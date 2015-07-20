class CreateHives < ActiveRecord::Migration
  def change
    create_table :hives do |t|
      t.references :question, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
