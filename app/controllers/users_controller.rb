class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created!"
      redirect_to posts_path, notice: 'Thank you for signing up'
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
    @user = User.find(params[:id])
    # puts @user.inspect
    redirect_to root_path, alert: 'access denied' unless can? :edit, @user
  end

  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit([:current_password, :password, :password_confirmation])

    if !(can? :edit, @user)
      redirect_to root_path, alert: 'Cannot update user; access denied'
    elsif @user.update(user_params)
      redirect_to root_path,
      notice: 'User updated'
    else
      render :edit
    end
  end


end
