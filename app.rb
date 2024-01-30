require "sinatra"
require "sinatra/reloader"
require "active_support/all"

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

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("number").to_f
  @the_result = @the_num**(0.5)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  """Get apr (user_apr), number of years (user_years), and principal (user_pv) from user via form.
  """

  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @pv = params.fetch("user_pv").to_f

  def payment(apr, pv, years)
    r = apr / 1200
    n = years*12

    numerator = r*pv
    denominator= 1-(1+r)**-n

    res = numerator/denominator #format to two decimal places

    return res
  end

  @the_result = payment(@apr, @pv, @years)

  erb(:payment_results)
end

get("/random/new") do
  """Get minimum (user_min) and maximum (user_max) range from user via form.
  """
  erb(:random_calc)
end

get("/random/results") do

  @min_no = params.fetch("user_min").to_f
  @max_no = params.fetch("user_max").to_f
  
  @pick_random = rand(@min_no...@max_no)

  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:new_square_calc)
end
