module Rooms
    class R4 < Generic
        attr_accessor :name, :description, :actions

        def initialize
            @name        = "Room 4 - Chamber of Secrets"
            @description = "Be careful, the basil rode"
            @action      = []
            super(@name, @description)
        end
    end
end
