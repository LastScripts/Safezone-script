local isInSafeZone = false
local currentZone = nil

CreateThread(function()
    while true do
        local sleep = 500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local foundZone = false

        for i, zone in ipairs(Config.SafeZones) do
            local dist = #(playerCoords - zone.coords)
            
            if zone.marker.enabled and dist < zone.marker.drawDistance then
                sleep = 0
                DrawMarker(zone.marker.type, 
                    zone.coords.x, zone.coords.y, zone.coords.z - 1.0, 
                    0.0, 0.0, 0.0, 
                    0.0, 0.0, 0.0, 
                    zone.radius * 2.0, zone.radius * 2.0, zone.marker.type == 1 and 1.0 or zone.radius * 2.0, 
                    zone.marker.color.r, zone.marker.color.g, zone.marker.color.b, zone.marker.color.a, 
                    false, zone.marker.drawOnEnts, 2, nil, nil, false
                )
            end

            if dist < zone.radius then
                foundZone = true
                if not isInSafeZone then
                    isInSafeZone = true
                    currentZone = i
                    Notify('enter')
                end
            end
        end

        if not foundZone and isInSafeZone then
            isInSafeZone = false
            currentZone = nil
            Notify('leave')
        end

        if isInSafeZone then
            sleep = 0
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 44, true)
            DisablePlayerFiring(playerPed, true)

            SetEntityInvincible(playerPed, true)
            SetPlayerInvincible(PlayerId(), true)
        end

        Wait(sleep)
    end
end)

function Notify(type)
    local msg = Config.Messages[type]
    
    if type == 'leave' then
        local playerPed = PlayerPedId()
        SetEntityInvincible(playerPed, false)
        SetPlayerInvincible(PlayerId(), false)
    end

    if Config.NotifySystem == 'ox_lib' then
        lib.notify({
            title = msg.title,
            description = msg.message,
            type = msg.type
        })
    elseif Config.NotifySystem == 'okokNotify' then
        exports['okokNotify']:Alert(msg.title, msg.message, 3000, msg.type)
    end
end
