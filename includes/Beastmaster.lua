local Beastmaster = T{};
local Toggles = {};

Beastmaster.AliasList = T{'charm', 'reward'};

function Beastmaster.SetAlias()
	for _, v in ipairs(Beastmaster.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Beastmaster.ClearAlias()
	for _, v in ipairs(Beastmaster.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Beastmaster.HandleCommands(args)
	if not Beastmaster.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'charm') then
		Beastmaster.DoCharm();
	elseif (args[1] == 'reward') then
		Beastmaster.DoReward();
	end
	
end

function Beastmaster.CheckAbilityRecast(check)
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
--Auto Ability Adjust on Cooldown--
-----------------------------------
function Beastmaster.DoCharm()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local CharmRecast = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(52); --Charm
	local TameRecast = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(54); --Tame
	
	if (player:GetMainJobLevel() >= 30) then
		if (TameRecast == 0) and (CharmRecast > 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Tame" <t>');
		elseif (TameRecast > 0) and (CharmRecast == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Charm" <t>');
		end
	end
end

function Beastmaster.DoReward()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local ammo = gData.GetEquipment(Ammo);
	local recast = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(78); --Reward
	
	if ((player:GetMainJobLevel() >= 12)) then
		if (recast == 0) then
			if (player:GetMainJobLevel() >= 72) then
				AshitaCore:GetChatManager():QueueCommand(1, '/lac set Zeta 3');
				--gData.GetEquipment(Ammo);
				if (ammo.Name == 'Pet Food Zeta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
				elseif (ammo.Name ~= 'Pet Food Zeta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Epsilon 3');
					--gData.GetEquipment(Ammo);
					if (ammo.Name == 'Pet Food Epsilon') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Epsilon') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Delta 3');
					--gData.GetEquipment(Ammo);
					if (ammo.Name == 'Pet Food Delta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Delta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Gamma 3');
					--gData.GetEquipment(Ammo);
					if (ammo.Name == 'Pet Food Gamma') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Gamma') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Beta 3');
					--gData.GetEquipment(Ammo);
					if (ammo.Name == 'Pet Food Beta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Beta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Alpha 3');
					--gData.GetEquipment(Ammo);
					if (ammo.Name == 'Pet Food Alpha') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				else
					AshitaCore:GetChatManager():QueueCommand(1, '/echo ERROR: PET FOOD NOT FOUND!');
				end
			elseif (player:GetMainJobLevel() < 72) and (player:GetMainJobLevel() >= 60) then
				AshitaCore:GetChatManager():QueueCommand(1, '/lac set Epsilon 3');
				if (ammo.Name == 'Pet Food Epsilon') then
					AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
				elseif (ammo.Name ~= 'Pet Food Epsilon') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Delta 3');
					if (ammo.Name == 'Pet Food Delta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Delta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Gamma 3');
					if (ammo.Name == 'Pet Food Gamma') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Gamma') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Beta 3');
					if (ammo.Name == 'Pet Food Beta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Beta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Alpha 3');
					if (ammo.Name == 'Pet Food Alpha') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				else
					AshitaCore:GetChatManager():QueueCommand(1, '/echo ERROR: PET FOOD NOT FOUND!');
				end
			elseif (player:GetMainJobLevel() < 60) and (player:GetMainJobLevel() >= 48) then
				AshitaCore:GetChatManager():QueueCommand(1, '/lac set Delta 3');
				if (ammo.Name == 'Pet Food Delta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
				elseif (ammo.Name ~= 'Pet Food Delta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Gamma 3');
					if (ammo.Name == 'Pet Food Gamma') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Gamma') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Beta 3');
					if (ammo.Name == 'Pet Food Beta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Beta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Alpha 3');
					if (ammo.Name == 'Pet Food Alpha') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				else
					AshitaCore:GetChatManager():QueueCommand(1, '/echo ERROR: PET FOOD NOT FOUND!');
				end
			elseif (player:GetMainJobLevel() < 48) and (player:GetMainJobLevel() >= 36) then
				AshitaCore:GetChatManager():QueueCommand(1, '/lac set Gamma 3');
				if (ammo.Name == 'Pet Food Gamma') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
				elseif (ammo.Name ~= 'Pet Food Gamma') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Beta 3');
					if (ammo.Name == 'Pet Food Beta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				elseif (ammo.Name ~= 'Pet Food Beta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Alpha 3');
					if (ammo.Name == 'Pet Food Alpha') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				else
					AshitaCore:GetChatManager():QueueCommand(1, '/echo ERROR: PET FOOD NOT FOUND!');
				end
			elseif (player:GetMainJobLevel() < 36) and (player:GetMainJobLevel() >= 24) then
				AshitaCore:GetChatManager():QueueCommand(1, '/lac set Beta 3');
				if (ammo.Name == 'Pet Food Beta') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
				elseif (ammo.Name ~= 'Pet Food Beta') then
					AshitaCore:GetChatManager():QueueCommand(1, '/lac set Alpha 3');
					if (ammo.Name == 'Pet Food Alpha') then
						AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
					end
				else
					AshitaCore:GetChatManager():QueueCommand(1, '/echo ERROR: PET FOOD NOT FOUND!');
				end
			elseif (player:GetMainJobLevel() < 24) and (player:GetMainJobLevel() >= 12) then
				AshitaCore:GetChatManager():QueueCommand(1, '/lac set Alpha 3');
				if (ammo.Name == 'Pet Food Alpha') then
					AshitaCore:GetChatManager():QueueCommand(1, '/ja "Reward" <me>');
				end
			else
				AshitaCore:GetChatManager():QueueCommand(1, '/echo ERROR: PET FOOD NOT FOUND!');
			end
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
function Beastmaster.CheckCancels()
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
function Beastmaster.Initialize()
	Beastmaster.SetAlias();
end

------------------
-- Unload Script--
------------------
function Beastmaster.Unload()
	Beastmaster.ClearAlias();
end

return Beastmaster;