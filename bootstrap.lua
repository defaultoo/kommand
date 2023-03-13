rconsoleclear()
rconsoleprint("@@WHITE@@")
rconsolename("Bootstrapp v0.8b")
ConsolePrint("Bootstrapp version 0.8b - (c) Ooflet|Interrupt boot sequence by pressing the enter key||")
ConsolePrint("Initializing Bootstrapp||")

local DebugCommands = false

local UIS = game:GetService("UserInputService")

local function ConsolePrint(word)
	for w in string.gmatch(word, "(%w)") do -- 'w' represents the individual letter returned
		if w == "|" then
			ConsolePrint("\n")
		else
			ConsolePrint(w)
		end
		wait(0.05)
	end
end

local function PrintInfo()
	rconsoleprint("[")
	rconsoleprint("@@CYAN@@")
	rconsoleprint("INFO")
	rconsoleprint("@@WHITE@@")
	rconsoleprint("] ")
end

local function PrintSucess()
	rconsoleprint("[")
	rconsoleprint("@@GREEN@@")
	rconsoleprint("SUCCESS")
	rconsoleprint("@@WHITE@@")
	rconsoleprint("] ")
end

local function PrintError()
	rconsoleprint("[")
	rconsoleprint("@@RED@@")
	rconsoleprint("ERROR")
	rconsoleprint("@@WHITE@@")
	rconsoleprint("] ")
end

local function PrintSystem()
	rconsoleprint("[")
	rconsoleprint("@@LIGHT_BLUE@@")
	rconsoleprint("SYSTEM")
	rconsoleprint("@@WHITE@@")
	rconsoleprint("] ")
end

spawn(function()
	rconsoleinput()
	DebugCommands = true
	PrintSystem()
	ConsolePrint("Interrupt! Wait for update daemon finish. If this was a mistake, type 'continue' on the prompt once debug mode has activated|")
end)

wait(3)

local framework, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") end)
if not framework then
	PrintError()
	ConsolePrint("Could not ping https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua. |"..message.."|")
	error()
end

local library, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") end)
if not library then
	PrintError()
	ConsolePrint("Could not ping https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua. |"..message.."|")
	error()
end

PrintInfo()
ConsolePrint("Checking Kommand Framework|")

if isfile("kommand/framework/kommandframework.kmd") then
	if readfile("kommand/framework/kommandframework.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") then
		PrintSucess()
		ConsolePrint("Framework up-to-date|")
		PrintInfo()
		ConsolePrint("Checking Kommand Library|")
	else 
		PrintInfo()
		ConsolePrint("Framework Update Found|")
		PrintInfo()
		ConsolePrint("Updating Kommand Framework|")
		delfile("kommand/framework/kommandframework.kmd")
		writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))	
		PrintSucess()
		ConsolePrint("Framework up-to-date|")
		PrintInfo()
		ConsolePrint("Checking Kommand Library|")
	end
else
	PrintInfo()
	ConsolePrint("Installing Kommand Framework|")
	makefolder("kommand")
	makefolder("kommand/framework")
	writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))
end

if isfile("kommand/library/kommandlibrary.kmd") then
	if readfile("kommand/library/kommandlibrary.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") then
		PrintSucess()
		ConsolePrint("Library up-to-date|")
	else 
		PrintInfo()
		ConsolePrint("Library Update Found|")
		PrintInfo()
		ConsolePrint("Updating Kommand Library|")
		delfile("kommand/library/kommandlibrary.kmd")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
	end
else
	PrintInfo()
	ConsolePrint("Installing Kommand Library|")
	makefolder("kommand/library")
	writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
	PrintSucess()
	ConsolePrint("Library up-to-date|")
end

local success, err = pcall(function()
if DebugCommands == true then
	while true do
		ConsolePrint("> ")
		local command = rconsoleinput()
		if command == "continue" then
			spawn(function()
				loadstring(readfile("kommand/library/kommandlibrary.kmd"))()
				loadstring(readfile("kommand/framework/kommandframework.kmd"))()	
			end)
			rconsoleclose()
			break
		elseif command == "exit" then
			rconsoleclose()	
			break
		elseif command == "clear" or command == "clr" then
			rconsoleclear()
		else
			local success, err = pcall(function() loadstring(command)() end)
			if success then
				PrintSucess()
				ConsolePrint("Successfully ran.|")
			else
				PrintError()
				local success, err = pcall(function() ConsolePrint("Error occured during execution: "..err.."|") end)
				if not success then 
					ConsolePrint("Error occured during execution.|")	
				end
			end
		end
	end
else
	spawn(function()
		loadstring(readfile("kommand/library/kommandlibrary.kmd"))()
		loadstring(readfile("kommand/framework/kommandframework.kmd"))()	
	end)
	rconsoleclose()
end
end)
if not success then
	rconsoleclear()
	rconsoleprint("@@RED@@")
	ConsolePrint("BOOTSTRAPP ERROR! SYSTEM HUNG, PRESS CTRL+C TO TERMINATE.")
end
