Rails.application.routes.draw do
  root 'home#index'
  get '/report' => 'home#index'
  get '/report/ahoy' => 'home#report_ahoy'
  get '/report/restrictions' => 'home#restriction'
  get '/report/jobcontracts' => 'home#jobcontract'
  get '/report/jobeffectives' => 'home#jobeffective'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end