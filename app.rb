require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  #"Hello there" #test
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("number").to_f
  @the_result = @the_num**2

  erb(:square_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
