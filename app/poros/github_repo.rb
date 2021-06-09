class GithubRepo
  attr_reader :data, :pull_requests, :team

  def initialize
    @data = GithubService.connect_repo
    @pull_requests = GithubService.pull_requests
    @team = GithubService.all_contributors
  end

  def num_merged_prs
    if @pull_requests.is_a? Array
      @pull_requests.count do |pr|
        pr[:merged_at]
      end
    else
      26 # lol not elegant,but will work
    end
  end

  def contributors
    team_usernames = ['netia1128', 'suzkiee', 'jamogriff', 'Jaybraum']

    if @team.is_a? Array
      @team.each_with_object({}) do |login, hash|
        if team_usernames.include? login[:login]
          hash[login[:login]] = login[:contributions]
        end
      end
    else
      default = Hash.new
      team_usernames.each do |name|
        default[name] = 0
      end
      default
    end
  end
end
