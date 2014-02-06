class Player
  def initialize
    @max_health = 20
    @mid_health = @max_health/2
    @danger_health = @max_health * 3 / 4
    @last_health = @max_health
  end
  
  def get_enemies(warrior)
    find_enemies(warrior) or find_enemies(warrior, :backward)
  end
 
  def find_enemies(warrior, where = :forward)
    enemy_spaces = warrior.look(where).find_all {|space| space.enemy? }
    return enemy_spaces.any?
  end
  
  def get_captives(warrior)
    find_captives(warrior) or find_captives(warrior, :backward)
  end
  
  def find_captives(warrior, where = :forward)
    captive_spaces = warrior.look(where).find_all {|space| space.captive? }
    return captive_spaces.any?
  end
  def rescues(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    else
      warrior.walk!
    end
  end
  def movement(warrior)
    if get_captives(warrior)
      rescues(warrior)
    elsif get_enemies(warrior)
      attacks(warrior)
    elsif warrior.feel.wall?
      warrior.pivot!
    else
      warrior.walk!
    end
  end
  
 def attacks(warrior)
    if warrior.feel(:backward).enemy?
      warrior.pivot!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif find_enemies(warrior, :backward)
      warrior.shoot!(:backward)
    elsif find_enemies(warrior)
      warrior.shoot!
    end
  end  

def diminishing_health(warrior)
    warrior.health < @last_health
  end

  def play_turn(warrior)
    if diminishing_health(warrior) and warrior.health <= @mid_health
      warrior.walk!(:backward)
    elsif diminishing_health(warrior)
      movement(warrior)
    elsif !diminishing_health(warrior) and warrior.health < @max_health 
      warrior.rest!
    elsif warrior.feel.captive?
      warrior.rescue!
    else 
      movement(warrior)
    end
    @last_health = warrior.health
  end
end 