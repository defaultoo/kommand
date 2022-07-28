rconsoleclear()
rconsolename("Bootstrapper")
rconsoleprint("Checking Kommand Framework\n")
local Debug = false
spawn(function()
	rconsoleinput()
	rconsoleprint("Bootstrap Interrupt! Wait for bootstrap to initialize components. If this was a mistake, wait for the '>' to appear and type 'boot'.")
	Debug = true
end)

local function KommandTerminal()
	while wait() do
		if Debug == false then
			break
		else
			rconsoleprint("\n# ")
			local command = rconsoleinput()
			if string.find(command, "boot") then
				Debug = false	
			elseif string.find(command, "bootset") then
				rconsoleprint("\nSet what parameter\n= ")
				local response = rconsoleinput()
				if string.find(response, "debug") then
					rconsoleprint("\nSet it to\n= ")
					local debugresponse = rconsoleinput()
					if string.find(debugresponse, "true") then
						rconsoleprint("\nSet")
					elseif string.find(debugresponse, "false") then
						rconsoleprint("\nSet")
					end
				end
		end
	end
end

if isfile("kommand/framework/kommandframework.kmd") then
	if readfile("kommand/framework/kommandframework.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") then
		rconsoleprint("Checking Kommand Library\n")
	else 
		rconsoleprint("Framework Update Found\n")
		rconsoleprint("Updating Kommand Framework\n")
		delfile("kommand/framework/kommandframework.kmd")
		writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))	
		rconsoleprint("Checking Kommand Library\n")
	end
else
	rconsoleprint("Installing Kommand Framework\n")
	makefolder("kommand")
	makefolder("kommand/framework")
	writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))
end

if isfile("kommand/library/kommandlibrary.kmd") then
	if readfile("kommand/library/kommandlibrary.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/lib.lua") then
	else 
		rconsoleprint("Library Update Found\n")
		rconsoleprint("Updating Kommand Library\n")
		delfile("kommand/library/kommandlibrary.kmd")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/lib.lua"))
	end
else
	rconsoleprint("Installing Kommand Library\n")
	makefolder("kommand/library")
	writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/lib.lua"))
end
rconsoleprint("Initializing Kommand Library\n")
loadstring(readfile("kommand/library/kommandlibrary.kmd"))()
if Debug == true then
	KommandTerminal()
	rconsoleprint("Launching Kommand\n")
		wait(1)
	rconsoleclose()
	loadstring(readfile("kommand/framework/kommandframework.kmd"))()
else
	rconsoleprint("Launching Kommand\n")
		wait(1)
	rconsoleclose()
	loadstring(readfile("kommand/framework/kommandframework.kmd"))()	
end
