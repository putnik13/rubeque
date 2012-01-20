# puts 'EMPTY THE MONGODB DATABASE'
# Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

Problem.delete_all

######################################################################################################################

Problem.create!(#_id: 1,
                difficulty: "easy",
                title: "The truth",
                tag_list: "booleans",
                instructions: "Here's a hint: true equals true.",
                code: "assert_equal true, __",
                approved: true)

######################################################################################################################

Problem.create!(#_id: 1,
                difficulty: "easy",
                title: "Hello World",
                instructions: "",
                tag_list: "strings",
                code: "assert_equal 'HELLO WORLD', 'hello world'.__",
                approved: true)

######################################################################################################################

Problem.create!(#_id: 2,
                difficulty: "easy",
                title: "Nil Values",
                instructions: "Enter in a boolean value for what #nil? will return.",
                tag_list: "nil, booleans",
                code: "[0, '', 'chunky_bacon'].each { |v| assert_equal v.nil?, __ }",
                approved: true)

######################################################################################################################

Problem.create!(#_id: 3,
                difficulty: "easy",
                title: "Reverse",
                instructions: "What happens when you apply reverse? Hint: don't forget to quote your strings!",
                tag_list: "strings",
                code: "assert_equal 'nocab yknuhc'.reverse, __",
                approved: true)

######################################################################################################################

Problem.create!(#_id: 4,
                difficulty: "easy",
                title: "FizzBuzz",
                instructions: "If a number is divisible by 3, return \"Fizz\". If a number is divisible by 5, return \"Buzz\". If a number
                               is divisible by 3 and 5, return \"FizzBuzz\"",
                tag_list: "arithmetic, strings",
                approved: true,
                code: <<-eos
def fizzbuzz(x)
  __
end

assert_equal fizzbuzz(3), "Fizz"
assert_equal fizzbuzz(50), "Buzz"
assert_equal fizzbuzz(15), "FizzBuzz"
assert_equal fizzbuzz(5175), "FizzBuzz"
eos
               )

######################################################################################################################

Problem.create!(#_id: 5,
                difficulty: "easy",
                title: "Map",
                instructions: "How would you create an array that contains the squares of all elements in a range?",
                tag_list: "enumerables",
                code: "assert_equal [1, 4, 9, 16], (1..4).map { __ }",
                approved: true)

######################################################################################################################

Problem.create!(difficulty: "easy",
                title: "The Curious Case of the Missing Method",
                instructions: "Stop this code from throwing an exception. Hint: find the right seven letter array
                  method: http://ruby-doc.org/core-1.9.3/Array.html",
                tag_list: "enumerables, arrays",
                code: "assert_equal [1, 4, nil, 9, 16, nil].__.inject(0) {|sum, number| sum + number}, 30",
                approved: true)

######################################################################################################################

Problem.create!(difficulty: "easy",
                title: "Blackjack",
                instructions: "Write a method that takes any number of integers and returns true if they sum to 21, false otherwise. Hint: splat operator.",
                approved: true,
                tag_list: "arithmetic, splat operator",
                code: <<-code_block
__

assert_equal twenty_one?(3, 4, 5, 6, 3), true
assert_equal twenty_one?(3, 11, 10), false
assert_equal twenty_one?(10, 11), true
code_block
               )

######################################################################################################################

Problem.create!(difficulty: "easy",
                title: "Injected and Rejected",
                instructions: "Write a method using inject and reject that takes an array of integers and gets the sum for all numbers greater than 50",
                approved: true,
                tag_list: "arithmetic, enumerables",
                code: <<-code_block
def average_over_50(arr)
  arr.__
end

assert_equal sum_over_50([29, 52, 77, 102]), 231
assert_equal sum_over_50([5, 11, 50]), 0
assert_equal sum_over_50([4, 8, 15, 16, 23, 42]), 0
assert_equal sum_over_50([300, 22, 1, 55, 42]), 355
code_block
               )

######################################################################################################################

