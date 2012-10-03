require_relative 'game'

class Match
  
  attr_accessor :played_games, :current_game, :winner

  def initialize
    @played_games = Array.new
    @current_game = Game.new
    play
  end

  def add_point(player_number)
    if(@current_game.winner == 0 && winner.nil?) then
      @current_game.add_point(player_number)
      current_score
      winner
    else
      @played_games << @current_game
      score
      if winner.nil? then
        @current_game = Game.new
        self.add_point(player_number)
      end
    end
  end

  def current_score
    p "Game #{played_games.length+1}: #{@current_game.score}"
  end

  def score
    games_for_1 = 0
    games_for_2 = 0
    played_games.each do |game|
      if(game.winner==1) then
        games_for_1+= 1
      else
        games_for_2+= 1
      end
    end
    puts()
    p "Player 1: #{games_for_1}, Player 2: #{games_for_2}"
    puts()
  end

  def winner
    games_for_1 = 0
    games_for_2 = 0
    played_games.each do |game|
      if(game.winner==1) then
        games_for_1+= 1
      else
        games_for_2+= 1
      end
    end
    if(games_for_1 >= 6 || games_for_2 >= 6) then
      if (games_for_1 >= (games_for_2+2))
        @winner = 1
      elsif (games_for_2 >= (games_for_1+2))
        @winner = 2
      end
    end
  end

  def play
    while @winner.nil?
      add_point(Random::rand(1..2))
    end
    p "And the winner is: Player #{@winner}!"
  end
end

Match.new