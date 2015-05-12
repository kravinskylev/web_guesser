require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def check(guess)
  if guess == NUMBER
    "Correct!"
  elsif (guess - NUMBER) > 5
    "Way too high!"
  elsif (NUMBER - guess) > 5
    "Way too low!"
  elsif guess > NUMBER
    "Too high!"
  elsif NUMBER > guess
    "Too low!"
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check(guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end
