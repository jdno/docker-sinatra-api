require 'sinatra'
require 'sinatra/json'

get '/' do
  json 'Hello World!'
end
