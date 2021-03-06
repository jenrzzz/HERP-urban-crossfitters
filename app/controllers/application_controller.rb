# ApplicationController handles the require_login
# filter for pages that require authentication and
# defines current_user.
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
 
  private

  # Filter to require users to login before accessing
  # this page.
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/login" # halts request cycle
    end
  end


  # Returns true if user is currently logged in.
  # --
  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!current_user
  end
 
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  helper_method :current_user, :logged_in?

end
