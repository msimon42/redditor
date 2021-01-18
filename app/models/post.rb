class Post < ApplicationRecord
  belongs_to :sub

  def upvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'upvote')
  end

  def downvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'downvote')
  end

  def mass_vote(dir)
    bots = Bot.all
    bots.each do |bot|
      session = bot.login
      session.vote_by_fullname(self.submission_id, dir)
    end
  end

  def reply(text)
    RedditBotService.new.reply_to_submission(self.submission_id, text)
  end
end
