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
end

