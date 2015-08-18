class AddHivedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :hived, :boolean, default: false
  end
end
