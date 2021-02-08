class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # sign_upの際にname,group_nameのデータ受け渡しを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, group_attributes: [:group_name]])
  end

  def after_sign_in_path_for(resource)
    home_path
  end
end
