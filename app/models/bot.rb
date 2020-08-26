class Bot < ApplicationRecord

  def self.random
    order('RANDOM()').first
  end

  def subscribe_to_sub(sub)
    RedditBotService.new(self).subscribe(sub)
  end

  def login
    RedditBotService.new(self)
  end
end
