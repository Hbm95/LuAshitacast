local Monk = T{};
local Toggles = {};

Monk.AliasList = T{'eva','acc','skup'};

Monk.Settings = T{
	EVA = false;
	ACC = false;
	SKUP = false;
};

function Monk.SetAlias()
	for _, v in ipairs(Monk.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Monk.ClearAlias()
	for _, v in ipairs(Monk.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Monk.HandleCommands(args)
	if not Monk.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'eva') then
		if (Monk.Settings.EVA == true) then
			Monk.Settings.EVA = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode De-Activated...');
		else
			Monk.Settings.EVA = true;
			Monk.Settings.ACC = false;
			Monk.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode Activated!');
		end
	elseif (args[1] == 'acc') then
		if (Monk.Settings.ACC == true) then
			Monk.Settings.ACC = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo ACCURACY Mode De-Activated...');
		else
			Monk.Settings.EVA = false;
			Monk.Settings.ACC = true;
			Monk.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo ACCURACY Mode Activated!');
		end
	elseif (args[1] == 'skup') then
		if (Monk.Settings.SKUP == true) then
			Monk.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo SKILL-UP Mode De-Activated...');
		else
			Monk.Settings.EVA = false;
			Monk.Settings.ACC = false;
			Monk.Settings.SKUP = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo SKILL-UP Mode Activated!');
		end
	end
	
end

function Monk.CheckAbilityRecast(check)
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

-------------------------------------------
--          Auto Buff Canceling          --
-------------------------------------------
--This function is technically against   --
--Horizon's ToS, and requires a secondary--
--addon to function properly.            --
-------------------------------------------
--         USE AT YOUR OWN RISK          --
-------------------------------------------
function Monk.CheckCancels()
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
function Monk.Initialize()
	Monk.SetAlias();
end

------------------
-- Unload Script--
------------------
function Monk.Unload()
	Monk.ClearAlias();
end

return Monk;