require "./vendor/engine.rb"
require "./vendor/writer.rb"
require "./vendor/fighter.rb"
require "./vendor/fight_manager.rb"
require "./vendor/map.rb"

module Test
    class Tester
        def initialize
        end
        def exec
            self.test_fight_manager_and_fight
        end

        def test_fight_manager_and_fight
            fighter = Fighter.instance

            # ////////////////////////////////////////////////////////////////////////////////////////////
            # Test FIGHTER MANAGER instance //////////////////////////////////////////////////////////////
            # ////////////////////////////////////////////////////////////////////////////////////////////
            fighter.set_point(:hero,0)

            obj = FightManager.new(fighter)

            raise("hero not dead") if !obj.hero_is_dead?

            fighter.set_point(:mvp,0)
            raise("mvp not dead") if !obj.mvp_is_dead?

            tmp_var = obj.hero_attack
            raise("Not god object Personnage::Wizzard") if tmp_var.class.name != "Personnage::Wizzard"

            tmp_var = obj.mvp_attack
            raise("Not god object Personnage::Wizzard") if tmp_var.class.name != "Personnage::Wizzard"

            tmp_var = obj.get_mvp
            raise("Not god object Personnage::Wizzard") if tmp_var.class.name != "Personnage::Wizzard"

            tmp_var = obj.get_hero
            raise("Not god object Personnage::Wizzard") if tmp_var.class.name != "Personnage::Wizzard"

            # ////////////////////////////////////////////////////////////////////////////////////////////
            # Test FIGTHER instance ///////////////////////////////////////////////////////////////////////
            # ////////////////////////////////////////////////////////////////////////////////////////////
            fighter.set_point(:hero,10)
            tmp_var = fighter.hero.points == 10
            raise("Not god points process hero #{tmp_var}") if !tmp_var

            fighter.set_point(:mvp,10)
            tmp_var = fighter.mvp.points == 10
            raise("Not god points process mvp #{tmp_var}") if !tmp_var

            tmp_var = fighter.get_mvp
            raise("Not god object Personnage::Wizzard") if tmp_var.class.name != "Personnage::Wizzard"

            tmp_var = fighter.get_hero
            raise("Not god object Personnage::Wizzard") if tmp_var.class.name != "Personnage::Wizzard"

            tmp_var = Fighter.instance
            raise("Not god object Fighter") if tmp_var.class.name != "Fighter"

            # ////////////////////////////////////////////////////////////////////////////////////////////
            # Test WIZARD instance ///////////////////////////////////////////////////////////////////////
            # ////////////////////////////////////////////////////////////////////////////////////////////
            tmp_var = Personnage::Wizzard.new("test",100)
            raise("Not god object Personnage::Wizzard") if tmp_var.class.name != "Personnage::Wizzard"
            raise("bad point access") if tmp_var.points != 100
            raise("bad name access") if tmp_var.name != "test"


            # ////////////////////////////////////////////////////////////////////////////////////////////
            # Test ENGINE instance ///////////////////////////////////////////////////////////////////////
            # ////////////////////////////////////////////////////////////////////////////////////////////
            tmp_var = Engine.new

            tmp_var.set_position(:r1)
            raise("Not god object Engine") if tmp_var.class.name != "Engine"

            res = tmp_var.get_moves
            raise("Not god object get mooves function") if res.class.name != "String"

            res = tmp_var.get_position
            raise("Not god object get_position function") if res.class.name != "Symbol"

            tmp_var.set_position(:r1)
            raise("bad final room process") if !tmp_var.is_not_in_final_room?

            tmp_var.set_position(:r5)
            raise("bad final room process") if tmp_var.is_not_in_final_room?

            tmp_var.set_position(:r1)
            raise("bad final room process") if tmp_var.is_final_room?

            tmp_var.set_position(:r5)
            raise("bad final room process") if !tmp_var.is_final_room?

            tmp_var.set_moove('test')
            raise("bad moove process") if !tmp_var.get_moves == :test

            tmp_var.set_moove('test')
            raise("bad moove process") if !tmp_var.get_moves.class.name == "Symbol"

            tmp_var.set_moove('test')
            raise("bad legal moove process") if tmp_var.is_legal_moove?

            tmp_var.set_moove('back')
            raise("bad legal moove process") if !tmp_var.is_legal_moove?

            tmp_var.set_position(:r1)
            tmp_var.set_moove('forward')
            raise("bad next room process -- #{tmp_var.get_next_room}") if tmp_var.get_next_room != :r2

            tmp_var.set_position(:r1)
            var = tmp_var.get_room
            raise("bad get room process -- #{var.class.name}") if var.class.name != "Rooms::R1"

            tmp_var.set_position(:r2)
            var = tmp_var.get_room
            raise("bad get room process -- #{var.class.name}") if var.class.name == "Rooms::R1"

            var = tmp_var.get_action_class(['A1'])
            raise("bad action process -- #{var.class.name}") if var.class.name != "Array"
            raise("bad action process -- #{var.first.class.name}") if var.first.class.name != "Actions::A1"

            # ////////////////////////////////////////////////////////////////////////////////////////////
            # Test ROOM instance ///////////////////////////////////////////////////////////////////////
            # ////////////////////////////////////////////////////////////////////////////////////////////

            var = Rooms::Generic.new('test','test')
            raise("bad name room  access  -- #{var.get_name}") if var.get_name != "test"
            raise("bad description room  access  -- #{var.get_description}") if var.get_description != "test"

            var = Rooms::R1.new()
            raise("bad name room  access super  -- #{var.get_name}") if var.get_name != "Common room - Gryffondor"
            raise("bad description room  access super -- #{var.get_description}") if var.get_description != "You are in the east wing, in the dungeon of spells."

            var_action = var.set_actions([Actions::A1.new])
            raise("bad action process -- #{var_action.get_actions.class.name}") if var_action.get_actions.class.name != "Array"
            raise("bad action process -- #{var_action.get_actions.first.class.name}") if var_action.get_actions.first.class.name != "Actions::A1"


            # ////////////////////////////////////////////////////////////////////////////////////////////
            # Test ACTIONS instance //////////////////////////////////////////////////////////////////////
            # ////////////////////////////////////////////////////////////////////////////////////////////

            var = Actions::A1.new
            raise("bad action question access -- #{var.get_question}") if var.get_question != " >> 1 + 1 = "
            raise("bad action response access -- #{var.get_response}") if var.get_response != 2

            var = var.set_response(6)
            raise("bad action response set access -- #{var.get_user_response}") if var.get_user_response != 6

            # 2 != 6
            var = var.is_good_answer?
            raise("bad calculation check response") if var


            puts " pass all the test"
        end
    end
end