class ProductsController < ApplicationController
  def index
    product = Product.all
    render json: product
  end

  def create
    if current_user
      product = Product.new(name: params[:name], description: params[:description], price: params[:price], supplier_id: params[:supplier_id])
      if product.save
        render json: product
      else
        render json: {message: product.errors.full_messages}
      end
    else
      render json: {message: "you must be logged in to create a product"}, status: :unauthorized
    end
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.description = params[:description]
    product.price = params[:price]
    product.save
    render json: product
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.delete
    render json: {message: "product successfully deleted"}
  end
end
