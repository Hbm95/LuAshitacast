local Emotes = T{};
Emotes.AliasList = T{'lick', 'fart', 'bonk', 'hug', 'tackle'};

-----------------------------------
--        Alias Functions        --
-----------------------------------
function Emotes.SetAlias()
	for _, v in ipairs(Emotes.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Emotes.ClearAlias()
	for _, v in ipairs(Emotes.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

-----------------------------------
--        Handle Commands        --
-----------------------------------
function Emotes.HandleCommands(args)
	if not Emotes.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'lick') then
		Emotes.LickEmote();
	elseif (args[1] == 'fart') then
		Emotes.FartEmote();
	elseif (args[1] == 'bonk') then
		Emotes.BonkEmote();
	elseif (args[1] == 'hug') then
		Emotes.HugEmote();
	elseif (args[1] == 'tackle') then
		Emotes.TackleEmote();
	end
end

-------------------
-- Custom Emotes --
-------------------
function Emotes.LickEmote()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil) or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em licks themself.');
	elseif (target.Type == "PC") or (target.Type == "NPC") or (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em licks <t>.');
	elseif (target.Type == "Monster") then
		AshitaCore:GetChatManager():QueueCommand(1, '/em licks the <t>.');
	end
end

function Emotes.FartEmote()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil) or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em farts.');
	elseif (target.Type == "PC") or (target.Type == "NPC") or (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em farts in <t>\'s general direction.');
	elseif (target.Type == "Monster") then
		AshitaCore:GetChatManager():QueueCommand(1, '/em farts on the <t>.');
	end
end

function Emotes.BonkEmote()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil) or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em bonks themself.');
	elseif (target.Type == "PC") or (target.Type == "NPC") or (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em bonks <t>.');
	elseif (target.Type == "Monster") then
		AshitaCore:GetChatManager():QueueCommand(1, '/em bonks the <t>.');
	end
end

function Emotes.HugEmote()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil) or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em wants a hug.');
	elseif (target.Type == "PC") or (target.Type == "NPC") or (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em hugs <t>.');
	elseif (target.Type == "Monster") then
		AshitaCore:GetChatManager():QueueCommand(1, '/em hugs the <t>.');
	end
end

function Emotes.TackleEmote()
local target = gData.GetTarget();
local player = gData.GetPlayer();
local party = gData.GetParty();
	
	if (target == nil) or (target == player.Name) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em falls on their face.');
	elseif (target.Type == "PC") or (target.Type == "NPC") or (party.InParty == true) then
		AshitaCore:GetChatManager():QueueCommand(1, '/em tackles <t>.');
	elseif (target.Type == "Monster") then
		AshitaCore:GetChatManager():QueueCommand(1, '/em tackles the <t>.');
	end
end

-----------------------
-- Initialize Script --
-----------------------
function Emotes.Initialize()
	Emotes.SetAlias();
end

----------------------
--Unload Emotes File--
----------------------
function Emotes.Unload()
	Emotes.ClearAlias();
end

return Emotes;