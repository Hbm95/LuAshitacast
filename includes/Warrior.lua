local Warrior = T{};
local Toggles = {};

Warrior.AliasList = T{'eva','acc','skup', 'TwoHand'};

Warrior.Settings = T{
	TwoHand = false;
	EVA = false;
	ACC = false;
	SKUP = false;
};

function Warrior.SetAlias()
	for _, v in ipairs(Warrior.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Warrior.ClearAlias()
	for _, v in ipairs(Warrior.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Warrior.HandleCommands(args)
	if not Warrior.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'TwoHand') then
		if (Warrior.Settings.TwoHand == true) then 
			Warrior.Settings.TwoHand = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo TwoHand Mode De-Activated...');
		else
			Warrior.Settings.TwoHand = true;
			Warrior.Settings.EVA = false;
			Warrior.Settings.ACC = false;
			Warrior.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo TwoHand Mode Activated!');
		end
	elseif (args[1] == 'eva') then
		if (Warrior.Settings.EVA == true) then
			Warrior.Settings.EVA = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode De-Activated...');
		else
			Warrior.Settings.TwoHand = false;
			Warrior.Settings.EVA = true;
			Warrior.Settings.ACC = false;
			Warrior.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo EVASION Mode Activated!');
		end
	elseif (args[1] == 'acc') then
		if (Warrior.Settings.ACC == true) then
			Warrior.Settings.ACC = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo ACCURACY Mode De-Activated...');
		else
			Warrior.Settings.TwoHand = false;
			Warrior.Settings.EVA = false;
			Warrior.Settings.ACC = true;
			Warrior.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo ACCURACY Mode Activated!');
		end
	elseif (args[1] == 'skup') then
		if (Warrior.Settings.SKUP == true) then
			Warrior.Settings.SKUP = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo SKILL-UP Mode De-Activated...');
		else
			Warrior.Settings.TwoHand = false;
			Warrior.Settings.EVA = false;
			Warrior.Settings.ACC = false;
			Warrior.Settings.SKUP = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo SKILL-UP Mode Activated!');
		end
	end
	
end

function Warrior.CheckAbilityRecast(check)
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
function Warrior.Initialize()
	Warrior.SetAlias();
end

------------------
-- Unload Script--
------------------
function Warrior.Unload()
	Warrior.ClearAlias();
end

return Warrior;