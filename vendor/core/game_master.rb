require "./vendor/utile/writer.rb"
class GameMaster

  include Writer

  attr_accessor :in_game, :mooven, :engine, :room_name
  attr_reader :final_fight

  def initialize(engine, fight_master)
    differ_initialize
    @engine       = engine
    @fight_master = fight_master
  end

  def differ_initialize
    @rooms   = {}
    @in_game = true
    @moove   = ""
  end

  def start_game(rooms)
    @rooms           = rooms
    @room_name       = @rooms.keys.first

    @engine.rooms    = @rooms
    @engine.position = @room_name

    start
  end

  protected

  def start
    loop do
      play
      break if !in_game
    end
  end

  def play
    init_game

    moove_on
      .get_next_room
      .check_step_and_make_action

    @fight_master.init_engine(@engine).start if @engine.is_final_room?
  end

  def init_game
    @engine.init_scenario
    @moove = STDIN.gets.chomp
    write_separatation_in_console
  end

  def moove_on
    @room_name = @engine.get_next_room if @engine.set_moove(@moove).is_legal_moove?
    self
  end

  def get_next_room
    @room = @engine.set_position(room_name).get_obj_room
    self
  end

  def check_step_and_make_action

    if @engine.is_not_in_final_room?
      @room.puts_description
      @room.execute_actions
      puts "Where do you want to go ? ( #{@engine.get_moves} )"
    end
  end

end