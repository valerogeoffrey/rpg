require "./vendor/core/application.rb"
require "./vendor/core/game_master.rb"
require "./vendor/core/game_builder.rb"

app = Application.new
game = GameBuilder.new.build

executer = GameMaster.new(app.engine,app.fight_master)

executer.start_game(game)

