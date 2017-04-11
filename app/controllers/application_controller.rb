class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    if !user_signed_in?
      redirect_to new_session_path, notice: "You must be signed in!"
    end

    # unless user_signed_in?
    #   flash[:notice] = "Please sign in"
    #   redirect_to new_session_path
    # end
  end
  helper_method :authenticate_user!

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user
end
