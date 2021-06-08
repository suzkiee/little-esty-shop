require 'rails_helper'

RSpec.describe 'admin index page', type: :feature do
  before(:each) do
  end

  describe 'page appearance' do
    it 'alerts you that you are on the Little Esty welcome page' do
      visit '/'

      expect(page).to have_content('Welcome to Little Esty Shop')
    end
    it 'contains a link to each merchant dashboard page' do
      merchant = Merchant.find(1)

      visit '/'

      expect(page).to have_link('Schroeder-Jerde')

      click_link('Schroeder-Jerde')

      expect(current_path).to eq("/merchants/#{merchant.id}/dashboard")
    end
  end
end