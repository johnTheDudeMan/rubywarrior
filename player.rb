class Player
  def play_turn(warrior)
  	@health = 20 if @health.nil?
  	@num = 1 if @num.nil?

  	case
  	when melee_damage?(warrior) && warrior.health <= @num
  		warrior.walk!(:backward)
  	when archer_damage?(warrior)
  		warrior.feel.empty? ? warrior.walk! : warrior.attack!
  	when !archer_damage?(warrior) && !melee_damage?(warrior) && warrior.health < 8
  		@num = 5
  		warrior.rest!
	  when warrior.feel.empty?
	  	warrior.walk!
	  when !warrior.feel.empty?
	  	warrior.attack!
	  else
	  	warrior.walk!
	  end

	  @health = warrior.health
  end

  def taking_damage?(warrior)
  	warrior.health < @health
  end

  def archer_damage?(warrior)
  	taking_damage?(warrior) && warrior.feel.empty?
  end

  def melee_damage?(warrior)
  	taking_damage?(warrior) && !warrior.feel.empty?
  end

end
