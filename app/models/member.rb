class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum blood_type: { other: 0, A: 1, B: 2, O: 3, AB: 4 }

  has_one_attached :image

  validates :name, presence: true
  validates :name_hiragana, presence: true
  validates :birthday, presence: true
  validates :nickname, presence: true
  validates :blood_type, presence: true

  has_many :events, dependent: :destroy
  has_many :event_members, dependent: :destroy
  has_many :assign_events, through: :event_members, source: :event
  has_many :comments, dependent: :destroy

  def main_user?
    !self.invited_by_id.present?
  end

  def family_user?
    self.invited_by_id.present?
  end

  def families
    if self.main_user?
      Member.where(invited_by_id: self.id).or(Member.where(id: self.id)).order(invited_by_id: :asc)
    else
      Member.where(invited_by_id: self.invited_by_id).or(Member.where(id: self.invited_by_id)).order(invited_by_id: :asc)
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_by(email: 'yamada@test.com')
  end
end
