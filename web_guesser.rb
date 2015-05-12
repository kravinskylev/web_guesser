require 'sinatra'
require 'sinatra/reloader'

secret_num = rand(100)
get '/' do
  "THE SECRET number is #{secret_num}"
end
