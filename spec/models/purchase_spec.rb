require 'rails_helper'

describe Purchase, "#quantity" do
  it "returns purchase quantity" do 
    purchase = Purchase.new(quantity: 5)
    expect(purchase.quantity).to eq(5)
  end
end
