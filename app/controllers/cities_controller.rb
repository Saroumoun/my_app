class CitiesController < ApplicationController
	def show
		@city = City.find(params[:id])

		@gossips = City.get_gossips_for(@city)
	end
end
