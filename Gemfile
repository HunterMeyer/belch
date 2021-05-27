source 'https://rubygems.org'
ruby '2.6.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'awesome_print'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'rails', '~> 5.0.2'
gem 'remote_table'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'elasticsearch-model'
# gem 'httparty'
# gem 'fog', '~>1.20', require: 'fog/aws/storage'
# gem 'aws-sdk'
# gem 'paperclip'

group :production do
  # gem 'heroku_rails_deflate'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'rubocop', require: false
end

group :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
