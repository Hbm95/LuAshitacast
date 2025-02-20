local profile = {};
Extras = gFunc.LoadFile('includes\\Extras.lua');
Emotes = gFunc.LoadFile('includes\\Emotes.lua');
Beastmaster = gFunc.LoadFile('includes\\Beastmaster.lua');

local sets = {
	['Glam'] = {
		Head = 'Cumulus Masque',
		--Head = 'Rabbit Cap',
        Body = 'Kirin\'s Osode',
        Hands = 'Monster Gloves',
        Legs = 'Ryl.Kgt. Breeches',
		Feet = 'Monster Gaiters',
	},
	['TownGear'] = {
		Body = 'Ducal Aketon',
	},
    ['Idle'] = {
		Head = 'Emperor hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s bracelets',
        Ring1 = 'Sniper\'s ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
		Feet = 'Beast gaiters',
    },
	['Melee'] = {
		Main = 'Octave Club',
		Sub = 'Darksteel Buckler',
        Head = 'Emperor hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s bracelets',
        Ring1 = 'Sniper\'s ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
		Feet = 'Beast gaiters',
    },
	['Melee_NIN'] = {
		Main = 'Tungi',
		Sub = 'Octave Club',
        Head = 'Emperor hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s bracelets',
        Ring1 = 'Sniper\'s ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
		Feet = 'Beast gaiters',
    },
	['Evasion'] = {
        Head = 'Optical Hat',
        Ear1 = 'Novia Earring',
        Ear2 = 'Dodge Earring',
        Body = 'Scorpion Harness',
        Hands = 'Beast Gloves',
        Back = 'Traveler\'s Mantle',
        Legs = 'Ryl.Kgt. Breeches',
		Feet = 'Beast Gaiters',
    },
	['WeaponSkill'] = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Pallas\'s bracelets',
        Ring1 = 'Sniper\'s ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Ryl.Kgt. Breeches',
		Feet = 'Beast gaiters',
    },
	['Charm'] = {
		Main = 'Apollo\'s Staff',
        Head = 'Beast Helm',
        Neck = 'Star Necklace',
        Ear1 = 'Novia Earring',
        Ear2 = 'Dodge Earring',
        Body = 'Beast Jackcoat',
        Hands = 'Beast Gloves',
        Back = 'Traveler\'s Mantle',
        Legs = 'Beast Trousers',
		Feet = 'Beast Gaiters',
    },
	['Tame'] = {
        Head = 'Beast Helm',
        Neck = 'Star Necklace',
		Body = 'Monster Jackcoat',
    },
	['CallBeast'] = {
		Hands = 'Monster Gloves',
    },
	['Reward'] = {
        Body = 'Beast Jackcoat',
		Feet = 'Beast Gaiters',
    },
	['Resting'] = {
        Legs = 'Monster Trousers',
    },
	['Zeta'] = { ammo = 'Pet Food Zeta',},
	['Epsilon'] = { ammo = 'Pet Fd. Epsilon',},
	['Delta'] = {ammo = 'Pet Food Delta',},
	['Gamma'] = {ammo = 'Pet Food Gamma',},
	['Beta'] = {ammo = 'Pet Food Beta',},
	['Alpha'] = {ammo = 'Pet Food Alpha',},
    ['Cap60'] = {
        Main = 'Tungi Axe',
        Sub = 'Darksteel Axe',
        Head = 'Walkure Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Fang Earring',
        Ear2 = 'Fang Earring',
        Body = 'Scorpion Harness',
        Hands = 'Beast Gloves',
        Ring1 = 'Sniper\'s ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Beast Trousers',
        Feet = 'Beast Gaiters',
    },
	['FastCast'] = {
		Ear1 = 'Magnetic Earring',
		Ear2 = 'Loquac. Earring',
		Body = 'Kirin\'s Osode',
	},
};

profile.Sets = sets;

profile.Packer = {};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	Extras.Initialize();
	Emotes.Initialize();
	Beastmaster.Initialize();
	AshitaCore:GetChatManager():QueueCommand(-1, '/lac lockstyle Glam');
	
	--> Change to default macro book and macro set
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 9');
end

profile.OnUnload = function()
	Extras.Unload();
	Emotes.Unload();
	Beastmaster.Unload();
end

profile.HandleCommand = function(args)
	Extras.HandleCommands(args);
	Emotes.HandleCommands(args);
	Beastmaster.HandleCommands(args);
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	local game = gData.GetEnvironment();
	
	if (player.MainJobSync == 60) then
		gFunc.EquipSet("Cap60");
	else
		---------------
		-- Town Gear --
		---------------
		if (game.Area ~= nil) and (Extras.Towns:contains(game.Area)) then
			gFunc.EquipSet('TownGear');
	
		elseif (player.Status == 'Engaged') then
			if (player.HPP <= 60) then --Change this percentage to equip your OH SHIT Evasion Set.
				if (game.Time < 6.00) and (game.Time > 18.00) then
					gFunc.EquipSet(sets.Night_Evasion);
				else
					gFunc.EquipSet(sets.Evasion);
				end
			elseif (player.SubJob == "NIN") then
				gFunc.EquipSet(sets.Melee_NIN);
			else
				gFunc.EquipSet(sets.Melee);
			end
		elseif (player.Status == 'Resting') then
			if (player.SubJob == "WHM") then
				gFunc.EquipSet(sets.Resting);
				gFunc.Equip('Main', 'Dark Staff');
			else
				gFunc.EquipSet(sets.Resting);
			end
		else
			if (player.SubJob == "WHM") then
				gFunc.EquipSet(sets.Idle);
				gFunc.Equip('Ring2', 'Serket Ring');
			else
				gFunc.EquipSet(sets.Idle);
			end
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	
	if string.match(ability.Name, 'Charm') then
		gFunc.EquipSet(sets.Charm);
	elseif string.match(ability.Name, 'Reward') then
		gFunc.EquipSet(sets.Reward);
	elseif string.match(ability.Name, 'Tame') then
		gFunc.EquipSet(sets.Tame);
	elseif string.match(ability.Name, 'Call Beast') then
		gFunc.EquipSet(sets.CallBeast);
	end
end

profile.HandleItem = function()
	
end

profile.HandlePrecast = function()
	gFunc.EquipSet("FastCast");
end

profile.HandleMidcast = function()

end

profile.HandlePreshot = function()
	
end

profile.HandleMidshot = function()
	
end

profile.HandleWeaponskill = function()
	local canWS = Extras.CheckWsBailout();
	
    if (canWS == false) then gFunc.CancelAction() return;
    else
		-----------------------------------------------------------
		--You can use this to make sets for specific Weaponskills--
		-----------------------------------------------------------
		--if string.match(ws.Name, 'Rampage') then
        --    gFunc.EquipSet(sets.Rampage);
		--end
		-----------------------------------------------------------
		--or Just use a Standard WS Set:
        local ws = gData.GetAction();
		gFunc.EquipSet(sets.Weaponskill);
    end
end

return profile;