# app/models/item

class Item < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.not_yet_shipped
    joins(:invoice_items, :invoices).where("invoice_items.status = 'packaged'").merge(Invoice.order(:created_at))
  end
end
