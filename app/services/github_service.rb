class GithubService
  REPO_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop'
  USER_PATH = 'https://api.github.com/users/'
  PULLS_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop/pulls?state=all'
  COLLABORATOR_PATH = 'https://api.github.com/projects/42/collaborators'

  # This method can intake any path so API calls can be flexible.
  def self.connect(path)
    validate_connection(Faraday.get(path))
  end

  # The following two methods utilize pre-specified paths that are common
  def self.connect_repo
    connect(REPO_PATH)
  end

  def self.connect_user(username)
    connect(USER_PATH + username)
  end

  def self.num_pull_requests
    connect(PULLS_PATH)
  end

  def self.all_collaborators
    connect(COLLABORATOR_PATH)
  end
 
  # Could add better error if API response is not 200, but fine for our purposes
  def self.validate_connection(response)
    if !response.status == 200
      # Incorporate flash alert here? yes
      nil
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
