class FixItemColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :specied_name, :species_name

  end
end
