class Bot < ApplicationRecord
  #after_find :login

  def self.random
    order('RANDOM()').first
  end

  def subscribe_to_sub(sub)
    @session.subscribe(sub)
  end

  def subscribed_subs
    @session.my_subreddits('subscriber').map{|s| s.display_name}
  end

  def self.mass_vote(dir, posts)
    v = VpnService.new
    all.each do |bot|
      puts "Loading #{bot}"
      v.connect(VpnServer.random.address)
      bot.login
      bot.vote_by_fullname(posts, dir)
      sleep(15)
      v.disconnect
    end
  end

  def vote_by_fullname(posts, dir)
    posts.each do |post|
      puts "#{self} voting #{post}"
      @session.vote_by_fullname(post.submission_id, dir)
      sleep(2)
    end
  end

  def make_post(sub, post_data)
    @session.make_post(
      sub,
      title: post_data[:title],
      text: post_data[:text],
      url: post_data[:url]
    )
  end

  def update_score
    scores = @session.user_score
    update(link_karma: scores[:link_karma], comment_karma: scores[:comment_karma])
    return scores
  end

  def total_karma
    return link_karma + comment_karma
  end

  private
    def login
      @session = RedditBotService.new(self)
    end
end
