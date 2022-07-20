class UpdateOrderColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :freeze, :selected_freeze
  end
end
