Config = {}

Config.Locations = {
    {
        coords = vector3(840.0374, 2151.355, 52.312),
        itemName = "cannabis",
        itemCountRange = {5, 15},
	-- MARKER --
        markerType = 27,
        markerScale = vector3(7.0, 7.0, 1.0),
        markerColor = {r = 0, g = 255, b = 10, a = 150},
        markerDistance = 10,
	-- BLIP --
        showBlip = false,
        blipId = 478,
        blipColor = 2,
        blipScale = 1.0,
        blipName = "Apfelfarm"
    },
    {
        coords = vector3(2178.424, 4970.091, 41.425),
        itemName = "lsdr",
        itemCountRange = {5, 15},
	-- MARKER --
        markerType = 27,
        markerScale = vector3(7.0, 7.0, 1.0),
        markerColor = {r = 0, g = 20, b = 255, a = 150},
        markerDistance = 10,
	-- BLIP --
        showBlip = false,
        blipId = 478,
        blipColor = 2,
        blipScale = 1.0,
        blipName = "Apfelfarm"
    },
    {
        coords = vector3(-1866.24, 2100.757, 137.81),
        itemName = "traube",
        itemCountRange = {5, 15},
	-- MARKER --
        markerType = 27,
        markerScale = vector3(7.0, 7.0, 1.0),
        markerColor = {r = 53, g = 0, b = 202, a = 150},
        markerDistance = 10,
	-- BLIP --
        showBlip = false,
        blipId = 478,
        blipColor = 2,
        blipScale = 1.0,
        blipName = "Apfelfarm"
    },
}

Config.Wait = 5000
Config.InteractionDistance = 1.5
Config.MenuCloseDistance = 2.0

-- Translation --
Config.PressE = "Drücke ~INPUT_CONTEXT~ um das Menü zu öffnen"
Config.FarmTitel = "Farm"
Config.Start = "Starte Farmen"
Config.StartSub = "Starte das Farmen um Items zu erhalten"
Config.NotifyStart = "~g~Du farmst jetzt"
Config.Close = "Menü Schließen"
Config.CloseSub = "Schließe dieses Menü um nichts zu farmen"
