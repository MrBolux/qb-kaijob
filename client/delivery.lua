local delivery = false
local task = false
local deliveryCount = 0
local deliveryPed = nil
local deliveryItem = {}
local taskingBlip = nil
deliveryPedMission = nil

local function generateText()
    local requiredItems = 'Le client demande <br>'
    for item, amount in pairs(deliveryItem) do
        local itemTxt = "- " .. (QBCore.Shared.Items[item].label or "Item inexistant") .. " : " .. amount .. "<br>"
        requiredItems = requiredItems .. itemTxt
    end
    return requiredItems
end

local function deliveryProgress()
    if not exports['qb-inventory']:HasItem(deliveryItem) then
        exports['okokNotify']:Alert("Livraison", generateText(), 8000, 'error')
        return
    end

    QBCore.Functions.Progressbar("delivery_process", 'Livraison en cours...', math.random(3000, 4000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mp_common',
        anim = 'givetake1_a',
        flags = 1,
    }, {}, {}, function() -- Terminé
        StopAnimTask(PlayerPedId(), 'mp_common', 'givetake1_a', 1.0)
        TriggerServerEvent("qb-kaijob:server:deliveryItem", deliveryItem)
        task = false
        QBCore.Functions.Notify('Produit Livrée')

    end, function() -- Annuler
        StopAnimTask(PlayerPedId(), 'mp_common', 'givetake1_a', 1.0)
        QBCore.Functions.Notify('Produit non récolté', "error")
    end)
end


local function calculeDeliveryDistance(location)
    CreateThread(function()
        local sleep = 500
        while task do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = GetDistanceBetweenCoords(location.x, location.y, location.z, playerCoords.x, playerCoords.y, playerCoords.z, true)
            if distance < 50 then
                sleep = 5
                DrawMarker(32, location.x, location.y, location.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0,1.0, 255, 255, 255, 255, true, true, 2, true, nil, false)
                if distance < 1.5 then
                    exports['okokTextUI']:Open('[E] Livrer', 'lightblue', 'right')
                    if not IsPedInAnyVehicle(playerPed) and IsControlJustReleased(0, 38) then
                        deliveryProgress()
                    end
                else
                    exports['okokTextUI']:Close()
                end
            else
                sleep = 500
            end
            Wait(sleep)
        end
        exports['okokTextUI']:Close()
    end)
end

local function createDeliveryPed(location)
    exports['togolo_lib']:deleteInteractPed(deliveryPed)
    deliveryPed = nil
    deliveryPedData = {
        coords = location,
        pedModel = Config.deliveryPedModel[math.random(#Config.deliveryPedModel)],
        animation = 'WORLD_HUMAN_AA_SMOKE'
    }
    deliveryPed = exports['togolo_lib']:createInteractPed(deliveryPedData)
    calculeDeliveryDistance(location)
end

local function createDeliveryItems()
    deliveryItem = {}
    local random = math.random(Config.deliveryProductAmount.min, Config.deliveryProductAmount.max)
    for i = 1, random do
        local randomProduct = Config.deliveryProduct[math.random(#Config.deliveryProduct)]
        local randomAmount = math.random(Config.deliveryProductAmount.min, Config.deliveryProductAmount.max)
        deliveryItem[randomProduct] = randomAmount
    end
end

local function nextTask(location)
	if task then
		return
	end
	task = true
    createDeliveryPed(location)
    createDeliveryItems()
    exports['okokNotify']:Alert("Livraison", generateText(), 8000, 'success')

    exports['togolo_lib']:deleteBlip(taskingBlip)
    taskingBlip = nil
    Config.deliveryBlip.coords = location
    taskingBlip = exports['togolo_lib']:createBlip(Config.deliveryBlip, { player = PlayerData.source, route = true, routeColor = 8 })
end

local function startDelivery()
	local limitCollect = math.random(Config.limitDelivery.min, Config.limitDelivery.max)
    QBCore.Functions.Notify('Livre les clients')

	while delivery do
		if task then
			Wait(6000)
		else
			if deliveryCount < limitCollect then
				nextTask(Config.deliveryPedLocations[math.random(#Config.deliveryPedLocations)])
				deliveryCount += 1
			else
                TriggerEvent('qb-kaijob:client:stopDelivery')
				QBCore.Functions.Notify('Il n\'y a plus rien à Livrer')
			end
		end
		Wait(5)
	end

end


deliveryPedMission = exports['togolo_lib']:createInteractPed(Config.deliveryPedMission)

RegisterNetEvent('qb-kaijob:client:startDelivery', function()
    delivery = true
    startDelivery()
end)

RegisterNetEvent('qb-kaijob:client:stopDelivery', function()
    delivery = false
    task = false
    deliveryCount = 0
    exports['togolo_lib']:deleteInteractPed(deliveryPed)
    exports['togolo_lib']:deleteBlip(taskingBlip)
    taskingBlip = nil
    deliveryPed  = nil
    exports['okokNotify']:Alert("Livraison", 'Vous venez d\'arrêter la mission.', 4000, 'success')
end)