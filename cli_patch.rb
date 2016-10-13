module GoogleImageFetcher
  class Fetcher
    class << self
      def search_url(query)
        api_key = ENV["GOOGLE_API_KEY"]
        engine_id = ENV["SEARCH_ENGINE_ID"]
        url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{engine_id}&q=#{query}&start=#{rand(80)}&searchType=image"
        puts url
        url
      end
    end
  end

  class CLI
    def search(query)
      search_url = Fetcher.search_url(query)
      conn = Faraday.new(url: URI.encode(search_url))
      response = conn.get
      result = JSON.parse(response.body)
      result["items"].map {|item| item["link"] }
    end
  end
end
