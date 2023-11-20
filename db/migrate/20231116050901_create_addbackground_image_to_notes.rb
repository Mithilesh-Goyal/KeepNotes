class CreateAddbackgroundImageToNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :addbackground_image_to_notes do |t|
      t.string :background_image

      t.timestamps
    end
  end
end


class AddPinToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :pin, :string, default: 'no', null: false
  end
end
