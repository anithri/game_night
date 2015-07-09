# == Route Map
#
#                             Prefix Verb   URI Pattern                                 Controller#Action
#              add_game_game_library GET    /game_libraries/:id/add_game(.:format)      game_libraries#add_game
#                     game_libraries GET    /game_libraries(.:format)                   game_libraries#index
#                       game_library GET    /game_libraries/:id(.:format)               game_libraries#show
#                                    PATCH  /game_libraries/:id(.:format)               game_libraries#update
#                                    PUT    /game_libraries/:id(.:format)               game_libraries#update
#                  bgg_game_searches GET    /bgg_game_searches(.:format)                bgg_game_searches#index
#                                    POST   /bgg_game_searches(.:format)                bgg_game_searches#create
#                new_bgg_game_search GET    /bgg_game_searches/new(.:format)            bgg_game_searches#new
#               edit_bgg_game_search GET    /bgg_game_searches/:id/edit(.:format)       bgg_game_searches#edit
#                    bgg_game_search GET    /bgg_game_searches/:id(.:format)            bgg_game_searches#show
#                                    PATCH  /bgg_game_searches/:id(.:format)            bgg_game_searches#update
#                                    PUT    /bgg_game_searches/:id(.:format)            bgg_game_searches#update
#                                    DELETE /bgg_game_searches/:id(.:format)            bgg_game_searches#destroy
#                        bgg_artists GET    /bgg_artists(.:format)                      bgg_artists#index
#                         bgg_artist GET    /bgg_artists/:id(.:format)                  bgg_artists#show
#                     bgg_categories GET    /bgg_categories(.:format)                   bgg_categories#index
#                       bgg_category GET    /bgg_categories/:id(.:format)               bgg_categories#show
#                      bgg_designers GET    /bgg_designers(.:format)                    bgg_designers#index
#                       bgg_designer GET    /bgg_designers/:id(.:format)                bgg_designers#show
#                       bgg_families GET    /bgg_families(.:format)                     bgg_families#index
#                         bgg_family GET    /bgg_families/:id(.:format)                 bgg_families#show
#                      bgg_mechanics GET    /bgg_mechanics(.:format)                    bgg_mechanics#index
#                       bgg_mechanic GET    /bgg_mechanics/:id(.:format)                bgg_mechanics#show
#                     bgg_publishers GET    /bgg_publishers(.:format)                   bgg_publishers#index
#                      bgg_publisher GET    /bgg_publishers/:id(.:format)               bgg_publishers#show
#                     game_summaries GET    /game_summaries(.:format)                   game_summaries#index
#                       game_summary GET    /game_summaries/:id(.:format)               game_summaries#show
#                            players GET    /players(.:format)                          players#index
#                                    POST   /players(.:format)                          players#create
#                         new_player GET    /players/new(.:format)                      players#new
#                        edit_player GET    /players/:id/edit(.:format)                 players#edit
#                             player GET    /players/:id(.:format)                      players#show
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
#                   creative_commons GET    /creative_commons(.:format)                 visitors#creative_commons
#                            license GET    /license(.:format)                          visitors#mit_license
#                        mit_license GET    /mit-license(.:format)                      visitors#mit_license
#                     privacy_policy GET    /privacy_policy(.:format)                   visitors#privacy_policy
#                               root GET    /                                           game_summaries#index
#                               page GET    /pages/*id                                  high_voltage/pages#show
#

Rails.application.routes.draw do
  resources :game_libraries, only: [:index, :show, :update]
  resources :bgg_game_searches
  resources :bgg_artists, only: [:index, :show]
  resources :bgg_categories, only: [:index, :show]
  resources :bgg_designers, only: [:index, :show]
  resources :bgg_families, only: [:index, :show]
  resources :bgg_mechanics, only: [:index, :show]
  resources :bgg_publishers, only: [:index, :show]

  resources :game_summaries, only: [:index, :show]
  resources :players

  devise_for :player_accounts, controllers: {registrations: 'registrations'}
  get '/creative_commons', to: 'visitors#creative_commons'
  get '/license', to: 'visitors#mit_license'
  get '/mit-license', to: 'visitors#mit_license'
  get '/privacy_policy', to: 'visitors#privacy_policy'

  root to: 'game_summaries#index'
end
