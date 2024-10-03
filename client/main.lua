QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
local createdBlips = {}
local bossMenus = {}
local stashs = {}
local clothingRooms = {}
local dutyPeds = {}
local radialMenuItems = {}

local function setupPlayer()
	PlayerData = QBCore.Functions.GetPlayerData()
end

local function playerIsDuty()
	return PlayerData.job.onduty
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    setupPlayer()
    if playerIsDuty() then
        radialMenuItems = exports['togolo_lib']:updateRadialOption(radialMenuItems, Config.radialMenu[PlayerData.job.name])
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    exports['togolo_lib']:removeRadialOptions(radialMenuItems)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    if playerIsDuty() then
        radialMenuItems = exports['togolo_lib']:updateRadialOption(radialMenuItems, Config.radialMenu[PlayerData.job.name])
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        setupPlayer()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        exports['togolo_lib']:removeRadialOptions(radialMenuItems)
        exports['togolo_lib']:deleteBlips(createdBlips)
        exports['togolo_lib']:deleteBossMenu(bossMenus)
        exports['togolo_lib']:deleteStashZones(stashs)
        exports['togolo_lib']:deleteClothingRoom(clothingRooms)
        exports['togolo_lib']:deleteDutyPed(dutyPeds)


        exports['togolo_lib']:deleteInteractPed(deliveryPedMission)

        exports['togolo_lib']:deleteBossMenu(kitchenZones)
        TriggerEvent('qb-kaijob:client:stopDelivery')
    end
end)

CreateThread(function()
    createdBlips = exports['togolo_lib']:createBlips(Config.blips)
    bossMenus = exports['togolo_lib']:createBossMenu(Config.bossMenu)
    stashs = exports['togolo_lib']:createStashZones(Config.stash)
    clothingRooms = exports['togolo_lib']:createClothingRoom(Config.clothingRoomsZones, Config.clothingRoomsOutfit)
    dutyPeds = exports['togolo_lib']:createDutyPed(Config.duty)
end)
