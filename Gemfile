source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# rails bootstrap
gem 'bootstrap-sass'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# My name's not Rick!
gem 'thin'

# Need OmniAuth 1.1.0 or newer for authentication
# and fetch the Facebook provider while we're at it.
gem 'omniauth', '>= 1.1.0'
gem 'omniauth-facebook', :git => 'https://github.com/mkdynamic/omniauth-facebook'

# For Graph API access
gem 'faraday', '~> 0.7.0' # new koala needs old faraday
gem 'koala', '>= 1.4.1'

# To fetch WOD info from CrossFit's RSS feed
gem 'feedzirra', :git => 'https://github.com/pauldix/feedzirra'
gem 'htmlentities' # people who include html in an RSS feed body shall
                   # be sent back to magic kindergarten

# To display calendar
gem 'event-calendar', :require => 'event_calendar'

# Validates Dates the easy way!
gem 'validates_timeliness', '~> 3.0.2'

# [10] guy loves HighCharts.... duuuuuuude
gem 'lazy_high_charts', :git => 'https://github.com/michelson/lazy_high_charts'

# Cron to run wods:fetch_latest rake tasks
gem 'whenever'

# Shoulda is a ruby testing framework
group :test do
    gem 'shoulda'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

