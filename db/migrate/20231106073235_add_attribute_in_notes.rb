class AddAttributeInNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :unique_id, :string
  end
end
