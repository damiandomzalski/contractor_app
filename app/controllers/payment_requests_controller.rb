# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: %i[show]

  def index
    @payment_requests = PaymentRequest.all
  end

  def show; end

  def new
    @payment_request = PaymentRequest.new
  end

  def edit; end

  def create
    @payment_request = PaymentRequest.new(payment_request_params)

    respond_to do |format|
      if @payment_request.save
        Publisher.publish('payment_requests', @payment_request.attributes)

        format.html { redirect_to @payment_request, notice: 'Payment request was successfully created.' }
        format.json { render :show, status: :created, location: @payment_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_payment_request
    @payment_request = PaymentRequest.find(params[:id])
  end

  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description)
  end
end
