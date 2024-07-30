class Notification < ApplicationRecord

  belongs_to :member
  belongs_to :target, polymorphic: true



  private


end
