# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payment_requests/edit', type: :view do
  before(:each) do
    @payment_request = assign(:payment_request, PaymentRequest.create!(
                                                  amount: 1.5,
                                                  currency: 'MyString',
                                                  description: 'MyText',
                                                  status: 1
                                                ))
  end

  it 'renders the edit payment_request form' do
    render

    assert_select 'form[action=?][method=?]', payment_request_path(@payment_request), 'post' do
      assert_select 'input[name=?]', 'payment_request[amount]'

      assert_select 'input[name=?]', 'payment_request[currency]'

      assert_select 'textarea[name=?]', 'payment_request[description]'
    end
  end
end
