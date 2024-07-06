class Comment < ApplicationRecord

  belongs_to :member
  belongs_to :event

  validates :body, presence: true, length: { maximum: 500 }
  
  def deletable_member?(member)
    self.member == member || self.member.families.include?(member) && member.main_user?
  end
end