Problem.create!(difficulty: "easy",
                title: "Introduction to Regular Expressions",
                instructions: "Write a regular expression that will match emails in a string.",
                approved: true,
                tag_list: "strings, regular expressions",
                code: <<-code_block
assert_equal "john@mail.com to jane@mail.com".scan(/__/), ["john@mail.com", "jane@mail.com"]
assert_equal "why@ @chunkybacon.com why@chunkybacon.com".scan(/__/), ["why@chunkybacon.com"]
assert_equal "why @ @ why@chunkybacon".scan(/__/), []
code_block
               )

######################################################################################################################

Problem.create!(#_id: 6,
                difficulty: "easy",
                title: "Reverse each word",
                instructions: "Write a method that takes a sentence and returns it with each word reversed in place.",
                tag_list: "strings, enumerables",
                approved: true,
                code: <<-code_block
def reverse_each_word(sentence)
 __
end

assert_equal "olleH ,ereht dna woh era ?uoy", reverse_each_word("Hello there, and how are you?")
code_block
               )

######################################################################################################################

Problem.create!(#_id: 7,
                  difficulty: "easy",
                  title: "Your favorite and mine, Fibonacci!",
                  instructions: "Write a method that handles Fibonacci sequences. Have it return the nth item in the Fibonacci sequence.  
                    Hint: The first item in the sequence is 0.",
                  approved: true,
                  tag_list: "arithmetic",
                  code: <<-code_block
 def fibo_finder(n)
   __
 end

 assert_equal 0, fibo_finder(0)
 assert_equal 1, fibo_finder(1)
 assert_equal 3, fibo_finder(4)
 assert_equal 13, fibo_finder(7)
 assert_equal 55, fibo_finder(10)
 code_block
                 )

######################################################################################################################

Problem.create!(#_id: 8,
               difficulty: 'medium',
               title: "Pigs Fly;  Wait, No They Don't.",
               instructions: 'Can you make a method return a differect value after a "return" is called?',
               approved: true,
               tag_list: "exceptions",
               code: <<-eos
def do_pigs_fly?
  return true
  __
end

assert_equal do_pigs_fly?, false
               eos
               )

######################################################################################################################

Problem.create!(#_id: 9,
                  difficulty: "medium",
                  title: "Happy Numbers",
                  instructions: "Happy numbers are positive integers that follow a particular formula: take each individual digit,
                                 square it, and then sum the squares to get a new number. Repeat with the new number and eventually,
                                 you might get to a number whose squared sum is 1. This is a happy number. An unhappy number (or
                                 sad number) is one that loops endlessly. Write a function that determines if a number is happy or not.",
                  approved: true,
                  tag_list: "arithmetic",
                  code: <<-code_block
 __

 assert_equal happy_number?(7), true
 assert_equal happy_number?(986543210), true
 assert_equal happy_number?(2), false
 assert_equal happy_number?(3), false
 code_block
                 )

######################################################################################################################

Problem.create!(difficulty: "hard",
                title: "Mason's Spades Problem",
                instructions: %Q{In the game of spades, one player deals all 52 cards to four players so that each has 13 cards in his or her hand.
                  The cards are shuffled prior to dealing, so that the distribution is random. The first play of the game is for each player to
                  lay down his or her lowest club (where clubs are ordered from low to high as: 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace).
                  <br/><br/>Once all four lowest clubs are on the table, the player who threw the highest of those four cards wins the cards (in other words,
                  he or she wins the "trick"). If a player has no clubs, he or she must play a heart or a diamond, and that card has no chance
                  of winning the trick. If a player has no clubs, no hearts, and no diamonds, then the player must play a spade, and will be
                  guaranteed to win the trick.<br/><br/>Write a class that has a method #winning_probablity that will return the probability of
                  a given card. Cards will be supplied in the format "2H" where two is the numeric value and H stands for hearts. Face value cards
                  will be of the format "AC" for ace of clubs, or "KS" for king of spades, etc. Results must contain two significant digits
                  after the decimal.},
               tag_list: "probability, arithmetic",
               approved: true,
               code: <<-code_block
__

assert_equal first_trick.winning_probability("2C"), 0.00
assert_equal first_trick.winning_probability("10C"), 9.08
assert_equal first_trick.winning_probability("KC"), 3.50
assert_equal first_trick.winning_probability("9C"), 11.87
assert_equal first_trick.winning_probability("2S"), 0.00
assert_equal first_trick.winning_probability("AH"), 0.00
code_block
)
