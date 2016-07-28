require "bundler/setup"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "active_record"
# require "pry"

require_relative "db/connection"
require_relative "models/pokemon"

# binding.pry

# puts "end of app"

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/pokemons/new' do
  erb :"pokemons/new"
end

get '/pokemons/:id' do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

post '/pokemons' do
  pokemons = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{pokemons.id}"
end

get '/pokemons/:id/edit' do
  @pokemons = Pokemon.find(params[:id])
  erb :"pokemons/edit"
end

put '/pokemons/:id' do
  @pokemons = Pokemon.find(params[:id])
  @pokemons.update(params[:pokemon])
  redirect "/pokemons/#{@pokemons.id}"
end

delete '/pokemons/:id' do
  @pokemons = Pokemon.find(params[:id])
  @pokemons.destroy
  redirect "/pokemons"
end

get '/' do
  redirect "/pokemons"
end

get '/public' do
  erb :"public/"
end
