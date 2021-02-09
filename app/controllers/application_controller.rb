class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_time_keep


  protected
  # sign_upの際にname,group_nameのデータ受け渡しを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, group_attributes: [:group_name]])
  end

  def after_sign_in_path_for(resource)
    home_path
  end

  def require_time_keep
    return unless user_signed_in?
    last_task_history = current_user.task_histories.last
    if last_task_history.finish_time.nil?
      redirect_to new_task_history_path(task_id: last_task_history.task_id)
    end
  end
end
