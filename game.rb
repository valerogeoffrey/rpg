require "./application.rb"

app = Application.new

writer        = app.writer
engine        = app.engine
fight_manager = app.fight_manager

room_name = engine.get_position

in_game = true
while in_game
    # Scenario Initialization
    engine.init_scenario
    moove = STDIN.gets.chomp
    writer.separate

    if engine.set_moove(moove).is_legal_moove?
        room_name = engine.get_next_room
    end

    room = engine.set_position(room_name).get_room

    if engine.is_not_in_final_room?
        room.puts_description
        room.execute_actions
        puts "Where do you want to go ? ( #{engine.get_moves} )"
    end

    in_last_fight = engine.is_final_room? ? true : false


    writer.final_room if engine.is_final_room?

    while in_last_fight

        fight_manager.init_fight

        while fight_manager.in_fight && fight_manager.hero.points > 0

            mvp  = fight_manager.mvp
            hero = fight_manager.mvp_attack

            if fight_manager.hero_is_dead?
                fight_manager.notify_death_hero

                engine.set_position(:r1).get_room
                in_last_fight             = false

                # reset heros points for try again
                fight_manager.hero.points = 50
                break
            end

            puts "#{mvp.name} attack #{hero.name}, he has #{hero.points} points left"
            puts "#{hero.name}, do you want to attack or flee ? ( attack / flee )"

            action = STDIN.gets.chomp

            if action == "flee"
                engine.set_position(:r1).get_room
                in_last_fight = false
                break
            else
                # Le hero attack
                mvp = fight_manager.hero_attack

                if fight_manager.mvp_is_dead?
                    fight_manager.notify_death_mvp
                    in_game       = false
                    in_last_fight = false
                    break
                end
                puts "#{hero.name} attack #{mvp.name}, he has #{mvp.points} points left"
            end

        end

        if !fight_manager.in_fight
            puts "It does not matter you will try the fight next time, continue to explore the rooms."
            engine.set_position(:r1).get_room
            in_last_fight = false
        end

    end
end

