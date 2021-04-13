module Rooms::Concrete
  class Room2
    def self.data
      {
        :id            => :pouffsouffle,
        :name          => "Maison pouffsouffle",
        :description   => "Description maison pouffsouffle",
        :is_first_room => false,
        :is_last_room  => true,
        :moves         => {
          :forward => :serpentard,
        },
      }
    end
  end
end