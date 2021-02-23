class Bot < ApplicationRecord
  def initialize
    @session ||= RedditBotService.new(self)
  end

  def self.random
    order('RANDOM()').first
  end

  def subscribe_to_sub(sub)
    @session.subscribe(sub)
  end

  #depricated
  def login
    RedditBotService.new(self)
  end

  def subscribed_subs
    @session.my_subreddits('subscriber').map{|s| s.display_name}
  end

  def self.mass_vote(dir, post)
    all.each do |bot|
      session = bot.login
      session.vote_by_fullname(self.submission_id, dir)
    end
  end

  def update_score

  end  
end
