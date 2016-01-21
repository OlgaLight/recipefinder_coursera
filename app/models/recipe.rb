# FOOD2FORK_KEY = 'http://food2fork.com/api/search?key=22c0e11125d21a6e447201d26f7cf55f&q=shredded%20chicken'
class Recipe
  include HTTParty

  FOOD2FORK_KEY = '22c0e11125d21a6e447201d26f7cf55f'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"

  default_params key: FOOD2FORK_KEY,
                 fields: "image_url, title, social_rank",
                 q: "search"
  format :json

  def self.for (key_value)
    get("/search", query: {q: key_value})["recipes"]
  end
end