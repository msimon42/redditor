desc 'upvotes all comments made by Bot'
task :upvote_bot_comments => :environment do
  comments = Comment.bot_posts(24)
  Bot.mass_vote('upvote', comments)
end
