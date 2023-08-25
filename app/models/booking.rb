class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  before_destroy :slot_available


  validate :check_token, :check_availability, if: :check_slot

  after_save :update_user_token_and_slot, if: :check_slot

  def check_slot
    slot.present?
  end

  def check_token
    errors.add(:tokens, ": No tokens available") if user.tokens_balance < slot.product.price
  end

  def check_availability
    errors.add(:available, ": Booking already taken") if slot.availability == false
  end

  def update_user_token_and_slot
    new_balance = user.tokens_balance - slot.product.price
    user.update(tokens_balance: new_balance)
    slot.update(availability: false)
  end

  def slot_available
    new_balance = user.tokens_balance + slot.product.price
    user.update(tokens_balance: new_balance)
    slot.update(availability: true)
  end
end
