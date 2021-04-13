require "./vendor/utile/writer.rb"
require "./vendor/characters/wizzard.rb"
class FightMaster

  include Writer
  attr_reader :engine, :in_last_fight

  def initialize
    @in_last_fight = false
    @hero          = nil
    @mvp           = nil
    @in_fight      = true
  end

  def init_engine(engine)
    @engine = engine

    self
  end

  def start
    init_fight_phase
    loop do
      fight
      break if !in_last_fight
    end
  end

  def init_fight_phase
    init_character_fight
    @in_last_fight = @engine.is_final_room? ? true : false
  end

  def init_character_fight
    hero  = Characters::Wizzard.new('harry potter', 50)
    mvp   = Characters::Wizzard.new('voldemort', 10)
    @hero = Fighter.new(hero)
    @mvp  = Fighter.new(mvp)
  end

  def fight
    while !gameover do
      play
    end

    if !in_last_fight
      puts "It does not matter you will try the fight next time, continue to explore the rooms."
      engine.set_position(engine.rooms.keys.first)
      in_last_fight = false
    end
  end

  def play
    loop do
      @hero = @mvp.attack(@hero)
      reset_if_gameover
      action
      break if !in_last_fight
    end
  end

  def action
    puts "#{@mvp.character.name} attack #{@hero.character.name}, he has #{@hero.character.points} points left"
    puts "#{@hero.character.name}, do you want to attack or flee ? ( attack / flee )"
    action = STDIN.gets.chomp
    if action == "flee"
      engine.set_position(engine.rooms.keys.first)
      @in_last_fight = false
    else
      # Le hero attack
      @mvp = @hero.attack(@mvp)

      if mvp_is_dead?
        notify_death_mvp
        in_game       = false
        in_last_fight = false
      end
      puts "#{@hero.character.name} attack #{@mvp.character.name}, he has #{@mvp.character.points} points left"
    end
  end

  def reset_if_gameover
    if @hero.character.points <= 0
      notify_death_hero
      @engine.set_position(@engine.rooms.keys.first)
      in_last_fight = false
      # reset heros points for try again
      @hero.points = 50
    end
  end

  def gameover
    !in_last_fight && @hero.character.points == 0
  end

  def mvp_is_dead?
    @mvp.character.points <= 0
  end

  def init_fight
    puts "#{@hero.character.name}, do you want to start the fight? ( Y / N )"
    action        = STDIN.gets.chomp
    self.in_fight = action == "Y" ? true : false
  end

  def notify_death_mvp
    puts "#{@hero.character.name} attack #{@mvp.character.name} and kill him ! "
    puts "#{@mvp.character.name} is dead, congratulation"
    puts "The wizarding world is finally free"
  end

  def notify_death_hero
    puts "#{@mvp.character.name} attaque #{@hero.character.name} and kill him, You have loose the game try again :("
  end

end