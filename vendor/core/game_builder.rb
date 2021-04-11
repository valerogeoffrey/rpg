require "./vendor/rooms/room_builder.rb"
require "./vendor/actions/action_builder.rb"
require "./vendor/core/feeder.rb"

class GameBuilder

  attr_accessor :room_builder, :action_builder, :data

  def initialize
    @room_builder   = Rooms::RoomBuilder.new
    @action_builder = Actions::ActionBuilder.new
    @data           = Feeder.process
    @rooms          = {}
  end

  def build
    data.each do |room, action|
      actions         = [].push(process_action action)
      room            = process_room(room, actions)
      @rooms[room.id] = room
    end
    @rooms
  end

  private

  def process_action(action)
    @action_builder.hydrate(action).build
  end

  def process_room(room, actions)
    @room_builder
      .hydrate(room)
      .build
      .link_action(actions)
  end

end