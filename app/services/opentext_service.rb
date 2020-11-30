class OpenTextService

  private

    def opentext_url
      'https://developer.opentext.com'
    end

    def connection
      Faraday.new(url: opentext_endpoint) do |f|
        f.adapter Faradat.default_adapter
      end
    end

end
