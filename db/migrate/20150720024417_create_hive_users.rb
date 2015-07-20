class CreateHiveUsers < ActiveRecord::Migration
  def change
    create_table :hive_users do |t|
      t.references :user, index: true
      t.references :hive, index: true

      t.timestamps null: false
    end
  end
end
