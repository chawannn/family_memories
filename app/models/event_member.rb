class EventMember < ApplicationRecord

  has_one_attached :image

  belongs_to :event
  belongs_to :member
end
