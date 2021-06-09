require 'rails_helper'

RSpec.describe 'invoices index page', type: :feature do
  describe 'page appearance' do
    it 'has links to every invoice' do
      visit '/admin/invoices'

      expect(page).to have_link "Invoice ##{Invoice.first.id}"
      expect(page).to have_link "Invoice ##{Invoice.last.id}"
      click_link "Invoice ##{Invoice.first.id}"
      expect(current_path).to eq "/admin/invoices/#{Invoice.first.id}"
    end
  end

  describe 'page functionality' do
  end

end
