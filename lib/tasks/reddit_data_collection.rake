desc 'Collect posts and comments from subreddits in db'
task :collect_posts_and_comments => :environment do
  subs = Sub.all
  subs.each do |sub|
    sub.collect_posts_and_comments
    puts "Collected for #{sub.name}"
  end
  puts 'Done'
end
