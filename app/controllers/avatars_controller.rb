class AvatarsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    current_user.avatar.attach(user_params[:avatar])
    redirect_to action: :edit
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
