Citizen.CreateThread(function()
    RequestModel(GetHashKey("ig_bankman"))
	
    while not HasModelLoaded(GetHashKey("ig_bankman")) do
        Wait(1)
    end
	
	for _, item in pairs(Config.ped) do
		local npc = CreatePed(4, 0x909D9E7F, item.x, item.y, item.z, item.heading, false, true)
			
		SetEntityHeading(npc, item.heading)
		FreezeEntityPosition(npc, true)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)	
	end
end)



