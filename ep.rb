require "./vendor/core/application.rb"
require "./vendor/core/game_master.rb"
require "./vendor/core/game_builder.rb"

app      = Application.new
engine   = app.engine
game     = GameBuilder.new.build
executer = GameMaster.new(app.engine, app.fight_master)

engine.set_position(engine.rooms.keys.last)
fight_master = app.fight_master
fight_master.init_engine(engine).start



