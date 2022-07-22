rconsoleclear()
rconsolename("Bootstrapper")
rconsoleprint("Checking Kommand Framework\n")

task.wait(1)
if isfile("kommand/framework/kommandframework.kmd") then
	if readfile("kommand/framework/kommandframework.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") then
		rconsoleprint("Checking Kommand Library\n")
	else 
		rconsoleprint("Framework Update Found\n")
		rconsoleprint("Updating Kommand Framework\n")
		delfile("kommand/framework/kommandframework.kmd")
		writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))
		wait(0.5)	
		rconsoleprint("Checking Kommand Library\n")
	end
else
	rconsoleprint("Installing Kommand Framework\n")
	makefolder("kommand")
	makefolder("kommand/framework")
	writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))
end

wait(0.5)

if isfile("kommand/library/kommandlibrary.kmd") then
	if readfile("kommand/library/kommandlibrary.kmd") == game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/lib.lua") then
		wait(0.5)
	else 
		rconsoleprint("Library Update Found\n")
		rconsoleprint("Updating Kommand Library\n")
		delfile("kommand/library/kommandlibrary.kmd")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/lib.lua"))
		task.wait(0.5)	
	end
else
	rconsoleprint("Installing Kommand Library\n")
	makefolder("kommand/library")
	writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/lib.lua"))
end

rconsoleprint("Launching Kommand\n")
wait(0.75)
rconsoleclose()
loadstring(readfile("kommand/framework/kommandframework.kmd"))()
