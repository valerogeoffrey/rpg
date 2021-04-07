require "./vendor/engine.rb"
require "./vendor/writer.rb"
require "./vendor/fighter.rb"
require "./vendor/fight_manager.rb"
require "./vendor/map.rb"

class Application
    attr_accessor :engine, :fighter,:writer,:map,:fight_manager

    def initialize
        @engine  = Engine.new
        @fighter = Fighter.instance
        @fight_manager = FightManager.new(@fighter)
        @writer  = Writer.new
        @map  = Map.new
    end

end
