
----------------------------------------[[ Others ]]----------------------------------------
--[[if getgenv().HasExecuted then
	return 
end
if not getgenv().HasExecuted then
getgenv().HasExecuted = true
queue_on_teleport("loadstring(game:HttpGet())()")
end]]
if not game.IsLoaded then
	game.Loaded:Wait()
end

local g = game
local PlaceId = g.PlaceId
local JobId = g.JobId

local w = workspace
local Map = w:WaitForChild("Map")

local Players = g:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Username = LocalPlayer.Name
local Data = LocalPlayer:WaitForChild("Data")
local PlayerGui = LocalPlayer.PlayerGui

local ReplicatedStorage = g:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local TeleportService = g:GetService("TeleportService")

local CoreGui = g:GetService("CoreGui")

local HttpService = g:GetService("HttpService")

local RunService = g:GetService("RunService")

local RootFolder = "Vortex Hub"
local MainFolder = "Main"
local FilePrefix = "Vortex Settings"
local FirstFolderPath = RootFolder.."/"..MainFolder
local GameNameFolder = "Blox Fruits - Aimbot"
local SecondFolderPath = FirstFolderPath.."/"..GameNameFolder
local SaveFile = SecondFolderPath.."/"..FilePrefix.." - "..Username..".json"

S = {
	-- Player --
	["Select Walk Speed"] = 300,
	["Select Dash Length"] = 200,
	["Walk On Water"] = true,
	-- Visual --
}

function EncryptData(Data)
    return HttpService:JSONEncode(Data)
end
function DecryptData(Data)
    return HttpService:JSONDecode(Data)
end
function SS()
    task.spawn(function()
        local DataEncrypted = EncryptData(S)
        if writefile and makefolder then
            if not isfolder(RootFolder) then makefolder(RootFolder) end
            if not isfolder(FirstFolderPath) then makefolder(FirstFolderPath) end
            if not isfolder(SecondFolderPath) then makefolder(SecondFolderPath) end
            writefile(SaveFile, DataEncrypted)
        end
    end)
end
function LoadSettings()
    if isfile and readfile and isfile(SaveFile) then
        local SuccessRead, DataEncrypted = pcall(readfile, SaveFile)
        if SuccessRead then
            local SuccessDecode, DataDecoded = pcall(DecryptData, DataEncrypted)
            if SuccessDecode then
                for K, V in pairs(DataDecoded) do
                    S[K] = V
                end
            end
        else
            SS()
        end
    else
        SS()
    end
end
LoadSettings()

----------------------------------------[[ Universal ]]----------------------------------------

Sea1 = table.find({2753915549}, PlaceId)
Sea2 = table.find({4442272183, 79091703265657}, PlaceId)
Sea3 = table.find({7449423635, 100117331123089}, PlaceId)

function ErrorPrompt(Func)
	task.spawn(function()
		local success, result = pcall(Func)
		if not success then
			if not w:FindFirstChild("Message") then
				local Message = Instance.new("Message")
				Message.Parent = w
				Message.Text = tostring(result)
				if getgenv().RunHeartbeat then
					getgenv().RunHeartbeat:Disconnect()
				end
				error(result)
			end
		end
	end)
end

CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v)
	if v.Name == "ErrorPrompt" then
		RunService.Heartbeat:Connect(function() TeleportService:TeleportToPlaceInstance(PlaceId, JobId) end)
	end
end)

LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton1(Vector2.new(math.huge, math.huge))
    task.wait(600)
end)

Teams = {
	["Pirates"] = "rgb(255, 89, 89)",
	["Marines"] = "rgb(175, 221, 255)"
}

function ResolvePos(X)
	if typeof(X) == "CFrame" then
		return X.Position
	elseif typeof(X) == "Instance" then
		if X.GetPivot then
			return X:GetPivot().Position
		elseif X:IsA("BasePart") then
			return X.Position
		end
	elseif typeof(X) == "Vector3" then
		return X
	end
end
function GetDistance(A, B)
	local PosA = ResolvePos(A)
	local PosB = ResolvePos(B) or (HRP and HRP.Position)
	if PosA and PosB then
		return (PosA - PosB).Magnitude
	end
end

function GetRoot(Model)
	if not Model or not Model:IsA("Model") then
		return nil
	end
	if not Model.PrimaryPart then
		Model.PrimaryPart = Model:FindFirstChildWhichIsA("BasePart", true)
	end
	return Model.PrimaryPart
end

function IsAlive(Model)
	if not Model or not Model:IsA("Model") then
		return false
	end
	local Humanoid = Model:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		return false
	end
	return Humanoid.Health > 0
end

function IsValid(Enemy)
	if not Enemy or not Enemy:IsA("Model") then
		return false
	end
	if not GetRoot(Enemy) then
		return false
	end
	if not IsAlive(Enemy) then
		return false
	end
	local Parent = Enemy.Parent
	if not Parent then
		return false
	end
	if Parent.Name ~= "Enemies" and Parent.Name ~= "ReplicatedStorage" and Parent.Name ~= "Characters" then
		return false
	end
	return true
