class GithubRepo
  attr_reader :commits_hash, :contributor_details

  def initialize
    @repo_prs = GithubService.num_pull_requests
    @contributors = GithubService.all_contributors
    @thing = GithubService.connect_user
    # @commits_hash = @commits.each_with_object(Hash.new(0)) do |commit, hash|
    #   require 'pry'; binding.pry
    #   if project_team.include? commit[:login]
    #     hash[commit[:login]] += 1
    #   end
    # end
    project_team = ['netia1128', 'suzkiee', 'jamogriff', 'Jaybraum']

    @contributor_details = @contributors.each_with_object({}) do |login, hash|
      if project_team.include? login[:login]
        hash[login[:login]] = login[:contributions]
      end
    end
  end

  def num_merged_prs
    @repo_prs.find_all do |pr|
      pr[:merged_at]
    end.count
  end

  def contributor_details
    project_team = ['netia1128', 'suzkiee', 'jamogriff', 'Jaybraum']

    @contributor_details = @contributors.each_with_object({}) do |login, hash|
      if project_team.include? login[:login]
        hash[login[:login]] = login[:contributions]
      end
    end
  end
end