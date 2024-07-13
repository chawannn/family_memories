class EventMember < ApplicationRecord

  has_one_attached :image

  belongs_to :event
  belongs_to :member
  
  has_many :notifications, as: :target
  after_create :notificate
  
  private
  
  def notificate
    self.notifications.create(member_id: self.member_id)
  end
end
