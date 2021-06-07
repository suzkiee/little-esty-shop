# require 'rails_helper'

# RSpec.describe GitHubUser do
#   before do
#     @netia1128 = GitHubData.new('netia1128')
#   end

#   describe '#name' do
#     it 'has data' do
#       mock_response = {:followers => 3,
#                        :name => 'Netia'
#                        :created_at => '03/27/2021'}

#       allow(GitHubData).to receive(:get_data).and_return(mock_response)

#       expect(@netia1128.get_data).to be_a(Hash)
#       expect(@netia1128.get_data).to have_key(:followers)
#       expect(@netia1128.get_data).to have_key(:name)
#       expect(@netia1128.get_data).to have_key(:created_at)
#     end

#     it 'can be valid' do

#     end
#     it 'can be invalid' do

#     end
#   end
# end