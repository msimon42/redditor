class Sub < ApplicationRecord
  has_many :posts
  has_many :comments

  def collect_posts_and_comments
    data = RedditService.new.collect_posts_and_comments(self.name)
    data[:posts].each{|post| Post.create(title: post.title, text: post.selftext, author: post.author, sub_id: self.id, score: (post.ups.to_i - post.downs.to_i))}
    data[:comments].each{|comment| Comment.create(text: comment.body, author: comment.author, sub_id: self.id, score: (comment.ups.to_i - comment.downs.to_i))}
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
end
