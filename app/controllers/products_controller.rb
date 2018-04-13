class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    json_response(@products)
  end

  def show
    json_response(@product)
  end

  def create
    @product = Product.create! products_params
    json_response(@product, :created) 
  end


  def update
    @product.update(products_params)
    head :no_content
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.permit(:name, :description, :price, :image_url, :main_image)
  end

end
