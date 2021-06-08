class GithubService

  def initialize(user)
    @user = user
  end

  def self.get_data(username)
    response = Faraday.get "https://api.github.com/users/#{username}"
    body = response.body
    JSON.parse(body, symbolize_name:true)
  end

  def number_of_followers
    data = get_data
    followers = data[:followers]
    puts "You have #{followers} followers on GitHub"
    followers
  end
end