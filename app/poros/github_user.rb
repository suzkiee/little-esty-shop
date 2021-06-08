class GithubUser

  # Didn't explicitly test this so may need debugging...
  def initialize(username)
    @data = GithubService.connect_user(username)
  end

end

