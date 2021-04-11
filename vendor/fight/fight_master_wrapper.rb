class FightMasterWrapper

    def initialize
        @Fighter
    end

    def self.instance
        FightMaster.new
    end
end