class DockingStation
	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity) || DEFAULT_CAPACITY
		@bikes = []
	end

	def bike_count
		@bikes.count
	end

	def dock bike
		raise "Station is full" if full?
		@bikes << bike
	end

	def release
		@bikes.delete(available_bikes.first)
	end
	def full?
		bike_count == @capacity
	end
	def available_bikes
		@bikes.reject {|bike| bike.broken?}
	end
	def unavailable_bikes
		@bikes.select {|bike| bike.broken?}
	end
	def release_broken_bikes
		@bikes.delete(unavailable_bikes.first)
	end

end