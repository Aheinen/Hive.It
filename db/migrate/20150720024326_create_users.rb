class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :image_url
      t.string :email
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
