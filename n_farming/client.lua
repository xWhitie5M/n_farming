ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local isInMarker = false
local currentZone = nil
local menuPool = NativeUI.CreatePool()
local mainMenu = nil
local isScriptActive = false

function CreateMainMenu(location)
    mainMenu = NativeUI.CreateMenu(Config.FarmTitel, "Scripted & Designed by ~b~xWhitie~s~")
    menuPool:Add(mainMenu)
    mainMenu.Settings.MouseControlsEnabled = false
    mainMenu.Settings.ControlDisablingEnabled = false
    AddMenuOptions(mainMenu, location)
end

function AddMenuOptions(menu, location)

    local startItem = NativeUI.CreateItem(Config.Start, Config.StartSub)
    menu:AddItem(startItem)

    menu.OnItemSelect = function(sender, item, index)
        if item == startItem then
	local game = lib.skillCheck({'easy', {areaSize = 90, speedMultiplier = 1}, 'easy'}, {'w', 'a', 's', 'd'})
            -- Logik für das Starten des Farmens
            local minCount, maxCount = table.unpack(location.itemCountRange)
            local itemCount = math.random(minCount, maxCount)

	if game then
            
            ESX.ShowNotification("Du hast " .. itemCount .. "x " .. location.itemName .. " erhalten!")
            
            StartGardenerAnimation()

            Citizen.Wait(Config.Wait)
            ClearPedTasks(PlayerPedId())

            TriggerServerEvent('esx:addInventoryItem', location.itemName, itemCount)
        elseif item == inventoryItem then
            menu:Visible(false)
		end
        end
    end
end

function StartGardenerAnimation()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "world_human_gardener_plant", 0, true)
end

function CreateBlips()
    for i = 1, #Config.Locations, 1 do
        local location = Config.Locations[i]
        if location.showBlip then
            local blip = AddBlipForCoord(location.coords.x, location.coords.y, location.coords.z)
            SetBlipSprite(blip, location.blipId)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, location.blipScale)
            SetBlipColour(blip, location.blipColor)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(location.blipName)
            EndTextCommandSetBlipName(blip)
        end
    end
end

Citizen.CreateThread(function()
    CreateBlips()

    while true do
        Citizen.Wait(500)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local isNearby = false

        for i = 1, #Config.Locations, 1 do
            local location = Config.Locations[i]
            local dist = #(coords - location.coords)

            if dist < location.markerDistance then
                isNearby = true
                if not isScriptActive then
                    isScriptActive = true
                    ActivateScript(i)
                end
                break
            end
        end

        if not isNearby and isScriptActive then
            isScriptActive = false
            DeactivateScript()
        end
    end
end)

function ActivateScript(zoneIndex)
    Citizen.CreateThread(function()
        local location = Config.Locations[zoneIndex]

        while isScriptActive do
            Citizen.Wait(0)
            if mainMenu ~= nil and mainMenu:Visible() then
                menuPool:ProcessMenus()
            end

            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local dist = #(coords - location.coords)

            isInMarker = false
            if dist < Config.InteractionDistance then
                isInMarker = true
                currentZone = zoneIndex
            end

            if isInMarker then
                ESX.ShowHelpNotification(Config.PressE)
                if IsControlJustReleased(0, 38) then
                    if mainMenu == nil or not mainMenu:Visible() then
                        if mainMenu ~= nil then
                            menuPool:Remove(mainMenu)
                        end
                        CreateMainMenu(location)
                        mainMenu:Visible(true)
                    end
                end
            end

            if mainMenu ~= nil and mainMenu:Visible() and currentZone ~= nil then
                if dist > Config.MenuCloseDistance then
                    mainMenu:Visible(false)
                end
            end

            if dist < location.markerDistance then
                DrawMarker(
                    location.markerType,
                    location.coords.x,
                    location.coords.y,
                    location.coords.z - 1.0,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    location.markerScale.x,
                    location.markerScale.y,
                    location.markerScale.z,
                    location.markerColor.r,
                    location.markerColor.g,
                    location.markerColor.b,
                    location.markerColor.a,
                    false, true, 2, false, nil, nil, false
                )
            end
        end
    end)
end

function DeactivateScript()
    ClearPedTasks(PlayerPedId())
    if mainMenu ~= nil then
        menuPool:Remove(mainMenu)
    end
    mainMenu = nil
    currentZone = nil
end
