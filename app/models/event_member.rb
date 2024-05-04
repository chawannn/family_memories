class EventMember < ApplicationRecord

  has_one_attached :image
  
  has_many :events, dependent: :destroy
  has_many :members, dependent: :destroy
  
end
