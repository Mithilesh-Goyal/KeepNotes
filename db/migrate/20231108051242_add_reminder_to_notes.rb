class AddReminderToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :reminder, :datetime
  end
end
