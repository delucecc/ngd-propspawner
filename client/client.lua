local entity_ids = {}
if Config.Persistent then
    if Config.FrameWork == 'qb' then
        QBCore = exports['qb-core']:GetCoreObject()
        AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
            Wait(1500)
            SpawnProps()
        end)
    elseif Config.FrameWork == 'esx' then
        local ESX = exports["es_extended"]:getSharedObject()
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function()
            Wait(1500)
            SpawnProps()
        end)
    end
end

function SpawnProps()
    for k, v in pairs(Config.PropLocations) do
        RequestModel(v.model)
        while not HasModelLoaded(v.model) do
            Wait(0)
        end
        local prop = CreateObject(v.model, v.coords.x, v.coords.y, v.coords.z - 1, false, true, false)
        entity_ids[#entity_ids + 1] = prop
        SetEntityHeading(prop, v.coords.w - 180)
        FreezeEntityPosition(prop, true)
        print("^3Prop Spawned:" .. v.coords)
    end
end

function DeleteProps()
    for _, entity in pairs(entity_ids) do
        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
    end
end

if Config.debug then
    RegisterCommand(Config.DeleteCommand, function()
        DeleteProps()
    end)
    RegisterCommand(Config.SpawnCommand, function()
        SpawnProps()
    end)
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    for _, entity in pairs(entity_ids) do
        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
    end
end)
