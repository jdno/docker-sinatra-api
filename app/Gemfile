source 'https://rubygems.org'

# Fix Sinatra version to ensure compatibility with upcoming releases
gem 'sinatra', '1.4.6'

# Use JSON extension provided by the Sinatra::Contrib project
gem 'sinatra-contrib', '~> 1.4.2'

# Use ActiveRecord as the ORM
gem 'sinatra-activerecord', '~> 2.0'

# Use rake to execute ActiveRecord's tasks
gem 'rake'

group :production do
  # Use Postgresql for ActiveRecord
  gem 'pg'
end

group :development, :test do
  # Use SQLite for ActiveRecord
  gem 'sqlite3'
end
