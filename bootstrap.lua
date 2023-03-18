-- Bootstrap GUI
-- Ooflet

-- GUI Setup

local connections = {}

local BootstrapScreenGUI = Instance.new("ScreenGui")
local Bootstrapper = Instance.new("Frame")
local UIPadding = Instance.new("UIPadding")
local DefaultState = Instance.new("Frame")
local Throbber = Instance.new("Frame")
local Fill = Instance.new("Frame")
local FillError = Instance.new("Frame")
local Status = Instance.new("TextLabel")
local PromptState = Instance.new("Frame")
local PromptText = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")

local StatusFail = false
local IsLoaded = false
local IsStarted = false
local Update = true

BootstrapScreenGUI.Parent = game.CoreGui
BootstrapScreenGUI.Name = "Bootstrap"

Bootstrapper.Name = "Bootstrapper"
Bootstrapper.Parent = BootstrapScreenGUI
Bootstrapper.AnchorPoint = Vector2.new(0.5, 1)
Bootstrapper.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Bootstrapper.BackgroundTransparency = 0.05
Bootstrapper.BorderSizePixel = 0
Bootstrapper.Position = UDim2.new(0.5, 0, 1, 60)
Bootstrapper.Size = UDim2.new(0, 275, 0, 60)

UIPadding.Parent = Bootstrapper
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 15)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 15)

DefaultState.Name = "DefaultState"
DefaultState.Parent = Bootstrapper
DefaultState.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DefaultState.BackgroundTransparency = 1.000
DefaultState.Size = UDim2.new(1, 0, 1, 0)

Throbber.Name = "Throbber"
Throbber.Parent = DefaultState
Throbber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Throbber.BackgroundTransparency = 1.000
Throbber.BorderSizePixel = 0
Throbber.ClipsDescendants = true
Throbber.Position = UDim2.new(0, 0, 0.899999976, 0)
Throbber.Size = UDim2.new(1, -5, 0, 1)

Fill.Name = "Fill"
Fill.Parent = Throbber
Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fill.BorderSizePixel = 0
Fill.Position = UDim2.new(-1, 0, 0, 0)
Fill.Size = UDim2.new(1, 0, 1, 0)

FillError.Name = "Fill"
FillError.Parent = Throbber
FillError.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
FillError.BorderSizePixel = 0
FillError.Position = UDim2.new(-1, 0, 0, 0)
FillError.Size = UDim2.new(1, 0, 1, 0)
FillError.ZIndex = 2

Status.Name = "Status"
Status.Parent = DefaultState
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.Size = UDim2.new(1, 0, 0.349999994, 0)
Status.Font = Enum.Font.RobotoMono
Status.Text = "Updating Kommand framework"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 16.000
Status.TextXAlignment = Enum.TextXAlignment.Left

PromptState.Name = "PromptState"
PromptState.Parent = Bootstrapper
PromptState.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PromptState.BackgroundTransparency = 1.000
PromptState.Size = UDim2.new(1, 0, 1, 0)
PromptState.Visible = false

PromptText.Name = "PromptText"
PromptText.Parent = PromptState
PromptText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PromptText.BackgroundTransparency = 1.000
PromptText.Size = UDim2.new(1, 0, 0.349999994, 0)
PromptText.Font = Enum.Font.RobotoMono
PromptText.Text = "Launch terminal?"
PromptText.TextColor3 = Color3.fromRGB(255, 255, 255)
PromptText.TextSize = 16.000
PromptText.TextXAlignment = Enum.TextXAlignment.Left

TextBox.Parent = PromptState
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.Position = UDim2.new(0, 0, 0.649999976, 0)
TextBox.Size = UDim2.new(1, 0, 0.349999994, 0)
TextBox.Font = Enum.Font.RobotoMono
TextBox.PlaceholderText = "[y/n]"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left

