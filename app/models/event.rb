class Event < ApplicationRecord

  has_many_attached :images

  belongs_to :member
  has_many :event_members, dependent: :destroy
  has_many :assign_members, through: :event_members, source: :member
  has_many :is_nices, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true

  def is_niced_by?(member)
    is_nices.exists?(member_id: member.id)
  end

  def get_image(width, height)
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    #image.variant(resize_to_limit: [width, height]).processed
  end

end
