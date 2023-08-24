class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  before_destroy :slot_available

  validate :check_token, :check_availability

  after_validation :update_user_token_and_slot

  def check_token
    if self.user.tokens_balance <= self.slot.product.price
      errors.add(:tokens, "No tokens available")
    end
  end

  def check_availability
    if self.slot.availability == false
      errors.add(:available, "Booking already taken")
    end
  end

  def update_user_token_and_slot
    new_balance = self.user.tokens_balance - self.slot.product.price
    self.user.update(tokens_balance: new_balance)
    self.slot.update(availability: false)
  end

  def slot_available
    new_balance = self.user.tokens_balance + self.slot.product.price
    self.user.update(tokens_balance: new_balance)
    self.slot.update(availability: true)
  end
end