end

function IsAlly(otherPlayer)
    if not otherPlayer or not LocalPlayer then return false end
    if LocalPlayer.Team and otherPlayer.Team then
        if LocalPlayer.Team.Name == "Marines" and otherPlayer.Team.Name == "Marines" then
            return true
        end
    end
    local tagForOther = "Ally" .. otherPlayer.Name
    local tagForLocal = "Ally" .. LocalPlayer.Name
    local hasLocalTag = LocalPlayer:HasTag(tagForOther)
    if hasLocalTag then
        hasLocalTag = otherPlayer:HasTag(tagForLocal)
    end
    return hasLocalTag
end

----------------------------------------[[ Stack Farm ]]----------------------------------------

function ChangeWalkSpeed()
	if getgenv().ChangeWalkSpeed and getgenv().SelectWalkSpeed then
		Char:SetAttribute("SpeedMultiplier", getgenv().SelectWalkSpeed/38)
	else
		Char:SetAttribute("SpeedMultiplier", 1.3)
	end
end
function ChangeDashLength()
	if getgenv().ChangeDashLength and getgenv().SelectDashLength  then
		Char:SetAttribute("DashLength", getgenv().SelectDashLength)
		Char:SetAttribute("DashLengthAir", getgenv().SelectDashLength)
	else
		Char:SetAttribute("DashLength", 1)
		Char:SetAttribute("DashLengthAir", 1)
	end
end
function WalkOnWater()
	if getgenv().WalkOnWater then
        Map:WaitForChild("WaterBase-Plane").Size = Vector3.new(1000, 113, 1000)
    else
        Map:WaitForChild("WaterBase-Plane").Size = Vector3.new(1000, 80, 1000)
    end
end

function AimbotSkill()
	local NearPlayer, MinDist = nil, math.huge
	for _, player in Players:GetPlayers() do
		if not IsAlly(player) and player.Character then
			local Dist = GetDistance(player.Character)
			if Dist < MinDist then
				MinDist = Dist
				NearPlayer = player.Character
			end
		end
	end
	if NearPlayer then
		require(ReplicatedStorage.Mouse).Hit = NearPlayer:GetPivot()
	end
end

---------------------------------------[[ Visual ]]---------------------------------------

