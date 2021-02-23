desc 'Fetches and updates karma for each bot account'
task :update_bot_scores => :environment do
  bots = Bot.all
  bots.each do |bot|
    bot.update_score
  end
end
