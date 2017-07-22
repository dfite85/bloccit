source 'https://rubygems.org'

#bundle edge Ralis instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

group :production do                                                            # specifies different databases for our dev and production enviroment       # because it is an easy to use database perfet for rapid testing
  gem 'rails_12factor'                                                          #added to gemfile then installed on application
  gem 'pg'
end

group :development do                                                           #added development group per lesson 12
    gem 'pg'  
    gem 'pry-rails'
end

group :development, :test do                                                    #New group per lesson 12
    gem 'rspec-rails', '~>3.0'                                                  #uses rspec gem file to both enviroments because we want its tasks and generators to be avail in both
end

gem 'bootstrap-sass'


#use SCSS for styleshets
gem 'sass-rails', '~> 5.0'
#use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
#use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
#use jquery as the JavaScript library
gem 'jquery-rails'
#turbolinks makes the following links in you web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'





