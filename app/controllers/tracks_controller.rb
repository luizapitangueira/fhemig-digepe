class TracksController < RailsAdmin::MainController
 after_action :track_action

 private

 def track_action
 	p "!!!!!!!!AAAAAA"
   ahoy.track "Rails Admin", { model: "Post", action: action_name, user_id: current_user.id }
 end
end