function EspPlayers()
	local LocalChar = LocalPlayer.Character
	if not LocalChar then return end
	local LocalHead = LocalChar:FindFirstChild("Head")
	if not LocalHead then return end
	local AllPlayers = Players:GetPlayers()
	if not getgenv().ESPPlayers then
		for _, player in pairs(AllPlayers) do
			if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("Player ESP") then
				player.Character.Head["Player ESP"]:Destroy()
			end
		end
	end
	if getgenv().ESPPlayers then
		for _, player in pairs(AllPlayers) do
			if player ~= LocalPlayer then
				local DispName = player.DisplayName
				local Team = tostring(player.Team)
				local TeamColor = Teams[Team]
				local char = player.Character
				if not char then return end
				local Head = char:FindFirstChild("Head")
				if not Head then return end
				local Humanoid = char:FindFirstChildOfClass("Humanoid")
				if not Humanoid then return end
				local Energy =char:FindFirstChild("Energy")
				if not Energy then return end
				local Distance = math.floor(GetDistance(Head.Position)/5)
				local Text = string.format("<font color='%s'>%s</font> <font color='rgb(120, 120, 120)'>[%d]</font>\n<font color='rgb(0, 255, 0)'>[%d/%d]</font><font color='rgb(0, 200, 255)'>[%d/%d]</font>", TeamColor, DispName, Distance, math.floor(Humanoid.Health), Humanoid.MaxHealth, math.floor(Energy.Value), Energy.MaxValue)
				if not Head:FindFirstChild("Player ESP") then
					local Bill = Instance.new("BillboardGui", Head)
                    Bill.Name = "Player ESP"
                    Bill.Size = UDim2.new(0, 240, 0, 40)
                    Bill.Adornee = Head
                    Bill.AlwaysOnTop = true
                    --[[local Image = Instance.new("ImageLabel", Bill)
					Image.BackgroundTransparency = 1
					Image.BorderSizePixel = 0
					Image.Name = "Player Image"
					Image.Position = UDim2.fromOffset(93, -32)
					Image.Size = UDim2.fromOffset(40, 40)
					Image.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=150&height=150&format=png"]]
                    local Name = Instance.new("TextLabel", Bill)
	                Name.Name = "Label"
                    Name.Font = "FredokaOne"
                    Name.TextSize = 10
                    Name.RichText = true
                    Name.Text = Text
                    Name.Size = UDim2.new(1, 0, 1, 0)
                    Name.BackgroundTransparency = 1
                    Name.TextStrokeTransparency = 0
					Name.AutoLocalize = true
				else
					Head["Player ESP"].Label.Text = Text
				end
			end
		end
	end
end

----------------------------------------[[ Window ]]----------------------------------------

local Fluent, SaveManager, InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/Libraries/Fluent/Beta.lua"))()

local Window = Fluent:CreateWindow({
Title = "Astral Hub - Blox Fruits Aimbot",
SubTitle = "by Vortex Team",
Search = true,
Icon = "",
TabWidth = 160,
Size = UDim2.fromOffset(580, 380),
Acrylic = false,
Theme = "Dark",
MinimizeKey = Enum.KeyCode.LeftControl,
UserInfo = true,
UserInfoTop = false,
UserInfoTitle = DisplayName,
UserInfoSubtitle = "",
UserInfoSubtitleColor = Color3.fromRGB(255, 255, 255)
})

Fluent:CreateMinimizer({
Icon = "rbxassetid://89871160246856",
Acrylic = true,
Corner = 5,
Transparency = 0,
Draggable = true,
Size = UDim2.fromOffset(45, 45),
Position = UDim2.fromOffset(60, 10),
Visible = true,
})

Social = Window:AddTab({Title = "Social",  Icon = ""})
Player = Window:AddTab({Title = "Player", con = ""})
Visual = Window:AddTab({Title = "Visual", Icon = ""})

InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("Astral Hub")
InterfaceManager:BuildInterfaceSection(Social)
Window:SelectTab(1)

----------------------------------------[[ Social Media ]]----------------------------------------

local DiscordSection = Social : AddSection("Discord")
DiscordSection : AddButton({
Title = "Copy Discord Invite",
Description = "",
Callback = function()
setclipboard("https://discord.gg/xfgyxF8Mc3")
end})

---------------------------------------[[ Player ]]--------------------------------------

local PlayerSection = Player : AddSection("Player")
PlayerSection : AddSlider("Slider", {
Title = "Select Walk Speed",
Description = "",
Min = 10,
Max = 300,
Rounding = 10,
Default = S["Select Walk Speed"],
Callback = function(Value)
getgenv().SelectWalkSpeed = Value
S["Select Walk Speed"] = Value
SS()
end})
PlayerSection : AddToggle("Toggle", {
Title = "Change Walk Speed",
Description = "",
Default = S["Change Walk Speed"],
Callback = function(Value)
getgenv().ChangeWalkSpeed = Value
S["Change Walk Speed"] = Value
SS()
end})
PlayerSection : AddSlider("Slider", {
Title = "Select Dash Length",
Description = "",
Min = 1,
Max = 200,
Rounding = 5,
Default = S["Select Dash Length"],
Callback = function(Value)
getgenv().SelectDashLength = Value
S["Select Dash Length"] = Value
SS()
end})
PlayerSection : AddToggle("Toggle", {
Title = "Change Dash Length",
Description = "",
Default = S["Change Dash Length"],
Callback = function(Value)
getgenv().ChangeDashLength = Value
S["Change Dash Length"] = Value
SS()
end})
PlayerSection : AddToggle("Toggle", {
Title = "Walk On Water", 
Description = "",
Default = S["Walk On Water"],
Callback = function(Value)
getgenv().WalkOnWater = Value
S["Walk On Water"] = Value
SS()
end})

local AimbotSection = Player : AddSection("Aimbot")
AimbotSection : AddToggle("Toggle", {
Title = "Aimbot Skill",
Description = "",
Default = S["Aimbot Skill"],
Callback = function(Value)
getgenv().AimbotSkill = Value
S["Aimbot Skill"] = Value
SS()
end})

---------------------------------------[[ Visual ]]---------------------------------------

local ESPSection = Visual : AddSection("Extra Sensory Perception")
ESPSection : AddToggle("Toggle", {
Title = "ESP Players",
Description = "",
Default = S["ESP Players"],
Callback = function(Value)
getgenv().ESPPlayers = Value
S["ESP Players"] = Value
SS()
end})

----------------------------------------[[ Load ]]----------------------------------------

task.spawn(function()
	getgenv().RunHeartbeat = RunService.Heartbeat:Connect(function()
		Char = LocalPlayer.Character
	    if not Char then return end
	    Humanoid = Char:FindFirstChildOfClass("Humanoid")
	    HRP = Char:FindFirstChild("HumanoidRootPart")
	    Backpack = LocalPlayer:FindFirstChild("Backpack")
		if not Humanoid or not HRP or not Backpack then return end
		ErrorPrompt(EspPlayers)
		ErrorPrompt(ChangeWalkSpeed) ErrorPrompt(ChangeDashLength) ErrorPrompt(WalkOnWater)
		if getgenv().AimbotSkill then ErrorPrompt(AimbotSkill) end
	end)
end)

