# frozen_string_literal: true

class PaymentRequestsWorker
  include Sneakers::Worker
  from_queue 'contractor_app.payment_requests', env: nil

  def work(raw_payment_request)
    parsed_params = JSON.parse(raw_payment_request)

    PaymentRequest.where(id: parsed_params['id']).first_or_initialize.tap do |payment_request|
      payment_request.status = parsed_params['status']
      payment_request.save!
    end

    ack!
  end
end
