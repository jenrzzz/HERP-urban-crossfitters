require 'uri'

# Renders the home page.
class HomeController < ApplicationController
  skip_before_filter :require_login

  # Renders the home page or redirects to dashboard if user is logged in.
  def index
    if current_user
      if !request.referer || (request.env['HTTP_REFERER'] && !(URI(request.env['HTTP_REFERER']).path == dashboard_path))
        redirect_to :controller => 'dashboards', :action => 'show'
      end
    end
    @title = 'Home'
  end
end
