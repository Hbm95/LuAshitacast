local profile = {};
Extras = gFunc.LoadFile('includes\\Extras.lua');
Emotes = gFunc.LoadFile('includes\\Emotes.lua');
BlackMage = gFunc.LoadFile('includes\\BlackMage.lua');

local ELEDotSpells = T{'Choke', 'Drown', 'Rasp', 'Burn', 'Frost', 'Shock'}
local MNDEnfeebles = T{'Paralyze', 'Slow'}
-------------------------------------------------------------------------------------------------------
-- Make and Fill out your Sets as you please                                                         --
-- You do NOT need to set elemental Staves in your sets, unless you want to.                         --
-- Elemental Staves are set to change automatically to the element of whatever spell you're casting. --
-------------------------------------------------------------------------------------------------------
-- You do NOT need to set Elemental Obis in your sets, unless you want to.                           --
-- Elemental Obis are set to change automatically according to Current Weather / Day                 --
-------------------------------------------------------------------------------------------------------

local sets = {
	['Glam'] = {
        Head = '',
        Body = '',
        Hands = '',
        Legs = '',
		Feet = '',
    },
    ['Idle'] = {
        Main = 'Terra\'s Staff',
		Sub = '',
        Head = 'Republic Circle',
        Neck = 'Black Silk Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Vermillion Cloak',
        Hands = 'Wizard\'s Gloves ',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Wisdom Ring',
        Back = 'Red cape +1',
        Waist = 'Shaman\'s Belt',
        Legs = 'Custom slacks',
		Feet = 'Custom M Boots',
    },
	['Movement'] = {
	     Main = 'Terra\'s Staff',
		Sub = '',
        Head = '',
        Neck = 'Black Silk Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = '',
        Hands = 'Wizard\'s Gloves ',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Wisdom Ring',
        Back = 'Red cape +1',
        Waist = 'Shaman\'s Belt',
        Legs = 'Custom slacks',
		Feet = 'Custom M Boots',
	},
	['Melee'] = {
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['Enfeebling'] = {
        Main = '',
		Sub = '',
        Head = 'Republic Circlet',
        Neck = 'Black Silk Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Ryl.Sqr. Robe +1',
        Hands = 'Wizard\'s Gloves ',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Wisdom Ring',
        Back = 'Red cape +1',
        Waist = 'Shaman\'s Belt',
        Legs = 'Custom slacks',
		Feet = 'Custom M Boots',
    },
    ['Nuke'] = {
        Main = '',
		Sub = '',
        Head = 'Republic Circlet',
        Neck = 'Black Silk Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Ryl.Sqr. Robe +1',
        Hands = 'Wizard\'s Gloves ',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Wisdom Ring',
        Back = 'Red cape +1',
        Waist = 'Shaman\'s Belt',
        Legs = 'Custom slacks',
		Feet = 'Custom M Boots',
    },
	['MagicBurst'] = {
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['Dark'] = {
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['ELEDots'] = { --Burn, Shock, Rasp, Choke, Etc
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['MND_Enfeebles'] = {
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['Stoneskin'] = {
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['Sneak_Invis'] = {
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
    ['Heal'] = {
        Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['Resting'] = {
        Main = 'Dark Staff',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = 'Vermillion cloak',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = 'Baron\'s Slops',
		Feet = '',
    },
	['AutoRefresh'] = {
		Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['FastCast'] = {
		Main = '',
		Sub = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
		Feet = '',
    },
	['MPSet'] = {
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
    },
	['UggalepihPendant'] = {
        Neck = 'Uggalepih Pendant',
    },
	['SorcRing'] = {
		Ring2 = 'Sorcerer\'s ring',
	},
};
local ElementalStaffTable = {
    ['Earth']   = 'Terra\'s Staff',
	['Water']   = 'Water Staff',
	['Wind']    = 'Auster\'s Staff',
	['Fire']    = 'Vulcan\'s Staff',
    ['Ice']     = 'Aquilo\'s Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light']   = 'Apollo\'s Staff',
    ['Dark']    = 'Dark Staff'
};
local ElementalObiTable = {
    ['Earth']   = 'Dorin Obi',
	['Water']   = 'Suirin Obi',
	['Wind']    = 'Furin Obi',
	['Fire']    = 'Karin Obi',
    ['Ice']     = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light']   = 'Korin Obi',
    ['Dark']    = 'Anrin Obi'
};
profile.Sets = sets;

profile.Packer = {};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	Extras.Initialize();
	BlackMage.Initialize();
	Emotes.Initialize();
	AshitaCore:GetChatManager():QueueCommand(-1, '/lac lockstyle Glam');
end

profile.OnUnload = function()
	Extras.Unload();
	Emotes.Unload();
	BlackMage.Unload();
end

profile.HandleCommand = function(args)
	Extras.HandleCommands(args);
	Emotes.HandleCommands(args);
	BlackMage.HandleCommands(args);
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	
	if (BlackMage.Settings.MPSET == true) and (player.MP > BlackMage.Settings.MPThreshold) then
		gFunc.EquipSet(sets.MPSet);
	else
	
		gFunc.EquipSet(sets.Idle);
		
		if (player.Status == 'Engaged') then
			gFunc.EquipSet(sets.Melee);
		elseif (player.Status == 'Resting') then
			gFunc.EquipSet(sets.Resting);
		elseif (player.IsMoving == true) then
			if (player.Status ~= 'Engaged') then
				gFunc.EquipSet(sets.Movement);
			end
		else
			--Equip AutoRefresh Set if MP below 90% and NOT resting (change this to whatever you want)
			if (player.MPP <= 90) and (player.Status ~= 'Resting') then
				gFunc.EquipSet(sets.AutoRefresh);
			else
				gFunc.EquipSet(sets.Idle);
			end
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
end

profile.HandleItem = function()
	
end

profile.HandlePrecast = function()
	local player = gData.GetPlayer();
    local spell = gData.GetAction();
	local weather = gData.GetEnvironment();
	
	if (BlackMage.Settings.MPSET == true) and (player.MP > BlackMage.Settings.MPThreshold) then
		gFunc.EquipSet(sets.MPSet);
	else
		gFunc.EquipSet(sets.FastCast);
	end
	--Automatic Staff Switching
	gFunc.Equip('main', ElementalStaffTable[spell.Element]);
	
	--Automatic Obi Switching
	if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
		gFunc.Equip('waist', ElementalObiTable[weather.DayElement]);
	end
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local player = gData.GetPlayer();
	
	if (BlackMage.Settings.MPSET == true) and (player.MP > BlackMage.Settings.MPThreshold) then
		gFunc.EquipSet(sets.MPSet);
	else
		if (player.HPP <= 76) then
			gFunc.EquipSet(sets.SorcRing);
		end

		if (spell.Skill == 'Enhancing Magic') then
			gFunc.EquipSet(sets.Enhancing);
			if (string.match(spell.Name, 'Sneak') or (string.match(spell.Name, 'Invisible'))) then
				gFunc.EquipSet(sets.Sneak_Invis);
			end
			if (string.match(spell.Name, 'Stoneskin')) then
				gFunc.EquipSet(sets.Stoneskin);
			end
		elseif (spell.Skill == 'Healing Magic') then
			gFunc.EquipSet(sets.Healing);
			
		elseif (spell.Skill == 'Elemental Magic') then
			if (ELEDotSpells:contains(spell)) then
				gFunc.EquipSet(sets.ELEDots);
			else
				if (BlackMage.Settings.MagicBurst == True) then
					gFunc.EquipSet(sets.MagicBurst);
				else
					gFunc.EquipSet(sets.Nuke);
					--Equip Uggalepih Pendant if MP is below or equal to 51%
					if (spell.MppAftercast) <= 51 then
						gFunc.EquipSet(sets.UggalepihPendant);
					end
				end
			end
		elseif (spell.Skill == 'Enfeebling Magic') then
			if (MNDEnfeebles:contains(spell)) then
				gFunc.EquipSet(sets.MND_Enfeebles);
			else
				gFunc.EquipSet(sets.Enfeebling);
			end
		elseif (spell.Skill == 'Dark Magic')then
			gFunc.EquipSet(sets.Dark);
		end
	end
end

profile.HandlePreshot = function()
	
end

profile.HandleMidshot = function()
	
end

profile.HandleWeaponskill = function()
	local canWS = Extras.CheckWsBailout();
	
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();    
        gFunc.EquipSet(sets.Weaponskill)
    end
end

return profile;