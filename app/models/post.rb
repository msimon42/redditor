class Post < ApplicationRecord
  belongs_to :sub

  def upvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'upvote')
  end

  def downvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'downvote')
  end

  def mass_vote(dir)
    Bot.mass_vote(dir, self.submission_id)
  end

  def reply(text)
    RedditBotService.new.reply_to_submission(self.submission_id, text)
  end
end
