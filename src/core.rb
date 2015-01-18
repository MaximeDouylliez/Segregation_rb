class Core < Marsys::Core
	def initialize(options={})
		@agents = [:Blue_people, :Red_people]
		super(options)
	end
end