# frozen_string_literal: true

class CreatePaymentRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_requests do |t|
      t.float :amount
      t.string :currency
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
