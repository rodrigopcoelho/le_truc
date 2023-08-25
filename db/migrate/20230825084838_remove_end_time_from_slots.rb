class RemoveEndTimeFromSlots < ActiveRecord::Migration[7.0]
  def change
    remove_column :slots, :end_time, :integer
  end
end
