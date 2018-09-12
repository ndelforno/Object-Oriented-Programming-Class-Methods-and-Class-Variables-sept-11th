class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed,strength)
    if speed > @@max_speed
      @zombie_speed = @@default_speed
    else
      @zombie_speed = speed
    end
    if strength <= @@max_strength
      @zombie_strength = strength
    else
      @zombie_strength = @@default_strength
    end
  end
#readers
  def zombie_speed
    return @zombie_speed
  end

  def zombie_strength
    return @zombie_strength
  end
#instance methods
  def encounter(zombie)
    if zombie.outrun_zombie?(zombie)
      puts "You escaped!"
    elsif zombie.survive_attack?(zombie)
      puts "You are now a zombie!"
      @@horde << Zombie.new(rand(@@max_speed + 1),rand(@@max_strength + 1))
    else
      puts "You died!"
    end
  end

  def outrun_zombie?(zombie)
    if rand(@@max_speed+1) > zombie.zombie_speed
      return true
    else
      return false
    end
  end

  def survive_attack?(zombie)
    if rand(@@max_strength+1) > zombie.zombie_strength
      return true
    else
      return false
    end
  end


#class methods
  def self.all
    return @@horde
  end

  def self.new_day
    Zombie.spawn
    Zombie.some_die_off
    Zombie.increase_plague_level
  end

  def self.some_die_off
    @@horde.delete(rand(11))
  end

  def self.spawn
    numbers_of_zombie = rand(@@plague_level + 1)
    numbers_of_zombie.times do
    new_zombie = Zombie.new(rand(@@max_speed + 1),rand(@@max_strength + 1))
    @@horde << new_zombie
    end
  end

  def self.increase_plague_level
    @@plague_level = @@plague_level + rand(3)
  end
end

#puts Zombie.all.inspect
Zombie.new_day
#puts Zombie.all.inspect
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
#p zombie1
puts zombie1.encounter(zombie1)
puts zombie2.encounter(zombie2)
puts zombie3.encounter(zombie3)
puts "-------------"
Zombie.new_day
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter(zombie1)
puts zombie2.encounter(zombie2)
puts zombie3.encounter(zombie3)
