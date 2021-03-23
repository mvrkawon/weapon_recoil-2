-- Script by Lyrad for LEFR

local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,   -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}
local meta = 1.0
function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )
    local _, hash = GetCurrentPedWeapon( ped, true )
        if not HashInTable( hash ) then 
		end 
end 

RegisterNetEvent('meta:zmniejszcooldown')
AddEventHandler('meta:zmniejszcooldown', function()
meta = 0.5
Citizen.Wait(1000*60*30)
meta = 1.0
end)

RegisterNetEvent('meta:reset')
AddEventHandler('meta:reset', function()
meta = 1.0
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed( -1 )
		local weapon = GetSelectedPedWeapon(ped)
		--print(weapon) -- To get the weapon hash by pressing F8 in game
		
		-- Disable reticle
		
		ManageReticle()
		
		-- Disable melee while aiming (may be not working)
		
		if IsPedArmed(ped, 6) then
        	DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
		
		-- Disable ammo HUD
		
		DisplayAmmoThisFrame(false)
		
		-- Shakycam
		
		-- Pistol
		if weapon == GetHashKey("WEAPON_STUNGUN") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)
			end
		end
		
		if weapon == GetHashKey("WEAPON_FLAREGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SNSPISTOL") then
			SetPlayerWeaponDamageModifier(PlayerId(), 0.5)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				RecoilThirdPersonMultiplier(1.5,1.2)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)				
				end
			end
		elseif weapon == GetHashKey("WEAPON_SNSPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM		
			SetPlayerWeaponDamageModifier(PlayerId(), 0.5)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				RecoilThirdPersonMultiplier(1.5,1.2)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)				
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_SNSPISTOL_MK2") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 0.6)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1*meta)
				RecoilThirdPersonMultiplier(1.5,1.2)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		elseif weapon == GetHashKey("WEAPON_SNSPISTOLMK2") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
			SetPlayerWeaponDamageModifier(PlayerId(), 0.6)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1*meta)
				RecoilThirdPersonMultiplier(1.5,1.2)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_PISTOL") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 0.63)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				RecoilThirdPersonMultiplier(1.5,1.2)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.2*0.2*meta)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		elseif weapon == GetHashKey("WEAPON_PISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
			SetPlayerWeaponDamageModifier(PlayerId(), 0.63)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				RecoilThirdPersonMultiplier(1.5,1.2)
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.2*0.2*meta)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		end
		if weapon == GetHashKey("WEAPON_PISTOL_MK2") then
			SetPlayerWeaponDamageModifier(PlayerId(), 0.7)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.12*meta)
				RecoilThirdPersonMultiplier(1.5,1.2)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		elseif weapon == GetHashKey("WEAPON_PISTOL_MK2") and IsPedCurrentWeaponSilenced(PlayerPedId()) then			-- Z TLUMIKIEM
			SetPlayerWeaponDamageModifier(PlayerId(), 0.7)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.12*meta)
				RecoilThirdPersonMultiplier(1.5,1.2)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_APPISTOL") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3*meta)
				RecoilThirdPersonMultiplier(1.5,1.2)
			end
		elseif weapon == GetHashKey("WEAPON_APPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3*meta)
				RecoilThirdPersonMultiplier(1.5,1.2)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATPISTOL") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 0.7)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.16*meta)
				RecoilThirdPersonMultiplier(1.0,0.7)
				else
				RecoilThirdPersonMultiplier(3.0,2.1)
				end
			end
		elseif weapon == GetHashKey("WEAPON_COMBATPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
			SetPlayerWeaponDamageModifier(PlayerId(), 0.7)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.16*meta)
				RecoilThirdPersonMultiplier(1.0,0.7)
				else
				RecoilThirdPersonMultiplier(3.0,2.1)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_PISTOL50") then
			SetPlayerWeaponDamageModifier(PlayerId(), 0.8)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*meta)
				RecoilThirdPersonMultiplier(2.5,2.2)
				else
				RecoilThirdPersonMultiplier(5.0,4.4)
				end
			end
		elseif weapon == GetHashKey("WEAPON_PISTOL50") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
			SetPlayerWeaponDamageModifier(PlayerId(), 0.8)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*meta)
				RecoilThirdPersonMultiplier(2.5,2.2)
				else
				RecoilThirdPersonMultiplier(5.0,4.4)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYPISTOL") then		
			SetPlayerWeaponDamageModifier(PlayerId(), 1.0)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4*meta)
				RecoilThirdPersonMultiplier(1.0,0.8)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		elseif weapon == GetHashKey("WEAPON_HEAVYPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
			SetPlayerWeaponDamageModifier(PlayerId(), 1.0)			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4*meta)
				RecoilThirdPersonMultiplier(1.0,0.8)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_VINTAGEPISTOL") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 0.6)		
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15*meta)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		elseif weapon == GetHashKey("WEAPON_VINTAGEPISTOL") and  IsPedCurrentWeaponSilenced(PlayerPedId()) then		
			SetPlayerWeaponDamageModifier(PlayerId(), 0.6)		
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15*meta)
				else
				RecoilThirdPersonMultiplier(3.5,3.2)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_MARKSMANPISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3*meta)
			end
		elseif weapon == GetHashKey("WEAPON_MARKSMANPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
		
		end
		
		if weapon == GetHashKey("WEAPON_REVOLVER") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4*meta)
			end
		elseif weapon == GetHashKey("WEAPON_REVOLVER") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
		
		end
		
		if weapon == GetHashKey("WEAPON_REVOLVER_MK2") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4*meta)
			end
		elseif weapon == GetHashKey("WEAPON_REVOLVER_MK2") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
		
		end
		
		if weapon == GetHashKey("WEAPON_DOUBLEACTION") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4*meta)
			end
		elseif weapon == GetHashKey("WEAPON_DOUBLEACTION") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM
		
		end
		-- SMG
		
		if weapon == GetHashKey("WEAPON_MICROSMG") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATPDW") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.03*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SMG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SMG_MK2") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
			end
		end
		
		if weapon == GetHashKey("WEAPON_ASSAULTSMG") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MACHINEPISTOL") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MINISMG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATMG") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMBATMG_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2*meta)
			end
		end
		
		-- Rifles
		
		if weapon == GetHashKey("WEAPON_ASSAULTRIFLE") then			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.25,0.2)
				else
				RecoilThirdPersonMultiplier(0.25,0.2)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.25,0.2)
				else
				RecoilThirdPersonMultiplier(0.25,0.2)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_CARBINERIFLE") then	
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
				else
				RecoilThirdPersonMultiplier(0.5,0.4)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_CARBINERIFLE_MK2") then			
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
				RecoilThirdPersonMultiplier(0.5,0.4)
				else
				RecoilThirdPersonMultiplier(0.5,0.4)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_ADVANCEDRIFLE") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_GUSENBERG") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SPECIALCARBINE") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_BULLPUPRIFLE") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMPACTRIFLE") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.2*meta)
			end
		end
		
		-- Shotgun
		
		if weapon == GetHashKey("WEAPON_PUMPSHOTGUN") then
			SetPlayerWeaponDamageModifier(PlayerId(), 3.0)
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
				else
				RecoilThirdPersonMultiplier(9.5,9.2)
				end
			end
		end
		
		if weapon == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
			SetPlayerWeaponDamageModifier(PlayerId(), 3.0)
			if IsPedShooting(ped) then
				if  GetFollowPedCamViewMode() == 4 then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
				else
				RecoilThirdPersonMultiplier(9.5,9.2)
				end			
			end
		end
		
		if weapon == GetHashKey("WEAPON_SAWNOFFSHOTGUN") then
			SetPlayerWeaponDamageModifier(PlayerId(), 3.0)
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
			end
		end
		
		if weapon == GetHashKey("WEAPON_ASSAULTSHOTGUN") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 3.0)
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
			end
		end
		
		if weapon == GetHashKey("WEAPON_BULLPUPSHOTGUN") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 3.0)		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
			end
		end
		
		if weapon == GetHashKey("WEAPON_DBSHOTGUN") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 3.0)
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
			end
		end
		
		if weapon == GetHashKey("WEAPON_AUTOSHOTGUN") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 3.0)
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MUSKET") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYSHOTGUN") then	
			SetPlayerWeaponDamageModifier(PlayerId(), 3.5)
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.6*meta)
				RecoilThirdPersonMultiplier(9.5,9.2)
			end
		end
		
		-- Sniper
		
		if weapon == GetHashKey("WEAPON_SNIPERRIFLE") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.400*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYSNIPER") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10000*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.35*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MARKSMANRIFLE") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then			
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1*meta)
			end
		end
		
		-- Launcher
		
		if weapon == GetHashKey("WEAPON_GRENADELAUNCHER") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_RPG") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.9*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_HOMINGLAUNCHER") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.9*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_MINIGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.20*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_RAILGUN") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.0*meta)
				
			end
		end
		
		if weapon == GetHashKey("WEAPON_COMPACTLAUNCHER") then		
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08*meta)
			end
		end
		
		if weapon == GetHashKey("WEAPON_FIREWORK") then	
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*meta)
			end
		end
		
		-- Infinite FireExtinguisher
		
		if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") then		
			if IsPedShooting(ped) then
				SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
			end
		end
	end
