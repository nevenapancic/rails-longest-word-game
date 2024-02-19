require "json"
require "open-uri"
class GamesController < ApplicationController


def new
  @letters = ('a'..'z').to_a.sample(10)
end

def score
  @word = params[:word]
  @letters = params[:letters]
  url = "https://wagon-dictionary.herokuapp.com/autocomplete/#{@word}"
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)
  if user['count'].zero?
    @score = "Sorry this word doesn't exist in English"
  elsif @word.chars.all? { |character| @letters.include?(character) }
    @score = "Your result is #{@word.size} points!"
  else
    @score = "You cant built this word out of these letters"
  end
end
end