-- Throbber Animation
spawn(function()
    while not StatusFail and not IsLoaded do
		pcall(function()
			Fill:TweenPosition(UDim2.new(1,0,0,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 1, true)
			wait(0.75)
			Fill.Position = UDim2.new(-1,0,0,0)
		end)
    end
end)

local function ThrobberError(err)
	Status.Text = err
	FillError:TweenPosition(UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true)
    StatusFail = true
    wait(3)
    Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,60), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
    wait(0.5)
	for _, connection in pairs(connections) do
		connection:Disconnect()
 	end		
    BootstrapScreenGUI:Destroy()
end

wait(0.5)

-- Terminal Setup
local Terminal = Instance.new("Frame")
local Console = Instance.new("Frame")
local ClientLog = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local CommandBar = Instance.new("Frame")
local CmdBar = Instance.new("TextBox")
local EnvIndicator = Instance.new("TextLabel")

Terminal.Name = "Terminal"
Terminal.Parent = BootstrapScreenGUI
Terminal.AnchorPoint = Vector2.new(0.5, 1)
Terminal.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Terminal.BackgroundTransparency = 0.025
Terminal.BorderSizePixel = 0
Terminal.Position = UDim2.new(0.5, 0, 1, 400)
Terminal.Size = UDim2.new(0, 700, 0, 400)

Console.Name = "Console"
Console.Parent = Terminal
Console.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Console.BackgroundTransparency = 1.000
Console.Size = UDim2.new(1, 0, 1, 0)

ClientLog.Name = "ClientLog"
ClientLog.Parent = Console
ClientLog.Active = true
ClientLog.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
ClientLog.BackgroundTransparency = 1.000
ClientLog.BorderSizePixel = 0
ClientLog.Position = UDim2.new(0, 20, 0, 20)
ClientLog.Size = UDim2.new(1, -40, 1, -40)
ClientLog.CanvasSize = UDim2.new(0, 0, 0, 0)
ClientLog.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ClientLog
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

CommandBar.Name = "CommandBar"
CommandBar.Parent = ClientLog
CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.BackgroundTransparency = 1.000
CommandBar.LayoutOrder = 999999999
CommandBar.Size = UDim2.new(1, 0, 0, 16)

CmdBar.Name = "CmdBar"
CmdBar.Parent = CommandBar
CmdBar.AnchorPoint = Vector2.new(0, 0.5)
CmdBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdBar.BackgroundTransparency = 1.000
CmdBar.Position = UDim2.new(0, 16, 0.5, 0)
CmdBar.Size = UDim2.new(1, -30, 0, 20)
CmdBar.ClearTextOnFocus = false
CmdBar.Font = Enum.Font.RobotoMono
CmdBar.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
CmdBar.Text = ""
CmdBar.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBar.TextSize = 16.000
CmdBar.TextWrapped = true
CmdBar.TextXAlignment = Enum.TextXAlignment.Left

EnvIndicator.Name = ">"
EnvIndicator.Parent = CommandBar
EnvIndicator.Active = true
EnvIndicator.AnchorPoint = Vector2.new(0, 0.5)
EnvIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EnvIndicator.BackgroundTransparency = 1.000
EnvIndicator.Position = UDim2.new(0, 0, 0.5, 0)
EnvIndicator.Selectable = true
EnvIndicator.Size = UDim2.new(0, 0, 0, 25)
EnvIndicator.Font = Enum.Font.RobotoMono
EnvIndicator.Text = ">"
EnvIndicator.TextColor3 = Color3.fromRGB(255, 255, 255)
EnvIndicator.TextSize = 16.000
EnvIndicator.TextXAlignment = Enum.TextXAlignment.Left
EnvIndicator.AutomaticSize = Enum.AutomaticSize.X

local OriginalAbsoluteSize = ClientLog.AbsoluteCanvasSize.Y
local ErrorColor = Color3.fromRGB(255, 0, 0)
local WarningColor = Color3.fromRGB(255, 170, 0)
local OutputColor = Color3.fromRGB(255, 255, 255)
local InfoColor = Color3.fromRGB(0, 85, 255)

