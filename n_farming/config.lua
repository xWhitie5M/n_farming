Config = {}

Config.Locations = {
    {
        coords = vector3(840.0374, 2151.355, 52.312),
        itemName = "cannabis",
        itemCountRange = {5, 15},
	-- MARKER --
        markerType = 27, -- Anderer Marker-Typ für diese Location
        markerScale = vector3(7.0, 7.0, 1.0), -- Größerer Marker
        markerColor = {r = 0, g = 255, b = 10, a = 150}, -- Grüne Farbe
        markerDistance = 10, -- Größere Sichtbarkeit
	-- BLIP --
        showBlip = false, -- Blip anzeigen
        blipId = 478, -- Blip-Icon ID
        blipColor = 2, -- Blip-Farbe
        blipScale = 1.0, -- Blip-Größe
        blipName = "Apfelfarm" -- Blip-Name
    },
    {
        coords = vector3(2178.424, 4970.091, 41.425),
        itemName = "lsdr",
        itemCountRange = {5, 15},
	-- MARKER --
        markerType = 27, -- Anderer Marker-Typ für diese Location
        markerScale = vector3(7.0, 7.0, 1.0), -- Größerer Marker
        markerColor = {r = 0, g = 20, b = 255, a = 150}, -- Grüne Farbe
        markerDistance = 10, -- Größere Sichtbarkeit
	-- BLIP --
        showBlip = false, -- Blip anzeigen
        blipId = 478, -- Blip-Icon ID
        blipColor = 2, -- Blip-Farbe
        blipScale = 1.0, -- Blip-Größe
        blipName = "Apfelfarm" -- Blip-Name
    },
    {
        coords = vector3(-1866.24, 2100.757, 137.81),
        itemName = "traube",
        itemCountRange = {5, 15},
	-- MARKER --
        markerType = 27, -- Anderer Marker-Typ für diese Location
        markerScale = vector3(7.0, 7.0, 1.0), -- Größerer Marker
        markerColor = {r = 53, g = 0, b = 202, a = 150}, -- Grüne Farbe
        markerDistance = 10, -- Größere Sichtbarkeit
	-- BLIP --
        showBlip = false, -- Blip anzeigen
        blipId = 478, -- Blip-Icon ID
        blipColor = 2, -- Blip-Farbe
        blipScale = 1.0, -- Blip-Größe
        blipName = "Apfelfarm" -- Blip-Name
    },
}

Config.Wait = 5000 -- Wartezeit in Millisekunden bevor die Animation stoppt und das Item gegeben wird
Config.InteractionDistance = 1.5 -- Distanz, in der der Spieler mit dem Marker interagieren kann
Config.MenuCloseDistance = 2.0 -- Distanz, ab der das Menü geschlossen wird

-- Translation --
Config.PressE = "Drücke ~INPUT_CONTEXT~ um das Menü zu öffnen"
Config.FarmTitel = "Farm"
Config.Start = "Starte Farmen"
Config.StartSub = "Starte das Farmen um Items zu erhalten"
Config.NotifyStart = "~g~Du farmst jetzt"
Config.Close = "Menü Schließen"
Config.CloseSub = "Schließe dieses Menü um nichts zu farmen"