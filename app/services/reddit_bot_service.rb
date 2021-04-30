class RedditBotService
  attr_reader :session

  def initialize(user=nil)
    @user = user || Bot.random
    @session = Redd.it(
      user_agent: @user.user_agent,
      client_id:  ENV['REDDIT_CLIENT_ID'],
      secret:     ENV['REDDIT_CLIENT_SECRET'],
      username:   @user.username,
      password:   @user.password
      )
    @user_data = @session.user(@user.username)

  end

  def vote_by_fullname(fullname, dir)
    puts @session.from_ids(fullname).to_ary[0].send(dir)
  end

  def reply_to_submission(fullname, text)
    @session.from_ids(fullname).first.reply(text)
  end

  def make_post(sub, post_data)
    post = @session.subreddit(sub.name).submit(post_data[:title], text: post_data[:text], url: post_data[:url])
    Post.create(
      title: post_data[:title],
      text: post_data[:text],
      submission_id: post.name,
      author: @user.username,
      bot_post: true,
      sub_id: sub.id
    )
  end

  def subscribe(sub)
    @session.subreddit(sub).subscribe
  end

  def user_score
    return {
      comment_karma: @user_data.comment_karma,
      link_karma: @user_data.link_karma
    }
  end

  def reset(usr=nil)
    @user = usr || Bot.random
    @session = Redd.it(
      user_agent: 'RedditorMan:v1',
      client_id:  ENV['REDDIT_CLIENT_ID'],
      secret:     ENV['REDDIT_CLIENT_SECRET'],
      username:   @user.username,
      password:   @user.password
      )
    @user_data = @session.user(@user.username)
  end
end
