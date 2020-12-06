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

      # flash[:] = result.success
    else
      
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
    end
    
  end

  # def create

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