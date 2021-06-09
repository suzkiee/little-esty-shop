require 'rails_helper'

RSpec.describe 'invoices index page', type: :feature do
  xdescribe 'page appearance' do
    it 'has links to every invoice' do
      visit '/admin/invoices'

      expect(page).to have_link "Invoice ##{@invoices.first.id}"
      expect(page).to have_link "Invoice ##{@invoices.last.id}"
      click_link "Invoice ##{@invoices.first.id}"
      expect(current_path).to eq "/admin/invoices/#{@invoices.first.id}"
    end
  end

  describe 'page functionality' do
  end

end
