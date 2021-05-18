class MovieService
  def find_movie(movie_id)
    resp = conn.get("movie/#{movie_id}?api_key=#{@api_key}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def find_movie_review(movie_id)
    resp = conn.get("movie/#{movie_id}/reviews?api_key=#{@api_key}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def find_movie_credits(movie_id)
    resp = conn.get("movie/#{movie_id}/credits?api_key=#{@api_key}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def self.request_api(path)
    resp = conn.get(path)
    parse_json(resp)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3') do |faraday|
      faraday.params['api_key'] = ENV['themoviesdb_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
