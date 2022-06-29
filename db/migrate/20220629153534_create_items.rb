class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :specied_name
      t.string :scientific_name
      t.string :color
      t.string :physical_description

      t.timestamps
    end
  end
end
