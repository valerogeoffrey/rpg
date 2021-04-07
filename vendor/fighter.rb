Dir["./personnages/*.rb"].each { |file| require file }

class Fighter
    attr_accessor :hero,:mvp
    @@instance

    def initialize()
        @hero = Characters::Wizzard.new('Harry potter', 50)
        @mvp  = Characters::Wizzard.new('Voldemort', 20)
        @spell  = {
            avada_kedavra: 10,
            expeliarmus:   15,
            stupefix:      5,
        }
    end

    def set_point(perso,points)
        if perso == :hero
            @hero.points = points
        end
        if perso == :mvp
            @mvp.points =  points
        end
    end

    def self.instance
        @@instance ||= Fighter.new
    end

    def get_hero
        @hero
    end

    def get_mvp
        @mvp
    end

    def attack(perso)
        points = @spell[@spell.keys.sample]
        if perso == :hero
            @hero.points = @hero.points - points
        end
        if perso == :mvp
            @mvp.points = @mvp.points - points
        end

        self
    end

end
