class CreateNoteslabels < ActiveRecord::Migration[5.0]
  def change
    create_table :labels_notes, id: false do |t|
      t.belongs_to :label, index: true
      t.belongs_to :note, index: true
    end
  end
end
