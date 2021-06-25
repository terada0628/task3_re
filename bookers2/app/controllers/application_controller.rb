class ApplicationController < ActionController::Base
before_action :configur_permitted_parameters,if: :devise_controller?

protected

def configure_permitted_parameters
    devise_paramete_sanitizer.permit(:sign_up,keys:[:name])
end


end
