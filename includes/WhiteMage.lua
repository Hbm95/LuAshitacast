local WhiteMage = T{};

WhiteMage.settings = {
	Toggle1 = false;
};

WhiteMage.AliasList = T{'haste','mpset'};

WhiteMage.Settings = T{
	MPSET = false;
	MPThreshold = 800;
};

function WhiteMage.SetKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/bind F11 /ToggleTest');
end

function WhiteMage.ClearKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/unbind F11 ');
end

function WhiteMage.SetAlias()
	for _, v in ipairs(WhiteMage.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function WhiteMage.ClearAlias()
	for _, v in ipairs(WhiteMage.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function WhiteMage.HandleCommands(args)
	if not WhiteMage.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'haste') then
		WhiteMage.DoHaste();
	elseif (args[1] == 'mpset') then
		if (WhiteMage.Settings.MPSET == true) then 
			WhiteMage.Settings.MPSET = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Deactivated...');
		else
			WhiteMage.Settings.MPSET = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Activated!');
		end
	end
end


function WhiteMage.CheckAbilityRecast(check)
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

function WhiteMage.DoHaste()
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


-------------------------------------------
--          Auto Buff Canceling          --
-------------------------------------------
--This function is technically against   --
--Horizon's ToS, and requires a secondary--
--addon to function properly.            --
-------------------------------------------
--         USE AT YOUR OWN RISK          --
-------------------------------------------
function WhiteMage.CheckCancels()
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
function WhiteMage.Initialize()
	WhiteMage.SetAlias();
	WhiteMage.SetKeybinds();
end

------------------
-- Unload Script--
------------------
function WhiteMage.Unload()
	WhiteMage.ClearAlias();
	WhiteMage.ClearKeybinds();
end

return WhiteMage;