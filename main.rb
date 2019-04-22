require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @number_bottles = reset_bottles(@number_bottles)
  @number_bottles_minus1 = decrement(@number_bottles)
  @beer_song = "bottles of beer on the wall"
  @link_text = "Take one down"
  erb :index
end

get '/:num_bottles' do
  if params[:num_bottles].to_i <= 0 
    # @number_bottles = '';
    @number_bottles_minus1 = reset_bottles(params[:num_bottles])
    @beer_song = "No bottles of beer on the wall"
    @link_text = "Start Over"
  else
    @number_bottles = params[:num_bottles];
    @number_bottles_minus1 = decrement(params[:num_bottles])
    @beer_song = "bottles of beer on the wall"
    @link_text = "Take one down"
  end
  erb (:index)
end


def decrement(num)
  return (num.to_i) - 1
end

def reset_bottles(param)
  return param = 99
end