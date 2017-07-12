class PurchasesController < ApplicationController

def new 
  @product = Product.find(params[:product_id])
  @purchase = @product.purchases.new
end

def create
  @product = Product.find(params[:product_id])
  
  @purchase = @product.purchases.new(purchase_params)

  @total_price = @purchase.quantity * @product.price

  @purchase.user = current_user
  @purchase.total_price = @total_price

    if @purchase.save
      redirect_to user_purchases_path(@product,@purchase) #index_path

    else
      render "purchases/edit"
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @purchase = Purchase.find(params[:id])
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to user_purchases_path(current_user)
  end

  def index 
    @purchases = current_user.purchases
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    @purchase.update(purchase_params)
      if @purchase.save
      redirect_to purchases_path(current_user)
      end
  end



  private
  def purchase_params
      params.require(:purchase).permit(:quantity, :total_price, :transaction_id, :transaction_status, :fourdigits)
  end

end
