module Rooms::Concrete
  class Room4
    def self.data
      {
        :id            => :final,
        :name          => "Final",
        :description   => "Description maison Final",
        :is_first_room => false,
        :is_last_room  => true,
        :moves         => {
          :back => :serpentard
        },
      }
    end
  end
end