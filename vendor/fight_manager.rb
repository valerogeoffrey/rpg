class FightManager

    attr_accessor :in_fight, :hero, :mvp
    def initialize(fighter)
        @fighter     = fighter
        @in_fight = false
        @hero        = @fighter.get_hero
        @mvp         = @fighter.get_mvp
    end

    def hero_is_dead?
        @hero.points <= 0
    end

    def mvp_is_dead?
        @mvp.points <= 0
    end

    def hero_attack
        @mvp = @fighter.attack(:mvp).get_mvp
    end

    def mvp_attack
        @hero = @fighter.attack(:hero).get_hero
    end

    def get_mvp
        @mvp
    end

    def get_hero
        @hero
    end

    def init_fight
        puts "#{@hero.name}, do you want to start the fight? ( Y / N )"
        action       = STDIN.gets.chomp
        @in_fight = action == "Y" ? true : false
    end

    def get_state_fight
        @fight_state
    end

    def notify_death_mvp
        puts "#{@hero.name} attack #{@mvp.name} and kill him ! "
        puts "#{@mvp.name} is dead, congratulation"
        puts "The wizarding world is finally free"
    end

    def notify_death_hero
        puts "#{@mvp.name} attaque #{@hero.name} and kill him, You have loose the game try again :("
    end

end
