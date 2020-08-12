class RedditBotService
  def initialize
    @session = Redd.it(
      user_agent: 'RedditorMan:v1',
      client_id:  ENV['REDDIT_CLIENT_ID'],
      secret:     ENV['REDDIT_CLIENT_SECRET'],
      username:   ENV['REDDIT_USERNAME'],
      password:   ENV['REDDIT_PASSWORD']
      )
  end
end
