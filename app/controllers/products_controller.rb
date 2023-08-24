class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR category ILIKE :query"
      @products = @products.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @booking = Booking.new
  end

  def dashboard
    if current_user.admin
      @products = Product.all
    else
      redirect_to root_path, notice: "You can't go here"
    end
  end

  def new
    @product = Product.new
  end

  def create
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
