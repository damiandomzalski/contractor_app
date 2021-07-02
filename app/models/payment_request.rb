# frozen_string_literal: true

class PaymentRequest < ApplicationRecord
  enum status: %i[pending accepted rejected]
end
