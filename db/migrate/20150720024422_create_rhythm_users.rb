class CreateRhythmUsers < ActiveRecord::Migration
  def change
    create_table :rhythm_users do |t|
      t.references :user, index: true
      t.references :rhythm, index: true

      t.timestamps null: false
    end
  end
end
