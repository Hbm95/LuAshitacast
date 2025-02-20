local profile = {};

local function SetLockStyle()
	AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 200');
end
	
local ElementalStaffTable = {
	--NQ Staffs
    ['Fire'] = 'vulcan\'s Staff',
    ['Earth'] = 'terra\'s Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'auster\'s Staff',
    --['Ice'] = 'Ice Staff',
    --['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Apollo\'s Staff',
	--['Dark'] = 'Dark Staff'
	--HQ Staffs
    --['Fire'] = 'Vulcan\'s Staff',
    --['Earth'] = 'Terra\'s Staff',
    --['Water'] = 'Neptune\'s Staff',
    --['Wind'] = 'Auster's Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Thunder staff',
    --['Light'] = 'Apollo\'s Staff',
    ['Dark'] = 'Dark staff'
};

local sets = {
	
	--2024/04/04
    Resting_Priority = {
		--Main = {'Dark Staff'}, 
        Main = {'dark Staff'}, 
		--Sub =  {''}, 
        --Ammo = {''}, 
		Head = {'Hlr. Cap +1'},
        Body = {'Hlr. Bliaut +1', 'Noble\'s Tunic', 'Seer\'s Tunic'}, 
        Legs = {'Baron\'s Slops'},  
        Feet = {'Hlr. Duckbills +1'}, 
		Neck = {'Checkered Scarf'}, 
        Back = {'Wizard\'s Mantle'}, 
        Waist = {'Hierarch Belt'}, 
        Ear1 = {'Magnetic Earring'}, 
        Ear2 = {'Relaxing Earring'}, 
		--Ring1 = {''}, 
        --Ring2 = {''}, 
    },
		
	FastCast_Priority = {
        Feet = {'Rostrum Pumps'}, 
		Ear2 = {'Loquacious Earring'}, 
	},
	
	FastCure_Priority = {
		Main = {'Rucke\'s Rung'};
        Feet = {'Cure Clogs'}, 
		Ear2 = {'Loquacious Earring'}, 
	},
	
    Cure_Priority = {
        Main = {'apollo\'s Staff'}, 
		--Sub =  {''}, 
        --Ammo = {''}, 
        Head = {'Nashira Turban', 'Healer\'s Cap'},  
		--Body = {'Noble\'s Tunic', 'Ryl.Sqr. Robe +1'}, 
        Body = {'Blessed Bliaut', 'Ryl.Sqr. Robe +1'},
        Hands ={'Blessed Mitts', 'Seer\'s Mitts +1'}, 
        Legs = {'Blessed Trousers'}, 
        Feet = {'Hlr. Duckbills +1', 'Seer\'s Pumps +1'}, 
        Neck = {'Ajari Necklace'}, 
        Back = {'Peace Cape +1', 'Red Cape +1'}, 
        Waist = {'Penitent\'s Rope', 'Mrc.Cpt. Belt'}, 
        Ear1 = {'Magnetic Earring'},
        Ear2 = {'Geist Earring'}, 
		Ring1 = {'Tamas Ring'}, 
        Ring2 = {'Kshama Ring No.9'}, 
     },
	
	 DebuffMND_Priority = {
		--Main = {'Light Staff'}, 
		--Sub =  {''}, 
        --Ammo = {''}, 
        Head = {'Nashira Turban', 'Hlr Cap +1'}, 
		Body = {'Hlr. Bliaut +1', 'Ryl.Sqr. Robe +1'}, 
        Hands ={'Blessed Mitts', 'Seer\'s Mitts +1'}, 		--Cleric's Mitts
        Legs = {'Errant Slops'},
        Feet = {'Rostrum Pumps', 'Seer\'s Pumps +1'}, 
        Neck = {'Enfeebling Torque'}, 
        Back = {'Altruistic Cape', 'Red Cape +1'}, 
        Waist = {'Penitent\'s Rope', 'Mrc.Cpt. Belt'},
		Ear1 = {'Magnetic Earring','Geist Earring'},
        Ear2 = {'Geist Earring'}, 
		Ring1 = {'Tamas Ring'}, 
        Ring2 = {'Kshama Ring No.9'}, 
	},

    DebuffINT_Priority = {
		--Main = {''}, 
		--Sub =  {''}, 
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'}, 
        Head = {'Nashira Turban', 'Seer\'s Crown +1'}, 
        Body = {'Hlr. Bliaut +1', 'Ryl.Sqr. Robe +1'}, 
        Hands = {'Errant Cuffs', 'Seer\'s Mitts +1'}, 		--Cleric's Mitts
        Legs = {'Errant Slops', 'Seer\'s Slacks'}, 
		Feet = {'Hlr. Duckbills +1'}, 
		Neck = {'Enfeebling Torque'},  
        Back = {'Altruistic Cape', 'Red Cape +1'}, 
        Waist = {'Penitent\'s Rope', 'Mrc.Cpt. Belt'}, 
        Ear1 = {'Magnetic Earring', 'Cunning Earring'}, 
        Ear2 = {'Cunning Earring'}, 
        Ring1 = {'Tamas Ring'}, 
        Ring2 = {'Eremite\'s Ring'}, 
    },
	
	Divine_Priority = {
        Main = {'apollo\'s Staff'}, 
        --Sub =  {''}, 
        --Ammo = {''}, 
		Head = {'Hlr. Cap +1'},
        Body = {'Errant Hpl.', 'Ryl.Sqr. Robe +1'},
        Hands = {'Blessed Mitts'}, 
        Legs = {'Errant Slops'}, 
        Feet = {'Rostrum Pumps', 'Seer\'s Pumps +1'}, 
		Neck = {'Ajari Necklace'},
        Back = {'Altruistic Cape'}, 
        Waist = {'Penitent\'s Rope', 'Mrc.Cpt. Belt'}, 
		Ear1 = {'Magnetic Earring','Geist Earring'},
        Ear2 = {'Geist Earring'}, 
        Ring1 = {'Tamas Ring'}, 
        Ring2 = {'Kshama Ring No.9'}, 
    },
	
    Regen_Priority = {
        Main = {'Rucke\'s Rung'}, 
    },
	
	Enhancing_Priority = {
        --Main = {''}, 
		--Sub =  {''}, 
        --Ammo = {''}, 
		Head = {'Hlr. Cap +1'},
        Body = {'Blessed Bliaut'},
		Hands = {'Blessed Mitts'}, 
        Legs = {'Cleric\'s Pantaln.'},
        Feet = {'Rostrum Pumps', 'Seer\'s Pumps +1'}, 
		Neck = {'Enhancing Torque'},
        Back = {'Red Cape +1'}, 
        Waist = {'Penitent\'s Rope', 'Mrc.Cpt. Belt'}, 
		Ear1 = {'Geist Earring'},
        Ear2 = {'Geist Earring'}, 
        Ring1 = {'Tamas Ring'}, 
        Ring2 = {'Kshama Ring No.9'}, 
    },
    
   
	Devotion_Priority = {
        Ring1 = {'Bomb Queen Ring'},
    },
	
    Idle_Priority = {
		Main = {'Terra\'s Staff'}, 
		--Sub =  {''}, 
        --Ammo = {''}, 
		--Head = {''}, 
		Body = {'Noble\'s Tunic'},  
        --Hands = {''}, 
        --Legs = {''}, 
		--Feet = {''},
        --Neck = {''}, 
        Back = {'Cheviot Cape'}, 
		--Waist = {''}, 
        --Ear1 = {''}, 
        --Ear2 = {''}, 
        --Ring1 = {''}, 
        Ring2 = {'Jelly Ring'},		
    },
	
    Sneakinvis_Priority = {
        Hands = {'Dream Mittens +1'},
        Feet = {'Dream Boots +1'},	
		Back = {'Skulker\'s Cape'}, 
    },
};

local Settings = { 
	AllowAddSet = true,
    UseRefreshIdle = true,
    CurrentLevel = 0, --used in profile.HandleDefault
};

profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	SetLockStyle:once(5); --delay is in seconds
end

profile.OnUnload = function()
end

profile.HandleDefault = function()

-- Automate gear by level sync

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
	local player = gData.GetPlayer();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
	end
	
--Disable slots if warp item equiped

	local varequipment = gData.GetEquipment(); -- Gets current equipment
	local usableequipment = T{ 'Treat Staff II', 'Warp Cudgel', 'Dream Mittens +1', 'Dream Boots +1', 'Altep Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Yhoat Ring', 'Vahzl Ring', 'Emperor Band', 'Emperess Band', 'Chariot Band', 'Reraise Hairpin'};	
	
--aketon city equip information
	
	local zone = gData.GetEnvironment('Area');
	local towns = T{
		'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau',
		'Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]',
		'San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship',
		'Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille',
		'Bastok Mines','Bastok Markets','Port Bastok','Metalworks',
		'Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower',
		'Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno',
		'Rabao','Selbina','Mhaura','Kazham','Norg',
		'Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin' }

--	Main HandleDefault loop
	if (varequipment.Main ~= nil) and (usableequipment:contains(varequipment.Main.Name)) then
	elseif (varequipment.Head ~= nil) and (usableequipment:contains(varequipment.Head.Name)) then
	elseif (varequipment.Ring1 ~= nil) and (usableequipment:contains(varequipment.Ring1.Name)) then
	elseif (varequipment.Ring2 ~= nil) and (usableequipment:contains(varequipment.Ring2.Name)) then
	elseif  (player.Status == 'Engaged') then
		gFunc.EquipSet(sets.Engaged);
	elseif (player.Status == 'Resting') then
		gFunc.EquipSet(sets.Resting);
	elseif (towns:contains(zone.Area)) then
		gFunc.Equip('Body', 'Ducal Aketon');
	else
        gFunc.EquipSet(sets.Idle);
    end
end

profile.HandleAbility = function()
	local playeraction = gData.GetAction()
	if (playeraction.Name == 'Devotion') then
		gFunc.EquipSet(sets.Devotion);
	end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();	

	if string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
        gFunc.EquipSet(sets.FastCure);
	else
		gFunc.EquipSet(sets.FastCast);
	end
end


profile.HandleMidcast = function()
	local MndDebuffs = T{ 'Paralyze', 'Slow', 'Silence' };
    local Sneakinvis = T{ 'Sneak', 'Invisible' };
    local action = gData.GetAction();	
	local player = gData.GetPlayer();
	
	if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.DebuffMND);
			gFunc.Equip('main', ElementalStaffTable[action.Element]);
        else
            gFunc.EquipSet(sets.DebuffINT);
			gFunc.Equip('main', ElementalStaffTable[action.Element]);
        end
	elseif (action.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Divine);
		gFunc.Equip('main', ElementalStaffTable[action.Element]);
	elseif (Sneakinvis:contains(action.Name)) then
            gFunc.EquipSet(sets.Sneakinvis);
	elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
		gFunc.Equip('main', ElementalStaffTable[action.Element]);
	elseif string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
        gFunc.EquipSet(sets.Cure);
	elseif string.match(action.Name, 'Regen') then
        gFunc.EquipSet(sets.Regen);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;