class RedditBotService
  attr_reader :session

  def initialize
    @session = Redd.it(
      user_agent: 'RedditorMan:v1',
      client_id:  ENV['REDDIT_CLIENT_ID'],
      secret:     ENV['REDDIT_CLIENT_SECRET'],
      username:   ENV['REDDIT_USERNAME'],
      password:   ENV['REDDIT_PASSWORD']
      )
  end

  def vote_by_fullname(fullname, dir)
    @session.from_ids(fullname).to_ary[0].send(dir)
  end

  def reply_to_submission(fullname, text)
    @session.from_ids(fullname).first.reply(text)
  end
end
