class Label < ApplicationRecord
  has_and_belongs_to_many :notes

   validates :label_name, uniqueness: true , presence: true

   def name_with_initial
      "#{label_name}"
    end
end
