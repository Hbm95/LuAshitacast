local profile = {};
Extras = gFunc.LoadFile('includes\\Extras.lua');
Emotes = gFunc.LoadFile('includes\\Emotes.lua');
RedMage = gFunc.LoadFile('includes\\RedMage.lua');

local sets = {
		['TownGear'] = {
		Main = 'Joyeuese',
		Sub = 'Octave Club',
		--Sub = 'Numinous Shield',
		Body = 'Ducal Aketon',
        Hands = 'Zenith Mitts',
        Legs = 'Blood cuisses',
		Feet = 'Dls. Boots +1',
		head = 'Dls. Chapeau +1',
		back = 'Hexerei Cape',
		Ear1 = 'Loquac. Earring',
        Ear2 = 'Cmn. Earring',
		Ring1 = 'Tamas ring',
        Ring2 = 'Astral Ring',
	},
	['Glam'] = {
		Main = 'Octave Club',
		Sub = 'Genbu\'s Shield',
		--Head = 'Dls. Chapeau +1',
		Head = 'Cumulus Masque',
		--Head = 'Rabbit Cap',
        --Body = 'Culinarian\'s Apron',
		--Body = 'Duelist\'s Tabard',
		Body = 'Ducal Aketon',
        Hands = 'Zenith Mitts',
        Legs = 'Duelist\'s Tights',
		Feet = 'Dls. Boots +1',
	},
	['Holiday'] = {
		Main = 'Octave Club',
		Sub = 'Hatchling Shield',
		Head = 'Dls. Chapeau +1',
		Body = 'Ducal Aketon',
		Hands = 'Dst. Mittens +1',
        Legs = 'Custom Slacks',
	    Feet = 'Dls. Boots +1',
	},
    ['Idle'] = {
        Main = 'Terra\'s Staff',
		Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Faith torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Astral Ring',
        Ring2 = 'Tamas ring',
        Back = 'Hexerei Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Dst. Subligar +1',
		Feet = 'Dst. Leggings +1',
    },
	['Idle_NIN'] = {
        Ammo = 'Fortune Egg',
        Head = 'Dls. Chapeau +1',
        Neck = 'Peacock Amulet',
        Ear1 = 'Suppanomimi',
        Ear2 = 'Gold earring +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Tamas ring',
        Ring2 = 'Astral ring',
        Back = 'Hexerei Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Dst. Subligar +1',
		Feet = 'Dst. Leggings +1',
    },
	['Melee'] = {
        Main = 'Octave Club',
		Sub = 'Numinous Shield',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Suppanomimi',
		Body = 'Scorpion Harness',
        Hands = 'Warlock\'s Gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Coral Cuisses +1',
		Feet = 'Dls. Boots +1',
    },
	['MDT'] = {
        Head = 'Coral Visor +1',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
		Body = 'Coral Scale Mail',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Hexerei Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Coral Cuisses +1',
		Feet = 'Dls. Boots +1',
    },
		['PDT'] = {
        Main = 'Terra\'s Staff',
		Head = 'Darksteel Cap +1',
        Neck = 'Faith torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
		Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Hexerei Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Dst. Subligar +1',
		Feet = 'Dst. Leggings +1',
    },
	['Melee_NIN'] = {
        Main = 'Joyeuese',
		Sub = 'Octave Club',
		Ammo = 'Fenrir\'s Stone',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Suppanomimi',
        Ear2 = 'Gold earring +1',
		Body = 'Scorpion Harness',
        Hands = 'Dusk Gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Crow hose',
		Feet = 'Dls. Boots +1',
    },
	['Melee_EVA'] = {
        Main = 'Joyeuese',
		Sub = 'Octave Club',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Gold earring +1',
        Ear2 = 'Suppanomimi',
		Body = 'Scorpion harness',
        Hands = 'Warlock\'s Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Jelly Ring',
        Back = 'Nomad\'s Mantle',
        Waist = 'Scouter\'s Belt',
        Legs = 'Crow hose',
		Feet = 'Dls. Boots +1',
    },
	['Enfeebling'] = {
        Head = 'Dls. Chapeau +1',
        Neck = 'Enfeebling Torque',
		Ear1 = 'Cmn. Earring',
		Ear2 = 'Loquac. Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Zenith Mitts',
        Back = 'Rainbow Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Errant Slops',
		Feet = 'Dls. Boots +1',
		Ring1 = 'Sapphire ring',
		Ring2 = 'Tamas ring',
    },
	['Enhancing'] = {
		Head = 'Warlock\'s Chapeau',
        Neck = 'Enhancing Torque',
		Ear1 = 'Magnetic Earring',
		Ear2 = 'Loquac. Earring',
        Body = 'Errant Hpl.',
        Hands = 'Coral Fng. Gnt. +1',
        Back = 'Rainbow Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Warlock\'s Tights',
		Feet = 'Dls. Boots +1',
		Ring1 = 'Sapphire ring',
		Ring2 = 'Tamas ring',
    },
    ['Nuke'] = {
        Head = 'Warlock\'s Chapeau',
		Neck = 'Elemental Torque',
		Ear1 = 'Magnetic Earring',
        Ear2 = 'Moldavite Earring',
		Body = 'Errant Hpl.',
        Hands = 'Zenith Mitts',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Tamas ring',
        Back = 'Rainbow Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Duelist\'s Tights',
		Feet = 'Dls. Boots +1',
    },
	['DarkMagic'] = {
		Neck = 'Prudence Torque',
        Ring2 = 'Overlord\'s Ring',
    },
    ['Heal'] = {
        Head = 'Warlock\'s Chapeau',
        Neck = 'Healing Torque',
        Ear1 = 'Magnetic Earring',
		Ear2 = 'Loquac. Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Errant Cuffs',
        Ring1 = 'Tamas ring',
        Ring2 = 'Sapphire ring',
        Back = 'Rainbow Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Warlock\'s Tights',
		Feet = 'Dls. Boots +1',
    },
	['Resting'] = {
        Main = 'Dark Staff',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Star Necklace',
        Ear1 = 'Cmn. Earring',
		Ear2 = 'Loquac. Earring',
        Body = 'Errant Hpl.',
        Hands = 'Errant Cuffs',
        Ring1 = 'astral ring',
        Ring2 = 'Tamas ring',
        Back = 'Rainbow Cape',
        Waist = 'Hierarch belt',
        Legs = 'Warlock\'s Tights',
		Feet = 'Dls. Boots +1',
    },
	['Movement'] = {
		Legs = 'Blood Cuisses',
	},
	['AutoRefresh'] = {
        head = 'Dls. Chapeau +1',
		--Body = 'Vermillion Cloak',
    },
	['FastCast'] = {
        Head = 'Warlock\'s Chapeau',
        Body = 'Duelist\'s Tabard',
		Ear2 = 'Loquac. Earring',
		Waist = 'Duelist\'s Belt',
    },
	['SneakInvis'] = {
        Hands = 'Dream Mittens +1',
		Feet = 'Dream Boots +1',
    },
	['MPSet'] = {
		Ammo = 'Hedgehog Bomb',
		Head = 'Zenith Crown',
        Neck = 'Star Necklace',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Zenith Mitts',
        Ring1 = 'astral ring',
        Ring2 = 'Tamas ring',
        Back = 'Rainbow Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Zenith Slacks',
		Feet = 'Zenith Pumps',
    },
	['VorpalBlade'] = {
        Head = 'Optical hat',
        Body = 'Assault Jerkin',
		Hands = 'Custom M Gloves',
		Waist = 'Life Belt',
		Legs = 'Warlock\'s Tights',
		Feet = 'Dls. Boots +1',
		ring1 = 'Sniper\'s Ring',
		ring2 = 'Sniper\'s ring',
    },
};
local ElementalStaffTable = {
    ['Earth']   = 'Terra\'s Staff',
	['Water']   = 'Water Staff',
	['Wind']    = 'Auster\'s Staff',
	['Fire']    = 'Vulcan\'s Staff',
    ['Ice']     = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light']   = 'Apollo\'s Staff',
    ['Dark']    = 'Dark Staff'
};
profile.Sets = sets;

