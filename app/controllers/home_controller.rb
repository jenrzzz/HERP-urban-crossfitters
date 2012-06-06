class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
    redirect_to 'dashboards#show' if current_user
    @title = 'Home'
  end
end
