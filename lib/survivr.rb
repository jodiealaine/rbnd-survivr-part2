require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	num = 0

	8.times do
  	puts "Challenge #{num += 1}"
  	losing_tribe = @borneo.immunity_challenge
		puts "#{losing_tribe} lost"
		puts "TRIBAL COUNCIL"
	  elemenated_member = losing_tribe.tribal_council
		puts "#{elemenated_member} was elementated"
	end

	puts "-- END OF PHASE 1 --\n\n"
	puts "MERGE TRIBES\n\n"
	new_combined_tribe = @borneo.merge "Merged Tribe"
	puts ""
	puts "Tribes have been merged into one tribe of #{new_combined_tribe.members.length}"
	puts "Tribe members".upcase
	new_combined_tribe.members.each {|contestent| puts contestent.name}
	puts ""
	puts "-----------------"
	puts "Now onto Phase 2 -->"
	
	return num
end

def phase_two
	3
end

def phase_three
	7
end

phase_one

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
# # phase_one #8 eliminations
# @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
# # phase_two #3 more eliminations
# @jury = Jury.new
# # phase_three #7 elminiations become jury members
# finalists = @merge_tribe.members #set finalists
# vote_results = @jury.cast_votes(finalists) #Jury members report votes
# @jury.report_votes(vote_results) #Jury announces their votes
# @jury.announce_winner(vote_results) #Jury announces final winner
