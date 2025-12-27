Config = {}

Config.NotifySystem = 'ox_lib' 

Config.SafeZones = {
    {
        coords = vector3(-30.9066, -1097.0107, 27.2738), -- PDM
        radius = 50.0,
        marker = {
            enabled = true,
            type = 1, -- 1 kruh
            drawDistance = 100.0,
            color = {r = 50, g = 255, b = 50, a = 100},
            drawOnEnts = false
        }
    },
    {
        coords = vector3(228.31, -785.64, 30.63), -- Legion Square
        radius = 60.0,
        marker = {
            enabled = true,
            type = 1, -- 1 kruh
            drawDistance = 150.0,
            color = {r = 255, g = 0, b = 0, a = 50},
            drawOnEnts = false
        }
    }
}

Config.Messages = {
    enter = {
        title = 'SafeZone',
        message = 'Vstoupil jsi do SafeZony',
        type = 'success'
    },
    leave = {
        title = 'SafeZone',
        message = 'Opustil jsi SafeZonu',
        type = 'error'
    }
}
