require 'faraday'
require 'json'
require 'pry'

class APIConnection
  attr_reader :data
  REPO_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop'

  def initialize
    @data = connect(REPO_PATH)
  end

  def connect(path)
    response = Faraday.get(path)
    if !response.status == 200
      puts "There was an error in connecting"
    else
      puts "Connection successful"
      JSON.parse(response.body, symbolize_names: true)
    end
  end

end

repo = APIConnection.new
binding.pry
# in pry, calling 'api.data' will return the repo's information as a hash

