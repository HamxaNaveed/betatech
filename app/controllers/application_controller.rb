class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      rails_admin_path
    else
      root_path
    end
  end
end
