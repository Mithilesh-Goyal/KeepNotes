class AddBackgroundImageToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :background_image, :string
  end
end
