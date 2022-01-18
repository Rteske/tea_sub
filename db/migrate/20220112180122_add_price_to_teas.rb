class AddPriceToTeas < ActiveRecord::Migration[5.2]
  def change
    add_column :teas, :price_per_gram, :float
  end
end
