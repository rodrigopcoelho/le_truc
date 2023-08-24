class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show
    @booking = Booking.new
  end

  def dashboard
    # raise
    # if current_user.admin
    #   @products = Product.all
    # else
    #   errors.add
    # end
    @products = Product.all if current_user.admin
  end

  def new
    @product = Product.new
  end

  def create
    # raise
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to dashboard_path
  end

  def destroy
    @product.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :price, :description, :photo)
  end
end
