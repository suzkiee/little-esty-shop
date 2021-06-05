require 'rails_helper'

RSpec.describe 'invoices show page', type: :feature do
  before(:all) do
    @invoice = Invoice.first
  end

  describe 'page appearance' do
    it 'has all info about that invoice' do
      visit "/admin/invoices/#{@invoice.id}"
      date = @invoice.created_at.strftime("%A, %B %d, %Y")
      expect(page).to have_content @invoice.status.capitalize
      expect(page).to have_content @invoice.id
      expect(page).to have_content date
      expect(page).to have_content @invoice.customer.first_name
      expect(page).to have_content @invoice.customer.last_name
    end
  end

  describe 'page functionality' do
  end
end
