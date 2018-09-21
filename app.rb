require 'sinatra/base'
require './lib/birth_dates'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:birthday_form)
  end

  post '/birthday' do
    set_session_data(params)
    if session[:days_to_birthday] == 0
      redirect '/celebrate'
    else
      redirect '/soon'
    end
  end

  get '/celebrate' do
    "It's your birthday, #{session[:name]}!!!"
  end

  get '/soon' do
    "Your birthday will be in #{session[:days_to_birthday]} days, #{session[:name]}"
  end

  run! if app_file == $0

  private

  def set_session_data(params)
    birth_dates = BirthDates.new
    session[:name] = params[:name]
    session[:day] = params[:day].to_i
    session[:month] = params[:month].to_i
    session[:days_to_birthday] = birth_dates.days_to_birthday(
      session[:day], session[:month]
    )
  end

end
