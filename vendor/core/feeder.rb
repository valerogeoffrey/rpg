require "./vendor/rooms/room_builder.rb"
require "./vendor/actions/action_builder.rb"
Dir["./vendor/actions/concrete/*.rb"].each { |file| require file }
Dir["./vendor/rooms/concrete/*.rb"].each { |file| require file }

class Feeder
  def self.process
    #Initialisation des salle + actions peut etre mit dans un fichier de config
    room1   = Rooms::Concrete::Room1.data
    action1 = Actions::Concrete::Action1.data

    room2   = Rooms::Concrete::Room2.data
    action2 = Actions::Concrete::Action2.data

    room3   = Rooms::Concrete::Room3.data
    action3 = Actions::Concrete::Action3.data

    room4   = Rooms::Concrete::Room4.data
    action4 = Actions::Concrete::Action1.data

    [] << [room1, action1] << [room2, action2] << [room3, action3] << [room4, action4]
  end
end