end)

-- recoil script by bluethefurry / Blumlaut https://forum.fivem.net/t/betterrecoil-better-3rd-person-recoil-for-fivem/82894
-- I just added some missing weapons because of the doomsday update adding some MK2.
-- I can't manage to make negative hashes works, if someone make it works, please let me know =)

local recoils = {
	[453432689] = 1.5, -- PISTOL
	[3219281620] = 1.5, -- PISTOL MK2
	[1593441988] = 0.2, -- COMBAT PISTOL
	[584646201] = 0.1, -- AP PISTOL
	[2578377531] = 5.8, -- PISTOL .50
	[324215364] = 1.0, -- MICRO SMG
	[736523883] = 0.1, -- SMG
	[2024373456] = 0.1, -- SMG MK2
	[4024951519] = 0.1, -- ASSAULT SMG
	[3220176749] = 1.2, -- ASSAULT RIFLE
	[961495388] = 0.2, -- ASSAULT RIFLE MK2
	[2210333304] = 0.1, -- CARBINE RIFLE
	[4208062921] = 0.1, -- CARBINE RIFLE MK2
	[2937143193] = 0.1, -- ADVANCED RIFLE
	[2634544996] = 0.1, -- MG
	[2144741730] = 0.1, -- COMBAT MG
	[3686625920] = 0.1, -- COMBAT MG MK2
	[487013001] = 0.4, -- PUMP SHOTGUN
	[1432025498] = 0.4, -- PUMP SHOTGUN MK2
	[2017895192] = 0.7, -- SAWNOFF SHOTGUN
	[3800352039] = 0.4, -- ASSAULT SHOTGUN
	[2640438543] = 0.2, -- BULLPUP SHOTGUN
	[911657153] = 0.1, -- STUN GUN
	[100416529] = 0.5, -- SNIPER RIFLE
	[205991906] = 0.7, -- HEAVY SNIPER
	[177293209] = 0.7, -- HEAVY SNIPER MK2
	[856002082] = 1.2, -- REMOTE SNIPER
	[2726580491] = 1.0, -- GRENADE LAUNCHER
	[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
	[2982836145] = 0.0, -- RPG
	[1752584910] = 0.0, -- STINGER
	[1119849093] = 0.01, -- MINIGUN
	[3218215474] = 0.05, -- SNS PISTOL
	[2009644972] = 0.25, -- SNS PISTOL MK2
	[1627465347] = 0.1, -- GUSENBERG
	[3231910285] = 0.2, -- SPECIAL CARBINE
	[-1768145561] = 0.25, -- SPECIAL CARBINE MK2
	[3523564046] = 0.5, -- HEAVY PISTOL
	[2132975508] = 0.2, -- BULLPUP RIFLE
	[-2066285827] = 0.25, -- BULLPUP RIFLE MK2
	[137902532] = 0.7, -- VINTAGE PISTOL
	[-1746263880] = 0.4, -- DOUBLE ACTION REVOLVER
	[2828843422] = 0.7, -- MUSKET
	[984333226] = 0.2, -- HEAVY SHOTGUN
	[3342088282] = 0.3, -- MARKSMAN RIFLE
	[1785463520] = 0.35, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0.9, -- FLARE GUN
	[171789620] = 0.2, -- COMBAT PDW
	[3696079510] = 0.9, -- MARKSMAN PISTOL
  	[1834241177] = 2.4, -- RAILGUN
	[3675956304] = 0.3, -- MACHINE PISTOL
	[3249783761] = 0.6, -- REVOLVER
	[-879347409] = 0.65, -- REVOLVER MK2
	[4019527611] = 0.7, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 0.3, -- COMPACT RIFLE
	[317205821] = 0.2, -- AUTO SHOTGUN
	[125959754] = 0.5, -- COMPACT LAUNCHER
	[3173288789] = 0.1, -- MINI SMG		
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				repeat 
					Wait(0)
					p = GetGameplayCamRelativePitch()
					if GetFollowPedCamViewMode() ~= 4 then
						SetGameplayCamRelativePitch(p+0.1, 0.2)
					end
					tv = tv+0.1
				until tv >= recoils[wep]
			end
			
		end
	end
end)


function RecoilThirdPersonMultiplier(ThirdPersonMultiplier,ThirdPersonAimingMultiplier)
	if GetFollowPedCamViewMode() ~= 4 then -- Not First Person
		local getwidthrecoil = GetGameplayCamRelativeHeading()
		local widthrecoil = math.random() + math.random() - math.random() - math.random()
		SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonMultiplier)
		
		local getheightrecoil = GetGameplayCamRelativePitch()
		local heightrecoil = math.random() + math.random()
		SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonMultiplier, 1.0)
		if IsControlPressed(0, 25) then --RMB aim
			local getwidthrecoil = GetGameplayCamRelativeHeading()
			local widthrecoil = math.random() + math.random() - math.random() - math.random()
			SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonAimingMultiplier)
			
			local getheightrecoil = GetGameplayCamRelativePitch()
			local heightrecoil = math.random() + math.random()
			SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonAimingMultiplier, 1.0)
			Citizen.Wait(0)
		end
	end
