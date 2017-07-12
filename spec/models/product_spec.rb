require 'rails_helper'

describe Product, "#category" do
  it "returns product category" do 
    product = Product.new(category: "Furniture")
    expect(product.category).to eq("Furniture")
  end
end

describe Product, "#Product name" do
  it "returns product name" do 
    product = Product.new(product_name: "Rustic Sofa")
    expect(product.product_name).to eq("Rustic Sofa")
  end
end

describe Product, "#Price in myr" do
  it "returns price in myr" do 
    product = Product.new(price: 900)
    expect(product.price).to eq(900)
  end
end

describe Product, "#Quantity" do
  it "returns product quantity" do 
    product = Product.new(quantity: 4)
    expect(product.quantity).to eq(4)
  end
end

describe Product, "#Size" do
  it "returns product size" do 
    product = Product.new(size: "W 32 / D 32 / H 15")
    expect(product.size).to eq("W 32 / D 32 / H 15")
  end
end