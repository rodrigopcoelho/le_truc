class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def create
    params[:booking].present? ? @slot = Slot.find(booking_params.fetch(:slot_id)).first : @slot = nil
    @booking = Booking.new(slot: @slot, user: current_user)
    if @booking.save
      redirect_to product_path(@booking.slot.product), notice: "Booking done!"
    else
      @slot.present? ? @product = @slot.product : @product = Product.find(session[:product_id])
      render "products/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    if current_user.admin
      redirect_to dashboard_admin_path
    else
      redirect_to dashboard_user_path
    end
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
end