profile.Packer = {};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	Extras.Initialize();
	Emotes.Initialize();
	RedMage.Initialize();
	AshitaCore:GetChatManager():QueueCommand(1, '/lac lockstyle Glam');
	
	--> Change to default macro book and macro set
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 5');
    --> Change macro set based on subjob
    if (gData.GetPlayer().SubJob == 'WHM') or (gData.GetPlayer().SubJob == 'BLM') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 0');
    elseif (gData.GetPlayer().SubJob == 'NIN') then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    end
end

profile.OnUnload = function()
	Extras.Unload();
	Emotes.Unload();
	RedMage.Unload();
end

profile.HandleCommand = function(args)
	Extras.HandleCommands(args);
	Emotes.HandleCommands(args);
	RedMage.HandleCommands(args);
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	local game = gData.GetEnvironment();
	
	if (game.Area ~= nil) and (Extras.Towns:contains(game.Area)) then
			gFunc.EquipSet('TownGear');
	else
	
		if (player.Status == 'Resting') then
			gFunc.Equip('Main', "Dark Staff");
			gFunc.Equip('Body', "Errant Hpl.");
		
		elseif (RedMage.Settings.MPSET == true) and (player.MP > RedMage.Settings.MPThreshold) then
			gFunc.EquipSet(sets.MPSet);
			
		elseif (RedMage.Settings.MDT == true) then
			gFunc.EquipSet(sets.MDT);
			
		elseif (RedMage.Settings.PDT == true) then
			gFunc.EquipSet(sets.PDT);
			
		else
			if (player.SubJob == "NIN") then
				gFunc.EquipSet(sets.Idle_NIN);
			else
				gFunc.EquipSet(sets.Idle);
			end

			if (player.Status == 'Engaged') then
				if (player.SubJob == "NIN") then
					if (player.HPP < 75) then
						gFunc.EquipSet(sets.Melee_EVA);
					else
						gFunc.EquipSet(sets.Melee_NIN);
					end
				else
					gFunc.EquipSet(sets.Melee);
				end
			elseif (player.Status == 'Resting') then
				gFunc.EquipSet(sets.Resting);
			elseif (player.IsMoving == true) then
				if (player.Status ~= 'Engaged') then
					gFunc.EquipSet(sets.Movement);
				end
			else
				if (player.MPP <= 90) then
					gFunc.EquipSet(sets.AutoRefresh);
				else
					if (player.SubJob == "NIN") then
						gFunc.EquipSet(sets.Idle_NIN);
					else
						gFunc.EquipSet(sets.Idle);
					end
				end
			end
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	RedMage.CheckCancels();
end

