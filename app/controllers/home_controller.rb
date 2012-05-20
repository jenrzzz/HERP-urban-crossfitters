class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
    @title = 'Home'
  end
end
