class CreateCompetencyUsers < ActiveRecord::Migration
  def change
    create_table :competency_users do |t|
      t.references :user, index: true
      t.references :competency, index: true
      t.integer :rank

      t.timestamps null: false
    end
  end
end
