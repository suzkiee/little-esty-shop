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
    it 'can update invoice status' do
      visit "/admin/invoices/#{@invoice.id}"
      expected_status = @invoice.status.capitalize
      expect(page).to have_select('invoice_status', selected: expected_status)
      select expected_status, from: 'invoice_status' 
      expect(current_path).to eq "/admin/invoices/#{invoice.id}"
      expect(@invoice.reload.status).to eq 'cancelled'
    end
  end
end
