class CreateMyNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_notes do |t|
      t.string :title
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
