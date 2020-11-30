class OpenTextService

  private

    def opentext_url
      'https://developer.opentext.com'
    end

    def connection
      Faraday.new(url: opentext_url) do |f|
        f.adapter Faradat.default_adapter
      end
    end

    def post_to_ca
      connection.post('/rs/v2') do |req|
        
      end
    end

end
