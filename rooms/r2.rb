
module Rooms
    class R2 < Generic
        attr_accessor :name,:description,:actions
        def initialize
            @name     = "Room 2 - The giant chess board"
            @description = "You are in the west wing named the course of miracle"
            super(@name,@description)
        end
    end
end
