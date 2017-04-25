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

  def edit
  end

  def update
    if @user.update_attributes(the_params)
      # Notify the user that his/her profile was updated
      flash.now[:success] = "Your changes have been saved"
    end
  end
end
