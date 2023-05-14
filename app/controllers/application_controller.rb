# frozen_string_literal: true

class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :selected_action_and_method

	def selected_action_and_method  
		# Criação de novos objetos - NÃO CONSEGUI ADICIONAR O ID, FICA NULL
		if request.path_parameters[:action] == 'new' && request.method == 'POST'
			object = request.path_parameters[:model_name]
			ahoy.track " Criando novo item", { user_id: current_user.id, 
												item: request.path_parameters[:model_name], 
												item_id: request.parameters[:id],
												object: request.parameters[object] }
		end
		# Edições de objetos - FUNCIONOU!!!!!!!!
		if request.path_parameters[:action] == 'edit' && request.method == 'POST'
			object = request.path_parameters[:model_name]
			ahoy.track " Editando um item", { user_id: current_user.id,
												item: request.path_parameters[:model_name],
												item_id: request.parameters[:id],
												object: request.parameters[object] }
		end
		# Remoção de objetos - NÃO CONSEGUI PEGAR OS PARÂMETROS DO OBJETO QUE FOI DELETADO
		if request.path_parameters[:action] == 'delete' && request.method == 'POST'
			object = request.path_parameters[:model_name]
			ahoy.track " Removendo um item", { user_id: current_user.id, 
												item: request.path_parameters[:model_name], 
												item_id: request.parameters[:id],
												object: request.parameters[object] }
		end
	end
end

