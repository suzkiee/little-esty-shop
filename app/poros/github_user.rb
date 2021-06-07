class GithubUser
  attr_reader :date_joined, :name

  def initialize(user)
    github_data = GithubService.get_data(user)
    valid?
    @date_joined = github_data["created_at"]
    @name = github_data["name"]
  end

  def valid?
    if @name.nil? || @date_joined.nil?
      return false
    else
      return true
    end
  end
end