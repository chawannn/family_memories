class EventMember < ApplicationRecord

  has_one_attached :image
  
  #has_many :events, dependent: :destroy
  #has_many :members, dependent: :destroy
  belongs_to :event
  belongs_to :member
end
