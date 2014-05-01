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


  def authenticate_vendor!
    logger.debug "In authenticate vendor"
    authenticate_user!
    unless current_user.vendor?
      logger.error "This area is restricted to vendor only."
      flash[:alert] = "This area is restricted to vendors only."
      redirect_to root_path 
    end
    logger.debug "Successfully authenticated as vendor"
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if resource_or_scope.has_role? "vendor"
        vendor_dashboard_path
      elsif resource_or_scope.has_role? "superadmin"
        admin_dashboard_path
      else
        user_dashboard_path
      end
    else
      super
    end
  end

end
