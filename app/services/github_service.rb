class GithubService
  REPO_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop'

  def self.connect(path)
    response = Faraday.get(path)
    if !response.status == 200
      puts "There was an error in connecting"
    else
      puts "Connection successful"
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.connect_to_repo
    response = Faraday.get(REPO_PATH)
    if !response.status == 200
      puts "There was an error in connecting"
    else
      puts "Connection successful"
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
