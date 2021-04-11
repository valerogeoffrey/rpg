require "./vendor/utile/writer.rb"
class FightMaster

    include Writer
    attr_reader :engine, :in_last_fight

    def initialize
        @in_last_fight = false
        @hero          = nil
        @mvp           = nil
    end

    def init_engine(engine)
        @engine = engine
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
        @in_last_fight = engine.is_final_room? ? true : false
        final_room if engine.is_final_room?
    end

    def init_character_fight
        hero  = Characters::Wizzard.new('harry potter', 50)
        mvp   = Characters::Wizzard.new('voldemort', 10)
        @hero = Fighter.new(hero)
        @mvp  = Fighter.new(mvp)
    end

    def fight
        fight_manager.init_fight

        while !gameover do
            play
        end

        while in_fight && fight_manager.hero.points > 0

            mvp  = fight_manager.mvp
            hero = fight_manager.mvp_attack

            if fight_manager.hero_is_dead?
                fight_manager.notify_death_hero

                engine.set_position(:r1).get_room
                in_last_fight = false

                # reset heros points for try again
                fight_manager.hero.points = 50
                break
            end

            puts "#{mvp.name} attack #{hero.name}, he has #{hero.points} points left"
            puts "#{hero.name}, do you want to attack or flee ? ( attack / flee )"

            action = STDIN.gets.chomp

        end

        if !fight_manager.in_fight
            puts "It does not matter you will try the fight next time, continue to explore the rooms."
            engine.set_position(:r1).get_room
            in_last_fight = false
        end
    end

    def play
        loop do
            @hero = fight_manager.mvp_attack
            reset_if_gameover
            action
            break if !in_fight
        end
    end

    def action
        puts "#{mvp.name} attack #{hero.name}, he has #{hero.points} points left"
        puts "#{hero.name}, do you want to attack or flee ? ( attack / flee )"
        action = STDIN.gets.chomp
        if action == "flee"
            engine.set_position(:r1).get_room
            in_last_fight = false
        else
            # Le hero attack
            mvp = fight_manager.hero_attack

            if fight_manager.mvp_is_dead?
                fight_manager.notify_death_mvp
                in_game       = false
                in_last_fight = false
            end
            puts "#{hero.name} attack #{mvp.name}, he has #{mvp.points} points left"
        end
    end

    def reset_if_gameover
        if fight_manager.hero_is_dead?
            fight_manager.notify_death_hero

            engine.set_position(:r1).get_room
            in_last_fight = false

            # reset heros points for try again
            fight_manager.hero.points = 50
        end
    end

    def gameover
        !in_last_fight && fight_manager.hero.points == 0
    end

    def init_fight
        puts "#{hero.name}, do you want to start the fight? ( Y / N )"
        action        = STDIN.gets.chomp
        self.in_fight = action == "Y" ? true : false
    end

    def notify_death_mvp
        puts "#{hero.name} attack #{mvp.name} and kill him ! "
        puts "#{mvp.name} is dead, congratulation"
        puts "The wizarding world is finally free"
    end

    def notify_death_hero
        puts "#{mvp.name} attaque #{hero.name} and kill him, You have loose the game try again :("
    end

end