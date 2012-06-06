# Renders the home page.
class HomeController < ApplicationController
  skip_before_filter :require_login

  # Renders the home page or redirects to dashboard if user is logged in.
  def index
    redirect_to :controller => 'dashboards', :action => 'show' if current_user
    @title = 'Home'
  end
end
