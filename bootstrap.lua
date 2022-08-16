rconsoleclear()
rconsolename("Kommand")
rconsoleprint("Bootstrapp version 0.7b - (c) Ooflet\nInterrupt boot sequence by pressing the ` key\n\n")
rconsoleprint("Initializing Bootstrapp\n\n")

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
	rconsoleprint("SUCESS")
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

wait(5)

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

if isfile("kommand/library/kommandlibrary.kmd") then
	if readfile("kommand/library/kommandlibrary.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") then
		PrintSucess()
		rconsoleprint("Library up-to-date\n")
	else 
		PrintInfo()
		rconsoleprint("Library Update Found\n")
		PrintInfo()
		rconsoleprint("Updating Kommand Library\n")
		delfile("kommand/library/kommandlibrary.kmd")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
	end
else
	PrintInfo()
	rconsoleprint("Installing Kommand Library\n")
	makefolder("kommand/library")
	writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
	PrintSucess()
	rconsoleprint("Library up-to-date\n")
end
wait(0.5)
spawn(function()
	loadstring(readfile("kommand/framework/kommandframework.kmd"))()	
end)
rconsoleclose()
game.CoreGui:WaitForChild("Kommand"):WaitForChild("ConsoleWindow")
loadstring(readfile("kommand/library/kommandlibrary.kmd"))()
