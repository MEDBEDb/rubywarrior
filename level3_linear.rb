class Player
def play_turn(warrior)
 if warrior.feel.empty? and warrior.health == 20
  warrior.walk!
 elsif warrior.feel.empty? and warrior.health < 20
  warrior.rest!
 elsif warrior.feel.enemy? 
  warrior.attack!
  end
 end
end
