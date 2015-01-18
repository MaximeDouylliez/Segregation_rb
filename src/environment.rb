class Environment < Marsys::Environment
	@expectency_actual_mean

	def turn
		unless population_is_stable?
		super
		calculate_expectency_actual_mean
		end
		display
	end

	def population_is_stable?
		:Blue_people.clone.concat(:Red_people).inject(true){ |sat, el| sat && !el.has_moved? }
	end
	def display
		puts @grid.inject(""){ |res,line| res + line.inject(""){ |res,square| res + square.char + " " } + "\n" } + "__" * @size + "\n"
	end
	def calculate_expectency_actual_mean
		@expectency_actual_mean = (:Blue_people.clone.concat(:Red_people).inject{ |sum, el| sum + el.expectency_actual }.to_f)   / (:Red_people.size+ Blue_people:.size)
	end

		def char
			case @content
				when Blue_people then "S".blue
				when Red_people then "T".red
				else "-"
			end
		end
end
