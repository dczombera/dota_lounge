source 'https://rubygems.org'

gem 'rails', '4.2.3'


# views & assets
# ==============
gem 'sass-rails', '~> 5.0'                   # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                   # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'               # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'                           # Use jquery as the JavaScript library
gem 'turbolinks'                             # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'bootstrap-sass'                         # Sass-powered version of Bootstrap
gem 'rails-i18n'                             # Provides localized Rails defaults for all languages in the world
gem 'jbuilder', '~> 2.0'                     # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder


# database
# ========
gem 'pg'                                     # Use PostgreSQL as the database for Active Record
gem 'activerecord-import'                    # Add bulk insert functionality to ActiveRecord (method: import)


# system & support
# ================
# gem 'unicorn'                              # Use Unicorn as the app server
gem 'therubyracer', platforms: :ruby         # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'figaro'                                 # keep sensitive config in a single application.yml and out of git
gem 'paperclip'                              # Handles file uploads, storage, and references in db
gem 'fastimage'                              # Extract width and height from image files in various formats


# documentation
# =============
group :doc do
  gem 'sdoc', '~> 0.4.0'                     # bundle exec rake doc:rails generates the API under doc/api.
end


# dev & deploy
# ============
group :development do

end
#gem 'whenever', require: false              # Configure cron jobs on server


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
  gem 'spring'                               # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

group :test do
  gem 'shoulda-matchers', require: false     # Shortcuts for testing model validations and more
  gem 'json_spec'                            # validate JSON format
end

group :development do
  gem 'guard-rspec'                          # Watches code files & executes tests
end

