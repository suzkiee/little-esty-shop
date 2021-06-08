class GithubUser

  def initialize(username)
    @data = GithubService.connect_user(username)
  end

end

