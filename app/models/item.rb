# app/models/item

class Item < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  belongs_to :merchant
  enum enabled: [:enabled, :disabled]

  def self.not_yet_shipped
<<<<<<< HEAD
    joins(:invoices).select("items.name, invoices.id as invoice_id, invoices.created_at as invoice_date").where("invoice_items.status = 'packaged' ").order("invoice_date")
=======
    joins(:invoices).select("items.name, invoices.id as invoice_id, invoices.created_at as invoice_date").where.not('invoice_items.status = 2').order("invoice_date")
>>>>>>> 85d0a7e6635d2a2d8d9f3f7793bca2c8b15b887c
  end

  def top_day
    invoices
    .joins(:transactions)
    .where("transactions.result = 'success'")
    .select('invoices.created_at, sum(invoice_items.unit_price * invoice_items.quantity)')
    .group(:created_at)
    .order("sum(invoice_items.unit_price * invoice_items.quantity) desc, created_at desc")
    .first.created_at.to_date
  end
end
