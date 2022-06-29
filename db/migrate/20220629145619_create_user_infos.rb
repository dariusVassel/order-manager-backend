class CreateUserInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :avatar_url
      t.string :email
      t.string :company_name
      t.string :address
      t.string :phone
      t.integer :completed_orders

      t.timestamps
    end
  end
end
