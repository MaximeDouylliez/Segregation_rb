class Environment < Marsys::Environment
	@expectency_actual_mean

	def turn
		unless population_is_stable?
		super
		calculate_expectency_actual_mean
		end
	end

	def population_is_stable?
		:blue.clone.concat(red:).inject(true){ |sat, el| sat && !el.has_moved? }
	end

	def calculate_expectency_actual_mean
		@expectency_actual_mean = (:blue.clone.concat(red:).inject{ |sum, el| sum + el.expectency_actual }.to_f)   / (red:.size+ blue:.size)
	end
end
