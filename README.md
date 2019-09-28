# lx-prop
Fivem Prop script

Hello everyone, 
Today I bring you a simple but modular script. With this, you can make items [Props] carryable by the player and at any time drop them on the ground and pick them back up. 

I have added a few props in a list for you to use to get started.

```
attachPropList = {

    ["test"] = { 
        ["model"] = "prop_cs_brain_chunk", ["bone"] = 28422, ["x"] = 0.062,["y"] = 0.02,["z"] = 0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["cigar01"] = { 
        ["model"] = "prop_cigar_03", ["bone"] = 28422, ["x"] = 0.062,["y"] = 0.02,["z"] = 0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["cig01"] = { 
        ["model"] = "prop_amb_ciggy_01", ["bone"] = 28422, ["x"] = -0.024,["y"] = 0.0,["z"] = 0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["cig02"] = { 
        ["model"] = "prop_amb_ciggy_01", ["bone"] = 58867, ["x"] = 0.06,["y"] = 0.0,["z"] = -0.02,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 90.0 
    },

    ["healthpack01"] = { 
        ["model"] = "prop_ld_health_pack", ["bone"] = 28422, ["x"] = 0.18,["y"] = 0.0,["z"] = 0.0,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["briefcase01"] = { 
        ["model"] = "prop_ld_case_01", ["bone"] = 28422, ["x"] = 0.08,["y"] = 0.0,["z"] = 0.0,["xR"] = 315.0,["yR"] = 288.0, ["zR"] = 0.0 
    },

    ["cashcase01"] = { 
        ["model"] = "prop_cash_case_01", ["bone"] = 28422, ["x"] = 0.05,["y"] = 0.0,["z"] = 0.0,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["cashbag01"] = { 
        ["model"] = "prop_cs_heist_bag_01", ["bone"] = 24816, ["x"] = 0.15,["y"] = -0.4,["z"] = -0.38,["xR"] = 90.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["notepad01"] = { 
        ["model"] = "prop_notepad_01", ["bone"] = 60309, ["x"] = 0.0,["y"] = -0.0,["z"] = -0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["phone01"] = { 
        ["model"] = "prop_player_phone_01", ["bone"] = 57005, ["x"] = 0.14,["y"] = 0.01,["z"] = -0.02,["xR"] = 110.0,["yR"] = 120.0, ["zR"] = -15.0 
    },

    ["tablet01"] = { 
        ["model"] = "prop_cs_tablet", ["bone"] = 60309, ["x"] = 0.03,["y"] = 0.002,["z"] = -0.0,["xR"] = 10.0,["yR"] = 160.0, ["zR"] = 0.0 
    },


    ["pencil01"] = { 
        ["model"] = "prop_pencil_01", ["bone"] = 58870, ["x"] = 0.04,["y"] = 0.0225,["z"] = 0.08,["xR"] = 320.0,["yR"] = 0.0, ["zR"] = 220.0 
    },

    ["drugpackage01"] = { 
        ["model"] = "prop_meth_bag_01", ["bone"] = 28422, ["x"] = 0.1,["y"] = 0.0,["z"] = -0.01,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 40.0 
    },

    ["drugpackage02"] = { 
        ["model"] = "prop_weed_bottle", ["bone"] = 28422, ["x"] = 0.09,["y"] = 0.0,["z"] = -0.03,["xR"] = 135.0,["yR"] = -100.0, ["zR"] = 40.0 
    },

    ["drugtest01"] = { 
        ["model"] = "prop_cash_case_02", ["bone"] = 28422, ["x"] = -0.01,["y"] = -0.1,["z"] = -0.138,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["box01"] = { 
        ["model"] = "prop_cs_cardbox_01", ["bone"] = 28422, ["x"] = 0.01,["y"] = 0.01,["z"] = 0.0,["xR"] = -255.0,["yR"] = -120.0, ["zR"] = 40.0 
    },

    ["bomb01"] = { 
        ["model"] = "prop_ld_bomb", ["bone"] = 28422, ["x"] = 0.22,["y"] = -0.01,["z"] = 0.0,["xR"] = -25.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["money01"] = { 
        ["model"] = "prop_anim_cash_note", ["bone"] = 28422, ["x"] = 0.1,["y"] = 0.04,["z"] = 0.0,["xR"] = 25.0,["yR"] = 0.0, ["zR"] = 10.0 
    },

    ["armor01"] = { 
        ["model"] = "prop_armour_pickup", ["bone"] = 28422, ["x"] = 0.3,["y"] = 0.01,["z"] = 0.0,["xR"] = 255.0,["yR"] = -90.0, ["zR"] = 10.0 
    },

    ["terd01"] = { 
        ["model"] = "prop_big_shit_01", ["bone"] = 61839, ["x"] = 0.015,["y"] = 0.0,["z"] = -0.01,["xR"] = 3.0,["yR"] = -90.0, ["zR"] = 180.0 
    },

    ["boombox01"] = { 
        ["model"] = "prop_boombox_01", ["bone"] = 28422, ["x"] = 0.2,["y"] = 0.0,["z"] = 0.0,["xR"] = -35.0,["yR"] = -100.0, ["zR"] = 0.0 
    },

    ["bowlball01"] = { 
        ["model"] = "prop_bowling_ball", ["bone"] = 28422, ["x"] = 0.12,["y"] = 0.0,["z"] = 0.0,["xR"] = 75.0,["yR"] = 280.0, ["zR"] = -80.0 
    },

    ["bowlpin01"] = { 
        ["model"] = "prop_bowling_pin", ["bone"] = 28422, ["x"] = 0.12,["y"] = 0.0,["z"] = 0.0,["xR"] = 75.0,["yR"] = 280.0, ["zR"] = -80.0 
    },

    ["crate01"] = { 
        ["model"] = "prop_cs_cardbox_01", ["bone"] = 28422, ["x"] = 0.0,["y"] = 0.0,["z"] = 0.0,["xR"] = 0.0,["yR"] = 0.0, ["zR"] = 0.0 
    },

    ["tvcamera01"] = { 
        ["model"] = "prop_v_cam_01", ["bone"] = 57005, ["x"] = 0.13,["y"] = 0.25,["z"] = -0.03,["xR"] = -85.0,["yR"] = 0.0, ["zR"] = -80.0 
    },

    ["boomMIKE01"] = { 
        ["model"] = "prop_v_bmike_01", ["bone"] = 57005, ["x"] = 0.1,["y"] = 0.0,["z"] = -0.03,["xR"] = 85.0,["yR"] = 0.0, ["zR"] = 96.0 
    },

    ["minigameThermite"] = { 
        ["model"] = "prop_oiltub_06", ["bone"] = 57005, ["x"] = 0.1,["y"] = 0.0,["z"] = -0.09,["xR"] = 145.0,["yR"] = 20.0, ["zR"] = 80.0 
    },

    ["minigameDrill"] = { 
        ["model"] = "hei_prop_heist_drill", ["bone"] = 57005, ["x"] = 0.15,["y"] = 0.0,["z"] = -0.05,["xR"] = 0.0,["yR"] = 90.0, ["zR"] = 90.0 
    },

        -- 18905 left hand - 57005 right hand
    ["tvmic01"] = { 
        ["model"] = "p_ing_microphonel_01", ["bone"] = 18905, ["x"] = 0.1,["y"] = 0.05,["z"] = 0.0,["xR"] = -85.0,["yR"] = -80.0, ["zR"] = -80.0 
    },

    ["newspaper01"] = { 
        ["model"] = "prop_cliff_paper", ["bone"] = 28422, ["x"] = -0.07,["y"] = 0.0,["z"] = 0.0,["xR"] = 90.0,["yR"] = 0.0, ["zR"] = 0.0 
    },


    ["golfbag01"] = { 
        ["model"] = "prop_golf_bag_01", ["bone"] = 24816, ["x"] = 0.12,["y"] = -0.3,["z"] = 0.0,["xR"] = -75.0,["yR"] = 190.0, ["zR"] = 92.0 
    },

    ["golfputter01"] = { 
        ["model"] = "prop_golf_putter_01", ["bone"] = 57005, ["x"] = 0.0,["y"] = -0.05,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },

    ["golfiron01"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.125,["y"] = 0.04,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },
    ["golfiron03"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.126,["y"] = 0.041,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },
    ["golfiron05"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.127,["y"] = 0.042,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },
    ["golfiron07"] = { 
        ["model"] = "prop_golf_iron_01", ["bone"] = 57005, ["x"] = 0.128,["y"] = 0.043,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },      
    ["golfwedge01"] = { 
        ["model"] = "prop_golf_pitcher_01", ["bone"] = 57005, ["x"] = 0.17,["y"] = 0.04,["z"] = 0.0,["xR"] = 90.0,["yR"] = -118.0, ["zR"] = 44.0 
    },

    ["golfdriver01"] = { 
        ["model"] = "prop_golf_driver", ["bone"] = 57005, ["x"] = 0.14,["y"] = 0.00,["z"] = 0.0,["xR"] = 160.0,["yR"] = -60.0, ["zR"] = 10.0 
    }   
}
```

To make new items here is a template

```
RegisterCommand("commandname", function(source, args, raw)
    local arg = args[1]
    if arg ~= nil then
    TriggerEvent("XP:removeall")
    else
    TriggerEvent("change me")
    end
end, false)

RegisterNetEvent('attach:changeme')
AddEventHandler('attach:changeme', function()
    TriggerEvent("XP:attachItem","changeme")
end)
```
Change the "changeme" 
Use the already provided props as an example. 

**How To Use**

Without any edits the commands are 
/briefcase
/boombox
/TVmic
/RE -- removes current prop
If you do "/breifcase" then do "/breifcase remove" then it will remove it from the world. The props are synced with everyone. 
