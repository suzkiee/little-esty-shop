class WelcomeController < ActionController::Base

  def index
    @user_info = GithubUser.new('netia1128')
  end
end
