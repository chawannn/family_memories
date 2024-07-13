class Event < ApplicationRecord

  has_many_attached :images

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :member
  has_many :event_members, dependent: :destroy
  has_many :assign_members, through: :event_members, source: :member
  has_many :comments, dependent: :destroy

  has_many :notifications, as: :target
  after_create :notificate

  validates :title, presence: true

  def get_image(width, height)
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    #image.variant(resize_to_limit: [width, height]).processed
  end

  private

  def notificate
    current_member = self.member
    families_ids = current_member.families.ids
    families_ids.delete(current_member.id)
    families_ids.each { |i| self.notifications.create(member_id: i) }
  end
end
