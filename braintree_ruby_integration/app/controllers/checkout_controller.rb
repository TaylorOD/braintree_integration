class CheckoutController < ApplicationController

  def new
    @client_token = gateway.client_token.generate
    render json: { client_token: @client_token }, status: :created
  end

  def gateway
    Braintree::Gateway.new(
    :environment => :sandbox,
    :merchant_id => "hf9cyz3ptq2y9gs4",
    :public_key => "nwj4rbghszp5djhx",
    :private_key => "f403c64b2487009ec1b5243236c0a182",
    )
  end

  def show
    @transaction = gateway.transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def noice
    nonce_from_the_client = params[:payment_method_nonce]
  end

  # def create
  #   amount = params["amount"] # In production you should not take amounts directly from clients
  #   nonce = params["payment_method_nonce"]

  #   result = gateway.transaction.sale(
  #     amount: amount,
  #     payment_method_nonce: nonce,
  #     :options => {
  #       :submit_for_settlement => true
  #     }
  #   )

  #   if result.success? || result.transaction
  #     redirect_to checkout_path(result.transaction.id)
  #   else
  #     error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
  #     flash[:error] = error_messages
  #     redirect_to new_checkout_path
  #   end
  # end

  # def _create_result_hash(transaction)
  #   status = transaction.status

  #   if TRANSACTION_SUCCESS_STATUSES.include? status
  #     result_hash = {
  #       :header => "Sweet Success!",
  #       :icon => "success",
  #       :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
  #     }
  #   else
  #     result_hash = {
  #       :header => "Transaction Failed",
  #       :icon => "fail",
  #       :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
  #     }
  #   end
  # end



end