end

function RecoilThirdPersonInCarMultiplier(ThirdPersonInCarMultiplier)
	local getwidthrecoil = GetGameplayCamRelativeHeading()
	local widthrecoil = math.random() + math.random() - math.random() - math.random()
	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonInCarMultiplier)
				
	local getheightrecoil = GetGameplayCamRelativePitch()
	local heightrecoil = math.random() + math.random()
	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonInCarMultiplier, 1.0)
end

function RecoilFirstPersonInCarMultiplier(FirstPersonInCarMultiplier)
	local getwidthrecoil = GetGameplayCamRelativeHeading()
	local widthrecoil = math.random() + math.random() - math.random() - math.random()
	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * FirstPersonInCarMultiplier)
	--Doesnt work hence side ways recoil increased
	--[[local getheightrecoil = GetGameplayCamRelativePitch()
	local heightrecoil = math.random() + math.random()
	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * FirstPersonInCarMultiplier, 1.0)--]]
end

Config = {}
Config.Weapons = {
    [`WEAPON_SNSPISTOL`] = 1.0,
    [`WEAPON_SNSPISTOL_MK2`] = 1.0,
    [`WEAPON_PISTOL`] = 1.0,
    [`WEAPON_PISTOL_MK2`] = 1.0,
    [`WEAPON_COMBATPISTOL`] = 1.0,
    [`WEAPON_PISTOL50`] = 1.0,
    [`WEAPON_HEAVYPISTOL`] = 1.0,
    [`WEAPON_VINTAGEPISTOL`] = 1.0,
    [`WEAPON_PUMPSHOTGUN`] = 1.00,
    [`WEAPON_PUMPSHOTGUN_MK2`] = 1.00,
    [`WEAPON_SAWNOFFSHOTGUN`] = 1.0,
    [`WEAPON_ASSAULTSHOTGUN`] = 1.0,
    [`WEAPON_BULLPUPSHOTGUN`] = 1.0,
    [`WEAPON_DBSHOTGUN`] = 1.0,
    [`WEAPON_AUTOSHOTGUN`] = 1.0,
}

Citizen.CreateThread(function()

    local aiming, shooting, curMul, _, weapon = nil, nil, nil



    while true do
        aiming, shooting = IsControlPressed(0, 25), IsPedShooting(PlayerPedId())

        if aiming or shooting then            
            _, weapon = GetCurrentPedWeapon(PlayerPedId(), true)

            if _ then
                curMul = GetPlayerWeaponDamageModifier(PlayerId())
 

                if curMul > (Config.Weapons[weapon]) then
                    TriggerServerEvent('twojstarynajebany:siema', curMul, (Config.Weapons[weapon]))
                    Citizen.Wait(60000)
                end
            end
        else
            Citizen.Wait(10)
        end

        Citizen.Wait(0)
    end
end)




