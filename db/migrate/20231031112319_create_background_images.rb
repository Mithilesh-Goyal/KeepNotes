class CreateBackgroundImages < ActiveRecord::Migration[5.2]
  def change
    create_table :background_images do |t|
      t.references :note, foreign_key: true
      t.string :image
    end
  end
end
