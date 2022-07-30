rconsoleclear()
rconsolename("Bootstrapper")
rconsoleprint("Checking Kommand Framework\n")

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
	if readfile("kommand/library/kommandlibrary.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") then
	else 
		rconsoleprint("Library Update Found\n")
		rconsoleprint("Updating Kommand Library\n")
		delfile("kommand/library/kommandlibrary.kmd")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
	end
else
	rconsoleprint("Installing Kommand Library\n")
	makefolder("kommand/library")
	writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
end
rconsoleprint("Initializing Kommand Library\n")
spawn(function()
	loadstring(readfile("kommand/library/kommandlibrary.kmd"))()	
end)
if Debug == true then
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
