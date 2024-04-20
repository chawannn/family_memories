class Public::MembersController < ApplicationController

private

  def member_params
    params.require(:member).permit(:image)  end

end
