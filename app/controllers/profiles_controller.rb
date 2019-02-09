class ProfilesController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])

    if @user.update(profile_params)
      redirect_to user_path(params[:user_id])
    else
      render action: :edit
    end
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end
end
