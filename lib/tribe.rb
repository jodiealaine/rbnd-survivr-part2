class Tribe
	attr_reader :name, :members
	def initialize tribe
		@tribe = tribe
		@name = tribe[:name]
		@members = tribe[:members]
		puts tribe
	end
	def to_s
		@name
	end
	def tribal_council immune=""
		not_immune = tribe_members_not_immune immune
		voted_out = randomize_tribal_member not_immune
		@members.delete_if{|member| member == voted_out}
	end
	def tribe_members_not_immune immune
		@members.map {|member| member unless member.name == immune}
	end
	def randomize_tribal_member not_immune
		not_immune[rand(not_immune.length)]
	end
end