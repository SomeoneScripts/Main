	----------------------------------------[[ Others ]]----------------------------------------
	g = game
	
	w = workspace
	MaxLevel = w:GetAttribute("LEVEL_CAP")
	Boats = w.Boats
	ChestModels = w.ChestModels
	Enemies = w.Enemies
	Map = w.Map
	WorldOrigin = w._WorldOrigin
	Locations = WorldOrigin.Locations
	EnemySpawns = WorldOrigin.EnemySpawns
	if w:FindFirstChild("Rocks") then
		w.Rocks:Destroy()
	end
	
	Players = g:GetService("Players")
	LocalPlayer = Players.LocalPlayer
	UserId = LocalPlayer.UserId
	DisplayName = LocalPlayer.DisplayName
	Data = LocalPlayer.Data
	Backpack = LocalPlayer.Backpack
	PlayerGui = LocalPlayer.PlayerGui
	
	ReplicatedStorage = g:GetService("ReplicatedStorage")
	Remotes = ReplicatedStorage.Remotes
	
	CoreGui = g:GetService("CoreGui")
	
	Lighting = g:GetService("Lighting")
	
	TweenService = g:GetService("TweenService")
	
	RunService = g:GetService("RunService")
	
	UIS = g:GetService("UserInputService")
	
	TeleportService = g:GetService("TeleportService")
	
	HttpService = g:GetService("HttpService")
	
	MarketService = g:GetService("MarketplaceService")
	
	CollectionService = g:GetService("CollectionService")
	
	LocalizationService = g:GetService("LocalizationService")
	
	PlaceId = g.PlaceId
	JobId = g.JobId
	
	GameName = MarketService:GetProductInfo(PlaceId).Name
	
	Heartbeat = RunService.Heartbeat
	RenderStepped = RunService.RenderStepped
	Stepped = RunService.Stepped
	
	RootFolder = "Someone Hub"
	MainFolder = "Main"
	FilePrefix = "Settings"
	FirstFolderPath = RootFolder.."/"..MainFolder
	GameNameFolder = "Blox Fruits"
	SecondFolderPath = FirstFolderPath.."/"..GameNameFolder
	SaveFile = SecondFolderPath.."/"..FilePrefix.." - "..UserId..".json"
	
	S = {
		-- Settings --
		["Select Tool Tip"] = "Melee",
		["Tween Speed"] = 350,
		["Bring Enemies"] = true,
		["Auto Buso"] = true,
		["Auto Attack"] = true,
		["Select Team"] = "Pirates",
		["Ant Reset"] = true,
		-- Stats --
		
		-- Information --
		
		-- Main --
		
		-- Quests --
		
		-- SeaEvent --
		
		-- Fish --
		
		-- Fruits --
		
		-- Teleport --
		
		-- Player --
		["Walk On Water"] = true,
		-- Race --
		
		-- Shop --
		
		-- Visual --
		["Select Font"] = "Arimo",
		["Font Size"] = 15,
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
	
	Fluent = loadstring(g:HttpGet("https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/Libraries/Fluent/Beta.lua"))()
	
	task.spawn(function()
		if Settings and Settings["Boost FPS"] then
			if _G.FPSBoosted then return end
			_G.FPSBoosted = true
			setfpscap(math.huge)
			local L = Lighting
			local T = w.Terrain
			T.WaterWaveSize = 0
			T.WaterWaveSpeed = 0
			T.WaterReflectance = 0
			T.WaterTransparency = 0
			L.GlobalShadows = false
			L.ShadowSoftness = 0
			L.Brightness = 0
			settings().Rendering.QualityLevel = "Level01"
			w.StreamingEnabled = true
			local function LockProperty(Obj, Prop, Value)
				Obj[Prop] = Value
				Obj:GetPropertyChangedSignal(Prop):Connect(function()
					if Obj[Prop] ~= Value then
						Obj[Prop] = Value
					end
				end)
			end
			LockProperty(T, "WaterWaveSize", 0)
			LockProperty(T, "WaterWaveSpeed", 0)
			LockProperty(T, "WaterReflectance", 0)
			LockProperty(T, "WaterTransparency", 0)
			LockProperty(L, "GlobalShadows", false)
			LockProperty(L, "ShadowSoftness", 0)
			LockProperty(L, "Brightness", 0)
			LockProperty(settings().Rendering, "QualityLevel", "Level01")
			LockProperty(w, "StreamingEnabled", true)
			local function Optimize(V)
				if V:IsA("BasePart") then
					V.Material = "Plastic"
					V.Reflectance = 0
					V.CastShadow = false
				elseif V:IsA("Decal") or V:IsA("Texture") then
					V.Transparency = 1
				elseif V:IsA("Fire") or V:IsA("SpotLight") or V:IsA("Smoke") or V:IsA("Sparkles") or V:IsA("ParticleEmitter") or V:IsA("Trail") then
					V.Enabled = false
				elseif V:IsA("Explosion") then
					V.BlastPressure = 1
					V.BlastRadius = 1
				elseif V:IsA("Sound") then
					V.Volume = 0
					V.Playing = false
				elseif V:IsA("Accessory") or V.Name == "Pants" or V.Name == "Shirt" then
					V:Destroy()
				elseif V:IsA("BlurEffect") or V:IsA("SunRaysEffect") or V:IsA("ColorCorrectionEffect") or V:IsA("BloomEffect") or V:IsA("DepthOfFieldEffect") or V:IsA("Light") then
					V.Enabled = false
				end
			end
			for _, V in pairs(g:GetDescendants()) do
				Optimize(V)
			end
			g.DescendantAdded:Connect(Optimize)
		end
	end)
	
	Sea1 = PlaceId == 2753915549
	Sea2 = PlaceId == 4442272183
	Sea3 = PlaceId == 7449423635
	
	function CommF_(...)
		return Remotes.CommF_:InvokeServer(...)
	end
	
	if S["Auto Choose Team"] and LocalPlayer.Team == nil then
		CommF_("SetTeam", S["Select Team"])
		wait(3)
	end
	
	function Compile(ID)
		local Shift = math.random(1, 9)
		local Result = ""
		for c in ID:gmatch(".") do
			if c:match("%d") then
				local newNum = (tonumber(c) + Shift) % 10
				Result = Result .. newNum
			elseif c:match("%a") then
				local lower = c:lower()
				local index = Alphabet:find(lower)
				local newIndex = ((index + Shift - 1) % 26) + 1
				local newChar = Alphabet:sub(newIndex, newIndex)
				if c:match("%u") then
					newChar = newChar:upper()
				end
				Result = Result .. newChar
			end
		end
		return Result .. "-" .. Shift
	end
	
	function Decompile(CompiledID)
		local Shift = tonumber(CompiledID:match("-(%d)$"))
		local IDPart = CompiledID:sub(1, #CompiledID - 2)
		local Result = ""
		local Pattern = {8,4,4,4,12}
		local i = 1
		local k = 1
		for _,len in ipairs(Pattern) do
			if i > 1 then Result = Result .. "-" end
			Result = Result .. IDPart:sub(k, k+len-1)
			k = k + len
			i = i + 1
		end
		local Original = ""
		for c in Result:gmatch(".") do
			if c:match("%d") then
				local origNum = (tonumber(c) - Shift) % 10
				Original = Original .. origNum
			elseif c:match("%a") then
				local lower = c:lower()
				local index = Alphabet:find(lower)
				local newIndex = ((index - Shift - 1) % 26) + 1
				local newChar = Alphabet:sub(newIndex, newIndex)
				if c:match("%u") then
					newChar = newChar:upper()
				end
				Original = Original .. newChar
			else
				Original = Original .. c
			end
		end
		return Original
	end
	
	----------------------------------------[[ Universal ]]----------------------------------------
	
	function VerifyTool(Name)
		local Char = LocalPlayer.Character
		if not Char then return end
		local CTool = Char:FindFirstChild(Name)
		local BTool = Backpack:FindFirstChild(Name)
		if CTool then 
			return CTool
		end
		if BTool then
			return BTool
		end
		return nil
	end
	
	function GetTrueName(Name)
	    return Name:gsub("%s%[.*%]", "")
	end
	
	function VerifyNPC(Name)
		if Enemies:FindFirstChild(Name) and Enemies[Name]:FindFirstChildOfClass(Name) and Enemies[Name].Humanoid.Health > 0 then
			return Enemies[Name]
		end
		if ReplicatedStorage:FindFirstChild(Name) and ReplicatedStorage[Name]:FindFirstChildOfClass(Name) and ReplicatedStorage[Name].Humanoid.Health > 0 then
			return ReplicatedStorage[Name]
		end
		return false
	end
	
	if Sea3 then
		if Map then
			if not Map:FindFirstChild("Temple of Time") then
				local TempleClone = ReplicatedStorage.MapStash["Temple of Time"]:Clone()
				TempleClone.Parent = Map
			end
		end
	end
	
	LocalPlayer.Idled:connect(function()
		g:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), w.CurrentCamera.CFrame)
		wait(1)
		g:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), w.CurrentCamera.CFrame)
	end)
	
	function CheckItem(itemName, itemType)
		for _, v in pairs(CommF_("getInventory")) do
			if type(v) == "table" and v.Type == itemType and v.Name == itemName then
				return v.Count or true
				end
			end
		return false
	end
	
	function CheckSword(name)
		return CheckItem(name, "Sword")
	end
	
	function CheckMaterial(name)
		return CheckItem(name, "Material")
	end
	
	function CheckGun(name)
		return CheckItem(name, "Gun")
	end
	
	function CheckAccessory(name)
		return CheckItem(name, "Wear")
	end
	
	function CheckScroll(name)
		return CheckItem(name, "Scroll")
	end
	
	function CheckFruit(name)
		return CheckItem(name, "Fruit")
	end
	
	----------------------------------------[[ Settings ]]----------------------------------------
	
	function EquipTool(Name)
	    local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	    local Humanoid = Char:WaitForChild("Humanoid")
	    local Tool
	    if Name then
	        repeat task.wait() Tool = Backpack:FindFirstChild(Name) until Tool
	    else
	        repeat
	            for _, T in ipairs(Backpack:GetChildren()) do
	                if T:IsA("Tool") and T.ToolTip == _G.SelectToolTip then
	                    Tool = T
	                    break
	                end
	            end
	            task.wait()
	        until Tool or Char:FindFirstChildOfClass("Tool")
	    end
	    Humanoid:EquipTool(Tool)
	end
	
	function WorkerSpeak(...)
		return ReplicatedStorage.Modules.Net["RF/SubmarineWorkerSpeak"]:InvokeServer(...)
	end
	
	local HalloweenPortais = {
		[Vector3.new(-12856, 844, -10715)] = "Turtle Mountain",
		[Vector3.new(5288, 1005, 392)] = "Hydra Town",
		[Vector3.new(-10163, 331, -8320)] = "Turtle Entrance",
		[Vector3.new(-16456, 527, 436)] = "Tiki Outpost",
		[Vector3.new(379, 126, -12720)] = "Chocolate Land",
		[Vector3.new(-5502, 313, -2863)] = "Sea Castle",
		[Vector3.new(-9515, 142, 5534)] = "Haunted Castle",
		[Vector3.new(-342, 20, 5547)] = "Port",
		[Vector3.new(-2037, 9, -9948)] = "Peanut Land",
		[Vector3.new(4345, 565, -6159)] = "Great Tree",
		[Vector3.new(5020, 173, -2011)] = "Hydra Arena",
		[Vector3.new(-917, 56, -10858)] = "Ice Cream Land",
		[Vector3.new(-2098, 70, -12128)] = "Cake Land",
		[Vector3.new(-12007, 331, -9178)] = "Turtle Center",
	}
	
	local OldTarget = nil
	_G.Cancel = false	
	function Tween(targetPosition)
		if OldTarget ~= targetPosition then
			_G.Cancel = true
			OldTarget = targetPosition
		end
		_G.Cancel = false
		local LocalPlayer = Players.LocalPlayer
		local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
		local Humanoid = Character:WaitForChild("Humanoid")
		HumanoidRootPart.CanCollide = false
		if Humanoid.Sit then
			Humanoid.Sit = false
		end
		local function GetDistance()
			return (targetPosition - HumanoidRootPart.Position).Magnitude
		end
		if GetDistance() <= 200 then
			HumanoidRootPart.CFrame = CFrame.new(targetPosition)
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			return
		end
		local PortalPos = {}
		if Sea1 then
			PortalPos = {
				Vector3.new(-4652, 872, -1754),
				Vector3.new(-7895, 5547, -380),
				Vector3.new(61164, 5, 1820),
				Vector3.new(3865, 5, -1926)
			}
		elseif Sea2 then
			PortalPos = {
				Vector3.new(923, 125, 32853),
				Vector3.new(-6509, 83, -133)
			}
		elseif Sea3 then
			PortalPos = {
				Vector3.new(3029, 2280, -7325),
				Vector3.new(28286, 14897, 103)
			}
		end
		local unlocks = CommF_("GetUnlockables")
		if Sea2 and unlocks.FlamingoAccess then
			table.insert(PortalPos, Vector3.new(-289, 306, 600))
			table.insert(PortalPos, Vector3.new(2284, 15, 905))
		end
		if Sea3 and unlocks.DefeatedIndraTrueForm then
			table.insert(PortalPos, Vector3.new(-12471, 374, -7551))
			table.insert(PortalPos, Vector3.new(5661, 1013, -335))
			table.insert(PortalPos, Vector3.new(-5074, 314, -3153))
		end
		if Sea3 and WorkerSpeak("AskKilledTikiBoss") then
			table.insert(PortalPos, Vector3.new(11520, -2154, 9829))
			if Map:FindFirstChild("Boat Castle") and Map["Boat Castle"]:FindFirstChild("MapTeleportC") then
				table.insert(PortalPos, Vector3.new(-16813, 58, 304))
			end
		end
		
	--[[	if Sea3 and w:FindFirstChild("PortalBack") and unlocks.DefeatedIndraTrueForm then
			for pos,  _ in HalloweenPortais do
				table.insert(PortalPos, pos)
			end
		end]]
		
		local closestPortal = nil
		local closestDistance = (HumanoidRootPart.Position - targetPosition).Magnitude	
		for _, portal in pairs(PortalPos) do
			local portalDistance = (portal - targetPosition).Magnitude
			if portalDistance < closestDistance then
				closestPortal = portal
				closestDistance = portalDistance
			end
		end
		if closestPortal == Vector3.new(3029, 2280, -7325) then
			Tween(Vector3.new(28609, 14896, 105))
			task.wait(0.1)
			for _ = 1, 3 do
				CommF_("RaceV4Progress", "TeleportBack")
			end
			task.wait(1)
		elseif closestPortal == Vector3.new(11520, -2154, 9829) then
			Tween(Vector3.new(-16269, 23., 1371))
			repeat task.wait() until (HumanoidRootPart.Position - Vector3.new(-16269, 23., 1371)).Magnitude < 10
			WorkerSpeak("TravelToSubmergedIsland")
			WorkerSpeak("TravelToSubmergedIsland")
			WorkerSpeak("TravelToSubmergedIsland")
			wait(1)
		elseif closestPortal == Vector3.new(-16813, 58, 304) then
			Tween(Vector3.new(-5074, 314, -3153))
			repeat task.wait() until (HumanoidRootPart.Position - Vector3.new(-5074, 314, -3153)).Magnitude < 10
			HumanoidRootPart.CFrame = Map["Boat Castle"]:FindFirstChild("MapTeleportC"):GetPivot()
			ReplicatedStorage.Modules.Net["RF/BoatCastleTeleporters"]:InvokeServer("InitiateTeleport", Map["Boat Castle"].MapTeleportC)
		elseif HalloweenPortais[closestPortal] then
			Tween(Vector3.new(-12482, 375, -7546))
			task.wait(0.5)
			Remotes.HalloweenPortal:InvokeServer("b", HalloweenPortais[closestPortal])
			--Remotes.HalloweenPortal:InvokeServer("b", HalloweenPortais[closestPortal])
			task.wait(0.2)
		elseif closestPortal then
			CommF_("requestEntrance", closestPortal)
			task.wait()
			CommF_("requestEntrance", closestPortal)
		end
		if HumanoidRootPart.Position.Y ~= targetPosition.Y then
			HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position.X, targetPosition.Y, HumanoidRootPart.Position.Z)
		end
		if GetDistance() <= 200 then
			HumanoidRootPart.CFrame = CFrame.new(targetPosition)
			HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			return
		end
		task.spawn(function()
			while true do
				if _G.Cancel then return end
				if Humanoid.Sit then
					Humanoid.Sit = false
				end
				local distance = GetDistance()
				if distance <= 200 then
					HumanoidRootPart.CFrame = CFrame.new(targetPosition)
					HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					break
				end
				if distance < 2 then return end
				local direction = (targetPosition - HumanoidRootPart.Position).Unit
				HumanoidRootPart.CFrame += direction * (_G.TweenSpeed or 1) * task.wait()
				HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			end
		end)
	end
	
	task.spawn(function()
		while task.wait(0.1) do
			if _G.BringEnemies and bringmobs then
				for _, Mob in pairs(Enemies:GetChildren()) do
					local Hum = Mob:FindFirstChild("Humanoid")
					local HRP = Mob:FindFirstChild("HumanoidRootPart")
					if Mob.Name == MobName and Hum and Hum.Health > 0 and HRP then
						local Direcao = (MobPos - HRP.Position)
						local Dist = Direcao.Magnitude
						if Dist > 15 then
							HRP.Velocity = Direcao.Unit * math.clamp(Dist * 5, 400, 800)
						elseif Dist > 1 then
							HRP.Velocity = Direcao.Unit * 75
						else
							HRP.Velocity = Vector3.new(0, HRP.Velocity.Y, 0)
						end
					end
				end
			end
		end
	end)
	
	function IsAlive(Entity)
		if not Entity then return false end
		local Humanoid = Entity:FindFirstChildOfClass("Humanoid")
		return Humanoid and Humanoid.Health > 0
	end
	
	function GetNearbyTargets()
		local PlayerCharacter = LocalPlayer.Character
		if not PlayerCharacter then return {} end
		local PlayerPosition = PlayerCharacter:GetPivot().Position
		local EnemyList = {}
		local PlayerListInRange = {}
	
		for _, Enemy in pairs(Enemies:GetChildren()) do
			local EnemyRoot = Enemy:FindFirstChild("HumanoidRootPart") or Enemy.PrimaryPart
			if EnemyRoot and IsAlive(Enemy) and (EnemyRoot.Position - PlayerPosition).Magnitude < 60 then
				table.insert(EnemyList, Enemy)
			end
		end
	
		if #EnemyList > 0 then
			table.sort(EnemyList, function(A, B)
				local ARoot = A:FindFirstChild("HumanoidRootPart") or A.PrimaryPart or A:GetPivot()
				local BRoot = B:FindFirstChild("HumanoidRootPart") or B.PrimaryPart or B:GetPivot()
				return (ARoot.Position - PlayerPosition).Magnitude < (BRoot.Position - PlayerPosition).Magnitude
			end)
			return EnemyList
		end
	
		for _, PlayerObj in ipairs(Players:GetPlayers()) do
			if PlayerObj ~= LocalPlayer and PlayerObj.Character then
				local PlayerRoot = PlayerObj.Character:FindFirstChild("HumanoidRootPart") or PlayerObj.Character.PrimaryPart
				if PlayerRoot and IsAlive(PlayerObj.Character) and (PlayerRoot.Position - PlayerPosition).Magnitude < 60 then
					table.insert(PlayerListInRange, PlayerObj.Character)
				end
			end
		end
	
		table.sort(PlayerListInRange, function(A, B)
			local ARoot = A:FindFirstChild("HumanoidRootPart") or A.PrimaryPart or A:GetPivot()
			local BRoot = B:FindFirstChild("HumanoidRootPart") or B.PrimaryPart or B:GetPivot()
			return (ARoot.Position - PlayerPosition).Magnitude < (BRoot.Position - PlayerPosition).Magnitude
		end)
	
		return PlayerListInRange
	end
	
	local GunsSettings = {
		Kabucha = 1,
		["Dual Flintlock"] = 2
	}
	
	local _, SF = pcall(function()
		return getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack, 9)
	end)
	
	function GetValidator2()
		local v1,v2,v3,v4,v5,v6,v7 = getupvalue(SF,15), getupvalue(SF,13), getupvalue(SF,16), getupvalue(SF,17), getupvalue(SF,14), getupvalue(SF,12), getupvalue(SF,18)
		local v8 = v6 * v2
		local v9 = (v5 * v2 + v6 * v1) % v3
		v9 = (v9 * v3 + v8) % v4
		v5 = math.floor(v9 / v3)
		v6 = v9 - v5 * v3
		v7 = v7 + 1
		setupvalue(SF,15,v1)
		setupvalue(SF,13,v2)
		setupvalue(SF,16,v3)
		setupvalue(SF,17,v4)
		setupvalue(SF,14,v5)
		setupvalue(SF,12,v6)
		setupvalue(SF,18,v7)
		return math.floor(v9 / v4 * 16777215), v7
	end
	
	function AttackNoCoolDown()
	local Character = LocalPlayer.Character
	if not Character then return end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local EquippedTool = Character:FindFirstChildOfClass("Tool")
	if not (Humanoid and EquippedTool) then return end
	local ToolName = EquippedTool.Name
	local Targets = GetNearbyTargets()
	if #Targets == 0 then return end
	local Net = ReplicatedStorage.Modules.Net
	local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack", true)
	local RegisterHit = Net:FindFirstChild("RE/RegisterHit", true)
	local function AttackTarget(Target)
		if CollectionService:HasTag(Target, "NoAttack") then return end
		local TargetRoot = Target:FindFirstChild("HumanoidRootPart") or Target.PrimaryPart
		if not TargetRoot then return end
		require(ReplicatedStorage.Mouse).Hit, require(ReplicatedStorage.Mouse).Target = TargetRoot.CFrame, TargetRoot
		if ToolName == "Skull Guitar" then
			local Remote = EquippedTool:FindFirstChild("RemoteEvent")
			if Remote then Remote:FireServer("TAP", TargetRoot.Position) end
			return
		end
		if EquippedTool.ToolTip == "Blox Fruit" and not table.find({"Ice-Ice","Light-Light"}, ToolName) and Humanoid:FindFirstChild("") then
			require(ReplicatedStorage.Mouse).Hit, require(ReplicatedStorage.Mouse).Target = TargetRoot.CFrame, TargetRoot
			EquippedTool.RemoteEvent:FireServer({TargetRoot.Position})
			Humanoid:FindFirstChild(""):InvokeServer({"TAP"})
			return
		end
		if EquippedTool:FindFirstChild("LeftClickRemote") and not table.find({"Ice-Ice","Light-Light"}, ToolName) then
			local Dir = (Target:GetPivot().Position - Character:GetPivot().Position).Unit
			EquippedTool.LeftClickRemote:FireServer(Dir, 1)
			EquippedTool.LeftClickRemote:FireServer(Dir, 2)
			return
		end
		if EquippedTool.ToolTip == "Gun" and ToolName ~= "Skull Guitar" then
			for i = 1, (GunsSettings[ToolName] or 1) do
				Remotes.Validator2:FireServer(GetValidator2())
			--	Net["RE/ShootGunEvent"]:FireServer(TargetRoot.Position, {TargetRoot})
				Net["RE/ShootGunEvent"]:FireServer(TargetRoot.Position)
			end
			wait(EquippedTool.Cooldown.Value)
			return
		end
		if RegisterAttack then RegisterAttack:FireServer(0.35) end
		local PlayerScripts = LocalPlayer:FindFirstChild("PlayerScripts")
		if not PlayerScripts then return end
		local LocalScriptObj = PlayerScripts:FindFirstChildOfClass("LocalScript")
		while not LocalScriptObj do
			PlayerScripts.ChildAdded:Wait()
			LocalScriptObj = PlayerScripts:FindFirstChildOfClass("LocalScript")
		end
		local Internal
		if getsenv then
			local ok, Env = pcall(getsenv, LocalScriptObj)
			if ok and Env and Env._G then Internal = Env._G.SendHitsToServer end
		end
		local ok, F = pcall(function()
			return require(ReplicatedStorage.Modules.Flags).COMBAT_REMOTE_THREAD
		end)
		if ok and Internal and F then
			Internal(TargetRoot, {{Target, TargetRoot}})
		elseif ok and not F then
			if RegisterHit then RegisterHit:FireServer(TargetRoot, {{Target, TargetRoot}}) end
		end
	end
	for i = 1, math.min(2, #Targets) do
		AttackTarget(Targets[i])
	end
end
	
	function AutoHaki()
		if LocalPlayer.Character and not LocalPlayer.Character:FindFirstChild("HasBuso") then
			CommF_("Buso")
		end
	end
	
	task.spawn(function()
		while task.wait() do
			if _G.AutoAttack then
				AttackNoCoolDown()
			end
			if _G.AutoBuso then
				AutoHaki()
			end
			if _G.EnableV3 then
				CommE("ActivateAbility")
			end
		end
	end)
	
	function Hop()
	    local Path = "Someone Hub/Main/Blox Fruits"
	    local File = Path.."/Servers.json"
	    if not isfolder("Someone Hub") then makefolder("Someone Hub") end
	    if not isfolder("Someone Hub/Main") then makefolder("Someone Hub/Main") end
	    if not isfolder(Path) then makefolder(Path) end
	    if not isfile(File) then writefile(File, "[]") end
	    local VisitedServers = HttpService:JSONDecode(readfile(File))
	    local Cursor = ""
	    local CurrentHour = os.date("!*t").hour
	    function SaveServers()
	        writefile(File, HttpService:JSONEncode(VisitedServers))
	    end
	    function TPReturner()
	        local ServerData
	        if Cursor == "" then
	            ServerData = HttpService:JSONDecode(g:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
	        else
	            ServerData = HttpService:JSONDecode(g:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Cursor))
	        end
	        if ServerData.nextPageCursor and ServerData.nextPageCursor ~= "null" then
	            Cursor = ServerData.nextPageCursor
	        end
	        for _, Info in pairs(ServerData.data) do
	            local Id = tostring(Info.id)
	            if tonumber(Info.playing) < tonumber(Info.maxPlayers) and not table.find(VisitedServers, Id) then
	                table.insert(VisitedServers, Id)
	                SaveServers()
	                task.wait()
	                pcall(function()
	                    task.wait()
	                    TeleportService:TeleportToPlaceInstance(PlaceId, Id, LocalPlayer)
	                end)
	                task.wait()
	            end
	        end
	    end
	    function StartHop()
	        while task.wait() do
	            pcall(function()
	                TPReturner()
	                if Cursor ~= "" then TPReturner() end
	            end)
	        end
	    end
	    StartHop()
	end
	
	function SendKey(Key, Time)
		local vim = g:GetService("VirtualInputManager")
		vim:SendKeyEvent(true, Key, false, game)
		task.wait(Time or 0.1)
		vim:SendKeyEvent(false, Key, false, game)
	end
	
	task.spawn(function()
		while task.wait(0.1) do
			if _G.EnableV4 then
				local char = LocalPlayer.Character
				local energy = char and char:FindFirstChild("RaceEnergy")
				local transformed = char and char:FindFirstChild("RaceTransformed")
				if energy and transformed and energy.Value >= 1 and not transformed.Value then
					SendKey("Y")
				end
			end
		end
	end)
	task.spawn(function()
	    while task.wait(1) do
	        local Time = 30 * 60
	        repeat
	            task.wait(1)
	            Time -= 1
	        until Time <= 0
	        if _G.AntReset then
	            Hop()
	        end
	    end
	end)
	
	----------------------------------------[[ Stats ]]----------------------------------------
	
	task.spawn(function()
		while task.wait(0.1) do
			if _G.AutoStats and _G.SelectPointsAmount and Data and Data.Points and Data.Points.Value > 0 then
				local StatsList = {}
				if _G.AddStatisticsToMelee then table.insert(StatsList, "Melee") end
				if _G.AddStatisticsToSword then table.insert(StatsList, "Sword") end
				if _G.AddStatisticsToGun then table.insert(StatsList, "Gun") end
				if _G.AddStatisticsToDefense then table.insert(StatsList, "Defense") end
				if _G.AddStatisticsToBloxFruit then table.insert(StatsList, "BloxFruit") end
				if #StatsList > 0 then
					local RandomStat = StatsList[math.random(1, #StatsList)]
					CommF_("AddPoint", RandomStat, _G.SelectPointsAmount)
				end
			end
		end
	end)
	
	----------------------------------------[[ Main ]]----------------------------------------
	
	function CheckLevel()
	    local MyLevel = Data.Level.Value
	    if Sea1 then
	        if MyLevel > 0 and MyLevel < 10 then
				if LocalPlayer.Team.Name == "Marines" then
				    Module = {"Trainee", "MarineQuest", 1, Vector3.new(-2864, 41, 2200)}
				else
					Module = {"Bandit", "BanditQuest1", 1, Vector3.new(1038, 41, 1576)}
				end
	        elseif MyLevel > 9 and MyLevel < 15 then
			    Module = {"Monkey", "JungleQuest", 1, Vector3.new(-1448, 50, 63)}
	        elseif MyLevel > 14 and MyLevel < 30 then
                if VerifyNPC("The Gorilla King") and MyLevel > 19 then
	                Module = {"The Gorilla King", "JungleQuest", 3, Vector3.new(-1052, 12, -437)}
                else
	                Module = {"Gorilla", "JungleQuest", 2, Vector3.new(-1142, 40, -515)}
                end
	        elseif MyLevel > 29 and MyLevel < 40 then
                Module = {"Pirate", "BuggyQuest1", 1, Vector3.new(-1201, 40, 3857)}
	        elseif MyLevel > 39 and MyLevel < 60 then
				if VerifyNPC("Chef") and MyLevel >= 55 then
			        Module = {"Chef", "BuggyQuest1", 3, Vector3.new(-1131, 14, 4080)}
			      else
	                Module = {"Brute", "BuggyQuest1", 2, Vector3.new(-1387, 24, 4100)}
				end
	        elseif MyLevel > 59 and MyLevel < 75 then
                Module = {"Desert Bandit", "DesertQuest", 1, Vector3.new(984, 16, 4417)}
	        elseif MyLevel > 74 and MyLevel < 90 then
                Module = {"Desert Officer", "DesertQuest", 2, Vector3.new(1547, 14, 4381)}
			elseif MyLevel > 89 and MyLevel < 100 then
				Module = {"Snow Bandit", "SnowQuest", 1, Vector3.new(1356, 105, -1328)}
	        elseif MyLevel > 99 and MyLevel < 120 then
				if VerifyNPC("Yeti") and MyLevel >= 105 then
					Module = {"Yeti", "SnowQuest", 3, Vector3.new(1185, 106, -1518)}
				else
	                Module = {"Snowman", "SnowQuest", 2, Vector3.new(1218, 138, -1488)}
				end
	        elseif MyLevel > 119 and MyLevel < 150 then
				if VerifyNPC("Vice Admiral") and Level >= 130 then
					Module = {"Vice Admiral", "MarineQuest2", 2, Vector3.new(-4807, 21, 4360)}
				else
				    Module = {"Chief Petty Officer", "MarineQuest2", 1, Vector3.new(-4931, 65, 4121)}
                end
	        elseif MyLevel > 149 and MyLevel < 175 then
                Module = {"Sky Bandit", "SkyQuest", 1, Vector3.new(-4955, 365, -2908)}
	        elseif MyLevel > 174 and MyLevel < 190 then
                Module = {"Dark Master", "SkyQuest", 2, Vector3.new(-5148, 439, -2332)}
	        elseif MyLevel > 189 and MyLevel < 210 then
                Module = {"Prisoner", "PrisonerQuest", 1, Vector3.new(4937, 0, 649)}
	        elseif MyLevel > 209 and MyLevel < 250 then
				if VerifyNPC("Swan") and Level >= 240 then
					Module = {"Swan", "ImpelQuest", 3, Vector3.new(5099, 0, 1055)}
				elseif VerifyNPC("Chief Warden") and Level >= 230 then
					Module = {"Chief Warden", "ImpelQuest", 2, Vector3.new(5230, 4, 749)}
				else
					Module = {"Warden", "ImpelQuest", 1, Vector3.new(5230, 4, 749)}
			--	else
	         --       Module = {"Dangerous Prisoner", "PrisonerQuest", 2, Vector3.new(5099, 0, 1055)}
				end
	        elseif MyLevel > 249 and MyLevel < 275 then
                Module = {"Toga Warrior", "ColosseumQuest", 1, Vector3.new(-1872, 49, -2913)}
			elseif MyLevel > 274 and MyLevel < 300 then
                Module = {"Gladiator", "ColosseumQuest", 2, Vector3.new(-1521, 81, -3066)}
	        elseif MyLevel > 299 and MyLevel < 325 then
                Module = {"Military Soldier", "MagmaQuest", 1, Vector3.new(-5369, 61, 8556)}
	        elseif MyLevel > 324 and MyLevel < 375 then
                Module = {"Military Spy", "MagmaQuest", 2, Vector3.new(-5787, 75, 8651)}
	        elseif MyLevel > 374 and MyLevel < 400 then
                Module = {"Fishman Warrior", "FishmanQuest", 1, Vector3.new(60844, 98, 1298)}
	        elseif MyLevel > 399 and MyLevel < 450 then
                Module = {"Fishman Commando", "FishmanQuest", 2, Vector3.new(61738, 64, 1433)}
	        elseif MyLevel > 449 and MyLevel < 475 then
                Module = {"God's Guard", "SkyExp1Quest", 1, Vector3.new(-4628, 866, -1931)}
	        elseif MyLevel > 474 and MyLevel < 525 then
                Module = {"Shanda", "SkyExp1Quest", 2, Vector3.new(-7685, 5601, -441)}
	        elseif MyLevel > 524 and MyLevel < 550 then
                Module = {"Royal Squad", "SkyExp2Quest", 1, Vector3.new(-7654, 5637, -1407)}
	        elseif MyLevel > 549 and MyLevel < 625 then
                Module = {"Royal Soldier", "SkyExp2Quest", 2, Vector3.new(-7760, 5679, -1884)}
	        elseif MyLevel > 624 and MyLevel < 650 then
                Module = {"Galley Pirate", "FountainQuest", 1, Vector3.new(5557, 152, 3998)}
	        elseif MyLevel >= 650 then
                Module = {"Galley Captain", "FountainQuest", 2, Vector3.new(5677, 92, 4966)}
	        end
	    end
	    if Sea2 then
	        if MyLevel > 699 and MyLevel < 725 then
                Module = {"Raider", "Area1Quest", 1, Vector3.new(68, 93, 2429)}
	        elseif MyLevel > 724 and MyLevel < 775 then
                Module = {"Mercenary", "Area1Quest", 2, Vector3.new(-864, 122, 1453)}
	        elseif MyLevel > 774 and MyLevel < 800 then
                Module = {"Swan Pirate", "Area2Quest", 1, Vector3.new(1065, 137, 1324)}
	        elseif MyLevel > 799 and MyLevel < 875 then
                Module = {"Factory Staff", "Area2Quest", 2, Vector3.new(533, 128, 355)}
	        elseif MyLevel > 874 and MyLevel < 900 then
                Module = {"Marine Lieutenant", "MarineQuest3", 1, Vector3.new(-2489, 84, -3151)}
	        elseif MyLevel > 899 and MyLevel < 950 then
                Module = {"Marine Captain", "MarineQuest3", 2, Vector3.new(-2335, 79, -3245)}
	        elseif MyLevel > 949 and MyLevel < 975 then
                Module = {"Zombie", "ZombieQuest", 1, Vector3.new(-5536, 101, -835)}
	        elseif MyLevel > 974 and MyLevel < 1000 then
                Module = {"Vampire", "ZombieQuest", 2, Vector3.new(-5806, 16, -1164)}
	        elseif MyLevel > 999 and MyLevel < 1050 then
                Module = {"Snow Trooper", "SnowMountainQuest", 1, Vector3.new(535, 432, -5484)}
	        elseif MyLevel > 1049 and MyLevel < 1100 then
                Module = {"Winter Warrior", "SnowMountainQuest", 2, Vector3.new(1234, 456, -5174)}
	        elseif MyLevel > 1099 and MyLevel < 1125 then
                Module = {"Lab Subordinate", "IceSideQuest", 1, Vector3.new(-5720, 63, -4784)}
	        elseif MyLevel > 1124 and MyLevel < 1175 then
                Module = {"Horned Warrior", "IceSideQuest", 2, Vector3.new(-6292, 91, -5502)}
	        elseif MyLevel > 1174 and MyLevel < 1200 then
                Module = {"Magma Ninja", "FireSideQuest", 1, Vector3.new(-5461, 130, -5836)}
	        elseif MyLevel > 1199 and MyLevel < 1250 then
                Module = {"Lava Pirate", "FireSideQuest", 2, Vector3.new(-5251, 55, -4774)}
	        elseif MyLevel > 1249 and MyLevel < 1275 then
                Module = {"Ship Deckhand", "ShipQuest1", 1, Vector3.new(921, 125, 33088)}
	        elseif MyLevel > 1274 and MyLevel < 1300 then
                Module = {"Ship Engineer", "ShipQuest1", 2, Vector3.new(886, 40, 32800)}
	        elseif MyLevel > 1299 and MyLevel < 1325 then
                Module = {"Ship Steward", "ShipQuest2", 1, Vector3.new(943, 129, 33444)}
	        elseif MyLevel > 1324 and MyLevel < 1350 then
                Module = {"Ship Officer", "ShipQuest2", 2, Vector3.new(955, 181, 33331)}
	        elseif MyLevel > 1349 and MyLevel < 1375 then
                Module = {"Arctic Warrior", "FrostQuest", 1, Vector3.new(5935, 77, -6472)}
	        elseif MyLevel > 1374 and MyLevel < 1425 then
                Module = {"Snow Lurker", "FrostQuest", 2, Vector3.new(5628, 57, -6618)}
	        elseif MyLevel > 1424 and MyLevel < 1450 then
                Module = {"Sea Soldier", "ForgottenQuest", 1, Vector3.new(-3185, 58, -9663)}
            elseif MyLevel > 1449 then
                Module = {"Water Fighter", "ForgottenQuest", 2, Vector3.new(-3262, 298, -10552)}
	        end
	    end
	    if Sea3 then
	        if MyLevel > 1499 and MyLevel < 1525 then
                Module = {"Pirate Millionaire", "PiratePortQuest", 1, Vector3.new(-193, 56, 5755)}
            elseif MyLevel > 1524 and MyLevel < 1575 then
                Module = {"Pistol Billionaire", "PiratePortQuest", 2, Vector3.new(-188, 84, 6337)}
	        elseif MyLevel > 1574 and MyLevel < 1600 then
                Module = {"Dragon Crew Warrior", "DragonCrewQuest", 1, Vector3.new(6615, 50, -978)}
            elseif MyLevel > 1599 and MyLevel < 1625 then
                Module = {"Dragon Crew Archer", "DragonCrewQuest", 2, Vector3.new(6818, 483, 512)}
	        elseif MyLevel > 1624 and MyLevel < 1650 then
                Module = {"Hydra Enforcer", "VenomCrewQuest", 1, Vector3.new(4547, 1001, 334)}
            elseif MyLevel > 1649 and MyLevel < 1700 then
                Module = {"Venomous Assailant", "VenomCrewQuest", 2, Vector3.new(4637, 1077, 882)}
	        elseif MyLevel > 1699 and MyLevel < 1725 then
                Module = {"Marine Commodore", "MarineTreeIsland", 1, Vector3.new(2198, 128, -7109)}
	        elseif MyLevel > 1724 and MyLevel < 1775 then
                Module = {"Marine Rear Admiral", "MarineTreeIsland", 2, Vector3.new(3294, 385, -7048)}
	        elseif MyLevel > 1774 and MyLevel < 1800 then
                Module = {"Fishman Raider", "DeepForestIsland3", 1, Vector3.new(-10553, 521, -8176)}
            elseif MyLevel > 1799 and MyLevel < 1825 then
                Module = {"Fishman Captain", "DeepForestIsland3", 2, Vector3.new(-10789, 427, -9131)}
	        elseif MyLevel > 1824 and MyLevel < 1850 then
                Module = {"Forest Pirate", "DeepForestIsland", 1, Vector3.new(-13489, 400, -7770)}
            elseif MyLevel > 1849 and MyLevel < 1900 then
                Module = {"Mythological Pirate", "DeepForestIsland", 2, Vector3.new(-13508, 582, -6985)}
	        elseif MyLevel > 1899 and MyLevel < 1925 then
                Module = {"Jungle Pirate", "DeepForestIsland2", 1, Vector3.new(-12267, 459, -10277)}
	        elseif MyLevel > 1924 and MyLevel < 1975 then
                Module = {"Musketeer Pirate", "DeepForestIsland2", 2, Vector3.new(-13291, 520, -9904)}
            elseif MyLevel > 1974 and MyLevel < 2000 then
                Module = {"Reborn Skeleton", "HauntedQuest1", 1, Vector3.new(-8761, 183, 6168)}
	        elseif MyLevel > 1999 and MyLevel < 2025 then
                Module = {"Living Zombie", "HauntedQuest1", 2, Vector3.new(-10103, 238, 6179)}
            elseif MyLevel > 2024 and MyLevel < 2050 then
                Module = {"Demonic Soul", "HauntedQuest2", 1, Vector3.new(-9712, 204, 6193)}
	        elseif MyLevel > 2049 and MyLevel < 2075 then
                Module = {"Posessed Mummy", "HauntedQuest2", 2, Vector3.new(-9545, 69, 6339)}
            elseif MyLevel > 2074 and MyLevel < 2100 then
                Module = {"Peanut Scout", "NutsIslandQuest", 1, Vector3.new(-2150, 122, -10358)}
	        elseif MyLevel > 2099 and MyLevel < 2125 then
                Module = {"Peanut President", "NutsIslandQuest", 2, Vector3.new(-2150, 122, -10358)}
            elseif MyLevel > 2124 and MyLevel < 2150 then
                Module = {"Ice Cream Chef", "IceCreamIslandQuest", 1, Vector3.new(-789, 209, -11009)}
	        elseif MyLevel > 2149 and MyLevel < 2200 then
                Module = {"Ice Cream Commander", "IceCreamIslandQuest", 2, Vector3.new(-789, 209, -11009)}
            elseif MyLevel > 2199 and MyLevel < 2225 then
                Module = {"Cookie Crafter", "CakeQuest1", 1, Vector3.new(-2321, 36, -12216)}
	        elseif MyLevel > 2224 and MyLevel < 2250 then
                Module = {"Cake Guard", "CakeQuest1", 2, Vector3.new(-1418, 36, -12255)}
	        elseif MyLevel > 2249 and MyLevel < 2275 then
                Module = {"Baking Staff", "CakeQuest2", 1, Vector3.new(-1980, 36, -12983)}
	        elseif MyLevel > 2274 and MyLevel < 2300 then
                Module = {"Head Baker", "CakeQuest2", 2, Vector3.new(-2251, 52, -13033)}
            elseif MyLevel > 2299 and MyLevel < 2325 then
                Module = {"Cocoa Warrior", "ChocQuest1", 1, Vector3.new(167, 26, -12238)}
	        elseif MyLevel > 2324 and MyLevel < 2350 then
                Module = {"Chocolate Bar Battler", "ChocQuest1", 2, Vector3.new(701, 25, -12708)}
            elseif MyLevel > 2349 and MyLevel < 2375 then
                Module = {"Sweet Thief", "ChocQuest2", 1, Vector3.new(-140, 25, -12652)}
	        elseif MyLevel > 2374 and MyLevel < 2401 then
                Module = {"Candy Rebel", "ChocQuest2", 2, Vector3.new(47, 25, -13029)}
            elseif MyLevel > 2400 and MyLevel < 2425 then
                Module = {"Candy Pirate", "CandyQuest1", 1, Vector3.new(-1437, 17, -14385)}
	        elseif MyLevel > 2424 and MyLevel < 2450 then
                Module = {"Snow Demon", "CandyQuest1", 2, Vector3.new(-916, 17, -14638)}
            elseif MyLevel > 2449 and MyLevel < 2475 then
                Module = {"Isle Outlaw", "TikiQuest1", 1, Vector3.new(-16162, 11, -96)}
	        elseif MyLevel > 2474 and MyLevel < 2500 then
                Module = {"Island Boy", "TikiQuest1", 2, Vector3.new(-16357, 20, 1005)}
            elseif MyLevel > 2499 and MyLevel < 2525 then
                Module = {"Sun-kissed Warrior", "TikiQuest2", 1, Vector3.new(-16357, 20, 1005)}
	        elseif MyLevel > 2524 and MyLevel < 2550 then
                Module = {"Isle Champion", "TikiQuest2", 2, Vector3.new(-16848, 21, 1041)}
            elseif MyLevel > 2549 and MyLevel < 2575 then
                Module = {"Serpent Hunter", "TikiQuest3", 1, Vector3.new(-16621, 121, 1290)}
	        elseif MyLevel > 2574 then
				if WorkerSpeak("AskKilledTikiBoss") then 
					if MyLevel > 2574 and MyLevel < 2600 then
		                Module = {"Skull Slayer", "TikiQuest3", 2, Vector3.new(-16811, 84, 1542)}
		            elseif MyLevel > 2599 and MyLevel < 2625 then
		                Module = {"Reef Bandit", "SubmergedQuest1", 1, Vector3.new(10951, -2159, 9150)}
		            elseif MyLevel > 2624 and MyLevel < 2650 then
		                Module = {"Coral Pirate", "SubmergedQuest1", 2, Vector3.new(10744, -2087, 9343)}
		            elseif MyLevel > 2649 and MyLevel < 2675 then
		                Module = {"Sea Chanter", "SubmergedQuest2", 1, Vector3.new(10661, -2087, 10088)}
		            elseif MyLevel > 2674 and MyLevel < 1700 then
		                Module = {"Ocean Prophet", "SubmergedQuest2", 2, Vector3.new(11050, -2001, 10142)}
		            elseif MyLevel > 1699 then
			              Module = {"Grand Devotee", "SubmergedQuest3", 2, Vector3.new(9568, -1993, 9857)}
					end
				else
					Module = {"Skull Slayer", "TikiQuest3", 2, Vector3.new(-16811, 84, 1542)}
				end
	        end
	    end
	end
	
	SkyEnemiesList = {"Sky Bandit", "Dark Master", "God's Guard", "Shanda", "Royal Squad"}
	EctoplasmsEnemiesList = {"Ship Steward", "Ship Engineer", "Ship Deckhand", "Ship Officer"}
	BonesEnemies = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
	EliteHunterEnemies = {"Diablo", "Deandre", "Urban"}
	KatakuriEnemies = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}
	
	function MaterialMon()
	    local MaterialData = {
	        ["Radioactive Material"] = {"Factory Staff"},
	        ["Mystic Droplet"] = {"Water Fighter", "Sea Soldier"},
	        ["Angel Wings"] = {"God's Guard", "Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God"},
	        ["Demonic Wisp"] = {"Demonic Soul"},
	        ["Vampire Fang"] = {"Vampire"},
	        ["Conjured Cocoa"] = {"Chocolate Bar Battler", "Cocoa Warrior"},
	        ["Dragon Scale"] = {"Dragon Crew Archer", "Dragon Crew Warrior"},
	        ["Gunpowder"] = {"Pistol Billionaire"},
	        ["Mini Tusk"] = {"Mythological Pirate"},
			["Nightmare Catcher"] = {"Reborn Skeleton", "Living Zombie"},
			["Volt Capsule"] = {"Sea Chanter", "Ocean Prophet"},
	    }
	    local Material = _G.SelectMaterial
	
	    if Material == "Magma Ore" then
	        if Sea1 then
	            EnemiesList = {"Military Spy", "Military Soldier", "Magma Admiral"}
	        elseif Sea2 then
	            EnemiesList = {"Magma Ninja", "Lava Pirate"}
	        end
	    elseif Material == "Leather & Scrap Metal" then
	        if Sea1 then
	            EnemiesList = {"Brute", "Pirate"}
	        elseif Sea2 then
	            EnemiesList = {"Mercenary"}
	        elseif Sea3 then
	            EnemiesList = {"Pistol Millionaire", "Pistol Billionaire"}
	        end
	    elseif Material == "Fish Tail" then
	        if Sea3 then
	            EnemiesList = {"Fishman Raider", "Fishman Captain"}
	        elseif Sea1 then
	            EnemiesList = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"}
	        end
	    elseif MaterialData[Material] then
	        EnemiesList = MaterialData[Material]
	    end
	end
	
	BossesList = {}
	
	NotBosses = {
	"rip_indra",
	"Terrorshark",
	"Ice Admiral",
	}
	
	task.spawn(function()
		for _, cont in pairs({Enemies, ReplicatedStorage}) do
			for _, boss in cont:GetChildren() do
				if boss:GetAttribute("IsBoss") and not table.find(NotBosses, boss.Name) and boss:FindFirstChildOfClass("Humanoid") and boss:FindFirstChildOfClass("Humanoid").Health > 0 then
					table.insert(BossesList, boss.Name)
				end
			end
			for _, spawn in EnemySpawns:GetChildren() do
				if not table.find(NotBosses, tostring(GetTrueName(spawn.Name))) and spawn.Name:find("Boss") then
					table.insert(BossesList, tostring(GetTrueName(spawn.Name)))
				end
			end
		end
		table.sort(BossesList, function(a, b) return a:lower() < b:lower() end)
	end)
	
	function UpdateBossesList()
		BossesList = {}
		for _, cont in pairs({Enemies, ReplicatedStorage}) do
			for _, boss in cont:GetChildren() do
				if boss:GetAttribute("IsBoss") and not table.find(NotBosses, boss.Name) and boss:FindFirstChildOfClass("Humanoid") and boss:FindFirstChildOfClass("Humanoid").Health > 0 then
					table.insert(BossesList, boss.Name)
				end
			end
			for _, spawn in EnemySpawns:GetChildren() do
				if not table.find(NotBosses, tostring(GetTrueName(spawn.Name))) and spawn.Name:find("Boss") then
					table.insert(BossesList, tostring(GetTrueName(spawn.Name)))
				end
			end
		end
		table.sort(BossesList, function(a, b) return a:lower() < b:lower() end)
		BossesListDrop:Set(BossesList)
	end
	
	if Sea1 then
	    MaterialList = {
	        "Angel Wings",
	        "Fish Tail",
	        "Leather & Scrap Metal",
	        "Magma Ore"
	    }
	elseif Sea2 then
	    MaterialList = {
	        "Leather & Scrap Metal",
	        "Magma Ore",
	        "Mystic Droplet",
	        "Radioactive Material",
	        "Vampire Fang"
	    }
	elseif Sea3 then
	    MaterialList = {
	        "Conjured Cocoa",
	        "Demonic Wisp",
	        "Dragon Scale",
	        "Fish Tail",
	        "Gunpowder",
	        "Leather & Scrap Metal",
	        "Mini Tusk",
			"Nightmare Catcher",
	    }
	end
	
	if Sea3 and WorkerSpeak("AskKilledTikiBoss") then
		table.insert(MaterialList, "Volt Capsule")
	end
	table.sort(MaterialList, function(a, b) return a:lower() < b:lower() end)
	
	local LastEliteRemovedTime = 0
	local TimerActive = false
	
	Enemies.ChildRemoved:Connect(function(Child)
		if table.find(EliteHunterEnemies, Child.Name) then
			LastEliteRemovedTime = tick()
			TimerActive = true
			task.spawn(function()
				while tick() - LastEliteRemovedTime < 600 do
					task.wait(1)
				end
				TimerActive = false
			end)
		end
	end)
	
	function UpdateEliteStatus()
	    local Countdown = 0
	    local ProgressValue = CommF_ and CommF_("EliteHunter", "Progress") or 0
	    for _, Cont in pairs({Enemies, ReplicatedStorage}) do
	        for _, Elite in Cont:GetChildren() do
	            if table.find(EliteHunterEnemies, Elite.Name) and Elite:FindFirstChild("Humanoid") and Elite.Humanoid.Health > 0 then
	                return Translate("Elite Hunter Spawned")..": "..Elite.Name.." | "..Translate("Progress")..": "..ProgressValue
	            end
	        end
	    end
	    if TimerActive then
	        Countdown = math.max(0, 600 - (tick() - LastEliteRemovedTime))
	    end
	    local TimeText = Countdown >= 60 and math.floor(Countdown / 60)..":"..string.format("%02d", Countdown % 60) or tostring(math.floor(Countdown))
	    local ProgressText = Translate("Elite Hunter Spawned: None").." | "..Translate("Progress")..": "..ProgressValue
	    if Countdown > 0 then
	        return ProgressText.."\n"..Translate("Time Until Next Spawn")..": "..TimeText
	    else
	        return ProgressText
	    end
	end
	
	function GetCakePrinceValue()
	    local Result = CommF_("CakePrinceSpawner")
	    local Len = string.len(Result)
	    if Len == 88 then
	        return tonumber(string.sub(Result, 39, 41))
	    elseif Len == 87 then
	        return tonumber(string.sub(Result, 39, 40))
	    elseif Len == 86 then
	        return tonumber(string.sub(Result, 39, 39))
	    else
	        return 0
	    end
	end
	
	task.spawn(function()
		while task.wait() do
			local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			local Humanoid = Char:FindFirstChildOfClass("Humanoid")
			local HRP = Char:FindFirstChild("HumanoidRootPart")
			if not Char or not Humanoid or not HRP then continue end
			if _G.FarmLevel then
				local QuestTitle = PlayerGui.Main.Quest.Container.QuestTitle.Title
				CheckLevel()
				NameMon = Module[1]
				NameQuest = Module[2]
				QuestLv = Module[3]
				CFrameQ = Module[4]
				if not QuestTitle.Text:find(NameMon) or not PlayerGui.Main.Quest.Visible then
					CommF_("AbandonQuest")
					CommF_("StartQuest", NameQuest, QuestLv)
				else
					local NearestEnemy, MinDist = nil, math.huge
					for _, Cont in pairs({Enemies, ReplicatedStorage}) do
						for _, Enemy in pairs(Cont:GetChildren()) do
							if Enemy:FindFirstChildOfClass("Humanoid") and Enemy.Humanoid.Health > 0 and Enemy.Name == NameMon then
								local Dist = (HRP.Position - Enemy:GetPivot().Position).Magnitude
								if Dist < MinDist then
									MinDist = Dist
									NearestEnemy = Enemy
								end
							end
						end
					end
					if NearestEnemy then
						repeat
							task.wait()
							bringmobs = true
							EquipTool()
							Tween(NearestEnemy:GetPivot().Position + Vector3.new(0, 30, 0))
							MobPos = NearestEnemy:GetPivot().Position
							MobName = NearestEnemy.Name
						until not _G.FarmLevel or not NearestEnemy.Parent or NearestEnemy.Humanoid.Health <= 0 or not Enemies:FindFirstChild(NearestEnemy.Name) or not PlayerGui.Main.Quest.Visible or Humanoid.Health <= 0
						bringmobs = false
					else
						local NearSpawn, MinSpawnDist = nil, math.huge
						for _, Spawn in pairs(EnemySpawns:GetChildren()) do
							if GetTrueName(Spawn.Name) == NameMon then
								local Dist = (HRP.Position - Spawn.Position).Magnitude
								if Dist < MinSpawnDist then
									MinSpawnDist = Dist
									NearSpawn = Spawn
								end
							end
						end
						if NearSpawn and MinSpawnDist > 40 then
							Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
						else
							Tween(CFrameQ)
						end
					end
				end
			end
			if _G.FarmNearest then
				local ClosestEnemy, ShortestDistance = nil, math.huge
				for _, Enemy in pairs(Enemies:GetChildren()) do
					if Enemy:FindFirstChildOfClass("Humanoid") and Enemy.Humanoid.Health > 0 then
						local Dist = (Enemy:GetPivot().Position - HRP.Position).Magnitude
						if Dist < ShortestDistance then
							ShortestDistance = Dist
							ClosestEnemy = Enemy
						end
					end
				end
				if ClosestEnemy then
					repeat
						bringmobs = true
						EquipTool()
						Tween(ClosestEnemy:GetPivot().Position + Vector3.new(0, 30, 0))
						MobPos = ClosestEnemy:GetPivot().Position
						MobName = ClosestEnemy.Name
						task.wait()
					until not _G.FarmNearest or not ClosestEnemy or ClosestEnemy.Humanoid.Health <= 0 or Humanoid.Health <= 0
					bringmobs = false
				end
			end
			if _G.FarmSkyEnemies then
				local Near, MinDist = nil, math.huge
				for _, cont in pairs({Enemies, ReplicatedStorage}) do
					for _, enemy in cont:GetChildren() do
						if table.find(SkyEnemiesList, enemy.Name) and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
							local dist = (enemy:GetPivot().Position - HRP.Position).Magnitude
							if dist < MinDist then
								MinDist = dist
								Near = enemy
							end
						end
					end
				end
				if Near then
					repeat
						task.wait()
						bringmobs = true
						EquipTool()
						Tween(Near:GetPivot().Position + Vector3.new(0, 30, 0))
						MobPos = Near:GetPivot().Position
						MobName = Near.Name
					until not _G.FarmSkyEnemies or Near.Humanoid.Health <= 0 or Humanoid.Health <= 0
					bringmobs = false
				else
					local NearSpawn, MinSpawnDist = nil, math.huge
					for _, spawn in pairs(EnemySpawns:GetChildren()) do
						if table.find(SkyEnemiesList, GetTrueName(spawn.Name)) then
							local Dist = (HRP.Position - spawn.Position).Magnitude
							if Dist < MinSpawnDist then
								MinSpawnDist = Dist
								NearSpawn = spawn
							end
						end
					end
					if NearSpawn and MinSpawnDist > 35 then
						Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
					end
				end
			end
			if _G.FactoryRaid then
				local Core = VerifyNPC("Core")
				if Core and Core.Humanoid.Health > 0 then
					repeat
						wait()
						EquipTool()
						Tween(Core:GetPivot().Position + Vector3.new(0, 30, 0))
					until not _G.FactoryRaid or not Core.Parent or Core.Humanoid.Health <= 0 or Humanoid.Health <= 0
				end
			end
			if _G.PirateRaid then
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					for _, Enemy in pairs(Cont:GetChildren()) do
						if _G.PirateRaid and Enemy:FindFirstChildOfClass("Humanoid") and Enemy.Humanoid.Health > 0 and not Enemy.Name:lower():find("rip_indra") and not Enemy.Name:lower():find("friend") then
							if (Enemy:GetPivot().Position - Vector3.new(-5496, 313, 2841)).Magnitude < 2000 then
								repeat
									task.wait()
									EquipTool()
									Tween(Enemy:GetPivot().Position + Vector3.new(0, 30, 0))
								until Enemy.Humanoid.Health <= 0 or not Enemy.Parent or not _G.PirateRaid or Humanoid.Health <= 0
							end
						end
					end
				end
			end
			if _G.CollectChests then
				local AllChests, NearChest, MinDist = CollectionService:GetTagged("_ChestTagged"), nil, math.huge
				for _, chest in pairs(AllChests) do
					if not chest:GetAttribute("IsDisabled") then
						local Dist = (chest.Position - HRP.Position).Magnitude
						if Dist < MinDist then
							MinDist = Dist
							NearChest = chest
						end
					end
				end
				if NearChest then
					repeat
						task.wait()
						Tween(NearChest.Position + Vector3.new(0, 1, 0))
					until not _G.CollectChests or NearChest:GetAttribute("IsDisabled") or Humanoid.Health <= 0
				end
			end
			if _G.FarmEctoplasms then
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					local NearestEnemy, MinDist = nil, math.huge
					for _, Enemy in pairs(Cont:GetChildren()) do
						if table.find(EctoplasmsEnemiesList, Enemy.Name) and Enemy:FindFirstChildOfClass("Humanoid") and Enemy.Humanoid.Health > 0 then
							local Dist = (HRP.Position - Enemy:GetPivot().Position).Magnitude
							if Dist < MinDist then
								MinDist = Dist
								NearestEnemy = Enemy
							end
						end
					end
					if NearestEnemy then
						repeat
							task.wait()
							bringmobs = true
							EquipTool()
							Tween(NearestEnemy:GetPivot().Position + Vector3.new(0, 30, 0))
							MobPos = NearestEnemy:GetPivot().Position
							MobName = NearestEnemy.Name
						until not _G.FarmEctoplasms or not NearestEnemy.Parent or NearestEnemy.Humanoid.Health <= 0 or Humanoid.Health <= 0
						bringmobs = false
					else
						local NearSpawn, MinSpawnDist = nil, math.huge
						for _, Spawn in pairs(EnemySpawns:GetChildren()) do
							if table.find(EctoplasmsEnemiesList, GetTrueName(Spawn.Name)) then
								local Dist = (HRP.Position - Spawn.Position).Magnitude
								if Dist < MinSpawnDist then
									MinSpawnDist = Dist
									NearSpawn = Spawn
								end
							end
						end
						if NearSpawn and MinSpawnDist > 35 then
							Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
						end
					end
				end
			end
			if _G.DefeatSelectedBoss then
				local Boss
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					for _, enemy in pairs(Cont:GetChildren()) do
						if enemy.Name == _G.SelectBoss and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
							Boss = enemy
						end
					end
				end
				if Boss then
					repeat
						task.wait()
						EquipTool()
						Tween(Boss:GetPivot().Position + Vector3.new(0, 30, 0))
					until not _G.DefeatSelectedBoss or not Boss.Parent or Boss.Humanoid.Health <= 0 or Humanoid.Health <= 0
				else
					local NearSpawn, MinSpawnDist = nil, math.huge
					for _, Spawn in pairs(EnemySpawns:GetChildren()) do
						if GetTrueName(Spawn.Name) == _G.SelectBoss then
							local Dist = (HRP.Position - Spawn.Position).Magnitude
							if Dist < MinSpawnDist then
								MinSpawnDist = Dist
								NearSpawn = Spawn
							end
						end
					end
					if NearSpawn and MinSpawnDist > 35 then
						Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
					end
				end
			end
			if _G.DefeatAllBosses then
				local ClosestBoss, MinBossDist = nil, math.huge
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					for _, Enemy in pairs(Cont:GetChildren()) do
						if Enemy:GetAttribute("IsBoss") and not table.find(NotBosses, tostring(Enemy.Name)) then
							local HumanoidE = Enemy:FindFirstChildOfClass("Humanoid")
							if HumanoidE and HumanoidE.Health > 0 then
								local Dist = (HRP.Position - Enemy:GetPivot().Position).Magnitude
								if Dist < MinBossDist then
									MinBossDist = Dist
									ClosestBoss = Enemy
								end
							end
						end
					end
				end
				if ClosestBoss then
					repeat
						task.wait()
						EquipTool()
						Tween(ClosestBoss:GetPivot().Position + Vector3.new(0, 30, 0))
					until not _G.DefeatAllBosses or not ClosestBoss.Parent or ClosestBoss.Humanoid.Health <= 0 or Humanoid.Health <= 0
				else
					local NearSpawn, MinSpawnDist = nil, math.huge
					for _, Spawn in pairs(EnemySpawns:GetChildren()) do
						if Spawn.Name:find("Boss") and not table.find(NotBosses, tostring(GetTrueName(Spawn.Name))) then
							local Dist = (HRP.Position - Spawn.Position).Magnitude
							if Dist < MinSpawnDist then
								MinSpawnDist = Dist
								NearSpawn = Spawn
							end
						end
					end
					if NearSpawn and MinSpawnDist > 35 then
						Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
					end
				end
			end
			if _G.FarmMaterial then
				MaterialMon()
				local NearEnemy, NearSpawn, MinEnemyDist, MinSpawnDist = nil, nil, math.huge, math.huge
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					for _, Enemy in pairs(Cont:GetChildren()) do
						if table.find(EnemiesList, Enemy.Name) and Enemy:FindFirstChildOfClass("Humanoid") and Enemy.Humanoid.Health > 0 then
							local Dist = (HRP.Position - Enemy:GetPivot().Position).Magnitude
							if Dist < MinEnemyDist then
								MinEnemyDist = Dist
								NearEnemy = Enemy
							end
						end
					end
				end
				if NearEnemy then
					repeat
						task.wait()
						bringmobs = true
						EquipTool()
						Tween(NearEnemy:GetPivot().Position + Vector3.new(0, 30, 0))
						MobPos = NearEnemy:GetPivot().Position
						MobName = NearEnemy.Name
					until not _G.FarmMaterial or not NearEnemy.Parent or NearEnemy.Humanoid.Health <= 0 or Humanoid.Health <= 0
					bringmobs = false
				else
					for _, Spawn in pairs(EnemySpawns:GetChildren()) do
						if table.find(EnemiesList, GetTrueName(Spawn.Name)) then
							local Dist = (HRP.Position - Spawn.Position).Magnitude
							if Dist < MinSpawnDist then
								MinSpawnDist = Dist
								NearSpawn = Spawn
							end
						end
					end
					if NearSpawn and (HRP.Position - NearSpawn.Position).Magnitude >= 35 then
						Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
					end
				end
			end
			if _G.TradeBones then
				CommF_("Bones", "Buy", 1, 1)
			end
			if _G.FarmBones then
				local NearEnemy, MinDist = nil, math.huge
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					for _, enemy in pairs(Cont:GetChildren()) do
						if table.find(BonesEnemies, enemy.Name) and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
							local Dist = (enemy:GetPivot().Position - HRP.Position).Magnitude
							if Dist < MinDist then
								MinDist = Dist
								NearEnemy = enemy
							end
						end
					end
				end
				if NearEnemy then
					repeat
						task.wait()
						bringmobs = true
						EquipTool()
						Tween(NearEnemy:GetPivot().Position + Vector3.new(0, 30, 0))
						MobPos = NearEnemy:GetPivot().Position
						MobName = NearEnemy.Name
					until not _G.FarmBones or NearEnemy.Humanoid.Health <= 0 or not NearEnemy.Parent or Humanoid.Health <= 0
					bringmobs = false
				else
					local NearSpawn, MinSpawnDist = nil, math.huge
					for _, Spawn in pairs(EnemySpawns:GetChildren()) do
						if table.find(BonesEnemies, GetTrueName(Spawn.Name)) then
							local Dist = (HRP.Position - Spawn.Position).Magnitude
							if Dist < MinSpawnDist then
								MinSpawnDist = Dist
								NearSpawn = Spawn
							end
						end
					end
					if NearSpawn and (HRP.Position - NearSpawn.Position).Magnitude >= 35 then
						Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
					else
						Tween(Vector3.new(-9515, 164, 5786))
					end
				end
			end
			if _G.FarmShinigamiBoss then
				local NearEnemy = nil
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					for _, enemy in pairs(Cont:GetChildren()) do
						if enemy.Name == "Soul Reaper" and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
							NearEnemy = enemy
							break
						end
					end
					if NearEnemy then break end
				end
				if NearEnemy then
					repeat
						task.wait()
						EquipTool()
						Tween(NearEnemy:GetPivot().Position + Vector3.new(0, 30, 0))
					until not _G.FarmShinigamiBoss or NearEnemy.Humanoid.Health <= 0 or not NearEnemy.Parent or Humanoid.Health <= 0
				else
					local NearSpawn = nil
					for _, Spawn in pairs(EnemySpawns:GetChildren()) do
						if GetTrueName(Spawn.Name) == "Soul Reaper" then
							NearSpawn = Spawn
							break
						end
					end
					if NearSpawn then
						Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
					elseif VerifyTool("Hallow Essence") then
						Tween(Vector3.new(-8934, 144, 6059))
					end
				end
			end
			if _G.FarmEliteHunters then
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					for _, enemy in pairs(Cont:GetChildren()) do
						if table.find(EliteHunterEnemies, enemy.Name) and enemy:FindFirstChildOfClass("Humanoid") and enemy.Humanoid.Health > 0 then
							repeat
								task.wait()
								CommF_("EliteHunter")
								EquipTool()
								Tween(enemy:GetPivot().Position + Vector3.new(0, 30, 0))
							until not _G.FarmEliteHunters or not enemy:FindFirstChild("Humanoid") or enemy.Humanoid.Health <= 0 or not enemy.Parent or Humanoid.Health <= 0
						end
					end
				end
			end
			if _G.KatakuriV1 then
			    for _, Cont in pairs({Enemies, ReplicatedStorage}) do
			        if Cont:FindFirstChild("Cake Prince") then
			            for _, Enemy in pairs(Cont:GetChildren()) do
			                if Enemy.Name == "Cake Prince" then
			                    if Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
			                        repeat
			                            task.wait()
			                            EquipTool()
			                            Tween(Enemy:GetPivot().Position + Vector3.new(0, 30, 0))
			                        until not _G.KatakuriV1 or not Enemy.Parent or Enemy.Humanoid.Health <= 0
			                    end
			                end
			            end
			        else
			            if GetCakePrinceValue() > 0 then
			                local Closest, Distance = nil, math.huge
			                for _, Cont in pairs({Enemies, ReplicatedStorage}) do
			                    for _, Enemy in pairs(Cont:GetChildren()) do
			                        if table.find(KatakuriEnemies, Enemy.Name) and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
			                            local Mag = (HRP.Position - Enemy:GetPivot().Position).Magnitude
			                            if Mag < Distance then
			                                Distance = Mag
			                                Closest = Enemy
			                            end
			                        end
			                    end
			                end
			                if Closest then
			                    local Enemy = Closest
			                    if Enemy:FindFirstChild("Humanoid") and Enemy:FindFirstChild("HumanoidRootPart") and Enemy.Humanoid.Health > 0 then
			                        repeat
			                            task.wait()
										bringmobs = true
			                            EquipTool()
			                            Tween(Enemy:GetPivot().Position + Vector3.new(0, 30, 0))
										MobPos = Enemy:GetPivot().Position
										MobName = Enemy.Name
			                        until not _G.KatakuriV1 or not Enemy.Parent or Enemy.Humanoid.Health <= 0 or GetCakePrinceValue() == 0
			                        bringmobs = false
			                    end
			                else
		                        local NearSpawn = nil
		                        for _, Spawn in pairs(EnemySpawns:GetChildren()) do
		                            if table.find(KatakuriEnemies, GetTrueName(Spawn.Name)) then
		                                NearSpawn = Spawn
		                                break
		                            end
		                        end
		                        if NearSpawn then
		                            Tween(NearSpawn.Position + Vector3.new(0, 30, 0))
			                    end
				            end
						else
				            CommF_("CakePrinceSpawner")
							CommF_("CakePrinceSpawner", true)
						end
			        end
			    end
			end
		end
	end)
	
	----------------------------------------[[ Quests ]]----------------------------------------
	
	----------------------------------------[[ SeaEvent ]]----------------------------------------
	
	----------------------------------------[[ Fish ]]----------------------------------------
	
	----------------------------------------[[ Fruits ]]----------------------------------------
	
	function Store(where)
		for _, fruit in where:GetChildren() do
			if fruit.Name:find("Fruit") then
				CommF_("StoreFruit", fruit:GetAttribute("OriginalName"), fruit)
			end
		end
	end
	
	task.spawn(function()
		while task.wait() do
			local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			local Humanoid = Char:FindFirstChildOfClass("Humanoid")
			local HRP = Char:FindFirstChild("HumanoidRootPart")
			if not Char or not Humanoid or not HRP then continue end
			if _G.StoreFruits then
				Store(Backpack)
				Store(Char)
			end
			if _G.CollectFruits then
				local NearestHandle, MinDist = nil, math.huge
				for _, tool in w:GetChildren() do
					if tool.Name:find("Fruit") then
						if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
							firetouchinterest(HRP, tool.Handle, 0)
							firetouchinterest(HRP, tool.Handle, 1)
						elseif tool:IsA("Model") then
							local Handle = tool:FindFirstChild("Handle")
							if Handle then
								local Dist = (Handle.Position - HRP.Position).Magnitude
								if Dist < MinDist then
									MinDist = Dist
									NearestHandle = Handle
								end
							end
						end
					end
				end
				if NearestHandle then
					Tween(NearestHandle.Position)
				end
			end
			if _G.RandomFruits then
				CommF_("Cousin", "Buy")
			end
		end
	end)
	
	----------------------------------------[[ Teleport ]]----------------------------------------
	
	if Sea1 then
	    IslandList = {
	        "WindMill",
	        "Marine",
	        "Middle Town",
	        "Jungle",
	        "Pirate Village",
	        "Desert",
	        "Snow Island",
	        "MarineFord",
	        "Colosseum",
	        "Sky Island 1",
	        "Sky Island 2",
	        "Sky Island 3",
	        "Prison",
	        "Magma Village",
	        "Under Water Island",
	        "Fountain City",
	        "Shank Room",
	        "Mob Island"
	    }
	elseif Sea2 then
	    IslandList = {
	        "The Cafe",
	        "Frist Spot",
	        "Dark Area",
	        "Flamingo Mansion",
	        "Flamingo Room",
	        "Green Zone",
	        "Factory",
	        "Colossuim",
	        "Zombie Island",
	        "Two Snow Mountain",
	        "Punk Hazard",
	        "Cursed Ship",
	        "Ice Castle",
	        "Forgotten Island",
	        "Ussop Island",
	        "Mini Sky Island"
	    }
	elseif Sea3 then
	    IslandList = {
	        "Mansion",
	        "Port Town",
	        "Great Tree",
	        "Castle On The Sea",
	        "MiniSky",
	        "Hydra Island",
	        "Floating Turtle",
	        "Haunted Castle",
	        "Ice Cream Island",
	        "Peanut Island",
	        "Cake Island",
	        "Cocoa Island",
	        "Candy Island",
	        "Tiki Outpost",
			"Submerged Island",
	    }
	end
	
	----------------------------------------[[ Player ]]----------------------------------------
	
	function CheckAlly(Target)
	    if not Target then return false end
	    if Target:IsA("Player") and tostring(LocalPlayer.Team) == "Marines" and tostring(Target.Team) == "Marines" then
	        return true
	    end
	    if Target == LocalPlayer then
	        return true
	    end
		if CollectionService:HasTag(Target, "Ally"..LocalPlayer.Name) or CollectionService:HasTag(LocalPlayer, "Ally"..Target.Name) then
			return true
		end
	    return false
	end
	
	task.spawn(function()
		while task.wait() do
			local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			local Humanoid = Char:FindFirstChildOfClass("Humanoid")
			local HRP = Char:FindFirstChild("HumanoidRootPart")
			if not Char or not Humanoid or not HRP then continue end
			if Humanoid.Health > 0 then
				if _G.ChangeSpeed then
					Char:SetAttribute("SpeedMultiplier", _G.SelectWalkSpeed/36)
				else
					Char:SetAttribute("SpeedMultiplier", 1)
				end
				if _G.ChangeDashDistance then
					Char:SetAttribute("DashLength", _G.SelectDashDistance)
					Char:SetAttribute("DashLengthAir", _G.SelectDashDistance)
				else
					Char:SetAttribute("DashLength", 1)
					Char:SetAttribute("DashLengthAir", 1)
				end
				if _G.AimbotNearest then
					local Mouse = require(ReplicatedStorage.Mouse)
					local nearest, nearestDist = nil, math.huge
					if not _G.IgnoreEnemies then
						for _, npc in pairs(w.Enemies:GetChildren()) do
							local NHum = npc:FindFirstChild("Humanoid")
							local Head = npc:FindFirstChild("Head")
							if NHum and NHum.Health > 0 and Head then
								local dist = (Head.Position - HRP.Position).Magnitude
								if dist < nearestDist then
									nearestDist = dist
									nearest = Head
								end
							end
						end
					end
					for _, player in pairs(Players:GetPlayers()) do
						if player ~= LocalPlayer and player.Character and not CheckAlly(player) then
							local PHum = player.Character:FindFirstChild("Humanoid")
							local Head = player.Character:FindFirstChild("Head")
							if PHum and PHum.Health > 0 and Head then
								local dist = (Head.Position - HRP.Position).Magnitude
								if dist < nearestDist then
									nearestDist = dist
									nearest = Head
								end
							end
						end
					end
					if nearest then
						Mouse.Hit = nearest.CFrame
					end
				end
			end
		end
	end)
	
	UIS.JumpRequest:Connect(function()
		local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local Humanoid = Char:FindFirstChildOfClass("Humanoid")
		if _G.InfiniteJump and Humanoid and Humanoid.Health > 0 then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
	
	----------------------------------------[[ Race ]]----------------------------------------
	
	----------------------------------------[[ Shop ]]----------------------------------------
	
	----------------------------------------[[ Visual ]]----------------------------------------
	
	FruitsData = {
		["rbxassetid://15124425041"] = {Name = "Rocket Fruit", Image = "rbxassetid://124904243114736", Rarity = "Common"},
		["rbxassetid://15123685330"] = {Name = "Spin Fruit", Image = "rbxassetid://125987181378388", Rarity = "Common"},
		["rbxassetid://15123613404"] = {Name = "Blade Fruit", Image = "rbxassetid://133974387882071", Rarity = "Common"},
		["rbxassetid://15123689268"] = {Name = "Spring Fruit", Image = "rbxassetid://134013067789926", Rarity = "Common"},
		["rbxassetid://15123595806"] = {Name = "Bomb Fruit", Image = "rbxassetid://139922914635788", Rarity = "Common"},
		["rbxassetid://15123677932"] = {Name = "Smoke Fruit", Image = "rbxassetid://99523390558254", Rarity = "Common"},
		["rbxassetid://15124220207"] = {Name = "Spike Fruit", Image = "rbxassetid://124890777809197", Rarity = "Common"},
		["rbxassetid://121545956771325"] = {Name = "Flame Fruit", Image = "rbxassetid://97880651761965", Rarity = "Uncommon"},
		["rbxassetid://15100433167"] = {Name = "Ice Fruit", Image = "rbxassetid://136877468840396", Rarity = "Uncommon"},
		["rbxassetid://15123673019"] = {Name = "Sand Fruit", Image = "rbxassetid://93883477293511", Rarity = "Uncommon"},
		["rbxassetid://15123618591"] = {Name = "Dark Fruit", Image = "rbxassetid://115322940089418", Rarity = "Uncommon"},
		["rbxassetid://77885466312115"] = {Name = "Eagle Fruit", Image = "rbxassetid://74870738047722", Rarity = "Uncommon"},
		["rbxassetid://15112600534"] = {Name = "Diamond Fruit", Image = "rbxassetid://119743790291961", Rarity = "Uncommon"},
		["rbxassetid://15123640714"] = {Name = "Light Fruit", Image = "rbxassetid://71526210186918", Rarity = "Rare"},
		["rbxassetid://15123668008"] = {Name = "Rubber Fruit", Image = "rbxassetid://122402408521248", Rarity = "Rare"},
		["rbxassetid://15123662036"] = {Name = "Ghost Fruit", Image = "rbxassetid://115906333233054", Rarity = "Rare"},
		["rbxassetid://15123645682"] = {Name = "Magma Fruit", Image = "rbxassetid://119356630077347", Rarity = "Rare"},
		["rbxassetid://15123659214"] = {Name = "Quake Fruit", Image = "rbxassetid://136765989753584", Rarity = "Legendary"},
		["rbxassetid://15123606541"] = {Name = "Buddha Fruit", Image = "rbxassetid://99168481648562", Rarity = "Legendary"},
		["rbxassetid://15123643097"] = {Name = "Love Fruit", Image = "rbxassetid://93996455419183", Rarity = "Legendary"},
		["rbxassetid://15123681598"] = {Name = "Spider Fruit", Image = "rbxassetid://131967190012072", Rarity = "Legendary"},
		["rbxassetid://116828771482820"] = {Name = "Creation Fruit", Image = "rbxassetid://116575631037600", Rarity = "Legendary"},
		["rbxassetid://15123679712"] = {Name = "Sound Fruit", Image = "rbxassetid://114098174367759", Rarity = "Legendary"},
		["rbxassetid://15123654553"] = {Name = "Phoenix Fruit", Image = "rbxassetid://106988656246811", Rarity = "Legendary"},
		["rbxassetid://15123656798"] = {Name = "Portal Fruit", Image = "rbxassetid://94632418000932", Rarity = "Legendary"},
		["rbxassetid://15123670514"] = {Name = "Rumble Fruit", Image = "rbxassetid://112807922264832", Rarity = "Legendary"},
		["rbxassetid://15123652069"] = {Name = "Pain Fruit", Image = "rbxassetid://72125923104449", Rarity = "Legendary"},
		["rbxassetid://15123587371"] = {Name = "Blizzard Fruit", Image = "rbxassetid://136766547178278", Rarity = "Legendary"},
		["rbxassetid://15123633312"] = {Name = "Gravity Fruit", Image = "rbxassetid://84292144182069", Rarity = "Mythical"},
		["rbxassetid://15123648309"] = {Name = "Mammoth Fruit", Image = "rbxassetid://117344163367778", Rarity = "Mythical"},
		["rbxassetid://15694681122"] = {Name = "T-Rex Fruit", Image = "rbxassetid://111080443643455", Rarity = "Mythical"},
		["rbxassetid://15123624401"] = {Name = "Dough Fruit", Image = "rbxassetid://108984363494229", Rarity = "Mythical"},
		["rbxassetid://15123675904"] = {Name = "Shadow Fruit", Image = "rbxassetid://117499868462830", Rarity = "Mythical"},
		["rbxassetid://10773719142"] = {Name = "Venom Fruit", Image = "rbxassetid://97423516356340", Rarity = "Mythical"},
		["rbxassetid://15123616275"] = {Name = "Control Fruit", Image = "rbxassetid://96155264810651", Rarity = "Mythical"},
		["rbxassetid://118054805452821"] = {Name = "Gas Fruit", Image = "rbxassetid://99827714105845", Rarity = "Mythical"},
		["rbxassetid://11911905519"] = {Name = "Spirit Fruit", Image = "rbxassetid://74999669338772", Rarity = "Mythical"},
		["rbxassetid://15123638064"] = {Name = "Tiger Fruit", Image = "rbxassetid://135188150527869", Rarity = "Mythical"},
		["rbxassetid://115276580506154"] = {Name = "Yeti Fruit", Image = "rbxassetid://79585045368547", Rarity = "Mythical"},
		["rbxassetid://15487764876"] = {Name = "Kitsune Fruit", Image = "rbxassetid://110190562050491", Rarity = "Mythical"},
		["rbxassetid://95749033139458"] = {Name = "Dragon Fruit", Image = "rbxassetid://122384981573934", Rarity = "Mythical"},
	}
	
	BerriesData = {
	    ["Blue Icicle Berry"] = {Image = "rbxassetid://86520396343538", Color = "rgb(0, 162, 255)"},
	    ["Green Toad Berry"] = {Image = "rbxassetid://91948271748927", Color = "rgb(0, 255, 0)"},
	    ["Orange Berry"] = {Image = "rbxassetid://74050626899602", Color = "rgb(255, 165, 0)"},
	    ["Pink Pig Berry"] = {Image = "rbxassetid://101490686556249", Color = "rgb(255, 192, 203)"},
	    ["Purple Jelly Berry"] = {Image = "rbxassetid://93939448612031", Color = "rgb(128, 0, 128)"},
	    ["Red Cherry Berry"] = {Image = "rbxassetid://118278340780007", Color = "rgb(255, 0, 0)"},
	    ["White Cloud Berry"] = {Image = "rbxassetid://79670000915648", Color = "rgb(255, 255, 255)"},
	    ["Yellow Star Berry"] = {Image = "rbxassetid://93720145607080", Color = "rgb(255, 255, 0)"}
	}
	
	ChestsData = {
		["Chest1"] = {Name = "Silver Chest", Color = "rgb(192, 192, 192)"},
		["Chest2"] = {Name = "Gold Chest", Color = "rgb(255, 215, 0)"},
		["Chest3"] = {Name = "Diamond Chest", Color = "rgb(0, 255, 255)"},
		["FragChest"] = {Name = "Fragments Chest", Color = "rgb(153, 0, 120)"},
	}
	
	FlowersData = {
		["Flower1"] = {Name = "Blue Flower", Color = "rgb(0,0,170)"}, 
		["Flower2"] = {Name = "Red Flower", Color = "rgb(170,0,0)"},
	}
	
	FruitColors = {
		["Apple"] = "rgb(255, 50, 50)",
		["Banana"] = "rgb(255, 255, 0)",
		["Pineapple"] = "rgb(255, 180, 0)",
	}
	
	Teams = {
		["Pirates"] = "rgb(255, 89, 89)",
		["Marines"] = "rgb(175, 221, 255)"
	}
	
	RarityColor = {
		["Common"] = "rgb(179, 179, 179)",
		["Uncommon"] = "rgb(92, 140, 211)",
		["Rare"] = "rgb(140, 82, 255)",
		["Legendary"] = "rgb(213, 43, 228)",
		["Mythical"] = "rgb(238, 47, 50)"
	}
	
	local FontList = {}
	
	for _, font in pairs(Enum.Font:GetEnumItems()) do
	    table.insert(FontList, font.Name)
	end
	
	table.sort(FontList, function(a, b)
	    return a:lower() < b:lower()
	end)
	
	function EspPlayers()
		local LocalChar = LocalPlayer.Character
		if not LocalChar then return end
		local LocalHead = LocalChar:FindFirstChild("Head")
		if not LocalHead then return end
		local AllPlayers = Players:GetPlayers()
		if not _G.ESPPlayers then
			for _, player in pairs(AllPlayers) do
				if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("Player ESP") then
					player.Character.Head["Player ESP"]:Destroy()
				end
			end
		end
		if _G.ESPPlayers then
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
					local Distance = math.floor((Head.Position - LocalHead.Position).Magnitude/5)
					local Text = string.format("<font color='%s'>%s</font> <font color='rgb(120, 120, 120)'>[%d]</font>\n<font color='rgb(0, 255, 0)'>[%d/%d]</font>", TeamColor, DispName, Distance, math.floor(Humanoid.Health), Humanoid.MaxHealth)
					if not Head:FindFirstChild("Player ESP") then
						local Bill = Instance.new("BillboardGui", Head)
	                    Bill.Name = "Player ESP"
	                    Bill.Size = UDim2.new(0, 240, 0, 40)
	                    Bill.Adornee = Head
	                    Bill.AlwaysOnTop = true
	                    local Name = Instance.new("TextLabel", Bill)
		                Name.Name = "Label"
	                    Name.Font = (_G.SelectFont or S["Select Font"])
	                    Name.TextSize = (_G.FontSize or S["Font Size"])
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
	
	function EspFruits()
		local LocalChar = LocalPlayer.Character
		if not LocalChar then return end
		local LocalHead = LocalChar:FindFirstChild("Head")
		if not LocalHead then return end
		if not _G.ESPFruits then
			for _, fruit in pairs(w:GetChildren()) do
				if fruit.Name:lower():find("fruit") then
					local Handle = fruit:FindFirstChild("Handle")
					if Handle and Handle:FindFirstChild("Fruit ESP") then
						Handle["Fruit ESP"]:Destroy()
					end
				end
			end
		end
		if _G.ESPFruits then
			for _, fruit in pairs(w:GetChildren()) do
				if fruit.Name:find("Fruit") then
					local Handle = fruit:FindFirstChild("Handle")
					if not Handle then continue end
					local fruitModel = fruit:FindFirstChild("Fruit")
					local idle = fruitModel and fruitModel:FindFirstChild("Idle")
					local anim = fruitModel and fruitModel:FindFirstChild("Animation")
					local mesh = fruitModel and fruitModel:FindFirstChild("Fruit")
					local fruitId = idle and idle.AnimationId or anim and anim.AnimationId or mesh and mesh.MeshId
					local FruitData = FruitsData[fruitId]
					if FruitData then
						local FruitName = Translate(FruitData.Name)
						local FruitImage = FruitData.Image
						local RarityCor = RarityColor[FruitData.Rarity]
						local Distance = math.floor((Handle.Position - LocalHead.Position).Magnitude/5)
						local Text = string.format("<font color='%s'>%s</font> <font color='rgb(120, 120, 120)'>[%d]</font>", RarityCor, FruitName or "???", Distance)
						local nearestLoc, nearestDist = nil, math.huge
						for _, loc in pairs(Locations:GetChildren()) do
							if loc:IsA("BasePart") then
								local dist = (Handle.Position - loc.Position).Magnitude
								if dist < nearestDist then
									nearestDist = dist
									nearestLoc = loc
								end
							end
						end
						if nearestLoc then
							local StatusText = fruit:IsA("Tool") and Translate("Dropped") or Translate("Spawned")
							Text = Text .. string.format("\n<font color='rgb(255, 215, 0)'>[%s][%s]</font>", StatusText, nearestLoc.Name)
						end
						if not Handle:FindFirstChild("Fruit ESP") then
							local Bill = Instance.new("BillboardGui", Handle)
							Bill.Name = "Fruit ESP"
							Bill.Size = UDim2.new(0, 240, 0, 40)
							Bill.Adornee = Handle
							Bill.AlwaysOnTop = true
							local NameLabel = Instance.new("TextLabel", Bill)
							NameLabel.Name = "Label"
							NameLabel.Font = (_G.SelectFont or S["Select Font"])
							NameLabel.TextSize = (_G.FontSize or S["Font Size"])
							NameLabel.RichText = true
							NameLabel.Text = Text
							NameLabel.Size = UDim2.new(1, 0, 1, 0)
							NameLabel.BackgroundTransparency = 1
							NameLabel.TextStrokeTransparency = 0
							NameLabel.AutoLocalize = true
							local Image = Instance.new("ImageLabel", Bill)
							Image.Name = "Fruit Image"
							Image.BackgroundTransparency = 1
							Image.Size = UDim2.new(0, 65, 0, 65)
							Image.Position = UDim2.new(0, 80, 0, -50)
							Image.Image = FruitImage
						else
							Handle["Fruit ESP"].Label.Text = Text
						end
					end
				end
			end
		end
	end
	
	function EspBerries()
	local LocalChar = LocalPlayer.Character
	if not LocalChar then return end
	local LocalHead = LocalChar:GetPivot()
	if not LocalHead then return end
	local AllBushs = CollectionService:GetTagged("BerryBush")
	if #AllBushs <= 0 then return end
	for _, Bush in pairs(AllBushs) do
		local BushModel = Bush.Parent
		local BerryName = nil
		for name, value in Bush:GetAttributes() do
			if value and BerriesData[value] then
				BerryName = value
				break
			end
		end
		if not _G.ESPBerries or not BerryName then
			local Esp = BushModel:FindFirstChild("Berry ESP")
			if Esp then Esp:Destroy() end
			continue
		end
		local DispName = Translate(BerryName) 
		local BerryColor = BerriesData[BerryName].Color or "#FFFFFF"
		local BerryImage = BerriesData[BerryName].Image or ""
		local BerryChild = Bush:FindFirstChildWhichIsA("Model")
		local Target = (BerryChild and BerryChild) or BushModel
		local Distance = 0
		local TargetPivot = Target:GetPivot()
		if LocalHead.Position and TargetPivot then
			Distance = math.floor((LocalHead.Position - TargetPivot.Position).Magnitude / 5)
		end
		local Text = string.format("<font color='%s'>%s</font> <font color='rgb(120,120,120)'>[%d]</font>", BerryColor, DispName, Distance)
		local Esp = BushModel:FindFirstChild("Berry ESP")
		if not Esp then
			local Bill = Instance.new("BillboardGui", BushModel)
			Bill.Name = "Berry ESP"
			Bill.Size = UDim2.new(0, 240, 0, 40)
			Bill.AlwaysOnTop = true
			local Name = Instance.new("TextLabel", Bill)
			Name.Name = "Label"
			Name.Font = (_G.SelectFont or S["Select Font"])
			Name.TextSize = (_G.FontSize or S["Font Size"])
			Name.RichText = true
			Name.Text = Text
			Name.Size = UDim2.new(1, 0, 1, 0)
			Name.BackgroundTransparency = 1
			Name.TextStrokeTransparency = 0
			Name.AutoLocalize = true
			local Image = Instance.new("ImageLabel", Bill)
			Image.Name = "Berry Image"
			Image.BackgroundTransparency = 1
			Image.Size = UDim2.new(0, 50, 0, 50)
			Image.Position = UDim2.new(0, 95, 0, -40)
			Image.Image = BerryImage
			Esp = Bill
		else
			Esp.Label.Text = Text
		end
		if BerryChild and Distance < 250 then
			Esp.Adornee = BerryChild
		else
			Esp.Adornee = BushModel
		end
	end
end
	
	function EspChests()
		local LocalChar = LocalPlayer.Character
		if not LocalChar then return end
		local LocalHead = LocalChar:FindFirstChild("Head")
		if not LocalHead then return end
		for _, chest in CollectionService:GetTagged("_ChestTagged") do
			if not _G.ESPChests or chest:GetAttribute("IsDisabled") then
					local CPPart = chest
					local Gui = CPPart:FindFirstChild("Chest ESP")
					if CPPart and Gui then
						Gui:Destroy()
					end
			end
			if _G.ESPChests and not chest:GetAttribute("IsDisabled") then
				local ChestData = ChestsData[chest.Name]
				if not ChestData then return end
				local ChestName = ChestData.Name
				local ChestColor = ChestData.Color
				local PPart = chest
				if not PPart then return end
				local Distance = math.floor((LocalHead.Position - PPart.Position).Magnitude/5)
				local Text = string.format("<font color='%s'>%s </font><font color='rgb(120, 120, 120)'>[%d]</font>", ChestColor, ChestName, Distance)
				if not PPart:FindFirstChild("Chest ESP") then
					local Bill = Instance.new("BillboardGui", PPart)
	                Bill.Name = "Chest ESP"
	                Bill.Size = UDim2.new(0, 240, 0, 40)
	                Bill.Adornee = PPart
	                Bill.AlwaysOnTop = true
	                local Name = Instance.new("TextLabel", Bill)
	                Name.Name = "Label"
	                Name.Font = (_G.SelectFont or S["Select Font"])
	                Name.TextSize = (_G.FontSize or S["Font Size"])
	                Name.RichText = true
	                Name.Text = Text
	                Name.Size = UDim2.new(1, 0, 1, 0)
	                Name.BackgroundTransparency = 1
	                Name.TextStrokeTransparency = 0
					Name.AutoLocalize = true
				else
					PPart["Chest ESP"].Label.Text = Text
				end
			end
		end
	end
	
	function EspIslands()
		local LocalChar = LocalPlayer.Character
		if not LocalChar then return end
		local LocalHead = LocalChar:FindFirstChild("Head")
		if not LocalHead then return end
		local Locations = Locations:GetChildren()
		if not _G.ESPIslands then
			for _, island in pairs(Locations) do
				if island:FindFirstChild("Island ESP") then
					island["Island ESP"]:Destroy()
				end
			end
		end
		if _G.ESPIslands then
			for _, island in pairs(Locations) do
				if island.Name ~= "Sea" and not island.Name:find("LightningStrikesRegion") then
					local DispName = Translate(island.Name)
					local Distance = math.floor((LocalHead.Position - island.Position).Magnitude/5)
					local Esp = island:FindFirstChild("Island ESP")
					local Text = string.format("<font color='rgb(255, 200, 0)'>%s</font> <font color='rgb(120, 120, 120)'>[%d]</font>", DispName, Distance)
					if not Esp then
						local Bill = Instance.new("BillboardGui", island)
	                    Bill.Name = "Island ESP"
	                    Bill.Size = UDim2.new(0, 240, 0, 40)
	                    Bill.Adornee = island
	                    Bill.AlwaysOnTop = true
	                    local Name = Instance.new("TextLabel", Bill)
		                Name.Name = "Label"
	                    Name.Font = (_G.SelectFont or S["Select Font"])
	                    Name.TextSize = (_G.FontSize or S["Font Size"])
	                    Name.RichText = true
	                    Name.Text = Text
	                    Name.Size = UDim2.new(1, 0, 1, 0)
	                    Name.BackgroundTransparency = 1
	                    Name.TextStrokeTransparency = 0
						Name.AutoLocalize = true
					else
						Esp.Label.Text = Text
					end
				end
			end
		end
	end
	
	function EspFlowers()
		local LocalChar = LocalPlayer.Character
		if not LocalChar then return end
		local LocalHead = LocalChar:FindFirstChild("Head")
		if not LocalHead then return end
		if not _G.ESPFlowers then 
			for _, flower in pairs(w:GetChildren()) do
				if flower:IsA("Part") and flower:FindFirstChild("Flower ESP") then
					flower["Flower ESP"]:Destroy()
				end
			end
		end
		if _G.ESPFlowers then 
			for _, flower in pairs(w:GetChildren()) do
				if flower:IsA("Part") and FlowersData[flower.Name] then
					local Name = Translate(FlowersData[flower.Name].Name)
					local FlowerColor = FlowersData[flower.Name].Color
					local Distance = math.floor((LocalHead.Position - flower.Position).Magnitude/5)
					local Esp = flower:FindFirstChild("Flower ESP")
					local Text = string.format("<font color='%s'>%s</font> <font color='rgb(120, 120, 120)'>[%d]</font>", FlowerColor, Name, Distance)
					if not Esp then
						local Bill = Instance.new("BillboardGui", flower)
	                    Bill.Name = "Flower ESP"
	                    Bill.Size = UDim2.new(0, 240, 0, 40)
	                    Bill.Adornee = flower
	                    Bill.AlwaysOnTop = true
	                    local Name = Instance.new("TextLabel", Bill)
		                Name.Name = "Label"
	                    Name.Font = (_G.SelectFont or S["Select Font"])
	                    Name.TextSize = (_G.FontSize or S["Font Size"])
	                    Name.RichText = true
	                    Name.Text = Text
	                    Name.Size = UDim2.new(1, 0, 1, 0)
	                    Name.BackgroundTransparency = 1
	                    Name.TextStrokeTransparency = 0
						Name.AutoLocalize = true
					else
						Esp.Label.Text = Text
					end
				end
			end
		end
	end
	
	task.spawn(function()
		while task.wait(0.1) do
			EspPlayers()
			EspFruits()
			EspBerries()
			EspChests()
			EspIslands()
			EspFlowers()
		end
	end)
	
	----------------------------------------[[ Window ]]----------------------------------------
	
	loadstring(g:HttpGet("https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/Libraries/Fluent/Icons.lua"))()
	local Window = Fluent:CreateWindow({
	Title = "Vortex Hub - Blox Fruits",
	SubTitle = "Developed By Vortex Team",
	Image = "",
	BackgroundImage = "rbxassetid://112377220018543",
	BackgroundTransparency = 0,
	Size = UDim2.fromOffset(550, 375),
	TabWidth = 180,
	Acrylic = true,
	Theme = "Sunset",
	DropdownsOutsideWindow = true,
	Search = true,
	MinimizeKey = Enum.KeyCode.LeftControl,
	UserInfo = true,
	UserInfoTitle = DisplayName,
	UserInfoSubtitle = SortedText(),
	UserInfoSubtitleColor = Color3.fromRGB(255, 215, 0),
	UserInfoTop = false
	})
	
	Fluent:CreateMinimizer({
	Icon = "rbxassetid://96355621777389",
	Acrylic = false,
	Corner = 5,
	Transparency = 0,
	Draggable = false,
	Size = UDim2.fromOffset(50, 50),
	Position = UDim2.fromOffset(60, 10)
	})
	
	
	
	Social = Window:AddTab({Title = "Social Media", Icon = RandomIcon("Social Media")})
	if LocalPlayer.Data.Level.Value < MaxLevel then
	Stats = Window:AddTab({Title = "Stats", Icon = RandomIcon("Stats")})
	end
	Main = Window:AddTab({Title = "Main", Icon = RandomIcon("Main")})
	Quests = Window:AddTab({Title = "Quests/Items", Icon = RandomIcon("Quests")})
	SeaEvents = Window:AddTab({Title = "Sea Events", Icon = RandomIcon("Sea Events")})
	Fish = Window:AddTab({Title = "Fishing", Icon = RandomIcon("Fishery")})
	Fruits = Window:AddTab({Title = "Fruits", Icon = RandomIcon("Fruits")})
	Teleport = Window:AddTab({Title = "Teleport", Icon = RandomIcon("Teleport")})
	Player = Window:AddTab({Title = "Player", Icon = RandomIcon("Player")})
	Race = Window:AddTab({Title = "Race", Icon = RandomIcon("Race")})
	Shop = Window:AddTab({Title = "Shop", Icon = RandomIcon("Shop")})
	Visual = Window:AddTab({Title = "Visual", Icon = RandomIcon("Visual")})
	Settings = Window:AddTab({Title = "Miscellaneous", Icon = RandomIcon("Miscellaneous")})
	
	----------------------------------------[[ Information ]]----------------------------------------
	
	Social : AddSection("Social Media", RandomIcon())
	
	Social : AddButton({
	Title = "Someone Hub",
	Description = "Script Community; There You Can Find People And More Information About The Script",
	Icon = "rbxassetid://96355621777389",
	})
	
	----------------------------------------[[ Stats ]]----------------------------------------
	
	if LocalPlayer.Data.Level.Value < MaxLevel then
	Stats : AddSection("Auto Stats", RandomIcon())
	
	Stats : AddSlider("slider", {
    Title = "Select Points Amount",
    Description = "",
    Icon = RandomIcon(),
    Min = 0,
    Max = 100,
    Rounding = 0.01,
    Default = (S["Select Points Amount"] or 10),
    Callback = function(Value)
    _G.SelectPointsAmount = Value
    S["Select Points Amount"] = Value
    SS()
    end})
    
    Stats : AddToggle("toggle",{
	Title = "Auto Stats",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Auto Stats"],
	Callback = function(Value)
	_G.AutoStats = Value
	S["Auto Stats"] = Value
	SS()
	end})
	
	Stats : AddSection("")
	
	Stats : AddToggle("toggle", {
	Title = "Add Statistics To Defense Melee",
	Description = "",
	Icon = RandomIcon(),
	Default = (S["Add Statistics To Melee"] or false),
	Callback = function(Value)
	_G.AddStatisticsToMelee = Value
	S["Add Statistics To Melee"] = Value
	SS()
	end})
	
	Stats : AddToggle("toggle", {
	Title = "Add Statistics To Defense",
	Description = "",
	Icon = RandomIcon(),
	Default = (S["Add Statistics To Defense"] or false),
	Callback = function(Value)
	_G.AddStatisticsToDefense = Value
	S["Add Statistics To Defense"] = Value
	SS()
	end})
	
	Stats : AddToggle("toggle", {
	Title = "Add Statistics To Sword",
	Description = "",
	Icon = RandomIcon(),
	Default = (S["Add Statistics To Sword"] or false),
	Callback = function(Value)
	_G.AddStatisticsToSwors = Value
	S["Add Statistics To Sword"] = Value
	SS()
	end})
	
	Stats : AddToggle("toggle", {
	Title = "Add Statistics To Gun",
	Description = "",
	Icon = RandomIcon(),
	Default = (S["Add Statistics To Gun"] or false),
	Callback = function(Value)
	_G.AddStatisticsToGun = Value
	S["Add Statistics To Gun"] = Value
	SS()
	end})
	
	Stats : AddToggle("toggle", {
	Title = "Add Statistics To Blox Fruit",
	Description = "",
	Icon = RandomIcon(),
	Default = (S["Add Statistics To Blox Fruit"] or false),
	Callback = function(Value)
	_G.AddStatisticsToBloxFruit = Value
	S["Add Statistics To Blox Fruit"] = Value
	SS()
	end})
	end
	
	----------------------------------------[[ Settings ]]----------------------------------------
	
	Settings : AddSection("Main Settings", RandomIcon())
	
	Settings : AddDropdown("dropdown",{
	Title = "Select Tool Tip",
	Description = "",
	Icon = RandomIcon(),
	Values = {"Melee", "Sword", "Gun"},
	Default = S["Select Tool Tip"],
	Multi = false,
	Callback = function(Value)
	_G.SelectToolTip = Value
	S["Select Tool Tip"] = Value
	SS()
	end})
	
	Settings : AddSlider("slider",{
    Title = "Tween Speed",
    Description = "",
	Icon = RandomIcon(),
    Min = 50,
    Max = 350,
    Rounding = 10,
    Default = S["Tween Speed"],
    Callback = function(Value)
    _G.TweenSpeed = Value
    S["Tween Speed"] = Value
    SS()
    end})
    
    Settings : AddToggle("toggle",{
	Title = "Bring Enemies",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Bring Enemies"],
	Callback = function(Value)
	_G.BringEnemies = Value
	S["Bring Enemies"] = Value
	SS()
	end})
    
    Settings : AddToggle("toggle",{
	Title = "Auto Buso",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Auto Buso"],
	Callback = function(Value)
	_G.AutoBuso = Value
	S["Auto Buso"] = Value
	SS()
	end})
	
	Settings : AddToggle("toggle",{
	Title = "Auto Attack",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Auto Attack"],
	Callback = function(Value)
	_G.AutoAttack = Value
	S["Auto Attack"] = Value
	SS()
	end})
	
	Settings : AddSection("Others Settings", RandomIcon())
	
	Settings : AddToggle("toggle",{
	Title = "Enable V3 Race",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Enable V3 Race"],
	Callback = function(Value)
	_G.EnableV3 = Value
	S["Enable V3 Race"] = Value
	SS()
	end})
	
	Settings : AddToggle("toggle",{
	Title = "Enable V4 Race",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Enable V4 Race"],
	Callback = function(Value)
	_G.EnableV4 = Value
	S["Enable V4 Race"] = Value
	SS()
	end})
	
	Settings : AddSection("Codes", RandomIcon())
	
	Settings : AddButton({
    Title = "Redeem All Codes",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    
    end})
	
	Settings : AddSection("Menu", RandomIcon())
	
	Settings : AddButton({
    Title = "Open The Normal Fruit Shop",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
	local controllerModule = LocalPlayer.PlayerGui.Main.FruitShopAndDealer.Controller
	if controllerModule then
	    require(controllerModule):Open()
	end
    end})
    
    Settings : AddButton({
    Title = "Open The Advanced Fruit Shop",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    local controllerModule = LocalPlayer.PlayerGui.Main.FruitShopAndDealer.Controller
	if controllerModule then
	    require(controllerModule):Open("AdvancedFruitDealer")
	end
    end})
    
    Settings : AddButton({
    Title = "Open The Titles Menu",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    local Titles = LocalPlayer.PlayerGui.Main.Titles
    if Titles then
	    Titles.Visible = true
	end
    end})
	
	Settings : AddSection("Server", RandomIcon())
	
	Settings : AddParagraph({
	Title = Translate("Server Id")..": "..JobId,
	Content = "",
	Icon = RandomIcon(),
	})
	
	Settings : AddButton({
	Title = "Copy Server Id",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	setclipboard(JobId)
	end})
	
	Settings : AddButton({
	Title = "Rejoin",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	Rejoin()
	end})
	
	Settings : AddButton({
	Title = "Change Server",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	Hop()
	end})
	
	Settings : AddInput("input", {
    Title = "Enter Server Id",
    Description = "",
    Default = "",
    Placeholder = "Server Id Here",
    Numeric = false,
    Finished = false,
    MaxLength = 50,
    Icon = RandomIcon(),
    Visible = true,
    Callback = function(Value)
    _G.JobId = Value
    end})
	
	Settings : AddButton({
	Title = "Join Server Id",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	TeleportService:TeleportToPlaceInstance(PlaceId, Decompile(_G.JobId:gsub("%`", "")), LocalPlayer)
	end})
	
	Settings : AddSection("Team", RandomIcon())
	
	Settings : AddButton({
    Title = "Join Pirates",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    CommF_("SetTeam", "Pirates")
    end})
    
    Settings : AddButton({
    Title = "Join Marines",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    CommF_("SetTeam", "Marines")
    end})
    
    Settings : AddDropdown("dropdown",{
	Title = "Select Team",
	Description = "",
	Icon = RandomIcon(),
	Values = {"Pirates", "Marines"},
	Default = S["Select Team"],
	Multi = false,
	Callback = function(Value)
	S["Select Team"] = Value
	SS()
	end})
	
	Settings : AddToggle("toggle",{
	Title = "Auto Choose Team",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Auto Choose Team"],
	Callback = function(Value)
	S["Auto Choose Team"] = Value
	SS()
	end})
	
	Settings : AddSection("More FPS", RandomIcon())
	
	Settings : AddToggle("toggle",{
	Title = "Disable Notifications",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Disable Notifications"],
	Callback = function(Value)
	local Notify = LocalPlayer.PlayerGui.Notifications
	local Damage = ReplicatedStorage.Assets.GUI.DamageCounter
	if Notify and Damage then
		Notify.Enabled = not Value
		Damage.Enabled = not Value
	end
	S["Disable Notifications"] = Value
	SS()
	end})
	
	Settings : AddSection("Others", RandomIcon())
	
	Settings : AddButton({
	Title = "Reset Settings And Rejoin",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	if ifl(SaveFile) then
	delfile(SaveFile)
	Rejoin()
	end
	end})
	
	Settings : AddToggle("toggle",{
	Title = "Ant Reset",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Ant Reset"],
	Callback = function(Value)
	_G.AntReset = Value
	S["Ant Reset"] = Value
	SS()
	end})
	
	----------------------------------------[[ Main ]]---------------------------------------
	
	Main : AddSection("Main Farm", RandomIcon())
	
	Main : AddToggle("toggle",{
	Title = "Farm Level",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Level"],
	Callback = function(Value)
	_G.FarmLevel = Value
	S["Farm Level"] = Value
	SS()
	end})
	
	Main : AddToggle("toggle",{
	Title = "Farm Nearest",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Nearest"],
	Callback = function(Value)
	_G.FarmNearest = Value
	S["Farm Nearest"] = Value
	SS()
	end})
	
	if Sea1 then
	Main : AddToggle("toggle",{
	Title = "Farm Sky Enemies",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Sky Enemies"],
	Callback = function(Value)
	_G.FarmSkyEnemies = Value
	S["Farm Sky Enemies"] = Value
	SS()
	end})
	elseif Sea2 then
	Main : AddToggle("toggle",{
	Title = "Factory Raid",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Factory Raid"],
	Callback = function(Value)
	_G.FactoryRaid = Value
	S["Factory Raid"] = Value
	SS()
	end})
	elseif Sea3 then
	Main : AddToggle("toggle",{
	Title = "Pirate Raid",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Pirate Raid"],
	Callback = function(Value)
	_G.PirateRaid = Value
	S["Pirate Raid"] = Value
	SS()
	end})
	end
	
	Main : AddSection("Chests", RandomIcon())
	
	Main : AddToggle("toggle",{
	Title = "Collect Chests",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Collect Chests"],
	Callback = function(Value)
	_G.CollectChests = Value
	S["Collect Chests"] = Value
	SS()
	end})
	
	if Sea2 then
	Main : AddSection("Ectoplasms", RandomIcon())
	
	Main : AddToggle("toggle",{
	Title = "Farm Ectoplasms",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Ectoplasms"],
	Callback = function(Value)
	_G.FarmEctoplasms = Value
	S["Farm Ectoplasms"] = Value
	SS()
	end})
	elseif Sea3 then
	Main : AddSection("Bones", RandomIcon())
	
	Main : AddToggle("toggle",{
	Title = "Farm Bones",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Bones"],
	Callback = function(Value)
	_G.FarmBones = Value
	S["Farm Bones"] = Value
	SS()
	end})
	
	Main : AddToggle("toggle",{
	Title = "Farm Shinigami Boss",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Shinigami Boss"],
	Callback = function(Value)
	_G.FarmShinigamiBoss = Value
	S["Farm Shinigami Boss"] = Value
	SS()
	end})
	
	Main : AddToggle("toggle",{
	Title = "Trade Bones",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Trade Bones"],
	Callback = function(Value)
	_G.TradeBones = Value
	S["Trade Bones"] = Value
	SS()
	end})
	end
	
	Main : AddSection("Bosses", RandomIcon())
	
	Main : AddButton({
    Title = "Update Bosses List",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    UpdateBossesList()
    end})
    
    BossesListDrop = Main : AddDropdown("dropdown",{
	Title = "Select Boss",
	Description = "",
	Icon = RandomIcon(),
	Values = BossesList,
	Default = S["Select Boss"],
	Multi = false,
	Callback = function(Value)
	_G.SelectBoss = Value
	S["Select Boss"] = Value
	SS()
	end})
	
	Main : AddToggle("toggle",{
	Title = "Defeat Selected Boss",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Defeat Selected Boss"],
	Callback = function(Value)
	_G.DefeatSelectedBoss = Value
	S["Defeat Selected Boss"] = Value
	SS()
	end})
	
	Main : AddToggle("toggle",{
	Title = "Defeat All Bosses",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Defeat All Bosses"],
	Callback = function(Value)
	_G.DefeatAllBosses = Value
	S["Defeat All Bosses"] = Value
	SS()
	end})
	
	Main : AddButton({
    Title = "Change Server",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    Hop()
    end})
    
    if Sea3 then
    Main : AddSection("Katakuri", RandomIcon())
    
    Main : AddToggle("toggle",{
	Title = "Katakuri V1",
	Description = "",
	Icon = RandomIcon(),
	Icon = RandomIcon(),
	Default = S["Katakuri V1"],
	Callback = function(Value)
	_G.KatakuriV1 = Value
	S["Katakuri V1"] = Value
	SS()
	end})
	
	Main : AddToggle("toggle",{
	Title = "Katakuri V2",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Katakuri V2"],
	Callback = function(Value)
	_G.KatakuriV2 = Value
	S["Katakuri V2"] = Value
	SS()
	end})
	
    Main : AddSection("Elite Hunters", RandomIcon())
	
	Main : AddToggle("toggle",{
	Title = "Farm Elite Hunters",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Elite Hunters"],
	Callback = function(Value)
	_G.FarmEliteHunters = Value
	S["Farm Elite Hunters"] = Value
	SS()
	end})
    end
    
    Main : AddSection("Material", RandomIcon())
    
    Main : AddDropdown("dropdown",{
	Title = "Select Material",
	Description = "",
	Icon = RandomIcon(),
	Values = MaterialList,
	Default = S["Select Material"],
	Multi = false,
	Callback = function(Value)
	_G.SelectMaterial = Value
	S["Select Material"] = Value
	SS()
	end})
	
	Main : AddToggle("toggle",{
	Title = "Farm Material",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Farm Material"],
	Callback = function(Value)
	_G.FarmMaterial = Value
	S["Farm Material"] = Value
	SS()
	end})
    
    ----------------------------------------[[ Quests ]]----------------------------------------
    
	----------------------------------------[[ SeaEvent ]]----------------------------------------
	
	----------------------------------------[[ Fish ]]----------------------------------------
	
	----------------------------------------[[ Fruits ]]----------------------------------------
	
	Fruits : AddSection("Fruits", RandomIcon())
	
	Fruits : AddToggle("toggle",{
	Title = "Random Fruits",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Random Fruits"],
	Callback = function(Value)
	_G.RandomFruits = Value
	S["Random Fruits"] = Value
	SS()
	end})
	
	Fruits : AddToggle("toggle",{
	Title = "Collect Fruits",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Collect Fruits"],
	Callback = function(Value)
	_G.CollectFruits = Value
	S["Collect Fruits"] = Value
	SS()
	end})
	
	Fruits : AddToggle("toggle",{
	Title = "Store Fruits",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Store Fruits"],
	Callback = function(Value)
	_G.StoreFruits = Value
	S["Store Fruits"] = Value
	SS()
	end})
	
	----------------------------------------[[ Teleport ]]----------------------------------------
	
	Teleport : AddSection("World", RandomIcon())
	
	Teleport:AddButton({
    Title = Translate("World").." 1",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    CommF_("TravelMain")
    end})
    
	Teleport:AddButton({
    Title = Translate("World").." 2",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    CommF_("TravelDressrosa")
    end})
	
	Teleport:AddButton({
    Title = Translate("World").." 3",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
    CommF_("TravelZou")
    end})

	Teleport:AddSection("Island", RandomIcon())
	
	Teleport : AddDropdown("dropdown",{
	Title = "Select Island",
	Description = "",
	Icon = RandomIcon(),
	Values = IslandList,
	Default = "...",
	Multi = false,
	Callback = function(Value)
	_G.SelectIsland = Value
	end})
	
	Teleport:AddButton({
    Title = "Go To Island",
    Description = "",
	Icon = RandomIcon(),
    Callback = function()
	    if _G.SelectIsland == "WindMill" then
		    Tween(Vector3.new(980, 17, 1429))
		elseif _G.SelectIsland == "Marine" then
		    Tween(Vector3.new(-2566, 7, 2045))
		elseif _G.SelectIsland == "Middle Town" then
		    Tween(Vector3.new(-690, 15, 1582))
		elseif _G.SelectIsland == "Jungle" then
		    Tween(Vector3.new(-1613, 37, 149))
		elseif _G.SelectIsland == "Pirate Village" then
		    Tween(Vector3.new(-1181, 5, 3804))
		elseif _G.SelectIsland == "Desert" then
		    Tween(Vector3.new(944, 21, 4373))
		elseif _G.SelectIsland == "Snow Island" then
		    Tween(Vector3.new(1348, 105, -1320))
		elseif _G.SelectIsland == "MarineFord" then
		    Tween(Vector3.new(-4915, 51, 4281))
		elseif _G.SelectIsland == "Colosseum" then
		    Tween(Vector3.new(-1428, 7, -2793))
		elseif _G.SelectIsland == "Sky Island 1" then
		    Tween(Vector3.new(-4869, 733, -2667))
		elseif _G.SelectIsland == "Sky Island 2" then
		    Tween(Vector3.new(-4608, 873, -1668))
		elseif _G.SelectIsland == "Sky Island 3" then
		    Tween(Vector3.new(-7895, 5547, -380))
		elseif _G.SelectIsland == "Prison" then
		    Tween(Vector3.new(4875, 6, 735))
		elseif _G.SelectIsland == "Magma Village" then
		    Tween(Vector3.new(-5248, 13, 8505))
		elseif _G.SelectIsland == "Under Water Island" then
		    Tween(Vector3.new(61164, 12, 1820))
		elseif _G.SelectIsland == "Fountain City" then
		    Tween(Vector3.new(5127, 60, 4105))
		elseif _G.SelectIsland == "Shank Room" then
		    Tween(Vector3.new(-1442, 30, -28))
		elseif _G.SelectIsland == "Mob Island" then
		    Tween(Vector3.new(-2850, 7, 5355))
		elseif _G.SelectIsland == "The Cafe" then
		    Tween(Vector3.new(-380, 77, 256))
		elseif _G.SelectIsland == "Frist Spot" then
		    Tween(Vector3.new(-11, 29, 2772))
		elseif _G.SelectIsland == "Dark Area" then
		    Tween(Vector3.new(3780, 23, -3499))
		elseif _G.SelectIsland == "Flamingo Mansion" then
		    Tween(Vector3.new(-282, 306, 609))
		elseif _G.SelectIsland == "Flamingo Room" then
		    Tween(Vector3.new(2285, 15, 905))
		elseif _G.SelectIsland == "Green Zone" then
		    Tween(Vector3.new(-2449, 73, -3211))
		elseif _G.SelectIsland == "Factory" then
		    Tween(Vector3.new(424, 211, -428))
		elseif _G.SelectIsland == "Colossuim" then
		    Tween(Vector3.new(-1504, 220, 1369))
		elseif _G.SelectIsland == "Zombie Island" then
		    Tween(Vector3.new(-5622, 492, -782))
		elseif _G.SelectIsland == "Two Snow Mountain" then
		    Tween(Vector3.new(753, 408, -5275))
		elseif _G.SelectIsland == "Punk Hazard" then
		    Tween(Vector3.new(-6128, 16, -5040))
		elseif _G.SelectIsland == "Cursed Ship" then
		    Tween(Vector3.new(923, 125, 32886))
		elseif _G.SelectIsland == "Ice Castle" then
		    Tween(Vector3.new(6148, 294, -6741))
		elseif _G.SelectIsland == "Forgotten Island" then
		    Tween(Vector3.new(-3033, 318, -10075))
		elseif _G.SelectIsland == "Ussop Island" then
		    Tween(Vector3.new(4817, 8, 2864))
		elseif _G.SelectIsland == "Mini Sky Island" then
		    Tween(Vector3.new(-289, 49326, -35249))
		elseif _G.SelectIsland == "Great Tree" then
		    Tween(Vector3.new(2681, 1683, -7191))
		elseif _G.SelectIsland == "Castle On The Sea" then
		    Tween(Vector3.new(-5076, 315, -3150))
		elseif _G.SelectIsland == "MiniSky" then
		    Tween(Vector3.new(-261, 49326, -35254))
		elseif _G.SelectIsland == "Port Town" then
		    Tween(Vector3.new(-291, 7, 5344))
		elseif _G.SelectIsland == "Hydra Island" then
		    Tween(Vector3.new(5662, 1013, -335))
		elseif _G.SelectIsland == "Floating Turtle" then
		    Tween(Vector3.new(-13275, 532, -7579))
		elseif _G.SelectIsland == "Mansion" then
		    Tween(Vector3.new(-12469, 375, -7555))
		elseif _G.SelectIsland == "Haunted Castle" then
		    Tween(Vector3.new(-9515, 164, 5786))
		elseif _G.SelectIsland == "Ice Cream Island" then
		    Tween(Vector3.new(-903, 80, -10989))
		elseif _G.SelectIsland == "Peanut Island" then
		    Tween(Vector3.new(-2063, 50, -10233))
		elseif _G.SelectIsland == "Cake Island" then
		    Tween(Vector3.new(-1885, 19, -11667))
		elseif _G.SelectIsland == "Cocoa Island" then
		    Tween(Vector3.new(88, 74, -12319))
		elseif _G.SelectIsland == "Candy Island" then
		    Tween(Vector3.new(-1014, 149, -14556))
		elseif _G.SelectIsland == "Tiki Outpost" then
		    Tween(Vector3.new(-16542, 56, 1044))
		elseif _G.SelectIsland == "Submerged Island" then
			Tween(Vector3.new(11520, -2154, 9829))
	    end
    end})
	
	----------------------------------------[[ Player ]]----------------------------------------
	
	Player : AddSection("Player", RandomIcon())
	
	Player : AddSlider("slider",{
    Title = "Select Walk Speed",
    Description = "",
	Icon = RandomIcon(),
    Min = 10,
    Max = 300,
    Rounding = 10,
    Default = S["Select Walk Speed"],
    Callback = function(Value)
    _G.SelectWalkSpeed = Value
    S["Select Walk Speed"] = Value
    SS()
    end})
    
    Player : AddToggle("toggle",{
	Title = "Change Speed",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Change Speed"],
	Callback = function(Value)
	_G.ChangeSpeed = Value
	S["Change Speed"] = Value
	SS()
	end})
	
	Player : AddSlider("slider",{
    Title = "Select Dash Length",
    Description = "",
	Icon = RandomIcon(),
    Min = 1,
    Max = 200,
    Rounding = 10,
    Default = S["Select Dash Distance"],
    Callback = function(Value)
    _G.SelectDashDistance = Value
    S["Select Dash Distance"] = Value
    SS()
    end})
    
    Player : AddToggle("toggle",{
	Title = "Change Dash Length",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Change Dash Distance"],
	Callback = function(Value)
	_G.ChangeDashDistance = Value
	S["Change Dash Distance"] = Value
	SS()
	end})
	
	Player : AddToggle("toggle",{
	Title = "Infinite Jump",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Infinite Jump"],
	Callback = function(Value)
	_G.InfiniteJump = Value
	S["Infinite Jump"] = Value
	SS()
	end})
	
	Player : AddToggle("toggle",{
	Title = "Walk On Water",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Walk On Water"],
	Callback = function(Value)
	if Value then
		Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 113, 1000)
	else
		Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 80, 1000)
	end
	S["Walk On Water"] = Value
	SS()
	end})
	
	Player : AddSection("Aimbot", RandomIcon())
	
	Player : AddToggle("toggle",{
	Title = "Aimbot Nearest",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Aimbot Nearest"],
	Callback = function(Value)
	_G.AimbotNearest = Value
	S["Aimbot Nearest"] = Value
	SS()
	end})
	
	Player : AddToggle("toggle",{
	Title = "Ignore Enemies",
	Description = "",
	Icon = RandomIcon(),
	Default = S["Ignore Enemies"],
	Callback = function(Value)
	_G.IgnoreEnemies = Value
	S["Ignore Enemies"] = Value
	SS()
	end})
	
	----------------------------------------[[ Race ]]----------------------------------------
	
	----------------------------------------[[ Shop ]]----------------------------------------
	
	--[[Shop : AddSection("Christmas")
	
	Shop : AddButton({
	Title = "Buy 2x EXP (15 Mins.)",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("Candies", "Check")
	CommF_("Candies", "Buy", 1, 1)
	end})
	
	Shop : AddButton({
	Title = "Buy Stats Refund",
	Description = "Buy Stats Refund",
	Callback = function()
	CommF_("Candies", "Check")
	CommF_("Candies", "Buy", 1, 2)
	end})
	
	Shop : AddButton({
	Title = "Buy Race Reroll",
	Description = "Buy Race Reroll",
	Callback = function()
	CommF_("Candies", "Check")
	CommF_("Candies", "Buy", 1, 3)
	end})
	
	Shop : AddButton({
	Title = "Buy 200 Frags",
	Description = "Buy 200 Frags",
	Callback = function()
	CommF_("Candies", "Check")
	CommF_("Candies", "Buy", 2, 2)
	end})
	
	Shop : AddButton({
	Title = "Buy 500 Frags",
	Description = "Buy 500 Frags",
	Callback = function()
	CommF_("Candies", "Check")
	CommF_("Candies", "Buy", 2, 2)
	end})
	]]
	
	Shop : AddSection("Ectoplasm", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Bizarre Rifle",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	end})
	
	Shop : AddButton({
	Title = "Buy Ghoul Mask",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	end})
	
	Shop : AddButton({
	Title = "Buy Midnight Blade",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	end})
	
	Shop : AddSection("Ability Teacher", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Geppo",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyHaki", "Geppo")
	end})
	
	Shop : AddButton({
	Title = "Buy Buso",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyHaki", "Buso")
	end})
	
	Shop : AddButton({
	Title = "Buy Soru",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyHaki", "Soru")
	end})
	
	Shop : AddButton({
	Title = "Buy Ken Haki",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("KenTalk", "Buy")
	end})
	
	Shop : AddSection("Miscellaneous", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Random Race",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BlackbeardReward", "Reroll", "1")
	CommF_("BlackbeardReward", "Reroll", "2")
	end})
	
	Shop : AddButton({
	Title = "Buy Reset Stats",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BlackbeardReward", "Refund", "1")
	CommF_("BlackbeardReward", "Refund", "2")
	end})
	
	Shop : AddSection("Fighting Styles", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Black Leg",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyBlackLeg")
	end})
	
	Shop : AddButton({
	Title = "Buy Electro",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyElectro")
	end})
	
	Shop : AddButton({
	Title = "Buy Fishman Karate",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyFishmanKarate")
	end})
	
	Shop : AddButton({
	Title = "Buy Dragon Claw",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BlackbeardReward", "DragonClaw", "1")
	CommF_("BlackbeardReward", "DragonClaw", "2")
	end})
	
	Shop : AddButton({
	Title = "Buy Superhuman",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuySuperhuman")
	end})
	
	Shop : AddButton({
	Title = "Buy Death Step",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyDeathStep")
	end})
	
	Shop : AddButton({
	Title = "Buy Sharkman Karate",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuySharkmanKarate")
	end})
	
	Shop : AddButton({
	Title = "Buy Electric Claw",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyElectricClaw")
	end})
	
	Shop : AddButton({
	Title = "Buy Dragon Talon",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyDragonTalon")
	end})
	
	Shop : AddButton({
	Title = "Buy GodHuman",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyGodhuman")
	end})
	
	Shop : AddButton({
	Title = "Buy Sanguine Art",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuySanguineArt")
	end})
	
	Shop : AddSection("Swords", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Katana",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Katana")
	end})
	
	Shop : AddButton({
	Title = "Buy Cutlass",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Cutlass")
	end})
	
	Shop : AddButton({
	Title = "Buy Dual Katana",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Dual Katana")
	end})
	
	Shop : AddButton({
	Title = "Buy Iron Mace",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Iron Mace")
	end})
	
	Shop : AddButton({
	Title = "Buy Triple Katana",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Triple Katana")
	end})
	
	Shop : AddButton({
	Title = "Buy Pipe",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Pipe")
	end})
	
	Shop : AddButton({
	Title = "Buy Dual-Headed Blade",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Dual-Headed Blade")
	end})
	
	Shop : AddButton({
	Title = "Buy Soul Cane",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Soul Cane")
	end})
	
	Shop : AddButton({
	Title = "Buy Bisento",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Bisento")
	end})
	
	Shop : AddSection("Guns", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Musket",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Musket")
	end})
	
	Shop : AddButton({
	Title = "Buy Slingshot",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Slingshot")
	end})
	
	Shop : AddButton({
	Title = "Buy Flintlock",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Flintlock")
	end})
	
	Shop : AddButton({
	Title = "Buy Refined Slingshot",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Refined Slingshot")
	end})
	
	Shop : AddButton({
	Title = "Buy Dual Flintlock",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Dual Flintlock")
	end})
	
	Shop : AddButton({
	Title = "Buy Cannon",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Cannon")
	end})
	
	Shop : AddButton({
	Title = "Buy Kabucha",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BlackbeardReward", "Slingshot", "1")
	CommF_("BlackbeardReward", "Slingshot", "2")
	end})
	
	Shop : AddSection("Accessories", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Black Cape",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Black Cape")
	end})
	
	Shop : AddButton({
	Title = "Buy Swordsman Hat",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Swordsman Hat")
	end})
	
	Shop : AddButton({
	Title = "Buy Tomoe Ring",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("BuyItem", "Tomoe Ring")
	end})
	
	Shop : AddSection("Races", RandomIcon())
	
	Shop : AddButton({
	Title = "Buy Ghoul Race",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("Ectoplasm", "Change", 4)
	end})
	
	Shop : AddButton({
	Title = "Buy Cyborg Race",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CyborgTrainer", "Buy")
	end})
	
	Shop : AddSection("Draco Crafts")
	
	Shop : AddButton({
	Title = "Craft Volcanic Magnet",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "Volcanic Magnet")
	end})
	
	Shop : AddButton({
	Title = "Craft Dragonstorm",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "Dragonstorm")
	end})
	
	Shop : AddButton({
	Title = "Craft Dragonheart",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "Dragonheart")
	end})
	
	Shop : AddButton({
	Title = "Craft T-Rex Skull",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "TRexSkull")
	end})
	
	Shop : AddButton({
	Title = "Craft Dino Hood",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "DinoHood")
	end})
	
	Shop : AddSection("Beast Hunter", RandomIcon())
	
	Shop : AddButton({
	Title = "Craft Leviathan Crown",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "LeviathanCrown")
	end})
	
	Shop : AddButton({
	Title = "Craft Leviathan Shield",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "LeviathanShild")
	end})
	
	Shop : AddButton({
	Title = "Craft Leviathan Ship",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "LeviathanShip")
	end})
	
	Shop : AddSection("Shark Hunter", RandomIcon())
	
	Shop : AddButton({
	Title = "Craft Shark Tooth Necklace",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "Tooth Necklace")
	end})
	
	Shop : AddButton({
	Title = "Craft Terror Jaw",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "Terror Jaw")
	end})
	
	Shop : AddButton({
	Title = "Craft Monster Magnet",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "Shark Anchor")
	end})
	
	Shop : AddSection("Dragon Talon Sage", RandomIcon())
	
	Shop : AddButton({
	Title = "Craft Common Scroll",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "CommonScroll")
	end})
	
	Shop : AddButton({
	Title = "Craft Rare Scroll",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "RareScroll")
	end})
	
	Shop : AddButton({
	Title = "Craft Legendary Scroll",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "LegendaryScroll")
	end})
	
	Shop : AddButton({
	Title = "Craft Mythical Scroll",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
	CommF_("CraftItem", "Craft", "MythicalScroll")
	end})
	
	----------------------------------------[[ Visual ]]----------------------------------------
	
	Visual : AddSection("Extra Sensory Perception", RandomIcon())
	
	Visual : AddSlider("slider",{
    Title = "Font Size",
    Description = "",
	Icon = RandomIcon(),
    Min = 8,
    Max = 24,
    Rounding = 0.5,
    Default = S["Font Size"],
    Callback = function(Value)
    _G.FontSize = Value
    S["Font Size"] = Value
    SS()
    end})
    
    Visual : AddDropdown("dropdown",{
	Title = "Select Font",
	Description = "",
	Icon = RandomIcon(),
	Values = FontList,
	Default = S["Select Font"],
	Multi = false,
	Callback = function(Value)
	_G.SelectFont = Value
	S["Select Font"] = Value
	SS()
	end})
    
	Visual : AddToggle("toggle",{
    Title = "ESP Players",
    Description = "",
	Icon = RandomIcon(),
    Default = S["ESP Players"],
    Callback = function(Value)
    _G.ESPPlayers = Value
    S["ESP Players"] = Value
	SS()
    end})
    
    Visual : AddToggle("toggle",{
    Title = "ESP Fruits",
    Description = "",
	Icon = RandomIcon(),
    Default = S["ESP Fruits"],
    Callback = function(Value)
    _G.ESPFruits = Value
    S["ESP Fruits"] = Value
	SS()
    end})
    
    Visual : AddToggle("toggle",{
    Title = "ESP Berries",
    Description = "",
	Icon = RandomIcon(),
    Default = S["ESP Berries"],
    Callback = function(Value)
    _G.ESPBerries = Value
    S["ESP Berries"] = Value
	SS()
    end})
    
    Visual : AddToggle("toggle",{
    Title = "ESP Chests",
    Description = "",
	Icon = RandomIcon(),
    Default = S["ESP Chests"],
    Callback = function(Value)
    _G.ESPChests = Value
    S["ESP Chests"] = Value
	SS()
    end})
    
    Visual : AddToggle("toggle",{
    Title = "ESP Islands",
    Description = "",
	Icon = RandomIcon(),
    Default = S["ESP Islands"],
    Icon = RandomIcon(),
    Callback = function(Value)
    _G.ESPIslands = Value
    S["ESP Islands"] = Value
	SS()
    end})
    
    if Sea2 then
    Visual : AddToggle("toggle",{
    Title = "ESP Flowers",
    Description = "",
	Icon = RandomIcon(),
    Default = S["ESP Flowers"],
    Callback = function(Value)
    _G.ESPFlowers = Value
    S["ESP Flowers"] = Value
	SS()
    end})
    end
    
    Visual : AddSection("Fake", RandomIcon())
	
	Visual : AddButton({
	Title = "Fruit Rain",
	Description = "",
	Icon = RandomIcon(),
	Callback = function()
		for _, Fruit in pairs(game:GetObjects("rbxassetid://96375671161494")[1]:GetChildren()[1]:GetChildren()) do
		    local Root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		    if Root then
				for _, desc in Fruit:GetDescendants() do
					if desc:IsA("BasePart") then
						desc.CanCollide = true
					end
				end
				CollectionService:AddTag(Fruit, "VisualFruit")
		        Fruit.Parent = workspace
		        Fruit:MoveTo(Root.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
		        --if Fruit.PrimaryPart then
		            --Fruit:SetPrimaryPartCFrame(CFrame.new(Fruit.PrimaryPart.Position) * CFrame.Angles(0, 0, 0))
		        --end
		        if Fruit:FindFirstChild("Fruit") and Fruit.Fruit:FindFirstChild("AnimationController") and Fruit.Fruit:FindFirstChild("Idle") then
		            Fruit.Fruit.AnimationController:LoadAnimation(Fruit.Fruit.Idle):Play()
		        end
		        if Fruit:FindFirstChild("Handle") then
					Fruit.Handle.CanTouch = true
		            Fruit.Handle.Touched:Connect(function(Hit)
		                if Hit.Parent:FindFirstChildOfClass("Humanoid") then
		                    Fruit.Parent = LocalPlayer.Backpack
		                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(Fruit)
		                end
		            end)
		        end
		    end
		end
	end})
	print(Translate("I Love My Mother"))