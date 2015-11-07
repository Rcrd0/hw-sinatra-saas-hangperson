arr =  [1, 2, 6, 4, 5, 6]

#max1 = arr.max
#arr.delete_at(arr.index(max1) || arr.length)
#max2 = arr.max
#puts max1 + max2
#puts "aeiou".include?("z")
require './hangperson_game'
g = HangpersonGame.new("zebra")

puts g.check_win_or_lose.to_s
g.guess("i")
g.guess("s")
g.guess("u")
puts g.check_win_or_lose.to_s
g.guess("c")
g.guess("k")
g.guess("h")
puts g.check_win_or_lose.to_s
puts g.word_with_guesses
g.guess("a")
puts g.word_with_guesses
puts g.check_win_or_lose.to_s
g.guess("r")
puts g.check_win_or_lose.to_s
puts g.word_with_guesses
puts g.check_win_or_lose.to_s

