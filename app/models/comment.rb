class Comment < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :member
  belongs_to :event

  validates :body, presence: true, length: { maximum: 500 }
end
