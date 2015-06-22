class GuestUser
  include Singleton

  def name
    'Guest'
  end

  def gaming_groups
    []
  end

  def id
    ''
  end

  def game_library

  end
end

