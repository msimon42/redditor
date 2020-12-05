desc 'calculate sentiment score for all crypto subs'
task :sentiment_score => :environment do
  t = Timer.new
  t.start
  score = Sub.crypto_sentiment_score(1)
  print %Q[Score: #{score}. Completed in #{t.stop}]
end
