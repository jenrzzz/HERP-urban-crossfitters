class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
    redirect_to :controller => 'dashboards', :action => 'show' if current_user
    @title = 'Home'
  end
end