local debounce = false
ClientLog.Changed:Connect(function(property)
	if debounce then
		debounce = false
		return
	end
	if property ~= "CanvasPosition" then
		ClientLog.CanvasPosition = Vector2.new(ClientLog.CanvasPosition.X, ClientLog.AbsoluteCanvasSize.Y - OriginalAbsoluteSize)
	end
end)

local function OutputText(Message, Type, Prefix, Color)
	if Type == Enum.MessageType.MessageError then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = ErrorColor
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "🛑 "..Message
		TextLabel.TextColor3 = ErrorColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.RichText = true
	elseif Type == Enum.MessageType.MessageWarning then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = WarningColor
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "⚠️ "..Message
		TextLabel.TextColor3 = WarningColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
	elseif Type == Enum.MessageType.MessageOutput then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = Message
		TextLabel.TextColor3 = OutputColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
	elseif Type == Enum.MessageType.MessageInfo then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = Message
		TextLabel.TextColor3 = InfoColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
	elseif Type == "Custom" then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = Message
		TextLabel.TextColor3 = Color
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
	else
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = Message
		TextLabel.TextColor3 = OutputColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
	end
end

-- Prompt Setup
connections[#connections+1] = TextBox.FocusLost:Connect(function(enter)
	if enter then
		if TextBox.Text == "y" then
			TextBox.Text = ""
			TextBox:ReleaseFocus()
			Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,60), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
			Terminal:TweenPosition(UDim2.new(0.5,0,1,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
			wait(0.5)
			DefaultState.Visible = true
			PromptState.Visible = false
			CmdBar:CaptureFocus()
			OutputText("Bootstrap version 0.8b - (c) Ooflet", Enum.MessageType.MessageOutput)
		elseif TextBox.Text == "n" then
			IsStarted = true
			TextBox.Text = ""
			TextBox:ReleaseFocus()
			Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,60), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
			wait(0.5)
			DefaultState.Visible = true
			PromptState.Visible = false
			Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
		else
			TextBox.Text = ""
			TextBox:CaptureFocus()
		end
	end
end)

-- Terminal Scripts

