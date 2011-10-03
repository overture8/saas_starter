class SiteController < ActionController::Base
  respond_to :html
  layout 'site'
  skip_before_filter :authenticate_user!

  def home
  end
  
  def pricing
    @plans = Stripe::Plan.all.data
  end
end
