local dropkey = 161 -- change this number based on the key you want to use to drop the item 
function GlobalObject(object)
    NetworkRegisterEntityAsNetworked(object)
    local netid = ObjToNet(object)
    SetNetworkIdExistsOnAllMachines(netid, true)
    NetworkSetNetworkIdDynamic(netid, true)
    SetNetworkIdCanMigrate(netid, false) 
    for i = 1, 255 do
        SetNetworkIdSyncToPlayer(netid, i, true)
    end
    print("New networked object: " .. netid)
end -- not needed anymore

attachedPropPerm = 0
function removeAttachedPropPerm()
    if DoesEntityExist(attachedPropPerm) then
        DeleteEntity(attachedPropPerm)
        attachedPropPerm = 0
    end
end

RegisterCommand("TVmic", function(source, args, raw)
    local arg = args[1]
    if arg ~= nil then
    TriggerEvent("XP:removeall")
    else
    TriggerEvent("attach:tvmic")
    end
end, false)
RegisterCommand("boombox", function(source, args, raw)
    local arg = args[1]
    if arg ~= nil then
    TriggerEvent("XP:removeall")
    else
    TriggerEvent("attach:boombox")
    end
end, false)

RegisterCommand("briefcase", function(source, args, raw)
    local arg = args[1]
    if arg ~= nil then
    TriggerEvent("XP:removeall")
    else
    TriggerEvent("attach:suitcase")
    end
end, false)

RegisterNetEvent('XP:DestroyProp')
AddEventHandler('XP:DestroyProp', function()
    removeAttachedPropPerm()
end)

local APPbone = 0
local APPx = 0.0
local APPy = 0.0
local APPz = 0.0
local APPxR = 0.0
local APPyR = 0.0
local APPzR = 0.0

local holdingPackage = false

RegisterNetEvent('XP:attachProp')
AddEventHandler('XP:attachProp', function(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)
    --exports['mythic_notify']:DoHudText('inform', "Press 7 to drop or pickup the object. Do /RE to delete the prop") -- Add your own notification system here instead 
    removeAttachedPropPerm()
    holdingPackage = true
    attachModel = GetHashKey(attachModelSent)
    boneNumber = boneNumberSent
    SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263) 
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumberSent)
    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Citizen.Wait(100)
    end
    attachedPropPerm = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(attachedPropPerm, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)

    APPbone = bone
    APPx = x
    APPy = y
    APPz = z
    APPxR = xR
    APPyR = yR
    APPzR = zR
end)
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function randPickupAnim()
  local randAnim = math.random(7)
    loadAnimDict('random@domestic')
    TaskPlayAnim(GetPlayerPed(-1),'random@domestic', 'pickup_low',5.0, 1.0, 1.0, 48, 0.0, 0, 0, 0)
end


Citizen.CreateThread( function()
    while true do 
        if attachedPropPerm ~= 0 then
            Citizen.Wait(1)
            if IsDisabledControlJustPressed(0, dropkey) or (GetHashKey("WEAPON_UNARMED") ~= GetSelectedPedWeapon(GetPlayerPed(-1)) and holdingPackage) then
                if not holdingPackage then
                    local dst = GetDistanceBetweenCoords(GetEntityCoords(attachedPropPerm) ,GetEntityCoords(GetPlayerPed(-1)),true)                 
                    if dst < 2 then
                        holdingPackage = not holdingPackage
                        randPickupAnim()
                        Citizen.Wait(1000)
                        PropCarryAnim()
                        ClearPedTasks(GetPlayerPed(-1))
                        ClearPedSecondaryTask(GetPlayerPed(-1))
                        AttachEntityToEntity(attachedPropPerm, GetPlayerPed(-1), APPbone, APPx, APPy, APPz, APPxR, APPyR, APPzR, 1, 1, 0, 0, 2, 1)
                    end
                else
                    holdingPackage = not holdingPackage
                    ClearPedTasks(GetPlayerPed(-1))
                    ClearPedSecondaryTask(GetPlayerPed(-1))
                    randPickupAnim()
                    Citizen.Wait(500)
                    DetachEntity(attachedPropPerm)
                end
            end
        else
            Citizen.Wait(1)
        end
    end
end)

function PropCarryAnim()
    -- add animations you want here for things like cameras 
end

attachedProp = 0
function removeAttachedProp()
    if DoesEntityExist(attachedProp) then
        DeleteEntity(attachedProp)
        attachedProp = 0
    end
end

RegisterNetEvent('XP:destroyProp')
AddEventHandler('XP:destroyProp', function()
    removeAttachedProp()
end)

--[[RegisterNetEvent('attachProp')
AddEventHandler('attachProp', function(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)
    removeAttachedProp()
    attachModel = GetHashKey(attachModelSent)
    boneNumber = boneNumberSent
    SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263) 
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumberSent)
    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Citizen.Wait(100)
    end
    attachedProp = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(attachedProp, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
end)]] 

attachedPropPhone = 0
function removeAttachedPropPhone()
    if DoesEntityExist(attachedPropPhone) then
        DeleteEntity(attachedPropPhone)
        attachedPropPhone = 0
    end
end

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

RegisterNetEvent('XP:attachItem')
AddEventHandler('XP:attachItem', function(item)
    TriggerEvent("XP:attachProp",attachPropList[item]["model"], attachPropList[item]["bone"], attachPropList[item]["x"], attachPropList[item]["y"], attachPropList[item]["z"], attachPropList[item]["xR"], attachPropList[item]["yR"], attachPropList[item]["zR"])
end)
--tvmic01
RegisterNetEvent('attach:tvmic')
AddEventHandler('attach:tvmic', function()
    TriggerEvent("XP:attachItem","tvmic01")
end)
--boomMIKE01
RegisterNetEvent('attach:tvcamera')
AddEventHandler('attach:tvcamera', function()
    TriggerEvent("XP:attachItem","tvcamera01")
end)
RegisterNetEvent('attach:suitcase')
AddEventHandler('attach:suitcase', function()
    TriggerEvent("XP:attachItem","briefcase01")
end)

RegisterNetEvent('attach:boombox')
AddEventHandler('attach:boombox', function()
    TriggerEvent("XP:attachItem","boombox01")
end)


RegisterCommand("RE", function() -- remove entity 
    TriggerEvent("disabledWeapons",false)
    TriggerEvent("XP:DestroyProp")
end, false)

RegisterNetEvent('XP:removeall')
AddEventHandler('XP:removeall', function()
    TriggerEvent("disabledWeapons",false)
    TriggerEvent("XP:DestroyProp")
end)

local function errorMsg(msg)
    TriggerEvent("chatMessage", "Error", {255, 0, 0}, msg)
end



local disabledWeapons = false
RegisterNetEvent("disabledWeapons")
AddEventHandler("disabledWeapons", function(sentinfo)
    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("weapon_unarmed"), 1)
    disabledWeapons = sentinfo
end)