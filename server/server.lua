ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('ali_namechange:SetFirstName')
AddEventHandler('ali_namechange:SetFirstName', function(ID, firstName)
    local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= 1500 then
		local newfirstname = xPlayer.getName()
        xPlayer.removeMoney(1500)
		SetFirstName(identifier, firstName)
		TriggerClientEvent('notifications', source, "#8a2be2", "AUSWEIS", "Dein neuer Vorname ist: " .. firstName)
		--xPlayer.showNotification('~hold~Your new name is ~g~'.. newfirstname ..'~w~.')
	else
		--xPlayer.showNotification('~r~~hold~You have not enough money!')
		TriggerClientEvent('notifications', source, "#8a2be2", "AUSWEIS", "Du hast nicht genug Bargeld um deinen Vornamen zu ändern.")
	end
end)


RegisterServerEvent('ali_namechange:SetLastName')
AddEventHandler('ali_namechange:SetLastName', function(ID, lastName)
    local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= 1500 then
		local newlastname = xPlayer.getName()
      xPlayer.removeMoney(1500)
		SetLastName(identifier, lastName)
		TriggerClientEvent('notifications', source, "#8a2be2", "AUSWEIS", "Dein neuer Nachname ist: " .. lastName)
	else
		--xPlayer.showNotification('~r~~hold~You have not enough money!')
		TriggerClientEvent('notifications', source, "#8a2be2", "AUSWEIS", "Du hast nicht genug Bargeld um deinen Nachnamen zu ändern.")
	end
end)







-- Vorname
function SetFirstName(identifier, firstName)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= firstName
	})
end

-- Nachname
function SetLastName(identifier, lastName)
	MySQL.Async.execute('UPDATE `users` SET `lastname` = @lastname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@lastname']		= lastName
	})
end



-- NUI Close
RegisterNetEvent("ali_namechange:deny")
AddEventHandler("ali_namechange:deny", function(data)
    TriggerClientEvent('notifications', source, "#8a2be2", "INFORMAION", "Du hast den Vorgang abgebrochen.")
end)