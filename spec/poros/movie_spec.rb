require 'rails_helper'

describe 'Movie class' do
  it 'exists' do
    stub_dilwale_dulhania
    movie = MovieFacade.find_movie(19404)

    expect(movie).to be_a Movie
    expect(movie).to have_attributes(title: 'Dilwale Dulhania Le Jayenge',
                                    vote_average: 8.7,
                                    runtime: 190,
                                    genres: [
                                      {
                                          "id": 35,
                                          "name": "Comedy"
                                      },
                                      {
                                          "id": 18,
                                          "name": "Drama"
                                      },
                                      {
                                          "id": 10749,
                                          "name": "Romance"
                                      }
                                    ],
                                    overview: 'Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.',
                                    cast: [
                                      {
                                          "adult": false,
                                          "gender": 2,
                                          "id": 35742,
                                          "known_for_department": "Acting",
                                          "name": "Shah Rukh Khan",
                                          "original_name": "Shah Rukh Khan",
                                          "popularity": 6.082,
                                          "profile_path": "/iAr3NRkU9KuPX7jI9ePPeq7zVsc.jpg",
                                          "cast_id": 1,
                                          "character": "Raj Malhotra",
                                          "credit_id": "52fe47d69251416c750a71a1",
                                          "order": 0
                                      },
                                      {
                                          "adult": false,
                                          "gender": 1,
                                          "id": 55061,
                                          "known_for_department": "Acting",
                                          "name": "Kajol",
                                          "original_name": "Kajol",
                                          "popularity": 1.982,
                                          "profile_path": "/cwum24EsxNwpcEsboKkudiGySLY.jpg",
                                          "cast_id": 2,
                                          "character": "Simran Singh",
                                          "credit_id": "52fe47d69251416c750a71a5",
                                          "order": 1
                                      },
                                      {
                                          "adult": false,
                                          "gender": 2,
                                          "id": 691,
                                          "known_for_department": "Acting",
                                          "name": "Amrish Puri",
                                          "original_name": "Amrish Puri",
                                          "popularity": 1.665,
                                          "profile_path": "/f9F456K0ydJCIIUS5YSmQWAgEgI.jpg",
                                          "cast_id": 3,
                                          "character": "Chaudhry Baldev Singh",
                                          "credit_id": "52fe47d69251416c750a71a9",
                                          "order": 2
                                      },
                                      {
                                          "adult": false,
                                          "gender": 2,
                                          "id": 6217,
                                          "known_for_department": "Acting",
                                          "name": "Anupam Kher",
                                          "original_name": "Anupam Kher",
                                          "popularity": 1.578,
                                          "profile_path": "/62IEjVcbXTzgM29lP2vDSPfeHae.jpg",
                                          "cast_id": 8,
                                          "character": "Dharamvir Malhotra",
                                          "credit_id": "52fe47d69251416c750a71c3",
                                          "order": 3
                                      },
                                      {
                                          "adult": false,
                                          "gender": 2,
                                          "id": 35759,
                                          "known_for_department": "Acting",
                                          "name": "Satish Shah",
                                          "original_name": "Satish Shah",
                                          "popularity": 0.6,
                                          "profile_path": "/yLZtBHVkWUIPWcrsWHeVsRG7BwH.jpg",
                                          "cast_id": 9,
                                          "character": "Ajit Singh",
                                          "credit_id": "52fe47d69251416c750a71c7",
                                          "order": 4
                                      },
                                      {
                                          "adult": false,
                                          "gender": 1,
                                          "id": 146971,
                                          "known_for_department": "Acting",
                                          "name": "Farida Jalal",
                                          "original_name": "Farida Jalal",
                                          "popularity": 0.6,
                                          "profile_path": "/qLlAHvTwQw6A91G2CLptlcUMYQZ.jpg",
                                          "cast_id": 54,
                                          "character": "Lajwanti 'Lajjo' Singh",
                                          "credit_id": "57a30dbe925141276900048b",
                                          "order": 5
                                      },
                                      {
                                          "adult": false,
                                          "gender": 1,
                                          "id": 146972,
                                          "known_for_department": "Acting",
                                          "name": "Achala Sachdev",
                                          "original_name": "Achala Sachdev",
                                          "popularity": 0.98,
                                          "profile_path": "/wW9YuDZdglCP29CScTbGZvWHAuh.jpg",
                                          "cast_id": 10,
                                          "character": "Simran's Grandmother",
                                          "credit_id": "52fe47d69251416c750a71cb",
                                          "order": 6
                                      },
                                      {
                                          "adult": false,
                                          "gender": 1,
                                          "id": 78248,
                                          "known_for_department": "Acting",
                                          "name": "Himani Shivpuri",
                                          "original_name": "Himani Shivpuri",
                                          "popularity": 0.6,
                                          "profile_path": "/gUCyskh3PnNdRJgxNSOxM0hoMKP.jpg",
                                          "cast_id": 11,
                                          "character": "Simran's Aunt",
                                          "credit_id": "52fe47d69251416c750a71cf",
                                          "order": 7
                                      },
                                      {
                                          "adult": false,
                                          "gender": 1,
                                          "id": 146973,
                                          "known_for_department": "Acting",
                                          "name": "Pooja Ruparel",
                                          "original_name": "Pooja Ruparel",
                                          "popularity": 1.02,
                                          "profile_path": "/evHnj6s0Z2sbV1Mq0dfXxQQU8Mf.jpg",
                                          "cast_id": 12,
                                          "character": "Rajeshwari / Chutki",
                                          "credit_id": "52fe47d69251416c750a71d3",
                                          "order": 8
                                      },
                                      {
                                          "adult": false,
                                          "gender": 1,
                                          "id": 146974,
                                          "known_for_department": "Acting",
                                          "name": "Mandira Bedi",
                                          "original_name": "Mandira Bedi",
                                          "popularity": 0.656,
                                          "profile_path": "/l50tq0OwzIxE4Z5JXDUSQvqCltN.jpg",
                                          "cast_id": 13,
                                          "character": "Preeti Singh",
                                          "credit_id": "52fe47d69251416c750a71d7",
                                          "order": 9
                                      }
                                    ],
                                    reviews: [
                                      {
                                          "author": "MohamedElsharkawy",
                                          "author_details": {
                                              "name": "",
                                              "username": "MohamedElsharkawy",
                                              "avatar_path": nil,
                                              "rating": nil
                                          },
                                          "content": "The Dilwale Dulhania Le Jayenge is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best.",
                                          "created_at": "2017-10-21T12:27:46.145Z",
                                          "id": "59eb3d42925141565100e901",
                                          "updated_at": "2017-10-22T00:40:50.358Z",
                                          "url": "https://www.themoviedb.org/review/59eb3d42925141565100e901"
                                      }
                                    ])
  end
end