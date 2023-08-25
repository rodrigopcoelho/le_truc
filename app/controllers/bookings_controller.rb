class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_tokens_user, :set_product_price, only: %i[destroy]

  def create
    @slot = Slot.find(booking_params[:slot_id].second)
    @booking = Booking.new(slot: @slot, user: current_user)
    if @booking.save
      redirect_to product_path(@booking.slot.product), notice: "Booking done!"
    else
      render "products/show"
    end
    set_product_price
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_user_path
  end

  def dashboard
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(slot_id: [])
  end

  def set_tokens_user
    @tokens_user = current_user.tokens_balance
  end

  def set_product_price
    @product_price = @booking.slot.product.price
  end
end
