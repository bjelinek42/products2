class ChangePriceToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, 'integer USING CAST(price AS integer)'
  end
end
