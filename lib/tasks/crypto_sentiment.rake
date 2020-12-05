desc 'calculate sentiment score for all crypto subs'
task :sentiment_score => :environment do
  t = Timer.new
  t.start
  subs = Sub.crypto
  score = subs.sum do |sub|
    c = sub.tokenize_comments(1)
    c.sum{ |words| Buzzword.get_score(words)  }
  end
  print score
  print %Q[Completed in #{t.stop}]
end
