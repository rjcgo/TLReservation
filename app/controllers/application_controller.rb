class ApplicationController < ActionController::Base
	rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
		render :text => exception, :status => 500
	end
	protect_from_forgery with: :exception
	
	def after_sign_in_path_for(resource)
  		testlines_reservations_path
	end

	def after_sign_out_path_for(resource_or_scope)
		root_path
	end

	def parse_notice(error)
		error_messages = "Error occurred:"
		error.full_messages.each do |message|
			error_messages += " #{message}."
		end
		return error_messages
	end
end
