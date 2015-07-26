class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.string :name
      t.string :color

      t.timestamps null: false
    end
  end
end
