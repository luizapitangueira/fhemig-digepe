# frozen_string_literal: true

class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :selected_action_and_method

	def selected_action_and_method  
		if request.path_parameters[:action] == 'new' && request.method == 'POST'
			ahoy.track " Criando novo item", { user_id: current_user.id, item: request.path_parameters[:model_name] }
		end
	end
end

