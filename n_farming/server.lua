ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('n_farming:getitem')
AddEventHandler('n_farming:getitem', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem(Config.Item, math.random(Config.ItemCountMin, Config.ItemCountMax))
end)

RegisterServerEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(itemName, itemCount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addInventoryItem(itemName, itemCount)
    end
end)
