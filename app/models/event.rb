class Event < ApplicationRecord

  has_one_attached :image

  belongs_to :member
  belongs_to :event_member

  validates :title, presence: true
end
