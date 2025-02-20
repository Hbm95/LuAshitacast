local Bard = T{};
local Toggles = {};

Bard.AliasList = T{'balladinstrument'};

Bard.Settings = T{
	HORN = true;
	HARP = false;
};

function Bard.SetAlias()
	for _, v in ipairs(Bard.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Bard.ClearAlias()
	for _, v in ipairs(Bard.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Bard.HandleCommands(args)
	if not Bard.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'balladinstrument') then
		if (Bard.Settings.HORN == true) then 
			Bard.Settings.HORN = false;
			Bard.Settings.HARP = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo HARP Mode Activated! >=D');
		elseif (Bard.Settings.HARP == true) then
			Bard.Settings.HORN = true;
			Bard.Settings.HARP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo HORN Mode Activated!');
		end
	end
	
end

function Bard.CheckAbilityRecast(check)
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
function Bard.CheckCancels()
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
function Bard.Initialize()
	Bard.SetAlias();
end

------------------
-- Unload Script--
------------------
function Bard.Unload()
	Bard.ClearAlias();
end

return Bard;