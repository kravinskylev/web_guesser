require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)
# @@count = 0
# message = "Pick a number, any number"

def check(guess)

  # if @@count > 4
  #     color = "rgb(150,150,255)"
  #     @@count = 0
  #     message = "Ya done goofed. Try again."
  # end

  if (guess - NUMBER) > 5
    @@count += 1
    "Way too high!"
  elsif (NUMBER - guess) > 5
    @@count += 1
    "Way too low!"
  elsif guess > NUMBER
    @@count += 1
    "Too high!"
  elsif NUMBER > guess
    @@count += 1
    "Too low!"
  elsif guess == NUMBER
    @@count = 0
    "Correct!"
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check(guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end
