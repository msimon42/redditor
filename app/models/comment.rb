class Comment < ApplicationRecord
  belongs_to :sub

  def upvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'upvote')
  end

  def downvote
    RedditBotService.new.vote_by_fullname(self.submission_id, 'downvote')
  end

  def reply(text)
    RedditBotService.new.reply_to_submission(self.submission_id, text)
  end

  def tokenize
    text.gsub(/[,.$#@!%&*'?)(%"<>"]/, '')
        .split
        .uniq
  end

  def self.not_nil
    where.not(text: nil)
  end

  def self.bot_posts(age)
    where(["bot_post = :bot_post and created_at > :created_at",
          {bot_post: true,
          created_at: age.hours.ago}])
  end
end
