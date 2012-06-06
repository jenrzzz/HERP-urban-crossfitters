# Controller to generate the About Us page.
# Does not require login.
class AboutController < ApplicationController
  skip_before_filter :require_login
  
  # Renders the About Us page.
  def index
    @title = 'About Us'
  end
end