CmdBar.FocusLost:Connect(function(enter)
	if enter then
		CommandBar.Visible = false
		OutputText("> "..CmdBar.Text)
		wait()
		CmdBar:CaptureFocus()
		local command = CmdBar.Text
		command = string.split(command, " ")
		CmdBar.Text = ""
		if command[1] == "help" then
			OutputText("System\ncontinue - Continues and launches Kommand.\nexit - Exits out of Bootstrapp and does not launch Kommand.\n\nDebug\nupdate <bool> - Sets the update variable.\n\nModule Library\ninstall <moduleLink> <name*> - Installs a module provided with the moduleLink argument. If no name is provided, it will use moduleLink as the module's name.\nuninstall <name> - Uninstalls module with the provided name.\n\nAny commands other than these will be executed as Lua scripts.")
		elseif command[1] == "continue" then
			Terminal:TweenPosition(UDim2.new(0.5,0,1,400), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
			wait(0.5)
			IsStarted = true
		elseif command[1] == "exit" then
			Terminal:TweenPosition(UDim2.new(0.5,0,1,400), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
			for _, connection in pairs(connections) do
				connection:Disconnect()
			end		
			wait(0.5)
			Terminal:Destroy()
		elseif command[1] == "update" then
			OutputText("Setting Update to "..tostring(command[2]))
			if command[2] == "true" then
				Update = true
				OutputText("Succesfully ran")
			elseif command[2] == "false" then
				Update = false
				OutputText("Succesfully ran")
			else
				OutputText("Failed to set Update to "..tostring(command[2])..". Note that argument 2 must be a bool (true/false).", Enum.MessageType.MessageError)
			end
			
		elseif command[1] == "install" then
			local name = command[3] or command[2]
			if command[2] == nil then
				OutputText("Argument 2 (moduleLink) must not be empty!", Enum.MessageType.MessageError)			
			else
				OutputText("Downloading module from "..tostring(command[2]).." with name "..tostring(command[3]).."...")
				local success, err = pcall(function() writefile("kommand/modules/"..name, game:HttpGet(command[2])) end)
				if success then 
					OutputText("Succesfully downloaded module")
				else
					OutputText("Failed to download module; "..err, Enum.MessageType.MessageError)
				end		
			end

		elseif command[1] == "uninstall" then
			if command[2] ~= nil then
				if isfile("kommand/modules/"..command[2]) then
					delfile("kommand/modules/"..command[2])
					OutputText("Successfully uninstalled module.")
				else
					OutputText("Failed to uninstall module! The module was most likely not found, double check to see if the module name is correctly spelt (it is case sensitive).", Enum.MessageType.MessageError)
				end
			else
				OutputText("Argument 2 (name) must not be empty!", Enum.MessageType.MessageError)
			end
		else
			command = table.concat(command, " ")
			local success, err = pcall(function() loadstring(command)() end)
			if success then
				
				OutputText("Successfully ran.")
			else
				
				local success, err = pcall(function() OutputText("Error occured during execution: "..err, Enum.MessageType.MessageError) end)
				if not success then 
					OutputText("Error occured during execution.", Enum.MessageType.MessageError)	
				end
			end
		end
		CommandBar.Visible = true
	end
end)

-- Bootstrap Scripts

if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
	Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
	DefaultState.Visible = false
	PromptState.Visible = true
	TextBox:CaptureFocus()
	repeat wait() until IsStarted
end

if Update then
	Status.Text = "Checking Kommand Framework"
	Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
	wait(0.5)
	local framework, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") end)
	if not framework then
		Status.Text = "Could not fetch data from https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua. "..message
		ThrobberError()
		error()
	end
	local library, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") end)
	if not library then
		Status.Text = "Could not fetch data from https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua. "..message
		ThrobberError()
		error()
	end
		if isfile("kommand/framework/kommandframework.kmd") then
		if readfile("kommand/framework/kommandframework.kmd") ~= game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") then
			Status.Text = "Updating Kommand Framework..."
			wait(0.1)
			delfile("kommand/framework/kommandframework.kmd")
			writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))	
			Status.Text = "Checking Kommand Library..."
		else
			Status.Text = "Checking Kommand Library..."
		end
	else
		Status.Text = "Installing Kommand Framework..."
		wait(0.1)
		makefolder("kommand")
		makefolder("kommand/framework")
		writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))
		Status.Text = "Checking Kommand Library.."
	end
	if isfile("kommand/library/kommandlibrary.kmd") then
		if readfile("kommand/library/kommandlibrary.kmd") ~= game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") then
			Status.Text = "Updating Kommand Library..."
			wait(0.1)
			delfile("kommand/library/kommandlibrary.kmd")
			writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
			Status.Text = "Initializing..."
		else
			Status.Text = "Initializing..."
		end
	else
		Status.Text = "Installing Kommand Library..."
		wait(0.1)
		makefolder("kommand/library")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
		Status.Text = "Initializing..."
	end
	wait(0.1)
end
IsLoaded = true
Status.Text = "Initializing..."
if game.CoreGui:FindFirstChild("Kommand") then
	ThrobberError("Kommand is already executed!")
else
	Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,60), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
	wait(0.5)
	for _, connection in pairs(connections) do
		connection:Disconnect()
	 end		
	BootstrapScreenGUI:Destroy()
	spawn(function()
		loadstring(readfile("kommand/library/kommandlibrary.kmd"))()	
	end)
	spawn(function()
		loadstring(readfile("kommand/framework/kommandframework.kmd"))()		
	end)
end
