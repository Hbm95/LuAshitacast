local DarkKnight = T{};
local Toggles = {};

DarkKnight.AliasList = T{'stone','water','aero','fire','blizzard','thunder','zz','zerg','eva','acc','skup'};

DarkKnight.Settings = T{
	ZERG = false;
	EVA = false;
	ACC = false;
	SKUP = false;
};

function DarkKnight.SetAlias()
	for _, v in ipairs(DarkKnight.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function DarkKnight.ClearAlias()
	for _, v in ipairs(DarkKnight.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function DarkKnight.HandleCommands(args)
	if not DarkKnight.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'stone') then
		DarkKnight.DoStone();
	elseif (args[1] == 'water') then
		DarkKnight.DoWater();
	elseif (args[1] == 'aero') then
		DarkKnight.DoAero();
	elseif (args[1] == 'fire') then
		DarkKnight.DoFire();
	elseif (args[1] == 'blizzard') then
		DarkKnight.DoBlizzard();
	elseif (args[1] == 'thunder') then
		DarkKnight.DoThunder();
	elseif (args[1] == 'drain') then
		DarkKnight.DoDrain();
	elseif (args[1] == 'zz') then
		DarkKnight.DoSleep();
	elseif (args[1] == 'zerg') then
		if (DarkKnight.Settings.ZERG == true) then 
			DarkKnight.Settings.ZERG = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/p [ZERG MODE]: Off...');
		else
			DarkKnight.Settings.ZERG = true;
			DarkKnight.Settings.EVA = false;
			DarkKnight.Settings.ACC = false;
			DarkKnight.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/p [ZERG MODE]: ON!');
		end
	elseif (args[1] == 'eva') then
		if (DarkKnight.Settings.EVA == true) then
			DarkKnight.Settings.EVA = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo [EVASION MODE]: De-Activated...');
		else
			DarkKnight.Settings.ZERG = false;
			DarkKnight.Settings.EVA = true;
			DarkKnight.Settings.ACC = false;
			DarkKnight.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo [EVASION MODE] Activated!');
		end
	elseif (args[1] == 'acc') then
		if (DarkKnight.Settings.ACC == true) then
			DarkKnight.Settings.ACC = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo [ACCURACY MODE]: De-Activated...');
		else
			DarkKnight.Settings.ZERG = false;
			DarkKnight.Settings.EVA = false;
			DarkKnight.Settings.ACC = true;
			DarkKnight.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo [ACCURACY MODE]: Activated!');
		end
	elseif (args[1] == 'skup') then
		if (DarkKnight.Settings.SKUP == true) then
			DarkKnight.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo [SKILL-UP MODE]: De-Activated...');
		else
			DarkKnight.Settings.ZERG = false;
			DarkKnight.Settings.EVA = false;
			DarkKnight.Settings.ACC = false;
			DarkKnight.Settings.SKUP = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo [SKILL-UP MODE]: Activated!');
		end
	end
	
end

function DarkKnight.CheckAbilityRecast(check)
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
function DarkKnight.DoStone()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(159); --Stone
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(160); --Stone2
	
	if (party:GetMemberMP(0) >= 43) and (player:GetMainJobLevel() >= 42) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	elseif (party:GetMemberMP(0) >= 9) and (player:GetMainJobLevel() >= 5) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	else
		return;
	end
end

function DarkKnight.DoWater()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(169); --Water
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(170); --Water2
	
	if (party:GetMemberMP(0) >= 51) and (player:GetMainJobLevel() >= 48) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	elseif (party:GetMemberMP(0) >= 13) and (player:GetMainJobLevel() >= 11) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	else
		return;
	end
end

function DarkKnight.DoAero()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(154); --Aero
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(155); --Aero2
	
	if (party:GetMemberMP(0) >= 59) and (player:GetMainJobLevel() >= 54) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	elseif (party:GetMemberMP(0) >= 18) and (player:GetMainJobLevel() >= 17) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	else
		return;
	end
end

function DarkKnight.DoFire()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(144); --Fire
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(145); --Fire2
	
	if (party:GetMemberMP(0) >= 68) and (player:GetMainJobLevel() >= 60) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	elseif (party:GetMemberMP(0) >= 24) and (player:GetMainJobLevel() >= 23) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	else
		return;
	end
end

function DarkKnight.DoBlizzard()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(149); --Blizzard
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(150); --Blizzard2
	
	if (party:GetMemberMP(0) >= 77) and (player:GetMainJobLevel() >= 66) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	elseif (party:GetMemberMP(0) >= 30) and (player:GetMainJobLevel() >= 29) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	else
		return;
	end
end

function DarkKnight.DoThunder()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(164); --Thunder
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(165); --Thunder2
	
	if (party:GetMemberMP(0) >= 86) and (player:GetMainJobLevel() >= 72) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	elseif (party:GetMemberMP(0) >= 37) and (player:GetMainJobLevel() >= 35) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	else
		return;
	end
end

function DarkKnight.DoSleep()
local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(253); --Sleep
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(259); --Sleep2
	
	if (party:GetMemberMP(0) >= 29) and (player:GetMainJobLevel() >= 56) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep II" <t>');
		elseif (recast1 == 0) then
            AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep" <t>');
        end
	elseif (party:GetMemberMP(0) >= 19) and (player:GetMainJobLevel() >= 30) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep" <t>');
		else
			return;
		end
	end
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
function DarkKnight.CheckCancels()
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
function DarkKnight.Initialize()
	DarkKnight.SetAlias();
end

------------------
-- Unload Script--
------------------
function DarkKnight.Unload()
	DarkKnight.ClearAlias();
end

return DarkKnight;