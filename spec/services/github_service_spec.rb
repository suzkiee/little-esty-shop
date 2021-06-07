# require_relative 'api_practice'

# RSpec.describe GitHubData do
#   before do
#     @netia1128 = GitHubData.new('netia1128')
#   end

#   describe '#number_of_followers' do
#     it 'reports on the number of followers a user has' do
#       mock_response = {"followers" => 3}
#       allow(GitHubService).to receive(:get).and_return(mock_response)
#       expect(@netia1128.number_of_followers).to eq(3)
#     end
#   end
# end