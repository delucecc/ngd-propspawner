local entity_ids = {}

function SpawnProps()
    for k, v in pairs(Config.PropLocations) do
        RequestModel(v.model)
        while not HasModelLoaded(v.model) do
            Wait(0)
        end
        local prop = CreateObject(v.model, v.coords.x, v.coords.y, v.coords.z - 1, true, true, false)
        entity_ids[#entity_ids + 1] = prop
        SetEntityHeading(prop, v.coords.w)
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

RegisterCommand(Config.DeleteCommand, function()
    DeleteProps()
end)

RegisterCommand(Config.SpawnCommand, function()
    SpawnProps()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    for _, entity in pairs(entity_ids) do
        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
    end
end)