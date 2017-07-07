class ProductsController < ApplicationController

  def index
    @products = Product.new
  end

  def create
    if current_user.superadmin? || current_user.moderator?
    @product = current_user.product.new(product_params)
    @product.save
    redirect_to products_path
  end

end
