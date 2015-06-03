# == Route Map
#
#                             Prefix Verb   URI Pattern                                 Controller#Action
#                            players GET    /players(.:format)                          players#index
#                                    POST   /players(.:format)                          players#create
#                         new_player GET    /players/new(.:format)                      players#new
#                        edit_player GET    /players/:id/edit(.:format)                 players#edit
#                             player GET    /players/:id(.:format)                      players#show
#                                    PATCH  /players/:id(.:format)                      players#update
#                                    PUT    /players/:id(.:format)                      players#update
#                                    DELETE /players/:id(.:format)                      players#destroy
#                                    GET    /players(.:format)                          players#index
#                                    POST   /players(.:format)                          players#create
#                                    GET    /players/new(.:format)                      players#new
#                                    GET    /players/:id/edit(.:format)                 players#edit
#                                    GET    /players/:id(.:format)                      players#show
#                                    PATCH  /players/:id(.:format)                      players#update
#                                    PUT    /players/:id(.:format)                      players#update
#                                    DELETE /players/:id(.:format)                      players#destroy
#         new_player_account_session GET    /player_accounts/sign_in(.:format)          devise/sessions#new
#             player_account_session POST   /player_accounts/sign_in(.:format)          devise/sessions#create
#     destroy_player_account_session DELETE /player_accounts/sign_out(.:format)         devise/sessions#destroy
#            player_account_password POST   /player_accounts/password(.:format)         devise/passwords#create
#        new_player_account_password GET    /player_accounts/password/new(.:format)     devise/passwords#new
#       edit_player_account_password GET    /player_accounts/password/edit(.:format)    devise/passwords#edit
#                                    PATCH  /player_accounts/password(.:format)         devise/passwords#update
#                                    PUT    /player_accounts/password(.:format)         devise/passwords#update
# cancel_player_account_registration GET    /player_accounts/cancel(.:format)           devise/registrations#cancel
#        player_account_registration POST   /player_accounts(.:format)                  devise/registrations#create
#    new_player_account_registration GET    /player_accounts/sign_up(.:format)          devise/registrations#new
#   edit_player_account_registration GET    /player_accounts/edit(.:format)             devise/registrations#edit
#                                    PATCH  /player_accounts(.:format)                  devise/registrations#update
#                                    PUT    /player_accounts(.:format)                  devise/registrations#update
#                                    DELETE /player_accounts(.:format)                  devise/registrations#destroy
#        player_account_confirmation POST   /player_accounts/confirmation(.:format)     devise/confirmations#create
#    new_player_account_confirmation GET    /player_accounts/confirmation/new(.:format) devise/confirmations#new
#                                    GET    /player_accounts/confirmation(.:format)     devise/confirmations#show
#                               root GET    /                                           visitors#index
#                               page GET    /pages/*id                                  high_voltage/pages#show
#

Rails.application.routes.draw do
  resources :players
  resources :players
  devise_for :player_accounts
  root to: 'visitors#index'
end
