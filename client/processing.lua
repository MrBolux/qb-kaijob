kitchenZones = {}
local processingRecipe = {}
local processingZone = nil
local menus = {}

local function processingProgress()

    if not exports['qb-inventory']:HasItem(processingRecipe.details.requiredItems) then
        QBCore.Functions.Notify('Il vous manque des items', 'error', 5000)
        return
    end

    QBCore.Functions.Progressbar("processing_process", 'Travail en cours...', math.random(2000, 3000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.zones[processingZone].animation.animDict,
        anim = Config.zones[processingZone].animation.anim,
        flags = 1,
    }, {}, {}, function() -- Terminé
        StopAnimTask(PlayerPedId(), Config.zones[processingZone].animation.animDict, Config.zones[processingZone].animation.anim, 1.0)
        TriggerServerEvent('qb-kaijob:server:processingItem', processingRecipe.item, processingRecipe.details.requiredItems, processingRecipe.details.amount)
    end, function() -- Annuler
        StopAnimTask(PlayerPedId(), Config.zones[processingZone].animation.animDict, Config.zones[processingZone].animation.anim, 1.0)
        QBCore.Functions.Notify('Produit non traité', "error")
    end)
end

local function generateArea()

    for zone, recipes in pairs(Config.recipes) do
        local menu = {
            {
                header = locale(zone),
                isMenuHeader = true,
            }
        }

        for recipe, details in pairs(recipes) do
            local recipeLabel = QBCore.Shared.Items[recipe].label
            local requiredItems = ''

            for item, amount in pairs(details.requiredItems) do
                local itemTxt = "- " .. (QBCore.Shared.Items[item].label or "Item inexistant") .. " : " .. amount .. "<br>"
                requiredItems = requiredItems .. itemTxt
            end

            menu[#menu + 1] = {
                header = recipeLabel,
                icon = recipe,
                txt = requiredItems,
                params = {
                    event = 'qb-kaijob:client:setProcessingRecipe',
                    args = {
                        item = recipe,
                        details = details,
                    }
                }
            }
        end
        menus[zone] = menu
    end

    for zone, zoneData in pairs(Config.zones) do
        local zoneName = string.format("KAI_%s", zone)
        local zoneParams = {
            name = zoneName,
            heading = zoneData.heading,
            minZ = zoneData.coords.z - 1,
            maxZ = zoneData.coords.z + 0.5,
            debugPoly = Config.Debug
        }
        local options = {
            {
                action = function()
                    exports['qb-menu']:openMenu(menus[zone])
                    processingZone = zone
                end,
                icon = 'fas fa-ring',
                label = locale(zone),
                job = 'kai',
            }
        }
        local boxOptions = {
            options = options,
            distance = 1.5
        }
        local kitchenZone = exports['qb-target']:AddBoxZone(zoneName, zoneData.coords, zoneData.length, zoneData.width, zoneParams, boxOptions)
        table.insert(kitchenZones, kitchenZone.name)
    end
end

RegisterNetEvent('qb-kaijob:client:setProcessingRecipe', function(args)
    processingRecipe = args
    processingProgress()
end)

generateArea()