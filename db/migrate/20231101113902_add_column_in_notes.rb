class AddColumnInNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :status, :string, default: 'active', null: false
    add_column :notes, :stage, :string, default: 'notdel', null: false
    add_column :notes, :pin, :boolean, default: 'false', null: false
    add_column :notes, :color, :string, default: 'White', null: false
    add_column :notes, :deleted_at, :datetime
  end
end
