class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    logger.debug "In authenticate_admin_user"
    authenticate_user!
    logger.debug "Past authenticate_user!"
    unless current_user.admin?
      logger.error "This area is restricted to administrators only."
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path 
    end
    logger.debug "Successfully authenticated as admin"
  end

end
