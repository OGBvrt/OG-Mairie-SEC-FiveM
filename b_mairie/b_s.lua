ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterNetEvent('AcheteCI')
AddEventHandler('AcheteCI', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local cic = xPlayer.getInventoryItem('cii').count

    if cic >= 1 then
        TriggerClientEvent('esx:showNotification', source, '~b~Policier:\n~r~Désolé, nous ne pouvons vous fournir qu\'une seul C.I\n~y~(MAX 1 C.I)')
    else
        xPlayer.addInventoryItem('cii', 1)
        TriggerClientEvent('esx:showNotification', source, '~b~Policier:\n~g~Eh, Voila pour vous\n~y~(MAX 1 C.I)')
    end
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
