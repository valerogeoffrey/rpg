module Rooms::Concrete
  class Room5
    def self.data
      {
        :id            => :agrid,
        :name          => "Agrid",
        :description   => "Description maison Agrid",
        :is_first_room => false,
        :is_last_room  => false,
        :moves         => {
          :left => :poufssoufle,
          :back => :gryffondor,
        },
      }
    end
  end
end