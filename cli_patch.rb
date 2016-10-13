module GoogleImageFetcher
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
