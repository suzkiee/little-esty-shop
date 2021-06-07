require 'faraday'
require 'json'
require 'pry'

class APIConnection
  attr_reader :data

  def initialize
    @data = repo_connect
  end

  def repo_connect
    response = Faraday.get('https://api.github.com/repos/suzkiee/little-esty-shop')
    if !response.status == 200
      puts "There was an error in connecting"
    else
      puts "Connection successful"
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end

api = APIConnection.new
binding.pry
# in pry, calling 'api.data' will return the repo's information as a hash

