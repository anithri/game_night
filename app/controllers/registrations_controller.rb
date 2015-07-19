class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.build_player
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  private

  def sign_up_params
    #lazy
    params[:player_account][:player_attributes] = params[:player_account][:player]
    params.require(resource_name).permit(:email,
                                         :password,
                                         :password_confirmation,
                                         player_attributes: :name)
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.

end
