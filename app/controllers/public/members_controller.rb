class Public::MembersController < ApplicationController

  def index
    @members = current_member.families
  end

  def show
    @member = Member.find(params[:id])
    @members = current_member.families
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "更新しました"
      redirect_to member_path(@member)
    else
      flash.now[:alert] = "更新に失敗しました"
      redirect_to edit_member_path
    end
  end


  private

  def member_params
    params.require(:member).permit(:name,:name_hiragana,:image,:birthday,:nickname,:blood_type,:letter_color)
  end
end
