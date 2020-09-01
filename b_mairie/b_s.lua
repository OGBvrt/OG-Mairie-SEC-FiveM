ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterNetEvent('AcheteCI')

AddEventHandler('AcheteCI', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('cii', 1)
end)

RegisterNetEvent('Achetepermis')
AddEventHandler('Achetepermis', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('permis', 1)

end)

ESX.RegisterUsableItem('cii', function(source)
	TriggerClientEvent('b_mairie:voirmaci', source)	
end)

ESX.RegisterUsableItem('permis', function(source)
	TriggerClientEvent('b_mairie:voirmonpermis', source)	
end)