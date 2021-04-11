module Rooms::Concrete
  class Room3
    def self.data
      {
        :id            => :serpentard,
        :name          => "Maison serpentard",
        :description   => "Description maison serpentard",
        :is_first_room => false,
        :is_last_room  => false,
        :moves         => {
          :forward => :final,
        },
      }
    end
  end
end