class Jury
	attr_accessor :members
	def initialize 
		@members = []
		@finalists = {}
	end
	def add_member member
		@members << member
	end
	def cast_votes finalists
		finalists.each do |finalist| 
			@finalists[finalist] = 0 
		end
		@members.each do |member|
			vote = randomize_vote
			@finalists[vote] += 1 
			puts "#{member.to_s} cast a vote for #{vote}"
		end
		@finalists
	end
	def randomize_vote
		vote_options = @finalists.keys
		vote_options[rand(vote_options.length)]
	end
	def report_votes final_votes
		final_votes.each {|contestent,votes| puts "#{contestent}: #{votes}"}
	end
	def announce_winner final_votes
		final_votes.max_by{|contestent,votes| votes}[0]
	end
end