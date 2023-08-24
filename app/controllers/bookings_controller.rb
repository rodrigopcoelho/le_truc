class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy]
  before_action :set_tokens_user, :set_product_price, only: %i[create destroy]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user.id
    # tokens_user = current_user.tokens_balance
    # product_price = @booking.slot.product.price

    if tokens_user >= product_price
      @booking.save
      # The below thing works? Because I'm saving the tokens of the user in a variable and not changing directly the tokens of the user (probably its better with an UPDATE method)
      @tokens_user -= product_price
      # the below line is needed to save the new balance tokens in the user?
      current_user.save
    else
      flash.alert("You need #{product_price - tokens_user} to make the booking")
    end
  end

  def destroy
    @booking.destroy
    if @booking.destroy
      # The below thing works? Because I'm saving the tokens of the user in a variable and not changing directly the tokens of the user (probably its better with an UPDATE method)
      @tokens_user += @product_price
      # the below line is needed to save the new balance tokens in the user?
      current_user.save
    else
      flash.alert("There is a problem with your request, try again later.")
    end
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
