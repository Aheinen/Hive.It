class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true
      t.string :inquiry

      t.timestamps null: false
    end
  end
end
