require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require "colorizr"

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
	#The game starts with 20 contestants, broken up evenly into two tribes of 10 contestants.
	puts "Welcome to the start of Survivr!\n\n"
	puts "OVERVIEW\n\n"
	puts "The game starts with 20 contestants, broken up evenly into two tribes of 10 contestants."
	puts "TRIBE #{@coyopa.name.upcase}:".blue
	@coyopa.members.each {|contestant| puts contestant}
	puts "TRIBE #{@hunapu.name.upcase}:".pink
	@hunapu.members.each {|contestant| puts contestant}

	# The tribes compete in 8 challenges against each 
	# other in an immunity challenge. 
	num = 0
	8.times do
  	puts "** Challenge #{num += 1} **\n\n"
  	
  	#There is a losing tribe every time.
  	losing_tribe = @borneo.immunity_challenge
		puts "#{losing_tribe} lost".red
  
	  # One contestant from the losing tribe is eliminated after every 
	  # challenge at what is called a “Tribal Council”
	  puts "TRIBAL COUNCIL"
	  elemenated_member = losing_tribe.tribal_council
		puts "#{elemenated_member} was elementated".red
	end

	puts "-- END OF PHASE 1 --\n\n"
	puts ""
	puts "-----------------"
	puts "Now onto Phase 2 -->"
	
	num
end

def phase_two
	puts "PHASE TWO\n"
	num = 0
	#The single tribe of 12 contestants compete in 3 additional individual immunity challenges.
	3.times do
		puts "** Challenge #{num += 1} **\n\n"

		#The individual winner of every challenge is immune from being eliminated.
  	winning_contestant = @borneo.individual_immunity_challenge
		puts "#{winning_contestant} won and is immune from being eliminated".green
		puts "TRIBAL COUNCIL"

		#One contestant is eliminated after every challenge.
	  elemenated_contestant = @merge_tribe.tribal_council winning_contestant
		puts "#{elemenated_contestant} was elementated".red
	end

	puts "-- END OF PHASE 2 --\n\n"
	#After 3 eliminations, there are 9 remaining contestants.
	puts "After 3 eliminations, there are #{@merge_tribe.members.length} remaining contestants:\n\n"
	puts "Tribe members".upcase
	@merge_tribe.members.each {|contestant| puts contestant.name}
	puts ""
	puts "-----------------"
	puts "Now onto Phase 3 -->"
	num
end

def phase_three
	#In phase three, there are 7 more challenges with an “immune” winner, as in the previous rounds.
	#However, each contestant that is eliminated during these challenges is set aside to another group, known as the jury.
	#This leaves 2 finalists and 7 jury members.
	num = 0
	7.times do
		puts
		puts "** Challenge #{num += 1} **\n\n"

		#The individual winner of every challenge is immune from being eliminated.
  	winning_contestant = @borneo.individual_immunity_challenge
		puts "#{winning_contestant} won and is immune from being eliminated".green
		puts "TRIBAL COUNCIL"

		#One contestant is eliminated after every challenge.
	  elemenated_contestant = @merge_tribe.tribal_council winning_contestant
	  @jury.add_member elemenated_contestant
		puts "#{elemenated_contestant} was elementated and added to the Jury".yellow
	end

	puts ""
	puts "Our finalists are:".upcase
	@merge_tribe.members.each {|contestant| puts contestant}
	puts ""

	puts "Our jury is:".upcase
	@jury.members.each {|juror| puts juror}
	puts ""
	puts "-----------------"
	puts "Now onto Final Stage -->"
	num
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
