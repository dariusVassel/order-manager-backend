class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :logo_image_url

      t.timestamps
    end
  end
end
