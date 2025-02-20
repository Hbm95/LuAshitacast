local profile = {};
local avatars = T{'Carbuncle', 'Titan', 'Leviathan', 'Garuda', 'Ifrit', 'Shiva', 'Ramuh', 'Fenrir', 'Diabolos'};
local elementals = T{'Light ELemental', 'Earth Elemental', 'Water Elemental', 'Air Elemental', 'Fire Elemental', 'Ice Elemental', 'Thunder Elemental', 'Dark Elemental'};

local sets = {
    ['summon'] = {
		Head = 'Austere hat',
        Neck = 'Smn. Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Morion Earring',
        Body = 'Austere Robe',
        Hands = 'Zenith mitts',
        Ring1 = 'Evoker\'s Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Rainbow Cape',
        Waist = 'Hierarch belt',
        Legs = 'Summoner\'s Spats',
        Feet = 'Summoner\'s pgch.',
    },
    ['cure'] = {
        Neck = 'Promise Badge',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Geist Earring',
        Body = 'Errant. Hpl.',
        Hands = 'Zenith mitts',
        Ring1 = 'Tamas Ring',
		Ring2 = 'Evoker\'s Ring',
        Back = 'Rainbow Cape',
        Waist = 'Hierarch belt',
        Legs = 'Errant Slops',
        Feet = 'Errant pigaches',
    },
	['rest'] = {
        Body = 'Errant Hpl.',
		waist = 'Hierarch belt',
		Head = 'Austere hat',
		Ring1 = 'Evoker\'s Ring',
		Ring2 = 'Tamas Ring',
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

profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
		
	if (player.Status == 'Resting') then
		gFunc.Equip('Main', "Dark Staff");
		gFunc.EquipSet(sets.rest)
	end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
	
    local action = gData.GetAction();
		gFunc.Equip('main', ElementalStaffTable[action.Element]);
    if (action.Skill == 'Summoning Magic') then
        if (avatars:contains(action.Name)) then
            gFunc.EquipSet(sets.summon);
		else
            gFunc.EquipSet(sets.summon);
		end
		gFunc.Equip('main', ElementalStaffTable[action.Element]);
	elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.cure);
	else
        gFunc.EquipSet(sets.summon);
	end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;