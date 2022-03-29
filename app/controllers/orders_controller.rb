class OrdersController < ApplicationController

  def create
    if current_user
      carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
      subtotal = 0
      carted_products.each do |carted_product|
        subtotal = carted_product.quantity * carted_product.product.price
      end
      order = Order.new(user_id: current_user.id, subtotal: subtotal, tax: subtotal * 0.09, total: subtotal * 1.09)
      order.save
      carted_products.each do |carted_product|
        carted_product[:status] = "purchased"
        carted_product[:order_id] = order.id
        carted_product.save
      end
      render json: order
    else
      render json: {message: "you must be logged in to order"}
    end
  end
end
