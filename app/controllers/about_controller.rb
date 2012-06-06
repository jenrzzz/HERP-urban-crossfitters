class AboutController < ApplicationController
  skip_before_filter :require_login
  def index
    @title = 'About Us'
  end
end
