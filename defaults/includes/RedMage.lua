local RedMage = T{};

RedMage.settings = {
	Toggle1 = false;
};

RedMage.AliasList = T{'stone','water','aero','fire','blizzard','thunder','Zz','refresh','haste','enstone','enwater','enaero','enfire','enblizzard','enthunder','mpset','eva'};

RedMage.Settings = T{
	MPSET = false;
	EVA = false;
	MPThreshold = 750;
};

function RedMage.SetKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/bind F11 /ToggleTest');
end

function RedMage.ClearKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/unbind F11 ');
end

function RedMage.SetAlias()
	for _, v in ipairs(RedMage.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(1, '/alias /' .. v .. ' /lac fwd ' .. v); --formerly: -1
	end
end

function RedMage.ClearAlias()
	for _, v in ipairs(RedMage.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(1, '/alias del /' .. v); --formerly: -1
	end
end

function RedMage.HandleCommands(args)
	if not RedMage.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'stone') then
		RedMage.DoStone();
	elseif (args[1] == 'water') then
		RedMage.DoWater();
	elseif (args[1] == 'aero') then
		RedMage.DoAero();
	elseif (args[1] == 'fire') then
		RedMage.DoFire();
	elseif (args[1] == 'blizzard') then
		RedMage.DoBlizzard();
	elseif (args[1] == 'thunder') then
		RedMage.DoThunder();
	elseif (args[1] == 'drain') then
		RedMage.DoDrain();
	elseif (args[1] == 'Zz') then
		RedMage.DoSleep();
	elseif (args[1] == 'refresh') then
		RedMage.DoRefresh();
	elseif (args[1] == 'haste') then
		RedMage.DoHaste();	
	elseif (args[1] == 'enstone') then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "EnStone" <me>');
	elseif (args[1] == 'enwater') then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "EnWater" <me>');
	elseif (args[1] == 'enaero') then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "EnAero" <me>');
	elseif (args[1] == 'enfire') then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "EnFire" <me>');
	elseif (args[1] == 'enblizzard') then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "EnBlizzard" <me>');
	elseif (args[1] == 'enthunder') then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "EnThunder" <me>');
	elseif (args[1] == 'mpset') then
		if (RedMage.Settings.MPSET == true) then 
			RedMage.Settings.MPSET = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Deactivated...');
		else
			RedMage.Settings.MPSET = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Activated!');
		end
	elseif (args[1] == 'eva') then
		if (RedMage.Settings.EVA == true) then
			RedMage.Settings.EVA = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode De-Activated...');
		else
			RedMage.Settings.MPSET = false;
			RedMage.Settings.EVA = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode Activated!');
		end
	end
end

function RedMage.DoToggleTest()
	if (RedMage.settings.Toggle1 == false) then
		RedMage.settings.Toggle1 = true;
		AshitaCore:GetChatManager():QueueCommand(1, '/echo Toggle1 is now Enabled!');
		
	elseif (RedMage.settings.Toggle1 == true) then
		RedMage.settings.Toggle1 = false;
		AshitaCore:GetChatManager():QueueCommand(1, '/echo Toggle1 is now Disabled!');
	end
end


function RedMage.CheckAbilityRecast(check)
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

------------------------------------
--Elemental Spell Tier Downcasting--
------------------------------------
function RedMage.DoStone()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(159); --Stone
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(160); --Stone2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(161); --Stone3
	
	if (party:GetMemberMP(0) >= 92) and (player:GetMainJobLevel() >= 65) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	elseif (party:GetMemberMP(0) >= 43) and (player:GetMainJobLevel() >= 35) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	elseif (party:GetMemberMP(0) >= 9) and (player:GetMainJobLevel() >= 4) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	else
		return;
	end
end

function RedMage.DoWater()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(169); --Water
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(170); --Water2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(171); --Water3
	
	if (party:GetMemberMP(0) >= 98) and (player:GetMainJobLevel() >= 67) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	elseif (party:GetMemberMP(0) >= 51) and (player:GetMainJobLevel() >= 40) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	elseif (party:GetMemberMP(0) >= 13) and (player:GetMainJobLevel() >= 9) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	else
		return;
	end
end

function RedMage.DoAero()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(154); --Aero
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(155); --Aero2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(156); --Aero3
	
	if (party:GetMemberMP(0) >= 105) and (player:GetMainJobLevel() >= 69) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	elseif (party:GetMemberMP(0) >= 59) and (player:GetMainJobLevel() >= 45) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	elseif (party:GetMemberMP(0) >= 18) and (player:GetMainJobLevel() >= 14) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	else
		return;
	end
end

function RedMage.DoFire()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(144); --Fire
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(145); --Fire2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(146); --Fire3
	
	if (party:GetMemberMP(0) >= 113) and (player:GetMainJobLevel() >= 71) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	elseif (party:GetMemberMP(0) >= 68) and (player:GetMainJobLevel() >= 50) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	elseif (party:GetMemberMP(0) >= 24) and (player:GetMainJobLevel() >= 19) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	else
		return;
	end
end

function RedMage.DoBlizzard()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(149); --Blizzard
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(150); --Blizzard2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(151); --Blizzard3
	
	if (party:GetMemberMP(0) >= 120) and (player:GetMainJobLevel() >= 73) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	elseif (party:GetMemberMP(0) >= 77) and (player:GetMainJobLevel() >= 55) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	elseif (party:GetMemberMP(0) >= 30) and (player:GetMainJobLevel() >= 24) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	else
		return;
	end
end

function RedMage.DoThunder()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(164); --Thunder
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(165); --Thunder2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(166); --Thunder3
	
	if (party:GetMemberMP(0) >= 128) and (player:GetMainJobLevel() >= 75) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	elseif (party:GetMemberMP(0) >= 86) and (player:GetMainJobLevel() >= 60) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	elseif (party:GetMemberMP(0) >= 37) and (player:GetMainJobLevel() >= 29) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	else
		return;
	end
end

function RedMage.DoSleep()
local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(253); --Sleep
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(259); --Sleep2
	
	if (party:GetMemberMP(0) >= 29) and (player:GetMainJobLevel() >= 46) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep II" <t>');
		elseif (recast1 == 0) then
            AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep" <t>');
        end
	elseif (party:GetMemberMP(0) >= 19) and (player:GetMainJobLevel() >= 25) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep" <t>');
		else
			return;
		end
	end
end

function RedMage.DoRefresh()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil) or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Refresh" <me>');
	elseif (target.Name ~= nil) and (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Refresh" <t>');
	else
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Refresh" <me>');
	end
end

function RedMage.DoHaste()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil)  or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Haste" <me>');
	elseif (target.Name ~= nil) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Haste" <t>');
	else
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Haste" <me>');
	end
