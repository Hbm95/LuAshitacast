local BlackMage = T{};

BlackMage.Settings = {
	MagicBurst = false;
	MPSET = false;
	MPThreshold = 240;
};
BlackMage.AliasList = T{'stone','stonega','water','waterga','aero','aeroga','fire','firaga','blizzard','blizzaga','thunder','thundaga', 'Zz', 'sleep','sleepga','MagicBurst', 'MB', 'mpset'};

function BlackMage.SetKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/bind F9 /MagicBurst');
end

function BlackMage.ClearKeybinds()
	--AshitaCore:GetChatManager():QueueCommand(1, '/unbind F9 ');
end

function BlackMage.SetAlias()
	for _, v in ipairs(BlackMage.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function BlackMage.ClearAlias()
	for _, v in ipairs(BlackMage.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function BlackMage.HandleCommands(args)
	if not BlackMage.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'stone') then
		BlackMage.DoStone();
	elseif (args[1] == 'stonega') then
		BlackMage.DoWater();
	elseif (args[1] == 'water') then
		BlackMage.DoWater();
	elseif (args[1] == 'waterga') then
		BlackMage.DoWater();
	elseif (args[1] == 'aero') then
		BlackMage.DoAero();
	elseif (args[1] == 'aeroga') then
		BlackMage.DoWater();
	elseif (args[1] == 'fire') then
		BlackMage.DoFire();
	elseif (args[1] == 'firaga') then
		BlackMage.DoWater();
	elseif (args[1] == 'blizzard') then
		BlackMage.DoBlizzard();
	elseif (args[1] == 'blizzaga') then
		BlackMage.DoWater();
	elseif (args[1] == 'thunder') then
		BlackMage.DoThunder();
	elseif (args[1] == 'thundaga') then
		BlackMage.DoWater();
	elseif (args[1] == 'sleep') or (args[1] == 'Zz') then
		BlackMage.DoSleep();
	elseif (args[1] == 'sleepga') then
		BlackMage.DoWater();
	elseif (args[1] == 'MagicBurst') or (args[1] == 'MB') then
		BlackMage.DoMagicBurst();
	elseif (args[1] == 'mpset') then
		BlackMage.DoMPSet();
	end
end

function BlackMage.CheckAbilityRecast(check)
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

------------------------
-- Magic Burst Toggle --
------------------------
function BlackMage.DoMagicBurst()
	if (BlackMage.Settings.MagicBurst == true) then
		BlackMage.Settings.MagicBurst = false;
		gFunc.Message('MagicBurst is now Disabled!');	
	elseif (BlackMage.Settings.MagicBurst == false) then
		BlackMage.Settings.MPSET = false;
		BlackMage.Settings.MagicBurst = true;
		gFunc.Message('MagicBurst is now Enabled!');
	end
end

function BlackMage.DoMPSet()
	if (BlackMage.Settings.MPSET == true) then 
			BlackMage.Settings.MPSET = false;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Deactivated...');
		elseif (BlackMage.Settings.MPSET == false) then
			BlackMage.Settings.MagicBurst = false;
			BlackMage.Settings.MPSET = true;
			AshitaCore:GetChatManager():QueueCommand(1, '/echo MP SET Activated!');
		end
end

------------------------------------
--Elemental Spell Tier Downcasting--
------------------------------------
function BlackMage.DoStone()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(159); --Stone
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(160); --Stone2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(161); --Stone3
	local recast4 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(162); --Stone4
	
	if (party:GetMemberMP(0) >= 138) and (player:GetMainJobLevel() >= 68) then
		if (recast4 == 0) and (player.MainJob == 'BLM') then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone IV" <t>');
		elseif (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	elseif (party:GetMemberMP(0) >= 92) and (player:GetMainJobLevel() >= 51) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	elseif (party:GetMemberMP(0) >= 43) and (player:GetMainJobLevel() >= 26) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	elseif (party:GetMemberMP(0) >= 9) and (player:GetMainJobLevel() >= 1) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stone" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoStonega()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(189); --Stonega
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(190); --Stonega2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(191); --Stonega3
	
	if (party:GetMemberMP(0) >= 211) and (player:GetMainJobLevel() >= 63) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stonega III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stonega II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stonega" <t>');
		end
	elseif (party:GetMemberMP(0) >= 109) and (player:GetMainJobLevel() >= 40) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stonega II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stonega" <t>');
		end
	elseif (party:GetMemberMP(0) >= 37) and (player:GetMainJobLevel() >= 15) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Stonega" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoWater()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(169); --Water
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(170); --Water2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(171); --Water3
	local recast4 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(172); --Water4
	
	if (party:GetMemberMP(0) >= 144) and (player:GetMainJobLevel() >= 70) then
		if (recast4 == 0) and (player:GetMainJobLevel() >= 70) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water IV" <t>');
		elseif (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	elseif (party:GetMemberMP(0) >= 98) and (player:GetMainJobLevel() >= 55) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	elseif (party:GetMemberMP(0) >= 51) and (player:GetMainJobLevel() >= 30) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	elseif (party:GetMemberMP(0) >= 13) and (player:GetMainJobLevel() >= 5) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Water" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoWaterga()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(199); --Waterga
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(200); --Waterga2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(201); --Waterga3
	
	if (party:GetMemberMP(0) >= 231) and (player:GetMainJobLevel() >= 65) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Waterga III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Waterga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Waterga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 123) and (player:GetMainJobLevel() >= 44) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Waterga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Waterga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 47) and (player:GetMainJobLevel() >= 19) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Waterga" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoAero()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(154); --Aero
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(155); --Aero2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(156); --Aero3
	local recast4 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(157); --Aero4
	
	if (party:GetMemberMP(0) >= 150) and (player:GetMainJobLevel() >= 72) then
		if (recast4 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero IV" <t>');
		elseif (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	elseif (party:GetMemberMP(0) >= 106) and (player:GetMainJobLevel() >= 59) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	elseif (party:GetMemberMP(0) >= 59) and (player:GetMainJobLevel() >= 34) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	elseif (party:GetMemberMP(0) >= 18) and (player:GetMainJobLevel() >= 9) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aero" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoAeroga()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(184); --Aeroga
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(185); --Aeroga2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(186); --Aeroga3
	
	if (party:GetMemberMP(0) >= 252) and (player:GetMainJobLevel() >= 67) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aeroga III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aeroga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aeroga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 138) and (player:GetMainJobLevel() >= 48) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aeroga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aeroga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 57) and (player:GetMainJobLevel() >= 23) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aeroga" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoFire()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(144); --Fire
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(145); --Fire2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(146); --Fire3
	local recast4 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(147); --Fire4
	
	if (party:GetMemberMP(0) >= 157) and (player:GetMainJobLevel() >= 73) then
		if (recast4 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire IV" <t>');
		elseif (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	elseif (party:GetMemberMP(0) >= 113) and (player:GetMainJobLevel() >= 62) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	elseif (party:GetMemberMP(0) >= 59) and (player:GetMainJobLevel() >= 38) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	elseif (party:GetMemberMP(0) >= 24) and (player:GetMainJobLevel() >= 13) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Fire" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoFiraga()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(174); --Firaga
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(175); --Firaga2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(176); --Firaga3
	
	if (party:GetMemberMP(0) >= 277) and (player:GetMainJobLevel() >= 69) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Firaga III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Firaga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Firaga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 158) and (player:GetMainJobLevel() >= 53) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Firaga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Firaga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 71) and (player:GetMainJobLevel() >= 28) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Firaga" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoBlizzard()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(149); --Blizzard
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(150); --Blizzard2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(151); --Blizzard3
	local recast4 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(152); --Blizzard4
	
	if (party:GetMemberMP(0) >= 164) and (player:GetMainJobLevel() >= 74) then
		if (recast4 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard IV" <t>');
		elseif (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	elseif (party:GetMemberMP(0) >= 120) and (player:GetMainJobLevel() >= 64) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	elseif (party:GetMemberMP(0) >= 77) and (player:GetMainJobLevel() >= 42) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	elseif (party:GetMemberMP(0) >= 30) and (player:GetMainJobLevel() >= 17) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzard" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoBlizzaga()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(179); --Blizzaga
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(180); --Blizzaga2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(181); --Blizzaga3
	
if (party:GetMemberMP(0) >= 299) and (player:GetMainJobLevel() >= 71) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzaga III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzaga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzaga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 175) and (player:GetMainJobLevel() >= 57) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzaga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzaga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 82) and (player:GetMainJobLevel() >= 32) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Blizzaga" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoThunder()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(164); --Thunder
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(165); --Thunder2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(166); --Thunder3
	local recast4 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(167); --Thunder4
	
	if (party:GetMemberMP(0) >= 171) and (player:GetMainJobLevel() >= 75) then
		if (recast4 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder IV" <t>');
		elseif (recast3 == 0)then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	elseif (party:GetMemberMP(0) >= 128) and (player:GetMainJobLevel() >= 66) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	elseif (party:GetMemberMP(0) >= 77) and (player:GetMainJobLevel() >= 46) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	elseif (party:GetMemberMP(0) >= 37) and (player:GetMainJobLevel() >= 21) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thunder" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoThundaga()
	local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(194); --Thundaga
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(195); --Thundaga2
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(196); --Thundaga3
	
	if (party:GetMemberMP(0) >= 322) and (player:GetMainJobLevel() >= 73) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thundaga III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thundaga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thundaga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 193) and (player:GetMainJobLevel() >= 61) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thundaga II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thundaga" <t>');
		end
	elseif (party:GetMemberMP(0) >= 95) and (player:GetMainJobLevel() >= 36) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Thundaga" <t>');
		end
	else
		return;
	end
end

function BlackMage.DoSleep()
local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(253); --Sleep
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(259); --Sleep2
	
	if (party:GetMemberMP(0) >= 29) and (player:GetMainJobLevel() >= 41) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep II" <t>');
		elseif (recast1 == 0) then
            AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep" <t>');
        end
	elseif (party:GetMemberMP(0) >= 19) and (player:GetMainJobLevel() >= 20) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleep" <t>');
		else
			return;
		end
	end
end

function BlackMage.DoSleepga()
local party = AshitaCore:GetMemoryManager():GetParty();
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(273); --Sleepga
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(274); --Sleepga2
	
	if (party:GetMemberMP(0) >= 58) and (player:GetMainJobLevel() >= 56) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleepga II" <t>');
		elseif (recast1 == 0) then
            AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleepga" <t>');
        end
	elseif (party:GetMemberMP(0) >= 38) and (player:GetMainJobLevel() >= 31) then
		if (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Sleepga" <t>');
		else
			return;
		end
	end
end

-----------------------
-- Initialize Script --
-----------------------
function BlackMage.Initialize()
	BlackMage.SetAlias();
end

------------------
-- Unload Script--
------------------
function BlackMage.Unload()
	BlackMage.ClearAlias();
end

return BlackMage;