class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy]
  before_action :set_tokens_user, :set_product_price, only: %i[create destroy]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user.id
    if @booking.save
      redirect_to product_path(@booking.slot.product), notice: "Booking done!"
    else
      render "products/show"
    end
  end

  def destroy
    @booking.destroy
    # Redirect after to the dashboard user
    # redirect_to dashboard_user_path(current_user)
    redirect_to products_path
  end

  def dashboard_user
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:slot_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_tokens_user
    @tokens_user = current_user.tokens_balance
  end

  def set_product_price
    @product_price = @booking.slot.product.price
  end
end
