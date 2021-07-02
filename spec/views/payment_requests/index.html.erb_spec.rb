# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payment_requests/index', type: :view do
  before(:each) do
    assign(:payment_requests, [
             PaymentRequest.create!(
               amount: 2.5,
               currency: 'Currency',
               description: 'MyText'
             ),
             PaymentRequest.create!(
               amount: 2.5,
               currency: 'Currency',
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of payment_requests' do
    render
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 'Currency'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'pending', count: 2
  end
end
