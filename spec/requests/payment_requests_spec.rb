# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/payment_requests', type: :request do
  let(:valid_attributes) do
    {
      amount: 123,
      currency: 'EUR',
      description: 'some desc'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      PaymentRequest.create! valid_attributes
      get payment_requests_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      payment_request = PaymentRequest.create! valid_attributes
      get payment_request_url(payment_request)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_payment_request_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new PaymentRequest' do
        expect do
          post payment_requests_url, params: { payment_request: valid_attributes }
        end.to change(PaymentRequest, :count).by(1)
      end

      it 'redirects to the created payment_request' do
        post payment_requests_url, params: { payment_request: valid_attributes }
        expect(response).to redirect_to(payment_request_url(PaymentRequest.last))
      end

      it 'publish an event' do
        expect(Publisher).to(receive(:publish))
        post payment_requests_url, params: { payment_request: valid_attributes }
      end
    end
  end
end
