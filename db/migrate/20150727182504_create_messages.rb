class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :hive
      t.string :body

      t.timestamps null: false
    end
  end
end
