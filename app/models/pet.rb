class Pet < ApplicationRecord
  has_one_attached :image

  belongs_to :user
   accepts_nested_attributes_for :user
end
