class FixOrderColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :sizd, :size
  end
end
