-- /checkparam <me>
local Extras = T{};
local Toggles = {};
local Cycles = {};

Extras.settings = {
	Messages = false; --set to true if you want chat log messages to appear on any /gc command used such as DT, TH, or KITE gear toggles, certain messages will always appear
	WScheck = true; --set to false if you dont want to use the WSdistance safety check
	WSdistance = 4.7; --default max distance (yalms) to allow non-ranged WS to go off at if the above WScheck is true
	DayNight = nil;
};

Extras.AliasList = T{'wsdistance', 'setcycle', 'sneak', 'invis', 'stats', 'timecheck'};
Extras.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden'};
Extras.LockingItems = T{'Warp Cudgel', 'Emperor Band', 'Empress Band', 'Chariot Band', 'Altep Ring', 'Dem Ring', 'Holla Ring', 'Mea Ring', 'Vahzl Ring'};
Extras.DistanceWS = T{'Flaming Arrow','Piercing Arrow','Dulling Arrow','Sidewinder','Blast Arrow','Arching Arrow','Empyreal Arrow','Refulgent Arrow','Apex Arrow','Namas Arrow','Jishnu\'s Randiance','Hot Shot','Split Shot','Sniper Shot','Slug Shot','Blast Shot','Heavy Shot','Detonator','Numbing Shot','Last Stand','Coronach','Wildfire','Trueflight','Leaden Salute','Myrkr','Dagan','Moonlight','Starlight','Mistral Axe'};
Extras.SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing'};
Extras.SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'};
Extras.SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'};
Extras.SmnHybrid = T{'Flaming Crush','Burning Strike'};
Extras.SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'};
Extras.BluMagPhys = T{'Foot Kick','Sprout Smack','Wild Oats','Power Attack','Queasyshroom','Battle Dance','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Dimensional Death','Spiral Spin','Death Scissors','Seedspray','Body Slam','Hydro Shot','Frenetic Rip','Spinal Cleave','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Whirl of Rage','Benthic Typhoon','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Bloodrake','Glutinous Dart','Paralyzing Triad','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'};
Extras.BluMagDebuff = T{'Filamented Hold','Cimicine Discharge','Demoralizing Roar','Venom Shell','Light of Penance','Sandspray','Auroral Drape','Frightful Roar','Enervation','Infrasonics','Lowing','CMain Wave','Awful Eye','Voracious Trunk','Sheep Song','Soporific','Yawn','Dream Flower','Chaotic Eye','Sound Blast','Blank Gaze','Stinking Gas','Geist Wall','Feather Tickle','Reaving Wind','Mortal Ray','Absolute Terror','Blistering Roar','Cruel Joke'};
Extras.BluMagStun = T{'Head Butt','Frypan','Tail Slap','Sub-zero Smash','Sudden Lunge'};
Extras.BluMagBuff = T{'Cocoon','Refueling','Feather Barrier','Memento Mori','Zephyr Mantle','Warm-Up','Amplification','Triumphant Roar','Saline Coat','Reactor Cool','Plasma Charge','Regeneration','Animating Wail','Battery Charge','Winds of Promy.','Barrier Tusk','Orcish Counterstance','Pyric Bulwark','Nat. Meditation','Restoral','Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
Extras.BluMagSkill = T{'Metallic Body','Diamondhide','Magic Barrier','Occultation','Atra. Libations'};
Extras.BluMagDiffus = T{'Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
Extras.BluMagCure = T{'Pollen','Healing Breeze','Wild Carrot','Magic Fruit','Plenilune Embrace'};
Extras.BluMagEnmity = T{'Actinic Burst','Exuviation','Fantod','Jettatura','Temporal Shift'};
Extras.BluMagTH = T{'Actinic Burst','Dream Flower','Subduction'};
Extras.Elements = T{'Thunder', 'Blizzard', 'Fire', 'Stone', 'Aero', 'Water', 'Light', 'Dark'};
Extras.NinNukes = T{'Katon: Ichi', 'Katon: Ni', 'Katon: San', 'Hyoton: Ichi', 'Hyoton: Ni', 'Hyoton: San', 'Huton: Ichi', 'Huton: Ni', 'Huton: San', 'Doton: Ichi', 'Doton: Ni', 'Doton: San', 'Raiton: Ichi', 'Raiton: Ni', 'Raiton: San', 'Suiton: Ichi', 'Suiton: Ni', 'Suiton: San'};

-----------------------------------
--        Alias Functions        --
-----------------------------------
function Extras.SetAlias()
	for _, v in ipairs(Extras.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Extras.ClearAlias()
	for _, v in ipairs(Extras.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(1, '/alias del /' .. v);
	end
end

-----------------------------------
--        Handle Commands        --
-----------------------------------
function Extras.HandleCommands(args)
	local game = gData.GetEnvironment();

	if not Extras.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'wsdistance') then
		if (tonumber(args[2])) then 
			Extras.settings.WScheck = true;
			Extras.settings.WSdistance = tonumber(args[2]);
			print(chat.header('Extras'):append(chat.message('WS Distance is on and set to ' .. Extras.settings.WSdistance)));
		else
			Extras.settings.WScheck = not Extras.settings.WScheck;
			print(chat.header('Extras'):append(chat.message('WS distance check is now ' .. tostring(Extras.settings.WScheck))));
			print(chat.header('Extras'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
		end
	elseif (args[1] == 'sneak') then
		Extras.DoSneak();
	elseif (args[1] == 'invis') then
		Extras.DoInvis();
	elseif (args[1] == 'stats') then
		AshitaCore:GetChatManager():QueueCommand(1, '/checkparam <me>');
	elseif (args[1] == 'timecheck') then
		print(game.Time);
	end
end

-----------------------------------
--        Ability Recasts        --
-----------------------------------
function Extras.CheckAbilityRecast(check)
	local RecastTime = 0;

	for x = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(x);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(x);

		if ((id ~= 0 or x == 0) and timer > 0) then
			local ability = AshitaCore:GetResourceManager():GetAbilityByTimerId(id);
			if ability == nil then return end
			if (ability.Name[1] == check) and (ability.Name[1] ~= 'Unknown') then
				RecastTime = timer;
			end
		end
	end

	return RecastTime;
end

-----------------------------------
--         Locking Items         --
-----------------------------------
function Extras.CheckLockingItems()
	local items = gData.GetEquipment();
	
	if (items.Main ~= nil) and (Extras.LockingItems:contains(items.Main.Name)) then
		local tempWeapon = items.Main.Name;
		AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ring1');
		gFunc.Equip('Main', tempWeapon);
	end
	
	if (items.Ring1 ~= nil) and (Extras.LockingItems:contains(items.Ring1.Name)) then
		local tempRing1 = items.Ring1.Name;
		gFunc.Equip('Ring1', tempRing1);
	end
	
	if (items.Ring2 ~= nil) and (Extras.LockingItems:contains(items.Ring2.Name)) then
		local tempRing2 = items.Ring2.Name;
		gFunc.Equip('Ring2', tempRing2);
	end
end

function Extras.CheckDefault()
	Extras.CheckLockingItems();
end


-----------------------------------
--      Weaponskill Bailout      --
-----------------------------------
function Extras.CheckWsBailout()
	local player = gData.GetPlayer();
	local ws = gData.GetAction();
	local target = gData.GetActionTarget();
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local amnesia = gData.GetBuffCount('Amnesia');
	local charm = gData.GetBuffCount('Charm');

	if Extras.settings.WScheck and not Extras.DistanceWS:contains(ws.Name) and (tonumber(target.Distance) > Extras.settings.WSdistance) then
		print(chat.header('Extras'):append(chat.message('Distance to mob is too far! Move closer or increase WS distance')));
		print(chat.header('Extras'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
		return false;
	elseif (player.TP <= 999) or (sleep+petrify+stun+terror+amnesia+charm >= 1) then
		return false;
	end
		
	return true;
end

-----------------------------------
--         Spell Bailouts        --
-----------------------------------
function Extras.CheckSpellBailout()
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local silence = gData.GetBuffCount('Silence');
	local charm = gData.GetBuffCount('Charm');

	if (sleep+petrify+stun+terror+silence+charm >= 1) then
		return false;
	else
		return true;
	end
end

----------------------------------------------------
--Ninjutsu Spell Tier Downcasting & Auto Canceling--
----------------------------------------------------
function Extras.DoShadows(spell)
	if spell.Name == 'Utsusemi: Ichi' then
		local delay = 3.2 --2.4
		if gData.GetBuffCount(66) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 66') end):once(delay)
		elseif gData.GetBuffCount(444) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 444') end):once(delay)
		elseif gData.GetBuffCount(445) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 445') end):once(delay)
		elseif gData.GetBuffCount(446) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 446') end):once(delay)
		end
	end

--	if spell.Name == 'Utsusemi: Ni' then
--		local delay = 0.5
--		if gData.GetBuffCount(66) == 1 then
--			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 66') end):once(delay)
--		elseif gData.GetBuffCount(444) == 1 then
--			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 444') end):once(delay)
--		elseif gData.GetBuffCount(445) == 1 then
--			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 445') end):once(delay)
--		elseif gData.GetBuffCount(446) == 1 then
--			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 446') end):once(delay)
--		end
--	end
end

----------------------------
-- Sneak / Invis Commands --
----------------------------
function Extras.DoSneak()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil)  or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sneak" <me>');
	elseif (target.Name ~= nil) and (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sneak" <t>');
	else
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sneak" <me>');
	end
end

function Extras.DoInvis()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil)  or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Invisible" <me>');
	elseif (target.Name ~= nil) and (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Invisible" <t>');
	else
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Invisible" <me>');
	end
end

-----------------------
-- Day / Night Check --
-----------------------
function Extras.DayNight(args)
	if (game.Time < 6.00) or (game.Time > 18.00) then
        Extras.settings.DayNight = 'Night';
	else
		Extras.settings.DayNight = 'Day';
	end
end

--------------------------
-- ConserveMP Reporting --
--------------------------
function Extras.DoConserveMPReporting()
    local player = gData.GetPlayer();
    local action = gData.GetAction();
    local mpcost = action.MpCost;
    local mpaftercast = action.MpAftercast;
    local mppaftercast = action.MppAftercast;
    local maxmp = player.MaxMP;
    local curmp = player.MP;
    local expectedresult;
    local actualresult;
    local mpsaved;
    
    expectedresult = curmp - mpaftercast;
    actualresult = maxmp - curmp;
    mpsaved = expectedresult - actualresult;
    
    if (expectedresult ~= actualresult) then
        AshitaCore:GetChatManager():QueueCommand(1, '/echo ConserveMP Saved you ' ..  mpsaved .. '/' .. mpcost .. 'MP!');
	end
end

-----------------------
-- Initialize Script --
-----------------------
function Extras.Initialize()
	Extras.SetAlias();
end

----------------------
--Unload Extras File--
----------------------
function Extras.Unload()
	Extras.ClearAlias();
end

return Extras;