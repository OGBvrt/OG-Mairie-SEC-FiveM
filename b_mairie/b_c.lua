local Keys = {

	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118

}

ESX = nil
local mairieb = {}

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


local policier = {
    {441.280, -978.850, 29.68,"",170.016,0x15F8700D,"s_f_y_cop_01"}
}


_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Service d'État Civil","~r~Service d'État Civil")
_menuPool:Add(mainMenu)


RegisterNetEvent('b_mairie:voirmaci')
AddEventHandler('b_mairie:voirmaci', function()
	mairieb.closestPlayer, mairieb.closestDistance = ESX.Game.GetClosestPlayer()										
	if mairieb.closestDistance ~= -1 and mairieb.closestDistance <= 3.0 then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(mairieb.closestPlayer))
	else
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		--ESX.ShowNotification('Aucun joueur a proximite')
	end
end)

--[[RegisterNetEvent('b_mairie:voirmonpermis')
AddEventHandler('b_mairie:voirmonpermis', function()
	mairieb.closestPlayer, mairieb.closestDistance = ESX.Game.GetClosestPlayer()										
	if mairieb.closestDistance ~= -1 and mairieb.closestDistance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(mairieb.closestPlayer), 'driver')
	else
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
	end
end)]]

function MaireMenuSECB(menu)

    local ci = NativeUI.CreateColouredItem("Carte d'identité", "", Colours.Black, Colours.White)
    menu:AddItem(ci)

--[[    local permis = NativeUI.CreateColouredItem("Permis", "", Colours.Black, Colours.White)
    menu:AddItem(permis)]]

    menu.OnItemSelect = function(menu, item)
    if item == ci then
            TriggerServerEvent('AcheteCI')
--[[    elseif item == permis then
                TriggerServerEvent('Achetepermis')
                ESX.ShowAdvancedNotification("Service d'Etat Civil", "Permis", "Un permis a été assignée á votre nom", "CHAR_DR_FRIEDLANDER", 1)]]
        end
    end
end

MaireMenuSECB(mainMenu)
_menuPool:RefreshIndex()

local secposb = {
    {x = 441.206, y = -981.107, z = 30.68}
}

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(secposb) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, secposb[k].x, secposb[k].y, secposb[k].z)

            if dist <= 1.2 then

                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour interagir avec le ~b~Service d'État Civil")

				if IsControlJustPressed(1,51) then 

                    mainMenu:Visible(not mainMenu:Visible())

				end
            end
        end
    end
end)

Citizen.CreateThread(function()

    for _,v in pairs(policier) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)
