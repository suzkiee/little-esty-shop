# app/controllers/invoice_controller.rb

class Admin::InvoicesController < ApplicationController

  def create
    Invoice.create(invoice_params)
    redirect_to '/invoices'
  end

  def destroy
    invoice = Invoice.find(params[:id])
    invoice.destroy
    redirect_to '/invoices'
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)

    render 'show'
  end

  private

  def invoice_params
    params.require(:invoice).permit(:status,
                  :customer_id)
  end
end
