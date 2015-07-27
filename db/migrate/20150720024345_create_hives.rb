class CreateHives < ActiveRecord::Migration
  def change
    create_table :hives do |t|
      t.references :question, index: true
      t.string :name
      t.boolean :active, default: false
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
