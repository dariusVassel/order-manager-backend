class FixOrderColumnNamePrice < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :price_ks, :price_kg
  end
end
