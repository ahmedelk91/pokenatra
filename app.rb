require "bundler/setup"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/pokemon"

binding.pry

puts "end of app"

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/' do
  redirect "/pokemons"
end

get '/pokemons/:id' do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemons/show"
end
