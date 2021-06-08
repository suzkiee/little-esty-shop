class GithubRepo
  attr_reader :commits_hash

  def initialize
    @repo_prs = GithubService.num_pull_requests
    @commits = GithubService.all_collaborators
    @thing = GithubService.connect_user

    project_team = ['netia1128', 'suzkiee', 'jamogriff', 'Jaybraum']
    @commits_hash = @commits.each_with_object(Hash.new(0)) do |commit, hash|
      require 'pry'; binding.pry
      if project_team.include? commit[:login]
        hash[commit[:login]] += 1
      end
    end

    require 'pry'; binding.pry
    #initialize repo object with base endpoint with access to different attributes
    #set constant with the base endpoint and initialize with url paths
  end

  def num_merged_prs
    @repo_prs.find_all do |pr|
      pr[:merged_at]
    end.count
  end
end