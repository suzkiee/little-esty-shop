class GithubService
  REPO_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop'
  PRSPECIFIC_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop/pulls/74/commits'
  PULLS_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop/pulls?state=all'
  CONTRIBUTOR_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop/contributors'

  # This method can intake any path so API calls can be flexible.
  def self.connect(path)
    begin
      validate_connection(Faraday.get(path))
    end
  end

  # The following two methods utilize pre-specified paths that are common
  def self.connect_repo
    connect(REPO_PATH)
  end

  def self.connect_user
    connect(PRSPECIFIC_PATH)
  end

  def self.num_pull_requests
    connect(PULLS_PATH)
  end

  def self.all_contributors 
    connect(CONTRIBUTOR_PATH)
  end

  # Could add better error if API response is not 200, but fine for our purposes
  def self.validate_connection(response)
    if !response.status == 200
      # Tried doing a StandardError or flash[:alert]
      # but both were unrecognized commands
      puts "Connection to GitHub Service Interrupted"
      nil
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end

