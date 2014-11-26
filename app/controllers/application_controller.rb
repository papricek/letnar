class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= user_from_session
  end
  helper_method :current_user

  private

    def user_from_session
      User.find_by(id: session[:user_id])
    end

end
