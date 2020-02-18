require 'json'
require 'open-uri'

class GamesController < ApplicationController

  LETTERS = Array.new(10) { ('A'..'Z').to_a.sample }

  def new
    @letters = LETTERS
  end

  def score
    @word = params[:word].upcase
    @letters = params[:token]
    @included = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
    @english_word = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@word.downcase}").read)['found']
  end
end
