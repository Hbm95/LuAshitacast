local Ascii = T{};

Ascii.AliasList = T{'dick', 'bigdick'};

-----------------------------------
--        Alias Functions        --
-----------------------------------
function Ascii.SetAlias()
	for _, v in ipairs(Ascii.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function Ascii.ClearAlias()
	for _, v in ipairs(Ascii.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function Ascii.HandleCommands(args)
	if not Ascii.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	
	if (args[1] == 'dick') then
		Ascii.Dick();
	elseif (args[1] == 'bigdick') then
		Ascii.BigDick();
	end
end

function Ascii.Dick()
AshitaCore:GetChatManager():QueueCommand(-1, '/p 8==========D');
end

function Ascii.BigDick()

end

-----------------------
-- Initialize Script --
-----------------------
function Ascii.Initialize()
	Ascii.SetAlias();
end

----------------------
--Unload Ascii File--
----------------------
function Ascii.Unload()
	Ascii.ClearAlias();
end

return Ascii;