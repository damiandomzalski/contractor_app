# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payment_requests/show', type: :view do
  before(:each) do
    @payment_request = assign(:payment_request, PaymentRequest.create!(
                                                  amount: 2.5,
                                                  currency: 'Currency',
                                                  description: 'MyText'
                                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/pending/)
  end
end
