class CreateRhythms < ActiveRecord::Migration
  def change
    create_table :rhythms do |t|
      t.string :name
      t.string :color

      t.timestamps null: false
    end
  end
end
