class Player
def play_turn(warrior)
@max_health = 20
@current_health = warrior.health
@danger_health = 9

 if warrior.feel.wall?
  warrior.pivot!
 elsif warrior.feel.captive?
  warrior.rescue!
 elsif warrior.look.find_all {|space| space.captive? }.size.to_i == 1
  warrior.walk!
elsif warrior.look.find_all {|space| space.enemy? }.size.to_i == 2
  warrior.shoot!
 elsif warrior.look.find_all {|space| space.enemy? }.size.to_i == 3 
  warrior.shoot!
 elsif warrior.look.find_all {|space| space.enemy? }.size.to_i == 0
  warrior.walk!
 elsif warrior.health < @danger_health and @current_health < @health
  warrior.walk!(:backward)
 else
  warrior.shoot!
 end
  @health = warrior.health
 end
end  
