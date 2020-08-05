class RedditService
  def initialize
    @r = Reddit::Api.new(ENV['REDDIT_USERNAME'], ENV['REDDIT_PASSWORD'])
  end

  def collect_posts_and_comments(sub)
    posts = @r.browse(sub)
    comments = Array.new

    posts.each{|post| comments << post.comments}
    comments.flatten!

    {
      posts: posts,
      comments: comments 
    }
  end
end
