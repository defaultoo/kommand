-- Bootstrap GUI
-- Ooflet

-- GUI Setup

local StatusFail = false
local BootstrapScreenGUI = Instance.new("ScreenGui")
local Bootstrapper = Instance.new("Frame")
local Status = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local Throbber = Instance.new("Frame")
local Fill = Instance.new("Frame")

BootstrapScreenGUI.Name = "KmdBootstrap"
BootstrapScreenGUI.Parent = game:GetService("CoreGui")

Bootstrapper.Name = "Bootstrapper"
Bootstrapper.Parent = BootstrapScreenGUI
Bootstrapper.AnchorPoint = Vector2.new(0.5, 1)
Bootstrapper.BorderSizePixel = 0
Bootstrapper.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Bootstrapper.BackgroundTransparency = 0.025
Bootstrapper.Position = UDim2.new(0.5, 0, 1, 50)
Bootstrapper.Size = UDim2.new(0, 275, 0, 50)

Status.Name = "Status"
Status.Parent = Bootstrapper
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.Size = UDim2.new(1, 0, 0.349999994, 0)
Status.Font = Enum.Font.RobotoMono
Status.Text = "Updating Kommand framework"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 16.000
Status.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = Bootstrapper
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 15)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 15)

Throbber.Name = "Throbber"
Throbber.Parent = Bootstrapper
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

-- Throbber Animation
spawn(function()
    while not StatusFail do
        Fill:TweenPosition(UDim2.new(1,0,0,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.5, true)
        wait(0.25)
        Fill.Position = UDim2.new(-1,0,0,0)
        Fill:TweenPosition(UDim2.new(1,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true)
        wait(0.5)
        Fill.Position = UDim2.new(-1,0,0,0)
    end
end)

local function ThrobberError()
    StatusFail = true
    Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Fill.Position = UDim2.new(-1,0,0,0)
    Fill:TweenPosition(UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true)
    wait(5)
    Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,50), Enum.EasingDirection.InOUt, Enum.EasingStyle.Quad, 0.5, true)
    wait(0.5)
    BootstrapScreenGUI:Destroy()
end

-- Bootstrap Setup
Status.Text = "Checking Kommand Framework"
Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,0), Enum.EasingDirection.InOUt, Enum.EasingStyle.Quad, 0.5, true)
wait(0.5)

local framework, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") end)
if not framework then
	Status.Text = "Could not fetch data from https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua. "..message
	error()
end

local library, message = pcall(function() module = game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") end)
if not library then
	Status.Text = "Could not fetch data from https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua. "..message
	error()
end

if isfile("kommand/framework/kommandframework.kmd") then
	if readfile("kommand/framework/kommandframework.kmd") ~= game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua") then
		Status.Text = "Updating Kommand Framework..."
		delfile("kommand/framework/kommandframework.kmd")
		writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))	
		Status.Text = "Checking Kommand Library..."
	end
else
	Status.Text = "Installing Kommand Framework..."
	makefolder("kommand")
	makefolder("kommand/framework")
	writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))
    Status.Text = "Checking Kommand Library.."
end

if isfile("kommand/library/kommandlibrary.kmd") then
	if readfile("kommand/library/kommandlibrary.kmd") ~= game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua") then
		Status.Text = "Updating Kommand Library..."
		delfile("kommand/library/kommandlibrary.kmd")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
        Status.Text = "Initializing..."
	end
else
	Status.Text = "Installing Kommand Library..."
	makefolder("kommand/library")
	writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
    Status.Text = "Initializing..."
end

wait(0.5)

Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,50), Enum.EasingDirection.InOUt, Enum.EasingStyle.Quad, 0.5, true)
wait(0.5)
BootstrapScreenGUI:Destroy()
spawn(function()
    loadstring(readfile("kommand/library/kommandlibrary.kmd"))()	
end)
spawn(function()
    loadstring(readfile("kommand/framework/kommandframework.kmd"))()		
end)
