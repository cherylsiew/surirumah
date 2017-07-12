class ProductsController < ApplicationController

  def index
    if params[:search] == nil
      @products = Product.order(:category)
    else
      @products = Product.product_name(params[:search]).or(Product.category(params[:search]
        ))
    end
      respond_to do|format|
      format.html {}
      format.js{}
    end
  end


  def create
    if current_user.superadmin? || current_user.moderator?
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
    end
  end

  def new
    @product = Product.new
  end

  def edit
     @product = Product.find(params[:id])
   end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
      if @product.save
      redirect_to products_path
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:category, :product_name, :price, :quantity, :size, {photos: []})
  end

end
