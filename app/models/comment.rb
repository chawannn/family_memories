class Comment < ApplicationRecord

  belongs_to :member
  belongs_to :event

  validates :body, presence: true, length: { maximum: 500 }
end
