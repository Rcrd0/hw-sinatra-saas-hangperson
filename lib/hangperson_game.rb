class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @num_tries = 0
  end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def self.get_random_word # class method?
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter) # instance method?
    raise ArgumentError.new("nil argument") if letter.nil?
    raise ArgumentError.new("empty string") if letter == ''
    raise ArgumentError.new("not a letter") unless (letter =~ /^[A-Za-z]$/) == 0
    letter.downcase!
    return false if (@guesses+@wrong_guesses).include? letter
      #debugger  
    
    @num_tries += 1
    if @word.include? letter
      @guesses += letter
    else
      @wrong_guesses += letter
    end
    return true
  end
  
  def word_with_guesses
    res = ""
    #debugger
    @word.chars {|c|; res += (@guesses.include? c) ? c : "-" }
    res
  end
  
  def check_win_or_lose
    return :lose if @num_tries >= 7
    if @word == word_with_guesses
      return :win
    else
      return :play
    end
  end
end
