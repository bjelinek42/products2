class CartedProductsController < ApplicationController
  def index
    if current_user
      cps = CartedProduct.where(status: "carted", user_id: current_user.id)
      render json: cps
    end
  end

  def create
    if current_user
      cp = CartedProduct.new(
        product_id: 3,
        quantity: 2,
        user_id: 2,
        status: "carted",
        order_id: nil
      )
      if cp.save
        render json: cp
      end
    else
      render json: {message: "you must be logged in to add items to cart"}
    end
  end
end
