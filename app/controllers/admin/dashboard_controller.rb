class Admin::DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize

  layout 'admin'

  private

  def authorize
    head :unauthorized unless current_user.is_admin?
  end


  # before_action :authenticate_user!
  # def index
  #   @user = current_user
  #   # @user = User.find(params[:id])
  #   user_params = params.require(:user).permit([:current_password, :new_password, :new_password_confirmation])
  #
  #   if !(can? :edit, @user)
  #     redirect_to root_path, alert: 'Cannot update user; access denied'
  #   elsif @user.update(user_params)
  #     redirect_to users_path(@user),
  #     notice: 'User updated'
  #   else
  #     render :edit
  #   end
  # end

  # def update_password
  #   @user = User.find(current_user.id)
  #   if @user.update(user_params)
  #     # Sign in the user by passing validation in case their password changed
  #     bypass_sign_in(@user)
  #     redirect_to root_path
  #   else
  #     render "edit"
  #   end
  # end
  #
  # private
  #
  # def user_params
  #   # NOTE: Using `strong_parameters` gem
  #   params.require(:user).permit(:password, :password_confirmation)
  # end






end
