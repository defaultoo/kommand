-- Please excuse my absolute fucking trash code

lib = {}
local ClientLog = game.CoreGui:WaitForChild("Kommand"):WaitForChild("ConsoleWindow"):WaitForChild("Console"):WaitForChild("ClientLog")

local ErrorColor = Color3.fromRGB(255, 0, 0)
local WarningColor = Color3.fromRGB(255, 170, 0)
local OutputColor = Color3.fromRGB(255, 255, 255)
local InfoColor = Color3.fromRGB(0, 85, 255)

function lib:Init()
function lib:OutputText(Message, Type, Prefix, Color)
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
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
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
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	elseif Type == Enum.MessageType.MessageOutput then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = OutputColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	elseif Type == Enum.MessageType.MessageInfo then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = InfoColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()	
	elseif Type == "Custom" then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = Color
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()	
	end
	end
end




return lib
