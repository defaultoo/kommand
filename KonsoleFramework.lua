-- Konsole
-- Ooflet 2022
																																				--[[
no balls :skull:
																																				--]]
----------------------------------------------------------------------
-- GUI Setup --
----------------------------------------------------------------------

local Konsole = Instance.new("ScreenGui")
local BlurEffect = Instance.new("Folder")
local ConsoleWindow = Instance.new("ImageLabel")
local Blur = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Exit = Instance.new("TextButton")
local UIPadding = Instance.new("UIPadding")
local Title = Instance.new("TextLabel")
local UIPadding_2 = Instance.new("UIPadding")
local Console = Instance.new("Frame")
local ClientLog = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local CommandBar = Instance.new("Frame")
local CmdBar = Instance.new("TextBox")
local EnvIndicator = Instance.new("TextLabel")

Konsole.Name = "Konsole"
Konsole.Parent = game:GetService("CoreGui")
Konsole.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BlurEffect.Name = "BlurEffect"
BlurEffect.Parent = game.StarterGui.Konsole.Blur

ConsoleWindow.Name = "ConsoleWindow"
ConsoleWindow.Parent = Konsole
ConsoleWindow.AnchorPoint = Vector2.new(0.5, 0.5)
ConsoleWindow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ConsoleWindow.BackgroundTransparency = 0.200
ConsoleWindow.BorderSizePixel = 0
ConsoleWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
ConsoleWindow.Size = UDim2.new(0, 800, 0, 550)
ConsoleWindow.Image = "rbxassetid://9823958365"
ConsoleWindow.ImageTransparency = 1.000

Blur.Name = "Blur"
Blur.Parent = ConsoleWindow
Blur.AnchorPoint = Vector2.new(0.5, 0.5)
Blur.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Blur.BackgroundTransparency = 1.000
Blur.Position = UDim2.new(0.5, 0, 0.5, 0)
Blur.Size = UDim2.new(0, 780, 0, 530)

TopBar.Name = "TopBar"
TopBar.Parent = ConsoleWindow
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1.000
TopBar.Size = UDim2.new(1, 0, 1, 0)

Exit.Name = "Exit"
Exit.Parent = TopBar
Exit.Active = false
Exit.AnchorPoint = Vector2.new(1, 0)
Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit.BackgroundTransparency = 1.000
Exit.Position = UDim2.new(1, -10, 0, 10)
Exit.Selectable = false
Exit.Size = UDim2.new(0, 30, 0, 25)
Exit.Font = Enum.Font.GothamMedium
Exit.Text = "X"
Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
Exit.TextSize = 20.000

UIPadding.Parent = Exit
UIPadding.PaddingTop = UDim.new(0, 5)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 10, 0, 10)
Title.Size = UDim2.new(0, 200, 0, 25)
Title.Font = Enum.Font.GothamMedium
Title.Text = "Konsole"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000
Title.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_2.Parent = Title
UIPadding_2.PaddingLeft = UDim.new(0, 10)
UIPadding_2.PaddingRight = UDim.new(0, 10)
UIPadding_2.PaddingTop = UDim.new(0, 5)

Console.Name = "Console"
Console.Parent = ConsoleWindow
Console.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Console.BackgroundTransparency = 1.000
Console.Size = UDim2.new(1, 0, 1, 0)

ClientLog.Name = "ClientLog"
ClientLog.Parent = Console
ClientLog.Active = true
ClientLog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClientLog.BackgroundTransparency = 1.000
ClientLog.BorderSizePixel = 0
ClientLog.Position = UDim2.new(0.0250000004, 0, 0.0649999976, 10)
ClientLog.Size = UDim2.new(0, 765, 0, 460)
ClientLog.CanvasSize = UDim2.new(0, 0, 0, 0)
ClientLog.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = ClientLog
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

CommandBar.Name = "CommandBar"
CommandBar.Parent = Console
CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.BackgroundTransparency = 1.000
CommandBar.Size = UDim2.new(1, 0, 1, 0)

CmdBar.Name = "CmdBar"
CmdBar.Parent = CommandBar
CmdBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdBar.BackgroundTransparency = 1.000
CmdBar.Position = UDim2.new(0.0500000007, 0, 0.944999993, -5)
CmdBar.Size = UDim2.new(0, 750, 0, 25)
CmdBar.Font = Enum.Font.RobotoMono
CmdBar.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
CmdBar.PlaceholderText = "Input Command (\\)"
CmdBar.Text = ""
CmdBar.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBar.TextSize = 16.000
CmdBar.TextWrapped = true
CmdBar.TextXAlignment = Enum.TextXAlignment.Left

