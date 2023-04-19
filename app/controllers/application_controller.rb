class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  # def render_404
  #   render file: "#{Rails.root}/public/404.html", status: 404
  # end
  
  def after_sign_up_path_for(_resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      rails_admin_path
    else
      super
    end
  end
end
