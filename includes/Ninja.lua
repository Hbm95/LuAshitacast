local Ninja = T{};

Ninja.settings = {
	Toggle1 = false;
};

Ninja.AliasList = T{'tank', 'kite', 'dd'};

Ninja.Settings = T{
	TANK = false;
	DD = false;
	KITE = false;
};

function Ninja.SetKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/bind F11 /ToggleTest');
end

function Ninja.ClearKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/unbind F11 ');
end

function Ninja.SetAlias()
	for _, v in ipairs(Ninja.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Ninja.ClearAlias()
	for _, v in ipairs(Ninja.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Ninja.HandleCommands(args)
	if not Ninja.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'tank') then
		if (Ninja.Settings.TANK == true) then 
			Ninja.Settings.TANK = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo TANK SET Deactivated...');
		else
			Ninja.Settings.TANK = true;
			Ninja.Settings.KITE = false;
			Ninja.Settings.DD = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo TANK SET Activated!');
		end
	elseif (args[1] == 'kite') then
		if (Ninja.Settings.KITE == true) then 
			Ninja.Settings.KITE = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo KITE SET Deactivated...');
		else
			Ninja.Settings.TANK = true;
			Ninja.Settings.KITE = true;
			Ninja.Settings.DD = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo KITE SET Activated!');
		end
	elseif (args[1] == 'dd') then
		if (Ninja.Settings.DD == true) then
			Ninja.Settings.DD = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo DD Mode De-Activated...');
		else
			Ninja.Settings.TANK = false;
			Ninja.Settings.KITE = false;
			Ninja.Settings.DD = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo DD Mode Activated!');
		end
	end
end

function Ninja.CheckAbilityRecast(check)
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
function Ninja.CheckCancels()
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
function Ninja.Initialize()
	Ninja.SetAlias();
	Ninja.SetKeybinds();
end

------------------
-- Unload Script--
------------------
function Ninja.Unload()
	Ninja.ClearAlias();
	Ninja.ClearKeybinds();
end

return Ninja;