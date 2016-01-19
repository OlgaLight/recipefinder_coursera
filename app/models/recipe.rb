
require 'httparty'

class Recipe < ActiveRecord::Base
  include HTTParty

  key = ENV['FOOD2FORK_KEY']
  host_port = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{host_port}/api"
  default_params key: key
  format :json

  def self.for(search)
    get('/search', query: { q: search }, :verify => false)['recipes']
  end

end