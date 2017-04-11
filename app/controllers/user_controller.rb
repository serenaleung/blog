class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created!"
      redirect_to questions_path, notice: 'Thank you for signing up and logging in!'
    else
      flash[:alert] = "Please try again"
      render :new
    end
  end

  def user_params
    params.require(:user).permit([:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation])
  end
end
