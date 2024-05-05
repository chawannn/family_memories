class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum blood_type: { other: 0, a: 1, b: 2, o: 3, ab: 4 }

  has_one_attached :image

  has_many :events, dependent: :destroy
  #belongs_to :event_member
  has_many :event_members, dependent: :destroy
  has_many :assigh_events, through: :event_members, source: :event

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
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

end
