class FlightsController < ApplicationController
  def index
    @airports = Airport.all

    if params[:search]
    	date_form = params[:search][:"departure_date(1i)"] + '-' + params[:search][:"departure_date(2i)"] + '-' + params[:search][:"departure_date(3i)"]
      @flights = Flight.where("departure_airport_id LIKE '%#{params[:search][:departure_code]}%' 
      	AND arrival_airport_id LIKE '%#{params[:search][:arrival_code]}%'
      	AND date(departure_date) = date(date_form)")

      Flight.where({departure_airport_id: params[:search][:departure_code], arrival_airport_id: params[:search][:arrival_code], date(departure_date): date(date_form)})
    else
    end
  end
end