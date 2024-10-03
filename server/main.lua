local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-kaijob:server:processingItem', function(item, requiredItems, amount)
	local Player = QBCore.Functions.GetPlayer(tonumber(source))

	if not exports['qb-inventory']:HasItem(source, requiredItems) then
		QBCore.Functions.Notify(source, 'Il vous manque des items', 'error', 7500)
		return
	end

	for name, removeAmount in pairs(requiredItems) do
		Player.Functions.RemoveItem(name, removeAmount)
		TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[name], 'remove', removeAmount)
	end

	Player.Functions.AddItem(item, amount, false)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
end)



RegisterNetEvent('qb-kaijob:server:deliveryItem', function(requiredItems)
	if not exports['qb-inventory']:HasItem(source, requiredItems) then
		QBCore.Functions.Notify(source, 'Il vous manque des items', 'error', 7500)
		return
	end
	local Player = QBCore.Functions.GetPlayer(tonumber(source))
	local amount = nil
	for name, removeAmount in pairs(requiredItems) do
		amount = removeAmount
		Player.Functions.RemoveItem(name, removeAmount)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[name], 'remove', removeAmount)
	end
	exports['okokBanking']:AddMoney('kai', (math.random(350, 450) * amount))
end)