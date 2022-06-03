require_relative '../Client.rb'
require_relative 'GatewayHelper'

module PaymentRails
  class InvoicePaymentGateway
    include GatewayHelper

    def initialize(client)
      @client = client
    end

    def create(body)
      response = @client.post('/v1/invoices/payment/create', body)
      invoice_payment_builder(response)
    end

    def update(body)
      response = @client.post('/v1/invoices/payment/update', body)
      p response
      invoice_payment_builder(response)
    end

    def delete(body)
      @client.post('/v1/invoices/payment/delete', body)
      true
    end

    def search(body)
      response = @client.post('/v1/invoices/payment/search', body)
      invoice_payments_list_builder(response)
    end

    def invoice_payment_builder(response)
      invoice_payment = InvoicePayment.new
      data = JSON.parse(response)
      data.each do |key, value|
        next unless key === 'invoicePayment'
        loosely_hydrate_model(invoice_payment, value)
      end
      invoice_payment
    end

    def invoice_payments_list_builder(response)
      invoice_payments = []
      data = JSON.parse(response)

      data.each do |key, value|
        next unless key === 'invoicePayments'
        value.each do |newKey, _newValue|
          invoice_payment = loosely_hydrate_model(InvoicePayment.new, newKey)
          invoice_payments.push(invoice_payment)
        end
      end
      invoice_payments
    end
  end
end
