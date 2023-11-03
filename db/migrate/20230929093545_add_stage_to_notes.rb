class AddStageToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :stage, :string, default: 'notdel', null: false
  end
end