end

function RedMage.DoEnStone()

end


-------------------------------------------
--          Auto Buff Canceling          --
-------------------------------------------
--This function is technically against   --
--Horizon's ToS, and requires a secondary--
--addon to function properly.            --
-------------------------------------------
--         USE AT YOUR OWN RISK          --
-------------------------------------------
function RedMage.CheckCancels()
	local action = gData.GetAction();
	local sneak = gData.GetBuffCount('Sneak');
	local stoneskin = gData.GetBuffCount('Stoneskin');
	local stoneskinDelay = 3;
	local target = gData.GetActionTarget();
	local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
	
	local function do_sneak()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sneak" <me>');
	end
	
	local function do_ss()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stoneskin" <me>');
	end

	if (action.Name == 'Sneak' and sneak ~= 0 and target.Name == me) then
		AshitaCore:GetChatManager():QueueCommand(1, '/cancel Sneak');
	elseif (action.Name == 'Stoneskin' and stoneskin ~= 0) then
		AshitaCore:GetChatManager():QueueCommand(1, '/cancel Stoneskin')
	end
end

-----------------------
-- Initialize Script --
-----------------------
function RedMage.Initialize()
	RedMage.SetAlias();
	RedMage.SetKeybinds();
end

------------------
-- Unload Script--
------------------
function RedMage.Unload()
	RedMage.ClearAlias();
	RedMage.ClearKeybinds();
end

return RedMage;