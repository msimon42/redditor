desc 'upvotes all posts made by Bot'
task :upvote_bot_posts => :environment do
  posts = Post.bot_posts(24)
  Bot.mass_vote('upvote', posts)
end
