require 'rails_helper'

RSpec.describe Merchant do
  before(:each) do
    @gary = Merchant.find(1)
    @item_1 = Item.find(1)
    @item_2 = @gary.items.create!(name: "Pants", description: "Gary does not wear it", unit_price: 6, enabled: "disabled")
  end

  describe 'relationships' do
    it {should have_many :items}
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
    it 'collects enabled items' do
      expect(@gary.enabled_items).to include(@item_1)
    end

    it 'collects disabled items' do
      expect(@gary.disabled_items).to eq([@item_2])
    end
  end
end
