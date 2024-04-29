class Event < ApplicationRecord

  has_one_attached :image
  belongs_to :member
  
  validates :title, presence: true
end
