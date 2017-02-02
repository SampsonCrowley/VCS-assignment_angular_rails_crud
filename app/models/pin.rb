class Pin < ApplicationRecord
  belongs_to :user
  validates :item_name, length: { minimum: 3, maximum: 20 }
  validates :description, length: { minimum: 3, maximum: 400 }
end

