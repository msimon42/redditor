class Bot < ApplicationRecord
  after_find :login

  def self.random
    order('RANDOM()').first
  end

  def subscribe_to_sub(sub)
    @session.subscribe(sub)
  end

  def subscribed_subs
    @session.my_subreddits('subscriber').map{|s| s.display_name}
  end

  def self.mass_vote(dir, post)
    all.each do |bot|
      bot.vote_by_fullname(post, dir)
    end
  end

  def vote_by_fullname(post, dir)
    @session.vote_by_fullname(post.submission_id, dir)
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
