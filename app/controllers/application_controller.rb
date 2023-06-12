# frozen_string_literal: true

class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	#layout :layout_by_resource
	before_action :selected_action_and_method
	after_action :create_selected

	def create_selected
		# Criação de novos objetos
		if request.path_parameters[:action] == 'new' && request.method == 'POST'
			object = request.path_parameters[:model_name]
			model = object.capitalize.constantize
			data_object = model.find_by(request.parameters[object])

			ahoy.track " Criando novo item", { user_id: current_user.id, 
												item: request.path_parameters[:model_name], 
												item_id: data_object.id,
												object: request.parameters[object] }
		end
	end

	def selected_action_and_method  
		# Edições de objetos
		if request.path_parameters[:action] == 'edit' && request.method == 'POST'
			object = request.path_parameters[:model_name]
			ahoy.track " Editando um item", { usuario: current_user.id,
												item: request.path_parameters[:model_name],
												item_id: request.parameters[:id],
												object: request.parameters[object] }
		end
		# Remoção de objetos
		if request.path_parameters[:action] == 'delete' && request.method == 'POST'
			object = request.path_parameters[:model_name]
			model = object.capitalize.constantize
			data_object = model.find(request.parameters[:id]).to_json

			ahoy.track " Removendo um item", { user_id: current_user.id, 
												item: request.path_parameters[:model_name], 
												item_id: request.parameters[:id],
												object: data_object }
		end
	end


  protected
  def layout_by_resource
    if devise_controller?
      'login'
    else
      'application'
    end
  end

end

