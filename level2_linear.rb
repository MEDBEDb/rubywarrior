class Player
  def play_turn(warrior)
      if warrior.feel.empty?
      warrior.walk!
      elsif warrior.feel.enemy?
      warrior.attack!
      end
    end
end