EnvIndicator.Name = "EnvIndicator"
EnvIndicator.Parent = CommandBar
EnvIndicator.Active = true
EnvIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EnvIndicator.BackgroundTransparency = 1.000
EnvIndicator.Position = UDim2.new(0.0250000004, 0, 0.944999993, -5)
EnvIndicator.Selectable = true
EnvIndicator.Size = UDim2.new(0, 25, 0, 25)
EnvIndicator.Font = Enum.Font.RobotoMono
EnvIndicator.Text = ">"
EnvIndicator.TextColor3 = Color3.fromRGB(255, 255, 255)
EnvIndicator.TextSize = 16.000
EnvIndicator.TextXAlignment = Enum.TextXAlignment.Left

----------------------------------------------------------------------
-- Blur Setup --
----------------------------------------------------------------------

local RunService = game:GetService'RunService'
local camera = workspace.CurrentCamera

do
	local function IsNotNaN(x)
		return x == x
	end
	local continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
	while not continue do
		RunService.RenderStepped:wait()
		continue = IsNotNaN(camera:ScreenPointToRay(0,0).Origin.x)
	end
end

local binds = {}
local root = Instance.new('Folder', camera)
root.Name = 'blur'


local GenUid; do -- Generate unique names for RenderStepped bindings
	local id = 0
	function GenUid()
		id = id + 1
		return 'neon::'..tostring(id)
	end
end

local DrawQuad; do
	local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
	local sz = 0.2

	function DrawTriangle(v1, v2, v3, p0, p1) -- I think Stravant wrote this function
		local s1 = (v1 - v2).magnitude
		local s2 = (v2 - v3).magnitude
		local s3 = (v3 - v1).magnitude
		local smax = max(s1, s2, s3)
		local A, B, C
		if s1 == smax then
			A, B, C = v1, v2, v3
		elseif s2 == smax then
			A, B, C = v2, v3, v1
		elseif s3 == smax then
			A, B, C = v3, v1, v2
		end

		local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
		local perp = sqrt((C-A).magnitude^2 - para*para)
		local dif_para = (A - B).magnitude - para

		local st = CFrame.new(B, A)
		local za = CFrame.Angles(pi/2,0,0)

		local cf0 = st

		local Top_Look = (cf0 * za).lookVector
		local Mid_Point = A + CFrame.new(A, B).lookVector * para
		local Needed_Look = CFrame.new(Mid_Point, C).lookVector
		local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

		local ac = CFrame.Angles(0, 0, acos(dot))

		cf0 = cf0 * ac
		if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
			cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
		end
		cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

		local cf1 = st * ac * CFrame.Angles(0, pi, 0)
		if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
			cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
		end
		cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

		if not p0 then
			p0 = Instance.new('Part')
			p0.FormFactor = 'Custom'
			p0.TopSurface = 0
			p0.BottomSurface = 0
			p0.Anchored = true
			p0.CanCollide = false
			p0.Material = 'Glass'
			p0.Size = Vector3.new(sz, sz, sz)
			local mesh = Instance.new('SpecialMesh', p0)
			mesh.MeshType = 2
			mesh.Name = 'WedgeMesh'
		end
		p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
		p0.CFrame = cf0

		if not p1 then
			p1 = p0:clone()
		end
		p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
		p1.CFrame = cf1

		return p0, p1
	end

	function DrawQuad(v1, v2, v3, v4, parts)
		parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
		parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
	end
end

