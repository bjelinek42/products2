class OrdersController < ApplicationController

  def create
    if current_user
      carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
      subtotal = 0
      carted_products.each do |carted_product|
        subtotal = carted_product.quantity * carted_product.product.price
      end
      p subtotal
    else
      render json: {message: "you must be logged in to order"}
    end
  end
end
