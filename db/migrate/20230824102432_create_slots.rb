class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.integer :start_time
      t.integer :end_time
      t.boolean :availability
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
