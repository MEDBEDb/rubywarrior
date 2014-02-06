class Player
def play_turn(warrior)
  @max_health = 20
  @current_health = warrior.health
  @mid_health = 9
  @danger_health = 3

 if warrior.feel.wall?
  warrior.pivot!
 elsif warrior.feel.captive?
  warrior.rescue!
 elsif warrior.look(:backward).find_all {|space| space.enemy? }.size.to_i == 1
  warrior.shoot!(:backward)
 elsif warrior.look.find_all {|space| space.enemy? }.size.to_i == 2
  warrior.shoot!
 elsif warrior.health == @max_health
  warrior.walk!
 elsif warrior.look.find_all {|space| space.enemy? }.size.to_i == 0 and @current_health >= @health
  warrior.rest!
 elsif warrior.health < @mid_health and @current_health < @health
  warrior.walk!(:backward)
 else 
  warrior.shoot!
 end
  @health = warrior.health
 end
end  
