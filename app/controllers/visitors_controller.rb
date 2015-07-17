class VisitorsController < ApplicationController

  def creative_commons
    skip_authorization
  end

  def mit_license
    skip_authorization
  end

  def privacy_policy
    skip_authorization
  end

end
