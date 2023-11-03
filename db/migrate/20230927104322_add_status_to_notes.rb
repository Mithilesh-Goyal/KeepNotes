class AddStatusToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :status, :string, default: 'active', null: false
  end
end
