class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :correct_member, only: [:edit, :update, :destroy]

  def index
    @members = current_member.families
  end

  def show
    @members = current_member.families
  end

  def edit
  end

  def update
    if @member.update(member_params)
      flash[:notice] = "更新しました"
      redirect_to member_path(@member)
    else
      flash.now[:alert] = "更新に失敗しました"
      redirect_to edit_member_path
    end
  end


  private
  
  def set_member
    @member = Member.find(params[:id])
  end

  def correct_member
    if !(@member == current_member || (current_member.main_user? && @member.families.include?(current_member)))
      redirect_to root_path
    end
  end

  def member_params
    params.require(:member).permit(:name,:name_hiragana,:image,:birthday,:nickname,:blood_type,:letter_color)
  end
end
