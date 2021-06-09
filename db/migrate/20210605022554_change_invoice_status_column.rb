class ChangeInvoiceStatusColumn < ActiveRecord::Migration[5.2]
  def change
    # Need to explicitly tell Postgres to cast string to int
    change_column :invoices, :status,'integer USING CAST("status" AS integer)'
  end
end
