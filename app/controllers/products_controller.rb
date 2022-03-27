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
