class Game

  attr_accessor :player1_points, :player2_points, :player1_advantage, :player2_advantage

  def initialize 
    @player1_points = 0
    @player1_advantage = false
    @player2_points = 0
    @player2_advantage = false
  end

  def add_point(player_number)
    if winner == 0 then
      if deuce? then
        case player_number
        when 1
          if (@player1_advantage) then
            @player1_points += 1
          elsif (@player2_advantage) then
            @player2_advantage = false
          else
            @player1_advantage = true
          end
        when 2
          if (@player2_advantage) then
            @player2_points += 1
          elsif (@player1_advantage) then
            @player1_advantage = false
          else
            @player2_advantage = true
          end
        end
      else
        case player_number
        when 1
          @player1_points += 1
        when 2
          @player2_points += 1
        end
      end
    else
      raise ArgumentError, "Player #{winner} has already won"
    end
  end

  def deuce?
    return @player1_points == 3 && @player2_points == 3
  end

  def winner
    if(@player1_points == 4) then
      return 1
    elsif (@player2_points == 4) then
      return 2
    else
      return 0
    end
  end

  def score
    case winner
    when 1
      return "Player 1 won"
    when 2
      return "Player 2 won"
    else
      return "Player 1: #{@player1_advantage ? "AD" : translate_score(@player1_points)}, Player 2: #{@player2_advantage ? "AD" : translate_score(@player2_points)}"
    end
  end

  private
    def translate_score(score)
      case score
      when 0
        return 0
      when 1
        return 15
      when 2
        return 30
      when 3
        return 40
      when 4
        return 50
      else
        raise "Invalid score"
    end
  end
end