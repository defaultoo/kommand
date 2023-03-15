rconsoleclear()
rconsolename("Kommand")
rconsoleprint("Bootstrapp version 0.7b - (c) Ooflet\nEnter debug mode by pressing the enter key\n\n")
rconsoleprint("Initializing Bootstrapp\n\n")

local DebugCommands = false

local UIS = game:GetService("UserInputService")

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
	rconsoleprint("Interrupt! Wait for update daemon to be finished. If you do not intend this, type 'continue' on the prompt once debug mode has activated\n")
end)

wait(3)

local framework, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") end)
if not framework then
	PrintError()
	rconsoleprint("Could not ping https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua. \n"..message.."\n")
	error()
end

local library, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") end)
if not library then
	PrintError()
	rconsoleprint("Could not ping https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua. \n"..message.."\n")
	error()
end

PrintInfo()
rconsoleprint("Checking Kommand Framework\n")

if isfile("kommand/framework/kommandframework.kmd") then
	if readfile("kommand/framework/kommandframework.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") then
		PrintSucess()
		rconsoleprint("Framework up-to-date\n")
		PrintInfo()
		rconsoleprint("Checking Kommand Library\n")
	else 
		PrintInfo()
		rconsoleprint("Framework Update Found\n")
		PrintInfo()
		rconsoleprint("Updating Kommand Framework\n")
		delfile("kommand/framework/kommandframework.kmd")
		writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))	
		PrintSucess()
		rconsoleprint("Framework up-to-date\n")
		PrintInfo()
		rconsoleprint("Checking Kommand Library\n")
	end
else
	PrintInfo()
	rconsoleprint("Installing Kommand Framework\n")
	makefolder("kommand")
	makefolder("kommand/framework")
	writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))
end

if isfile("kommand/framework/kommandlibrary.kmd") then
	if readfile("kommand/framework/kommandlibrary.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") then
		PrintSucess()
		rconsoleprint("Library up-to-date\n")
	else 
		PrintInfo()
		rconsoleprint("Library Update Found\n")
		PrintInfo()
		rconsoleprint("Updating Kommand Library\n")
		delfile("kommand/framework/kommandlibrary.kmd")
		writefile("kommand/framework/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
		PrintSucess()
		rconsoleprint("Library up-to-date\n")
	end
else
	PrintInfo()
	rconsoleprint("Installing Kommand Library\n")
	writefile("kommand/franework/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
	PrintSucess()
	rconsoleprint("Library up-to-date\n")
end

if isfile("kommand/framework/kronaco.kmd") then
	if readfile("kommand/framework/kronaco.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/Ronaco-Editor/main/main/k-ronaco/RonacoMain.lua") then
		PrintSucess()
		rconsoleprint("Ronaco up-to-date\n")
	else 
		PrintInfo()
		rconsoleprint("Ronaco Update Found\n")
		PrintInfo()
		rconsoleprint("Updating Ronaco\n")
		delfile("kommand/framework/kronaco.kmd")
		writefile("kommand/frameworkd/kronaco.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/Ronaco-Editor/main/main/k-ronaco/RonacoMain.lua"))
		PrintSucess()
		rconsoleprint("Ronaco up-to-date\n")
	end
else
	PrintInfo()
	rconsoleprint("Installing Ronaco\n")
	writefile("kommand/franework/kronaco.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/Ronaco-Editor/main/main/k-ronaco/RonacoMain.lua"))
	PrintSucess()
	rconsoleprint("Ronaco up-to-date\n")
end

if not isfolder("kommand/modules") then
	PrintInfo()
	rconsoleprint("Creating modules folder\n")
	makefolder("kommand/modules")
end

wait(0.5)

local function DebugCmd()
	local success, err = pcall(function()
	while true do
		rconsoleprint("> ")
		local command = rconsoleinput()
		command = string.split(command, " ")
		if command[1] == "help" then
			rconsoleprint("continue - Continues and launches Kommand.\nexit - Exits out of Bootstrapp and does not launch Kommand.\nclear/clr - Clears output.\ninstall <moduleLink> <name*> - Installs a module provided with the moduleLink argument. If no name is provided, it will use moduleLink as the module's name.\nuninstall <name> - Uninstalls module with the provided name.\n")		
		elseif command[1] == "continue" then
			spawn(function()
				loadstring(readfile("kommand/library/kommandlibrary.kmd"))()
				loadstring(readfile("kommand/framework/kommandframework.kmd"))()	
			end)
			rconsoleclose()
			break
		elseif command[1] == "exit" then
			rconsoleclose()	
			break
		elseif command[1] == "clear" or command == "clr" then
			rconsoleclear()
		elseif command[1] == "install" then
			local name = command[3] or command[2]
			if command[2] == nil then
				PrintError()
				rconsoleprint("Argument 2 (moduleLink) must not be empty!\n")			
			else
				PrintInfo()
				rconsoleprint("Downloading module from "..command[2].." with name "..command[3].."...\n")
				local success, err = pcall(function() writefile("kommand/modules/"..name, game:HttpGet(command[2])) end)
				if success then 
					PrintSucess()
					rconsoleprint("Succesfully downloaded module\n")
				else
					PrintError()
					rconsoleprint("Failed to download module; "..err.."\n")
				end		
			end
			
		elseif command[1] == "uninstall" then
			if command[2] ~= nil then
				if isfile("kommand/modules/"..command[2]) then
					delfile("kommand/modules/"..command[2])
					PrintSucess()
					rconsoleprint("Successfully uninstalled module.\n")
				else
					PrintError()
					rconsoleprint("Failed to uninstall module! The module was most likely not found, double check to see if the module name is correctly spelt (it is case sensitive).\n")
				end
			else
				PrintError()
				rconsoleprint("Argument 2 (name) must not be empty!\n")
			end
		else
			command = table.concat(command, " ")
			local success, err = pcall(function() loadstring(command)() end)
			if success then
				PrintSucess()
				rconsoleprint("Successfully ran.\n")
			else
				PrintError()
				local success, err = pcall(function() rconsoleprint("Error occured during execution: "..err.."\n") end)
				if not success then 
					rconsoleprint("Error occured during execution.\n")	
				end
			end
		end
	end
	end)
	if not success then 
		rconsoleprint("\n")
		PrintError()
		rconsoleprint("@@RED@@")	
		rconsoleprint("Bootstrapp system error! "..err..". Terminate Bootstrapp manually by pressing ctrl+c. \n\n")
		rconsoleprint("@@WHITE@@")
		DebugCmd()
	end
end

if DebugCommands == true then
	DebugCmd()
else
	wait(0.5)
	spawn(function()
		loadstring(readfile("kommand/library/kommandlibrary.kmd"))()	
	end)
	spawn(function()
		loadstring(readfile("kommand/framework/kommandframework.kmd"))()		
	end)
	rconsoleclose()
end
