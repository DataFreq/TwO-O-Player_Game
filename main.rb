require "./player"
require "./question"

def start 
  puts "Two player addition game @DataFreq"
  game
end

@player1 = Player.new
@player2 = Player.new
@count = 0

def divider
  puts "----- [ NEW TURN ] -----"
end

def score
  puts "----- [ SCOREBOARD ] -----"
  puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  puts "--------------------------"
end

def check
  if @player1.alive? && @player2.alive?
    game
  elsif !@player1.alive?
    puts "Player 2 wins with a score of #{@player2.lives}/3"
    puts "----- [ GAME OVER ] -----"
  else
    puts "Player 1 wins with a score of #{@player1.lives}/3"
    puts "----- [ GAME OVER ] -----"
  end
end

def game
  divider
  question = Question.new
  if @count % 2 == 0
    puts "Player 1: #{question.display}"
  else
    puts "Player 2: #{question.display}"
  end
  print '> '
  answer = gets.chomp
  if answer == question.answer
    puts 'Correct!'
    score
  else
    puts 'Wrong!'
    if @count % 2 == 0
      @player1.lives -= 1
      score
    else
      @player2.lives -= 1
      score
    end
  end
  @count += 1
  check
end

start