class MovieService
  class << self
    def request_api(path)
      resp = conn.get(path) do |faraday|
        faraday.params['api_key'] = ENV['themoviesdb_key']
      end
      parse_json(resp)
    end

    private

    def conn
      Faraday.new(url: 'https://api.themoviedb.org/3')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
