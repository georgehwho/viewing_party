require 'rails_helper'

describe 'movie service test' do
  it 'can make a call to the api' do
    stub_top_40_movies

    json_response = MovieService.request_api("movie/top_rated?page=1")

    expect(json_response).to be_a Hash
  end
end