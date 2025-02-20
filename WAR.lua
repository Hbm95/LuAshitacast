local profile = {}

local fastCastValue = 0.02 -- 2% from gear

local sets = {
    Idle = {
	Range = '',
	Ammo = 'Bomb Core',
	Head = 'Darksteel Cap +1',
	Neck = 'Fortitude Torque',
	Ear1 = 'Merman\'s Earring',
	Ear2 = 'Merman\'s Earring',
	Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
	Main = 'Martial bhuj',
	Ammo = 'Bomb Core',
	Head = 'Panther mask',
	Neck = 'Fortitude Torque',
	Ear1 = 'Merman\'s Earring',
	Ear2 = 'Merman\'s Earring',
	Body = 'Haubergeon',
        Hands = 'Dusk gloves',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift belt',
        Legs = 'Barone Cosciales',
        Feet = 'Dusk Ledelsens'
    },
    Resting = {},
    Town = {},
    Movement = {
	Main = 'Martial bhuj',
	Range = '',
	Ammo = 'Bomb Core',
	Head = 'Darksteel Cap +1',
	Neck = 'Fortitude Torque',
	Ear1 = 'Bushinomimi',
	Ear2 = 'Brutal Earring',
	Body = 'Dst. Harness +1',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bloodbead Ring',
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',},

    DT = {
	Main = 'Martial bhuj',
	Range = '',
	Ammo = 'Bomb Core',
	Head = 'Darksteel Cap +1',
	Neck = 'Fortitude Torque',
	Ear1 = 'Bushinomimi',
	Ear2 = 'Brutal Earring',
	Body = 'Dst. Harness +1',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bloodbead Ring',
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    MDT = {
	Main = 'Martial bhuj',
	Range = '',
	Ammo = 'Hedgehog Bomb',
	Head = 'Coral Visor +1',
	Neck = 'Fortitude Torque',
	Ear1 = 'Merman\'s Earring',
	Ear2 = 'Merman\'s Earring',
	Body = 'Coral scail mail',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Resentment Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Coral Cuisses +1',
        Feet = 'Coral Greaves +1', -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
	Ear1 = 'Loquac. Earring',
    },
    SIRD = {
	Head = 'Darksteel Cap +1',
	Neck = 'Evasion Torque',
	Ear1 = 'Loquac. Earring',
	Ear2 = 'Novia Earring',
	Body = 'Dst. Harness +1',
	Hands = 'Heavy Gauntlets',
	Ring1 = 'Jelly Ring',
	Ring2 = 'Breeze Ring',
	Back = 'Boxer\'s Mantle',
	Waist = 'Warwolf Belt',
	Legs = 'Dst. Subligar +1',
	Feet = 'Dst. Leggings +1',
    },
    Haste = {
	Head = 'Panther mask',
	Ear1 = 'Loquac. Earring',
	Hands = 'Dusk gloves',
	Ring1 = 'Sniper\'s Ring',
	Waist = 'Swift belt',
	Legs = 'Byakko\'s Haidate',
	Feet = 'Dusk Ledelsens',  -- Used for Utsusemi cooldown
    },
    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
	Main = 'Martial bhuj',
	Ammo = 'Bomb Core',
	Head = 'Optical hat',
	Neck = 'Peacock Amulet',
	Ear1 = 'Bushinomimi',
	Ear2 = 'Brutal Earring',
	Body = 'Haubergeon',
        Hands = 'Dusk gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',},
    TP_HighAcc = {
	Main = 'Martial bhuj',
	Ammo = 'Bomb Core',
	Head = 'Panther mask',
	Neck = 'Peacock Amulet',
	Ear1 = 'Bushinomimi',
	Ear2 = 'Brutal Earring',
	Body = 'Haubergeon',
        Hands = 'Dusk gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },

    TP_Aggressor = {},

    WS = {	
	Main = 'Martial bhuj',
	Range = '',
	Ammo = 'Bomb Core',
	Head = 'Optical hat',
	Neck = 'Peacock amulet',
	Ear1 = 'Bushinomimi',
	Ear2 = 'Brutal Earring',
	Body = 'Hecatomb Harness',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Flame Ring',
        Ring2 = 'Sniper\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Barone Cosciales',
        Feet = 'Fighter\'s Calligae',
    },
    WS_SteelCyclone = {        
        Neck = 'Breeze Gorget',
    },
    Warcry = {
	Head = 'Warrior\'s Mask',
	Neck = 'Harmonia\'s Torque',
	Ear1 = 'Hades Earring +1',
	Ear2 = 'Hades Earring +1',
	Body = 'Fighter\'s Lorica',
	Hands = 'Fighter\'s Mufflers',
	Ring1 = 'Hercules\' Ring',
	Ring2 = 'Bloodbead Ring',
	Back = 'Resentment Cape',
	Waist = 'Warwolf Belt',
	Legs = 'Warrior\'s Cuisses',
	Feet = 'Hydra Sollerets',
    },
    Provoke = {
	Head = 'Hydra Salade',
	Neck = 'Harmonia\'s Torque',
	Ear1 = 'Hades Earring +1',
	Ear2 = 'Hades Earring +1',
	Body = 'Fighter\'s Lorica',
	Hands = 'Fighter\'s Mufflers',
	Ring1 = 'Hercules\' Ring',
	Ring2 = 'Bloodbead Ring',
	Back = 'Resentment Cape',
	Waist = 'Warwolf Belt',
	Legs = 'Warrior\'s Cuisses',
	Feet = 'Hydra Sollerets',
    },

    DW = {
        Ear1 = 'Stealth Earring',
	Ear2 = 'Brutal Earring',
    },
    SAM = {
        Ear1 = 'Bushinomimi',
	Ear2 = 'Brutal Earring',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 5')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Warcry') then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
    -- You may add logic here
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    local action = gData.GetAction()
    if (action.Name == 'Steel Cyclone') then
        gFunc.EquipSet(sets.WS_SteelCyclone)
end
    -- You may add logic here
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'dw'})
    gcdisplay.CreateToggle('DW', false)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'dw'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'dw') then
        gcdisplay.AdvanceToggle('DW')
        gcinclude.Message('DW', gcdisplay.GetToggle('DW'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.SubJob == 'SAM') then
        gFunc.EquipSet(sets.SAM)
    end
    if (gcdisplay.GetToggle('DW') and player.Status == 'Engaged') then
        gFunc.EquipSet(sets.DW)
    end

    local aggressor = gData.GetBuffCount('Aggressor')
    if (aggressor == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Aggressor)
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
    -- You may add logic here
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
    -- You may add logic here
end

return profile
