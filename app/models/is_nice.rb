class IsNice < ApplicationRecord

  belongs_to :member
  belongs_to :event

  validates :member_id, uniqueness: {scope: :event_id}

end
