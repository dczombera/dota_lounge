source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

source 'https://rubygems.org'

gem 'rails', '4.2.0'


# views & assets
# ==============
gem 'sass-rails', '~> 5.0'                      # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                      # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'                  # Use CoffeeScript for .coffee assets and views
gem 'coffee-script-source', '~> 1.8.0'          # Downgrade this for now, to mitigate deployment problems
gem 'jquery-rails'                              # Use jquery as the JavaScript library
gem 'turbolinks'                                # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'bootstrap-sass'                            # Sass-powered version of Bootstrap
gem 'rails-i18n'                                # Provides localized Rails defaults for all languages in the world


# database
# ========
gem 'pg'                                        # Use PostgreSQL as the database for Active Record
gem 'activerecord-import'                       # Add bulk insert functionality to ActiveRecord (method: import)


# system & support
# ================
# gem 'unicorn'                                 # Use Unicorn as the app server
gem 'therubyracer', platforms: :ruby            # See https://github.com/sstephenson/execjs#readme for more supported runtimes


# documentation
# =============
group :doc do
  gem 'sdoc', '~> 0.4.0'                        # bundle exec rake doc:rails generates the API under doc/api.
end


# dev & deploy
# ============
group :development do

end
#gem 'whenever', require: false                # Configure cron jobs on server


# debug & test
# ============
group :development, :test do
  gem 'pry-rails'                            # More advanced Ruby and Rails console
  gem 'byebug'                               # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'web-console', '~> 2.0'                # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'rspec-rails', '~> 3.0'                # My main man when it comes to testing
  gem 'factory_girl_rails'                   # Provides factories to build/create model instances for testing
  gem 'ruby-debug-ide'                       # Adds RubyMine debugger support
  gem 'debase'                               # Adds RubyMine debugger support
end

group :test do
  gem 'shoulda-matchers', require: false     # Shortcuts for testing model validations and more
  gem 'json_spec'                            # validate JSON format
end

group :development do
  gem 'guard-rspec'                          # Watches code files & executes tests
end
