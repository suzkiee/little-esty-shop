class GithubRepo
  def initialize
    @repo_prs = GithubService.num_pull_requests
  end

  def num_merged_prs
    @repo_prs.find_all do |pr|
      pr[:merged_at]
    end.count
  end
end