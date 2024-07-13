class Public::NotificationsController < ApplicationController
  before_action :authenticate_member!
  def index
    @notifications = Notification.where(member_id: current_member.id, is_read: false)
  end
end
