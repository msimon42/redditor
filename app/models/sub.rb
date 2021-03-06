class Sub < ApplicationRecord
  has_many :posts
  has_many :comments

  def collect_posts_and_comments
    data = RedditScrapeService.new.collect_posts_and_comments(self.name)
    data[:posts].each{|post| Post.create(title: post.title, text: post.selftext, author: post.author, sub_id: self.id, score: (post.ups.to_i - post.downs.to_i), submission_id: post.id)}
    begin
      data[:comments].each{|comment| Comment.create(text: comment.body, author: comment.author, sub_id: self.id, score: (comment.ups.to_i - comment.downs.to_i), submission_id: comment.id)}
    rescue ArgumentError
      puts 'Failed to collect comment due to argument error'
    end
  end

  def top_posts(amt)
    posts.order(score: :desc).limit(amt)
  end

  def top_comments(amt)
    comments.order(score: :desc).limit(amt)
  end

  def negative_posts(amt)
    posts.where('score < ?', 0).limit(amt)
  end

  def negative_comments(amt)
    comments.where('score < ?', 0).limit(amt)
  end

  def non_nil_comments
    comments.pluck(:text).reject!{|comment| comment.nil?}
  end

  def post(**kwargs)
    RedditBotService.new.make_post(self.name, title: kwargs[:title], text: kwargs[:text], url: kwargs[:url])
  end

  def tokenize_comments(days)
    cmmnts = comments.not_nil
                     .where('created_at > ?', days.days.ago)
                     .map(&:tokenize)
  end

  def comment_word_count
    counter = Hash.new(0)
    non_nil_comments.flat_map{|text| text.split}.each do |word|
      counter[word] += 1
    end
    return counter
  end

  def self.crypto
    where(crypto: true)
  end

  def self.crypto_sentiment_score(days)
    score = crypto.sum do |sub|
      c = sub.tokenize_comments(days)
      c.sum{ |words| Buzzword.get_score(words)  }
    end
    return score
  end
end