profile.HandlePrecast = function()
	local player = gData.GetPlayer();
    local action = gData.GetAction();
	local spell = gData.GetAction();
	
	if (RedMage.Settings.MPSET == true) and (player.MP > RedMage.Settings.MPThreshold) then
		gFunc.EquipSet(sets.MPSet);
		    
	else
		--gFunc.LockSet(sets.FastCast, 1);
		gFunc.ForceEquipSet(sets.FastCast);
		gFunc.EquipSet(sets.FastCast);
		gFunc.EquipSet(sets.FastCast);
	end
	
	if (spell.Name == 'Sneak') or (spell.Name == 'Invisible') then
		gFunc.EquipSet(sets.SneakInvis);
	end
	
	if (player.Status ~= 'Engaged') then
		gFunc.Equip('main', ElementalStaffTable[action.Element]);
	end
	
	RedMage.CheckCancels();
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local player = gData.GetPlayer();
	
	
	
	if (RedMage.Settings.MPSET == true) and (player.MP > RedMage.Settings.MPThreshold) then
		gFunc.EquipSet(sets.MPSet);
	else
	
		if (spell.Skill == 'Enhancing Magic') then
			gFunc.EquipSet(sets.Enhancing);
			if (spell.Name == 'Blaze Spikes') or (spell.Name == 'Ice Spikes') or (spell.Name == 'Shock Spikes') then
				gFunc.Equip('legs', 'Warlock\'s Tights');
			elseif (spell.Name == 'Sneak') or (spell.Name == 'Invisible') then
				gFunc.EquipSet(sets.SneakInvis);
			end
			
		elseif (spell.Skill == 'Healing Magic') then
			gFunc.EquipSet(sets.Healing);
			
		elseif (spell.Skill == 'Elemental Magic') then
			gFunc.EquipSet(sets.Nuke);
			
		elseif (spell.Skill == 'Enfeebling Magic') then
			gFunc.EquipSet(sets.Enfeebling);
			
		elseif (spell.Skill == 'Ninjutsu') then
			gFunc.EquipSet(sets.FastCast);
		end
	end
end

profile.HandleWeaponskill = function()
	local canWS = Extras.CheckWsBailout();
	
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
		
		if string.match(ws.Name, 'Vorpal blade') then
            gFunc.EquipSet(sets.VorpalBlade)
		else
			gFunc.EquipSet(sets.Weaponskill)
		end
    end
end

return profile;