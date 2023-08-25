class ChangeStartTimeDataTypeInSlots < ActiveRecord::Migration[7.0]
  def change
    change_column :slots, :start_time, :string
  end
end
