-- Bootstrap GUI
-- Ooflet

-- GUI Setup

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
PromptText.Text = "Run CMD Bootstrapper?"
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
			Fill:TweenPosition(UDim2.new(1,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true)
			wait(0.5)
			Fill.Position = UDim2.new(-1,0,0,0)
		end)
    end
end)

local function ThrobberError()
	FillError:TweenPosition(UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true)
    StatusFail = true
    wait(5)
    Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,60), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
    wait(0.5)
    BootstrapScreenGUI:Destroy()
end

wait(0.5)

-- Bootstrap Setup
TextBox.Changed:Connect(function(property)
	if property == "Text" then
		if TextBox.Text == "y" then
			BootstrapScreenGUI:Destroy()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/bootstrapCMD.lua"))()
		elseif TextBox.Text == "n" then
			BootstrapScreenGUI:Destroy()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/bootstrap.lua"))()
		else
			TextBox.Text = ""
			wait()
			TextBox:CaptureFocus()
		end
	end
end)

if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
	Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
	DefaultState.Visible = false
	PromptState.Visible = true
	TextBox:CaptureFocus()
else
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
			delfile("kommand/framework/kommandframework.kmd")
			writefile("kommand/framework/kommandframework.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandFramework.lua"))	
			Status.Text = "Checking Kommand Library..."
		else
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
		else
			Status.Text = "Initializing..."
		end
	else
		Status.Text = "Installing Kommand Library..."
		makefolder("kommand/library")
		writefile("kommand/library/kommandlibrary.kmd", game:HttpGet("https://raw.githubusercontent.com/ooflet/kommand/main/framework/KommandLibrary.lua"))
		Status.Text = "Initializing..."
	end

	IsLoaded = true

	if game.CoreGui:FindFirstChild("Kommand") then
		ThrobberError()
		Status.Text = "Kommand is already executed!"
	end

	Bootstrapper:TweenPosition(UDim2.new(0.5,0,1,60), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
	wait(0.5)
	BootstrapScreenGUI:Destroy()
	spawn(function()
		loadstring(readfile("kommand/library/kommandlibrary.kmd"))()	
	end)
	spawn(function()
		loadstring(readfile("kommand/framework/kommandframework.kmd"))()		
	end)
end
