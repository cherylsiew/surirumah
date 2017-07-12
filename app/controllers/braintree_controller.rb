class BraintreeController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
    @purchase = Purchase.find(params[:purchase_id])
  end


  def create
    @purchase = Purchase.find(params[:purchase_id])
    @product = @purchase.product
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    amount_to_be_paid = @purchase.total_price

    result = Braintree::Transaction.sale(
     :amount => amount_to_be_paid, 
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )


    if result.success?
      @purchase.transaction_id = result.transaction.id
      @purchase.transaction_status = result.transaction.status
      @purchase.fourdigits = result.transaction.credit_card_details.last_4
      @purchase.save


      redirect_to product_purchase_path(@purchase.product,@purchase), :flash => { :success => "Transaction successful!" }
    else
      redirect_to braintree_new_path, :flash => { :error => "Transaction failed. Please try again." }
    end 
  end

end