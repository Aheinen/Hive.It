class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :hive, index: true
      t.references :competency, index: true
      t.string :data

      t.timestamps null: false
    end
  end
end
