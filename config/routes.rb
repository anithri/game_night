Rails.application.routes.draw do
  devise_for :player_accounts
  root to: 'visitors#index'
end
