class Public::MembersController < ApplicationController

  def index
    @members = Members.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to member_path(member.id)
  end


  private

    def member_params
      params.require(:member).permit(:name,:name_hiragana,:image,:birthday,:nickname,:blood_type,:letter_color)  end

end
