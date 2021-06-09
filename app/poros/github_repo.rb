class GithubRepo
  attr_reader :data, :pull_requests, :team
  
  def initialize
    @data = GithubService.connect_repo
    @pull_requests = GithubService.pull_requests
    @team = GithubService.all_contributors
  end

  def num_merged_prs
    @pull_requests.count do |pr|
      pr[:merged_at]
    end
  end

  def contributors
    team_usernames = ['netia1128', 'suzkiee', 'jamogriff', 'Jaybraum']

    @team.each_with_object({}) do |login, hash|
      if team_usernames.include? login[:login]
        hash[login[:login]] = login[:contributions]
      end
    end
  end
end
