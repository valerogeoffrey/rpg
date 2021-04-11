require "./vendor/rooms/room.rb"

module Rooms
  class RoomBuilder

    attr_accessor :room

    def initialize
      @data          = []
      @room          = nil
    end

    # possible to extend special logic business
    # to hydredata
    def hydrate(args)
      @data = args
      self
    end

    def build
      @room = Rooms::Room.new.hydrate(@data)

      self
    end

    def link_action(actions)
      @room.link_actions(actions)
    end
  end
end