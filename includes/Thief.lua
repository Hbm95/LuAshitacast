local Thief = T{};
local Toggles = {};

Thief.settings = {
	TreasureHunter = false;
};

Thief.AliasList = T{'TH'};

function Thief.SetVariables()
local player = gData.GetPlayer();

end

function Thief.SetAlias()
	for _, v in ipairs(Thief.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Thief.ClearAlias()
	for _, v in ipairs(Thief.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Thief.HandleCommands(args)
	if not Thief.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'TH') then
		Thief.DoTreasureHunter();
	end
end

----------------------------
-- Treasure Hunter Toggle --
----------------------------
function Thief.DoTreasureHunter()
	if (Thief.settings.TreasureHunter == false) then
		Thief.settings.TreasureHunter = true;
		gFunc.Message('TreasureHunter is now Enabled!');
		
	elseif (Thief.settings.TreasureHunter == true) then
		Thief.settings.TreasureHunter = false;
		gFunc.Message('TreasureHunter is now Disabled!');
	end
end

function Thief.CheckAbilityRecast(check)
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
function Thief.Initialize()
	Thief.SetAlias();
end

------------------
-- Unload Script--
------------------
function Thief.Unload()
	Thief.ClearAlias();
end

return Thief;