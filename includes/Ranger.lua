local Ranger = T{};

Ranger.settings = {
	Toggle1 = false;
};

Ranger.AliasList = T{'mpset','eva'};

Ranger.Settings = T{
	MPSET = false;
	EVA = false;
	MPThreshold = 750;
};

function Ranger.SetKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/bind F11 /ToggleTest');
end

function Ranger.ClearKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/unbind F11 ');
end

function Ranger.SetAlias()
	for _, v in ipairs(Ranger.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Ranger.ClearAlias()
	for _, v in ipairs(Ranger.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Ranger.HandleCommands(args)
	if not Ranger.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'mpset') then
		if (Ranger.Settings.MPSET == true) then 
			Ranger.Settings.MPSET = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Deactivated...');
		else
			Ranger.Settings.MPSET = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Activated!');
		end
	elseif (args[1] == 'eva') then
		if (Ranger.Settings.EVA == true) then
			Ranger.Settings.EVA = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode De-Activated...');
		else
			Ranger.Settings.MPSET = false;
			Ranger.Settings.EVA = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode Activated!');
		end
	end
end


function Ranger.CheckAbilityRecast(check)
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

-----------------------
-- Initialize Script --
-----------------------
function Ranger.Initialize()
	Ranger.SetAlias();
	Ranger.SetKeybinds();
end

------------------
-- Unload Script--
------------------
function Ranger.Unload()
	Ranger.ClearAlias();
	Ranger.ClearKeybinds();
end

return Ranger;