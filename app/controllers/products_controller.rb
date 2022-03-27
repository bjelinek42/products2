class ProductsController < ApplicationController
  def index
    product = Product.all
    render json: product
  end

  def create
    product = Product.new(name: params[:name], description: params[:description], price: params[:price])
    product.save
    render json: product
  end
end
