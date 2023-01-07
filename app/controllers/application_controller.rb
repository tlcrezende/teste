class ApplicationController < ActionController::API
  	include DeviseTokenAuth::Concerns::SetUserByToken
  	before_action :configure_permitted_parameters, if: :devise_controller?

  	protected

	# Permite atualizar nome no sign_up e no update da conta
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

end
