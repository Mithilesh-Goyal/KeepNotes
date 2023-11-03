class AddPinToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :pin, :string, default: 'no', null: false
  end
end
