source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'awesome_print'
gem 'remote_table'
# gem 'elasticsearch-model'
# gem 'httparty'
# gem 'fog', '~>1.20', require: 'fog/aws/storage'
# gem 'aws-sdk'
# gem 'paperclip'

group :production do
  gem 'rails_12factor'
  gem 'heroku_rails_deflate'
end

group :development, :test do
  gem 'pry'
  gem 'factory_girl_rails'
end

group :development do
  gem 'rubocop', require: false
end

group :test do
  gem 'rspec-rails'
end
