# frozen_string_literal: true

json.array! @payment_requests, partial: 'payment_requests/payment_request', as: :payment_request
