module Rooms
    class R3 < Generic
        attr_accessor :name, :description, :actions

        def initialize
            @name        = "Room 3 - the botanical garden"
            @description = "You can see on your left, Hagrid's chimney smoking"
            @action      = []
            super(@name, @description)
        end
    end
end
