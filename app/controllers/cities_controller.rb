class CitiesController < ApplicationController
	def show
		@cities = City.find(params[:id])

		@gossips = []
		
		@cities.users.each do |user|
			user.gossips.each do |gossip|
				@gossips << gossip
			end
		end
	end
end
