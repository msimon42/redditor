class Post < ApplicationRecord
  belongs_to :sub

  def upvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'upvote')
  end

  def downvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'downvote')
  end

  def mass_vote(dir)
    Bot.mass_vote(dir, [self])
  end

  def reply(text)
    RedditBotService.new.reply_to_submission(self.submission_id, text)
  end

  def self.bot_posts(age)
    where(["bot_post = :bot_post and created_at > :created_at"], {bot_post: true,
                                                                  created_at: age.hours.ago} )
  end
end
