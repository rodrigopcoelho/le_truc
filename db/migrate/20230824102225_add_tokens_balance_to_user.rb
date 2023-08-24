class AddTokensBalanceToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tokens_balance, :integer, default: 5
  end
end
