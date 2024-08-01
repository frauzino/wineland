class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      user_path(resource)
    else
      super
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def ensure_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'You do not have permission to access that page.'
  end

  def ensure_access_to_order
    return if current_user&.admin? || current_user == @order.user

    redirect_to root_path, alert: 'You do not have permission to access that page.'
  end
end
