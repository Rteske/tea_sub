class AddAmountToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :amount, :integer
  end
end
