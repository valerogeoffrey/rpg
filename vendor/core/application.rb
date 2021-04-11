require "./vendor/core/engine.rb"
require "./vendor/utile/writer.rb"
require "./vendor/fight/fighter.rb"
require "./vendor/fight/fight_master.rb"
require "./vendor/fight/fight_master_wrapper.rb"
require "./vendor/core/map.rb"

class Application
    attr_accessor :engine,:fight_master

    def initialize
        @engine  = Engine.new
        @fight_master  = FightMasterWrapper.instance
    end

end