local function BindFrame(frame, properties)
	if binds[frame] then
		return binds[frame].parts
	end

	local uid = GenUid()
	local parts = {}
	local f = Instance.new('Folder', root)
	f.Name = frame.Name

	local parents = {} -- construct hierarchy tree for rotation
	do
		local function add(child)
			if child:IsA'GuiObject' then
				parents[#parents + 1] = child
				add(child.Parent)
			end
		end
		add(frame)
	end

	local function UpdateOrientation(fetchProps)
		local zIndex = 1 - 0.05*frame.ZIndex
		-- the transparency inversion bug still surfaces when there's z-fighting
		local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
		local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
		do
			local rot = 0;
			for _, v in ipairs(parents) do
				rot = rot + v.Rotation
			end
			if rot ~= 0 and rot%180 ~= 0 then
				local mid = tl:lerp(br, 0.5)
				local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
				local vec = tl
				tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
				tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
				bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
				br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
			end
		end
		DrawQuad(
			camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
			camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
			camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
			camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
			parts
		)
		if fetchProps then
			for _, pt in pairs(parts) do
				pt.Parent = f
			end
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end
	end

	UpdateOrientation(true)
	RunService:BindToRenderStep(uid, 2000, UpdateOrientation)

	binds[frame] = {
		uid = uid;
		parts = parts;
	}
	return binds[frame].parts
end

-- Applies the `properties` table to bound parts.

-- Removes the part binding from a gui object if one exists.
local function UnbindFrame(frame)
	local cb = binds[frame]
	if cb then
		RunService:UnbindFromRenderStep(cb.uid)
		for _, v in pairs(cb.parts) do
			v:Destroy()
		end
		binds[frame] = nil
	else
		warn(('No part bindings exist for %s'):format(frame:GetFullName()))
	end
end

-- Returns true if a part binding exists for the gui object.
local function HasBinding(frame)
	return binds[frame] ~= nil
end

-- Returns an array using this.
local function GetBoundParts(frame)
	return binds[frame] and binds[frame].parts
end

local function Modify(frame, properties)
	local parts = GetBoundParts(frame)
	if parts then
		for propName, propValue in pairs(properties) do
			for _, pt in pairs(parts) do
				pt[propName] = propValue
			end
		end
	else
		warn(('No part bindings exist for %s'):format(frame:GetFullName()))
	end
end

local userSettings = UserSettings().GameSettings
local qualityLevel = userSettings.SavedQualityLevel.Value

if qualityLevel > 7 then
	local UIBlur = Instance.new("DepthOfFieldEffect")
	UIBlur.Name = "ConsoleBlur"
	UIBlur.FarIntensity = 0
	UIBlur.FocusDistance = 51.6
	UIBlur.InFocusRadius = 50
	UIBlur.NearIntensity = 1	
	game.Lighting:FindFirstChild("ConsoleBlur").Enabled = true
	BindFrame(Blur, {
		Transparency = 0.98,
		BrickColor = BrickColor.new('Institutional white')
	})
end

----------------------------------------------------------------------
-- Dragger Setup --
----------------------------------------------------------------------

local UserInputService = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local CanDrag = false
local gui = ConsoleWindow
ConsoleWindow.MouseEnter:Connect(function()
	CanDrag = true
end)
ConsoleWindow.MouseLeave:Connect(function()
	CanDrag = false
end)
local dragging
local dragInput
local dragStart
local startPos
local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if CanDrag == true then
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

----------------------------------------------------------------------
-- Console Setup --
----------------------------------------------------------------------

print("<b>Welcome to Konsole!</b> Type help or ? for help.")

game:GetService("LogService").MessageOut:Connect(function(Message, Type)
	if Type == Enum.MessageType.MessageError then
		local TextLabel = Instance.new("TextLabel")

		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "🛑 "..Message
		TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		for i = 1,0,-0.1 do
			wait(0.01)
			TextLabel.TextTransparency = i
		end
	elseif Type == Enum.MessageType.MessageWarning then
		local TextLabel = Instance.new("TextLabel")

		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "⚠️ "..Message
		TextLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		for i = 1,0,-0.1 do
			wait(0.01)
			TextLabel.TextTransparency = i
		end
	elseif Type == Enum.MessageType.MessageOutput then
		local TextLabel = Instance.new("TextLabel")

		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		for i = 1,0,-0.1 do
			wait(0.01)
			TextLabel.TextTransparency = i
		end
	elseif Type == Enum.MessageType.MessageInfo then
		local TextLabel = Instance.new("TextLabel")

		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		for i = 1,0,-0.1 do
			wait(0.01)
			TextLabel.TextTransparency = i
		end
	end
end)

----------------------------------------------------------------------
-- Command Bar Setup --
----------------------------------------------------------------------

local function SearchForCommand(cmd)
	local TextboxLength = string.len(CommandBar.Text)
	local CommandLength = string.len(cmd)
	pcall(function()
		match = string.find(cmd, CommandBar.Text)
	end)
	if match and TextboxLength == CommandLength then 
		return true
	else
		return false
	end
end

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.BackSlash then
		wait(0.05)
		CmdBar:CaptureFocus()
	end
	if input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
		--
	end
end)

CmdBar.Changed:Connect(function(property)
	if SearchForCommand("*") then
		EnvIndicator.Text = "*"
		CmdBar.PlaceholderText = "In system command mode. Lua functions will not work. Type '>' to return."
		CmdBar.Text = ""
	elseif SearchForCommand(">") then
		EnvIndicator.Text = ">"
		CmdBar.PlaceholderText = "Input Command"
		CmdBar.Text = ""
	elseif SearchForCommand("help") or SearchForCommand("?") then
		EnvIndicator.Text = "?"
		CmdBar.PlaceholderText = "In help mode. Press enter to show all commands. Type '>' to return."
		CmdBar.Text = ""	
	elseif SearchForCommand("!") then
		EnvIndicator.Text = "!"
		CmdBar.PlaceholderText = "In special command mode. Input a custom or debug command. Type '>' to return"
		CmdBar.Text = ""	
	elseif SearchForCommand("clr") or SearchForCommand("clear") then
		for _, v in pairs(ClientLog:GetDescendants()) do
			if v:IsA("TextLabel") then
				v:Destroy()
			end
		end
		CmdBar.Text = ""	
	end
end)

CmdBar.FocusLost:Connect(function(pressed)
	if pressed then
		loadstring(CmdBar.Text)
		CmdBar.Text = ""
	end
end)

Exit.MouseButton1Click:Connect(function()
	Konsole.Enabled = false
	UnbindFrame(Blur)
	game.Lighting:FindFirstChild("ConsoleBlur").Enabled = false
end)
