class BggGamePolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def search?
    ! user.is_a? GuestUser

  end
end
