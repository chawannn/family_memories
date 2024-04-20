class Public::MembersController < ApplicationController
  
  def index
    @members = Members.all
  end
  
  def show
     @member = Member.find(params[:id])
  end
  
  

  private

    def member_params
      params.require(:member).permit(:image)  end

end
