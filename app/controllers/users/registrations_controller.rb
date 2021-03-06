#  Overiding devise user registration controller
class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :define_role, only: [:new, :create]

  def create
    build_resource sign_up_params
    resource.set_role(params[:role])
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

private
  def sign_up_params
     params.require(:user).permit(:email, :password, :password_confirmation, :title, :first_name, :last_name, :date_of_birth, :gender)
  end

  def define_role
    @role = Role::PUBLIC_ROLES.include?(params[:role]) ? params[:role] : Role::DEFAULT_ROLE
  end
end
