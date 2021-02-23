desc 'downvotes posts containing word'
task :downvote_post_word => :environment do
  session = RedditBotService.new.session
  binding.pry
  session.subreddit(ENV['SUB']).comments.stream do |c|
    binding.pry
    if c.body.include?(ENV['WORD'])
      Bot.mass_vote('downvote', c.id)
    end
  end
end
