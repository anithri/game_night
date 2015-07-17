class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  after_action :verify_authorized, except: [:index, :want_to_play], unless: :devise_controller?
  #after_action :verify_policy_scoped, :only => :index

  #skip layout for ajax requests
  layout proc{|c| c.request.xhr? ? false : "application" }

  protect_from_forgery with: :exception

  def current_player
    current_player_account ? current_player_account.player : GuestUser.instance
  end
  alias_method :current_user, :current_player

  helper_method :current_player, :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
