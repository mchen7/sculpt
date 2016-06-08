require 'open-uri'
require 'json'

class SculpturesController < ApplicationController
  def search
    render("search.html.erb")
  end

  def display
    @sculptures = Sculpture.all

    @street_address = params[:street_address]
    @city = params[:city]
    formatted_address = @street_address + "," + @city
    url_safe_street_address = URI.encode(formatted_address)
    @url = "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address + "&sensor=false"
    parsed_data = JSON.parse(open(@url).read)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
  end

  def index
    @sculptures = Sculpture.all
  end

  def show
    @sculpture = Sculpture.find(params[:id])
  end

  def new
    @sculpture = Sculpture.new
  end

  def create
    @sculpture = Sculpture.new

    @sculpture.description = params[:description]
    @sculpture.aggregate = params[:aggregate]
    @sculpture.name = params[:name]
    @sculpture.address = params[:address]
    @sculpture.city = params[:city]
    @sculpture.state = params[:state]
    @sculpture.zipcode = params[:zipcode]

    @street_address = @sculpture.address + "," + @sculpture.city + "," + @sculpture.state + "," + @sculpture.zipcode.to_s

    url_safe_full_address = URI.encode(@street_address)
    @url = "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_full_address + "&sensor=false"
    parsed_data = JSON.parse(open(@url).read)

    @sculpture.lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @sculpture.lng = parsed_data["results"][0]["geometry"]["location"]["lng"]

    if @sculpture.save
      redirect_to "/sculptures", :notice => "Sculpture created successfully."
    else
      render 'new'
    end
  end

  def edit
    @sculpture = Sculpture.find(params[:id])
  end

  def update
    @sculpture = Sculpture.find(params[:id])

    @sculpture.description = params[:description]
    @sculpture.aggregate = params[:aggregate]
    @sculpture.name = params[:name]
    @sculpture.address = params[:address]
    @sculpture.city = params[:city]
    @sculpture.state = params[:state]
    @sculpture.zipcode = params[:zipcode]

    @street_address = @sculpture.address + "," + @sculpture.city + "," + @sculpture.state + "," + @sculpture.zipcode.to_s

    url_safe_full_address = URI.encode(@street_address)
    @url = "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_full_address + "&sensor=false"
    parsed_data = JSON.parse(open(@url).read)

    @sculpture.lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @sculpture.lng = parsed_data["results"][0]["geometry"]["location"]["lng"]

    if @sculpture.save
      redirect_to "/sculptures", :notice => "Sculpture updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @sculpture = Sculpture.find(params[:id])

    @sculpture.destroy

    redirect_to "/sculptures", :notice => "Sculpture deleted."
  end
end
