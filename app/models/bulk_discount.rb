class BulkDiscount < ApplicationRecord
  belongs_to :merchant
  has_many :items, through: :merchants
  has_many :invoice_items, through: :items
end