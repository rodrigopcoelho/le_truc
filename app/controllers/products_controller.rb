class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
  end

  def leisure
    @products = Product.where(category: 'leisure')
  end

  def lunch
    @products = Product.where(category: 'lunch')
  end

  def work
    @products = Product.where(category: 'work')
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
