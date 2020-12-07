class CheckoutController < ApplicationController

  def new
    @client_token = gateway.client_token.generate
    render json: { client_token: @client_token }, status: :created
  end

  def gateway
    Braintree::Gateway.new(
    :environment => :sandbox,
    :merchant_id => "#{Rails.application.credentials.braintree[:merchant_id]}",
    :public_key => "#{Rails.application.credentials.braintree[:public_key]}",
    :private_key => "#{Rails.application.credentials.braintree[:private_key]}",
    )
  end

  def transaction
    nonce_from_the_client = params[:payment_method_nonce]

    result = gateway.transaction.sale(
      :amount => "10.00",
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true 
      }
    )

    if result.success?
      settled_transaction = result.transaction

      render json: { message: "Your test transaction has been successfully processed." }, status: :created
    else
      render json: { errors: result.errors }, status: :bad_request
    end

  end

end