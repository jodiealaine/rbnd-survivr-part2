class Game
	attr_reader :tribes
	def initialize tribe1, tribe2
		@tribes = []
		puts "Tribe 1: #{tribe1.members}"
		add_tribe tribe1
		add_tribe tribe2
	end

	def add_tribe tribe
		@tribes << tribe
	end

	def immunity_challenge
		randomize_tribe
	end

	def clear_tribes
		@tribes = []
	end

	def merge new_tribe_name
		new_tribe_members = (@tribes[0].members + @tribes[1].members)
		Tribe.new({name: new_tribe_name, members: new_tribe_members})
	end
	def individual_immunity_challenge
		randomize_contestant
	end

	def randomize_tribe
		@tribes[rand(@tribes.length)]
	end
	def randomize_contestant
		contestants = @tribes.map {|tribe| tribe.members}.flatten!
		contestants[rand(contestants.length)]
	end
end