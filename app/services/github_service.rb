require 'token'

class GithubService
  REPO_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop'
  PRSPECIFIC_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop/pulls/74/commits'
  PULLS_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop/pulls?state=all'
  COLLABORATOR_PATH = 'https://api.github.com/repos/suzkiee/little-esty-shop/commits'

  # :commits_url=>"https://api.github.com/repos/suzkiee/little-esty-shop/commits{/sha}",
  # :git_commits_url=>"https://api.github.com/repos/suzkiee/little-esty-shop/git/commits{/sha}",

  # This method can intake any path so API calls can be flexible.
  def self.connect(path)
    # faraday = Faraday.new(headers: {'Authorization' => "token " + TOKEN})
    validate_connection(Faraday.get(path))
  end

  # The following two methods utilize pre-specified paths that are common
  def self.connect_repo
    connect(REPO_PATH)
  end

  def self.connect_user@
    connect(PRSPECIFIC_PATH)
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
