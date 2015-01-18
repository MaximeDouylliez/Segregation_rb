require 'marsys'

class Population < Marsys::Agent
	attr_accessor :square, :color, :expectency, :expectency_actual
	def initialize(environment, square = nil, expectency, color)
		super
		@expectency = expectency
		@expectency_actual =0
		@color = color
		@has_moved = false
	end

	def to_json(options = {})
		super
	end

	def move
		super
		@has_moved = true
	end

	def surrounding
		@expectency_actual = @environment.send("squares_around_with_#{@color}",@square).size
	end

	def neighborhood_is_ok? 
   		(surrounding >= @expectency)
	end

	def has_moved?
		@has_moved
		#ou attr_accessor :has_moved
 		# alias_method :has_moved?, :has_moved
	end

	def turn
		@has_moved = false
		unless  neighborhood_is_ok?
		move
		end
	end

	def collection
		super
	end
end
