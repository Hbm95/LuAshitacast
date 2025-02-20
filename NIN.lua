local profile = {};
Extras = gFunc.LoadFile('includes\\Extras.lua');
Emotes = gFunc.LoadFile('includes\\Emotes.lua');
Ninja = gFunc.LoadFile('includes\\Ninja.lua');

local sets = {
	['Glam'] = {
       main = 'Terra\'s Staff',
	   Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Minuet Earring',
        Body = 'Ducal Aketon',
        Hands = 'Ninja tekko',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Ninja Kyahan',
	},
    ['Idle'] = {
        main = 'Terra\'s Staff',
		Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Gold earring +1',
        Ear2 = 'Silver earring +1',
        Body = 'Scorpion harness +1',
        Hands = 'Arhat\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Ninja Kyahan',
    },
	['Movement'] = {
		Feet = 'Ninja Kyahan',
	},
	['Tank'] = {
       main = 'Terra\'s Staff',
	   Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Gold Earring',
        Ear2 = 'Silver Earring +1',
        Body = 'Scorpion Harness',
        Hands = 'Arhat\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Custom M Boots',
    },
	['Tank_Night'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Dodge Earring',
        Body = 'Scorpion Harness',
        Hands = 'Arhat\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Ninja Hakama',
        Feet = 'Custom M Boots',
    },
    ['Tank_Kite'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Dodge Earring',
        Body = 'Scorpion Harness',
        Hands = 'Horomusha Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Custom M Boots',
    },    
	['Tank_Evasion'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Suppanomimi',
        Ear2 = 'Dodge Earring',
        Body = 'Scorpion Harness',
        Hands = 'Arhhat\'s Kote',
        Ring1 = 'Sniper\' Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Custom M Boots',
    },
	['Tank_Enmity'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Dodge Earring',
        Body = 'Scorpion Harness',
        Hands = 'Arhat\'s Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Custom M Boots',
    },
	['Tank_Haste'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Dodge Earring',
        Body = 'Scorpion Harness',
        Hands = 'Dusk Gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Custom M Boots',
    },
    
	['Melee_Night'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Minuet Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Custom M Boots',
    },
	['Melee_TP'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Minuet Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Custom M Boots',
    },
	['Melee_Haste'] = {
        Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Minuet Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Custom M Boots',
    },
    ['Nuke'] = {
	    Head = 'Ninja Hatsuburi',
		Ring1 = 'Tamas Ring', 		
        Ring2 = 'Wisdom Ring',
        Ear1 = 'Moldavite earring',
        Ear2 = 'Morion earring',
        Hands = '',
        Legs = 'Ninja Hakama',
        Feet = 'Custom M boots',
        Back = '',
        Waist = '', 	    
	},
	['Resting'] = {
		
    },
	['Blade_Jin'] = {
		Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Minuet Earring',
        Body = 'Haubergeon',
        Hands = 'Horomusha Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Alumine Sollerets',
    },
	['Blade_Ten'] = {
		Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Minuet Earring',
        Body = 'Haubergeon',
        Hands = 'Horomusha Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Alumine Sollerets',
    },
	['Blade_Ku'] = {
		Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Minuet Earring',
        Body = 'Haubergeon',
        Hands = 'Horomusha Kote',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Alumine Sollerets',
    },
	['FastCast'] = {
		Ear2 = "Loquac. Earring",
	}
};

local ElementalStaffTable = {
    ['Earth']   = 'Terra\'s	Staff',
	['Water']   = 'Water Staff',
	['Wind']    = 'Auster\'s Staff',
	['Fire']    = 'Vulcan\'s Staff',
    ['Ice']     = 'Aquilo\'s Staff',
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
	Ninja.Initialize();
	AshitaCore:GetChatManager():QueueCommand(-1, '/lac lockstyle Glam'); --Automatically Apply Glamour Set
end

profile.OnUnload = function()
	Extras.Unload();
	Emotes.Unload();
	Ninja.Unload();
end

profile.HandleCommand = function(args)
	Extras.HandleCommands(args);
	Emotes.HandleCommands(args);
	Ninja.HandleCommands(args);
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	local game = gData.GetEnvironment();
	
	-------------
	--TANK MODE--
    -------------
    if (Ninja.Settings.TANK == true) or (Ninja.Settings.TANK == true) and (player.Status == 'Engaged') then
        if (game.Time < 6.00) and (game.Time > 18.00) then
            gFunc.EquipSet(sets.Tank_Night);
        elseif (game.Time > 6.00) and (game.Time < 1800) and (player.Status == 'Engaged') then
            gFunc.EquipSet(sets.Tank);
        elseif (Ninja.Settings.KITE == true) then
            gFunc.EquipSet(sets.Tank_Kite);
        else
            gFunc.EquipSet(sets.Idle);
        end
	------------
	--DD MODE--
	------------
elseif (Ninja.Settings.DD == true) or (Ninja.Settings.DD == true) and (player.Status == 'Engaged') then
    if (game.Time < 6.00) and (game.Time > 18.00) then
        gFunc.EquipSet(sets.Melee_Night);
    elseif (game.Time > 6.00) and (game.Time < 1800) and (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Melee_TP);
    elseif (game.Time < 6.00) and (game.Time > 18.00) and (player.IsMoving == true) then
        gFunc.EquipSet(sets.Movement);
    else
        gFunc.EquipSet(sets.Idle);
    end
	
	-----------------------
	--Player is in Combat--
	-----------------------
	elseif (player.Status == 'Engaged') then
			gFunc.EquipSet(sets.Melee_TP);
		
	---------------------
	--Player is Resting--
	---------------------
	elseif (player.Status == 'Resting') then
		gFunc.EquipSet(sets.Resting);
		
	--------------------
	--Player is Moving--
	--------------------
	elseif (player.IsMoving == true) and (game.Time < 6.00) and (game.Time > 18.00) then
		if (player.Status ~= 'Engaged') then
			gFunc.EquipSet(sets.Movement);
		end
		
	----------------------------------
	--Player is Idle / Out of Combat--
	----------------------------------
	elseif (player.Status == 'Idle') then
		gFunc.EquipSet(sets.Idle);
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	Ninja.CheckCancels();
end

profile.HandleItem = function()
	
end

profile.HandlePrecast = function()
	local player = gData.GetPlayer();
    local action = gData.GetAction();
	
	Extras.DoShadows(action);
	
	gFunc.ForceEquipSet("FastCast");
	
	if (player.Status ~= 'Engaged') then
		gFunc.Equip('main', ElementalStaffTable[action.Element]);
	end
	
	Ninja.CheckCancels();
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local player = gData.GetPlayer();

    if (spell.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Nuke);
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
		
		if string.match(ws.Name, 'Blade: Jin') then
			gFunc.EquipSet(sets.Blade_Jin);
		elseif string.match(ws.Name, 'Blade: Ten') then
			gFunc.EquipSet(sets.Blade_Ten);
		elseif string.match(ws.Name, 'Blade: Ku') then
			gFunc.EquipSet(sets.Blade_Ku);
		else
			gFunc.EquipSet(sets.Weaponskill); --If not specified, then use generic WS Set
		end
    end
end

return profile;