class Vampire
  #class variables
    @@coven = []

  #instance methods
  def initialize(name,age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  #readers
  def in_coffin
    return @in_coffin
  end

  def drank_blood_today
    return @drank_blood_today
  end

  #writers

  def in_coffin= (coffin)
    return @in_coffin = coffin
  end

  def drank_blood_today= (drank)
    return @drank_blood_today = drank
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end
#class methods
  def self.sunrise
    @@coven.delete_if do |vamp|
      if vamp.in_coffin == false || vamp.drank_blood_today == false
        true
      end
    end
  end


  def self.create(name,age)
    new_vampire = Vampire.new(name,age)
    @@coven << new_vampire
    return new_vampire
  end

  def self.sunset
    @@coven.each do |vamp|
    vamp.in_coffin = false
    vamp.drank_blood_today = false
    end
  end

  def self.available
    return @@coven
  end

end

vampire1 = Vampire.create("Dracula",650)
p vampire1
vampire2 = Vampire.create("Daniel",400)
p vampire2
vampire3 = Vampire.create("ana",120)
p vampire3
puts "------------"
Vampire.sunset
p vampire1
vampire1.drink_blood
p vampire1
vampire1.go_home
p vampire1

puts "------------"
p vampire2
vampire2.go_home
#vampire2.drink_blood
p vampire2

puts Vampire.available.inspect
#vampire3.go_home
puts "------------"
Vampire.sunrise
puts Vampire.available.inspect
