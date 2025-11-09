	----------------------------------------[[ Others ]]----------------------------------------
	g = game
	
	w = workspace
	MaxLevel = w:GetAttribute("LEVEL_CAP")
	Boats = w.Boats
	ChestModels = w.ChestModels
	Enemies = w.Enemies
	Map = w.Map
	WorldOrigin = w._WorldOrigin
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
	FilePrefix = "Someone Settings"
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
		["Y Pos"] = 30,
		-- Stats --
		
		-- Information --
		
		-- Main --
		
		-- Quests --
		
		-- SeaEvent --
		
		-- Fish --
		
		-- Fruits --
		
		-- Teleport --
		
		-- Player --
		
		-- Race --
		
		-- Shop --
		
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

	local Redzlib = loadstring(g:HttpGet("https://raw.githubusercontent.com/SomeoneScripts/Main/main/Libraries/Redz/redzlib.lua"))()
	
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
	
	----------------------------------------[[ Universal ]]----------------------------------------
	
	function VerifyTool(Name)
		local Char = LocalPlayer.Character
		if not Char then return end
		local CTool = Char:FindFirstChid(Name)
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
	
	----------------------------------------[[ Settings ]]----------------------------------------
	
	function EquipTool(Name)
	    local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	    local Humanoid = Char:WaitForChild("Humanoid")
	    local Tool
	    if Name then
	        Tool = Backpack:FindFirstChild(Name)
	    else
	        for _, T in ipairs(Backpack:GetChildren()) do
	            if T:IsA("Tool") and T.ToolTip == _G.SelectToolTip then
	                Tool = T
	                break
	            end
	        end
	    end	
	    if Tool then
	        Humanoid:EquipTool(Tool)
	    end
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
			table.insert(PortalPos, Vector3.new(-16813, 58, 304))
		end
		
		--[[if Sea3 and unlocks.DefeatedIndraTrueForm then
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
			task.wait(0.2)
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
			HumanoidRootPart.CFrame = Map["Boat Castle"].MapTeleportC:GetPivot()
			ReplicatedStorage.Modules.Net["RF/BoatCastleTeleporters"]:InvokeServer("InitiateTeleport", Map["Boat Castle"].MapTeleportC)
		elseif HalloweenPortais[closestPortal] then
			Tween(Vector3.new(-12482, 375, -7546))
			task.wait(0.5)
			Remotes.HalloweenPortal:InvokeServer("b", HalloweenPortais[closestPortal])
			Remotes.HalloweenPortal:InvokeServer("b", HalloweenPortais[closestPortal])
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
	end
	
	task.spawn(function()
		while true do
			if _G.BringEnemies and bringmobs then
				for _, mob in pairs(Enemies:GetChildren()) do
					if mob:IsA("Model") and mob.Name == MobName then
						local humanoid = mob:FindFirstChildOfClass("Humanoid")
						local hrp = mob:FindFirstChild("HumanoidRootPart")
						if humanoid and hrp and humanoid.Health > 0 then 
							local distance = (MobPos - hrp.Position).Magnitude
							if distance > 10 then
								humanoid.PlatformStand = true
								task.wait()
								hrp.AssemblyLinearVelocity = (MobPos - hrp.Position).Unit * 150
							elseif distance <= 10 then
								humanoid.AutoRotate = false
								humanoid.Sit = true
								humanoid.PlatformStand = false
								hrp.AssemblyLinearVelocity = Vector3.zero
							end
						end
					end
				end
			end
			task.wait(0.1)
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
	
		local Target = Targets[1]
	
		if CollectionService:HasTag(Target, "NoAttack") then return end
	
		local TargetRoot = Target:FindFirstChild("HumanoidRootPart") or Target.PrimaryPart
		if not TargetRoot then return end
	
		require(ReplicatedStorage.Mouse).Hit, require(ReplicatedStorage.Mouse).Target = TargetRoot.CFrame, TargetRoot
	
		local HitOptions = {
			"RightLowerArm",
			"RightUpperArm",
			"LeftLowerArm",
			"LeftUpperArm",
			"RightHand",
			"LeftHand"
		}
		local HitPart = Target:FindFirstChild(HitOptions[math.random(#HitOptions)]) or Target.PrimaryPart
		if not HitPart then return end
	
		if ToolName == "Skull Guitar" then
			local Remote = EquippedTool:FindFirstChild("RemoteEvent")
			if Remote then Remote:FireServer("TAP", TargetRoot.Position) end
			return
		end
	
		if EquippedTool.ToolTip == "Blox Fruit" and not table.find({"Ice-Ice","Light-Light"}, ToolName) and Humanoid:FindFirstChild("") then
			require(ReplicatedStorage.Mouse).Hit, require(ReplicatedStorage.Mouse).Target = TargetRoot.CFrame, TargetRoot
			Character:FindFirstChild(ToolName).RemoteEvent:FireServer({TargetRoot.Position})
			Humanoid:FindFirstChild(""):InvokeServer({"TAP"})
		end
	
		if EquippedTool:FindFirstChild("LeftClickRemote") and not table.find({"Ice-Ice","Light-Light"}, ToolName) then
			local Dir = (Target:GetPivot().Position - Character:GetPivot().Position).Unit
			EquippedTool.LeftClickRemote:FireServer(Dir, 1)
			EquippedTool.LeftClickRemote:FireServer(Dir, 2)
		end
	
		if EquippedTool.ToolTip == "Gun" and ToolName ~= "Skull Guitar" then
			for i = 1, (GunsSettings[ToolName] or 1) do
				Remotes.Validator2:FireServer(GetValidator2())
				local Net = ReplicatedStorage.Modules.Net
				Net["RE/ShootGunEvent"]:FireServer(TargetRoot.Position, {TargetRoot})
			end
			wait(EquippedTool.Cooldown.Value)
			return
		end
	
		local Net = ReplicatedStorage.Modules.Net
		local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack", true)
		local RegisterHit = Net:FindFirstChild("RE/RegisterHit", true)
		if RegisterAttack then RegisterAttack:FireServer(0.3) end
	
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
			Internal(TargetRoot, {{Target, HitPart}})
		elseif ok and not F then
			if RegisterHit then RegisterHit:FireServer(TargetRoot, {{Target, HitPart}}) end
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
	
	----------------------------------------[[ Stats ]]----------------------------------------
	
	function IsValidStats(Value)
		if not _G.SelectWhereToAdd then return false end
		if typeof(_G.SelectWhereToAdd) == "string" and _G.SelectWhereToAdd == Value then
			return true
		elseif typeof(_G.SelectWhereToAdd) == "table" and table.find(_G.SelectWhereToAdd, Value) then
			return true
		end
		return false
	end
	
	function AddPoint(Where)
		if _G.SelectPointsAmount and Data and Data.Points and Data.Points.Value > 0 then
			CommF_("AddPoint", Where, _G.SelectPointsAmount)
		end
	end
	
	task.spawn(function()
		while task.wait(0.1) do
			if _G.AutoStats then
				local Points = _G.SelectPointsAmount
				local Stats = _G.SelectWhereToAdd
				if Points and Stats then
					if typeof(Stats) == "string" then
						if IsValidStats(Stats) then
							AddPoint(Stats)
						end
					elseif typeof(Stats) == "table" then
						for _, Stat in pairs(Stats) do
							if IsValidStats(Stat) then
								AddPoint(Stat)
							end
						end
					end
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
                Module = {"Brute", "BuggyQuest1", 2, Vector3.new(-1387, 24, 4100)}
	        elseif MyLevel > 59 and MyLevel < 75 then
                Module = {"Desert Bandit", "DesertQuest", 1, Vector3.new(984, 16, 4417)}
	        elseif MyLevel > 74 and MyLevel < 90 then
                Module = {"Desert Officer", "DesertQuest", 2, Vector3.new(1547, 14, 4381)}
	        elseif MyLevel > 89 and MyLevel < 100 then
                Module = {"Snow Bandit", "SnowQuest", 1, Vector3.new(1356, 105, -1328)}
	        elseif MyLevel > 99 and MyLevel < 120 then
                Module = {"Snowman", "SnowQuest", 2, Vector3.new(1218, 138, -1488)}
	        elseif MyLevel > 119 and MyLevel < 150 then
                Module = {"Chief Petty Officer", "MarineQuest2", 1, Vector3.new(-4931, 65, 4121)}
	        elseif MyLevel > 149 and MyLevel < 175 then
                Module = {"Sky Bandit", "SkyQuest", 1, Vector3.new(-4955, 365, -2908)}
	        elseif MyLevel > 174 and MyLevel < 190 then
                Module = {"Dark Master", "SkyQuest", 2, Vector3.new(-5148, 439, -2332)}
	        elseif MyLevel > 189 and MyLevel < 210 then
                Module = {"Prisoner", "PrisonerQuest", 1, Vector3.new(4937, 0, 649)}
	        elseif MyLevel > 209 and MyLevel < 250 then
                Module = {"Dangerous Prisoner", "PrisonerQuest", 2, Vector3.new(5099, 0, 1055)}
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
			              Module = {"Grand Devote", "SubmergedQuest3", 2, Vector3.new(9568, -1993, 9857)}
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
	    for _, Cont in pairs({Enemies, ReplicatedStorage}) do
	        for _, Elite in Cont:GetChildren() do
	            if table.find(EliteHunterEnemies, Elite.Name) and Elite:FindFirstChild("Humanoid") and Elite.Humanoid.Health > 0 then
	                return Translate("Elite Hunter Spawned")..": "..Elite.Name.." | "..Translate("Progress")..": "..CommF_("EliteHunter", "Progress")
	            end
	        end
	    end
	    if TimerActive then
	        Countdown = math.max(0, 600 - (tick() - LastEliteRemovedTime))
	    end
	    local TimeText = Countdown >= 60 and math.floor(Countdown / 60)..":"..string.format("%02d", Countdown % 60) or tostring(math.floor(Countdown))
	    local ProgressText = Translate("Elite Hunters Spawned: None").." | "..Translate("Progress")..": "..CommF_("EliteHunter", "Progress")
	    if Countdown > 0 then
	        return ProgressText.."\n"..Translate("Time Until Next Spawn")..": "..TimeText
	    else
	        return ProgressText
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
				elseif QuestTitle.Text:find(NameMon) and PlayerGui.Main.Quest.Visible then
					local NearestEnemy, MinDist = nil, math.huge
					for _, Cont in pairs({Enemies, ReplicatedStorage}) do
						for _, Enemy in pairs(Cont:GetChildren()) do
							if Enemy:FindFirstChildOfClass("Humanoid") and Enemy:FindFirstChild("HumanoidRootPart") and Enemy.Humanoid.Health > 0 then
								if Enemy.Name == NameMon then
									local Dist = (HRP.Position - Enemy.HumanoidRootPart.Position).Magnitude
									if Dist < MinDist then
										MinDist = Dist
										NearestEnemy = Enemy
									end
								end
							end
						end
					end
					if NearestEnemy then
						repeat
							task.wait()
							bringmobs = true
							EquipTool()
							Tween(NearestEnemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
							MobPos = NearestEnemy.HumanoidRootPart.Position
							MobName = NearestEnemy.Name
						until not _G.FarmLevel or not NearestEnemy.Parent or NearestEnemy.Humanoid.Health <= 0 or not Enemies:FindFirstChild(NearestEnemy.Name) or not PlayerGui.Main.Quest.Visible
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
						end
					end
				end
			end
			if _G.FarmNearest then
			    local ClosestEnemy = nil
			    local ShortestDistance = math.huge
			    for _, Enemy in pairs(Enemies:GetChildren()) do
			        if Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 and Enemy:FindFirstChild("HumanoidRootPart") then
			            local Distance = (Enemy.HumanoidRootPart.Position - HRP.Position).Magnitude
			            if Distance < ShortestDistance then
			                ShortestDistance = Distance
			                ClosestEnemy = Enemy
			            end
			        end
			    end
			    if ClosestEnemy then
			        repeat
			            bringmobs = true
			            EquipTool()
			            Tween(ClosestEnemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
			            MobPos = ClosestEnemy.HumanoidRootPart.Position
			            MobName = ClosestEnemy.Name
			            task.wait()
			        until not _G.FarmNearest or not ClosestEnemy or ClosestEnemy.Humanoid.Health <= 0
					bringmobs = false
			    end
			end
			if _G.FarmSkyEnemies then
				local Near, MinDist = nil, math.huge
				for _, cont in pairs({Enemies, ReplicatedStorage}) do
					for _, enemy in cont:GetChildren() do
						if table.find(SkyEnemiesList, enemy.Name) then
							if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
								local dist = (enemy.HumanoidRootPart.Position - HRP.Position).Magnitude
								if dist < MinDist then
									MinDist = dist
									Near = enemy
								end
							end
						end
					end
				end
				if Near then
					repeat task.wait()
						bringmobs = true
						EquipTool()
						Tween(Near.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
						MobPos = Near.HumanoidRootPart.Position
						MobName = Near.Name
					until not _G.FarmSkyEnemies or Near.Humanoid.Health <= 0
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
                if Core then
                    if Core.Humanoid.Health > 0 then
                        repeat
                            wait()
                            EquipTool()
                            Tween(Core.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
                        until not Core.Parent or Core.Humanoid.Health <= 0 or not _G.FactoryRaid
                    end
                end
            end
            if _G.PirateRaid then
			    for _, Cont in pairs({Enemies, ReplicatedStorage}) do
			        for _, Enemy in pairs(Cont:GetChildren()) do
			            if _G.PirateRaid and Enemy:FindFirstChild("HumanoidRootPart") and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 and not Enemy.Name:lower():find("rip_indra") and not Enemy.Name:lower():find("friend") then
			                if (Enemy.HumanoidRootPart.Position - Vector3.new(-5496, 313, 2841)).Magnitude < 2000 then
			                    repeat
			                        task.wait()
			                        EquipTool()
			                        Tween(Enemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
			                    until Enemy.Humanoid.Health <= 0 or not Enemy.Parent or not _G.PirateRaid
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
					repeat task.wait()
						Tween(NearChest.Position + Vector3.new(0, 1, 0))
					until not _G.CollectChests or NearChest:GetAttribute("IsDisabled")
				end
			end
			if _G.FarmEctoplasms then
				for _, Cont in pairs({Enemies, ReplicatedStorage}) do
					local NearestEnemy, MinDist = nil, math.huge
					for _, Enemy in pairs(Cont:GetChildren()) do
						if table.find(EctoplasmsEnemiesList, Enemy.Name) and Enemy:FindFirstChild("Humanoid") and Enemy:FindFirstChild("HumanoidRootPart") then
							if Enemy.Humanoid.Health > 0 then
								local Dist = (HRP.Position - Enemy.HumanoidRootPart.Position).Magnitude
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
							Tween(NearestEnemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
							MobPos = NearestEnemy.HumanoidRootPart.Position
							MobName = NearestEnemy.Name
						until not _G.FarmEctoplasms or not NearestEnemy.Parent or NearestEnemy.Humanoid.Health == 0
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
					for _, enemy in Cont:GetChildren() do
						if enemy.Name == _G.SelectBoss then
							if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") and enemy:FindFirstChildOfClass("Humanoid").Health > 0 then
								Boss = enemy
							end
						end
					end
				end
				if Boss then
					repeat
						task.wait()
						EquipTool()
						Tween(Boss.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
					until not _G.DefeatSelectedBoss or not Boss.Parent or Boss.Humanoid.Health == 0
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
							local HRPEnemy = Enemy:FindFirstChild("HumanoidRootPart")
							local Humanoid = Enemy:FindFirstChildOfClass("Humanoid")
							if HRPEnemy and Humanoid and Humanoid.Health > 0 then
								local Dist = (HRP.Position - HRPEnemy.Position).Magnitude
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
					until not _G.DefeatAllBosses or not ClosestBoss.Parent or ClosestBoss.Humanoid.Health == 0
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
			            if table.find(EnemiesList, Enemy.Name) and Enemy:FindFirstChild("HumanoidRootPart") and Enemy:FindFirstChildOfClass("Humanoid") and Enemy.Humanoid.Health > 0 then
			                local Dist = (HRP.Position - Enemy.HumanoidRootPart.Position).Magnitude
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
			            Tween(NearEnemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
			            MobPos = NearEnemy.HumanoidRootPart.Position
			            MobName = NearEnemy.Name
			        until not _G.FarmMaterial or not NearEnemy.Parent or NearEnemy.Humanoid.Health <= 0
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
			            if table.find(BonesEnemies, enemy.Name) and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
			                local Dist = (enemy.HumanoidRootPart.Position - HRP.Position).Magnitude
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
			            Tween(NearEnemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
			            MobPos = NearEnemy.HumanoidRootPart.Position
			            MobName = NearEnemy.Name
			        until not _G.FarmBones or NearEnemy.Humanoid.Health <= 0 or not NearEnemy.Parent
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
			            if enemy.Name == "Soul Reaper" and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
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
			            Tween(NearEnemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
			        until not _G.FarmShinigamiBoss or NearEnemy.Humanoid.Health <= 0 or not NearEnemy.Parent
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
			        end
			    end
			end
			if _G.FarmEliteHunters then
			    for _, Cont in pairs({Enemies, ReplicatedStorage}) do
			        for _, enemy in pairs(Cont:GetChildren()) do
			            if table.find(EliteHunterEnemies, enemy.Name) and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
			                repeat
			                    task.wait()
								CommF_("EliteHunter")
			                    EquipTool()
			                    Tween(enemy.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
			                until not _G.FarmEliteHunters or enemy.Humanoid.Health <= 0 or not enemy.Parent
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
	
	----------------------------------------[[ Race ]]----------------------------------------
	
	----------------------------------------[[ Shop ]]----------------------------------------
	
	----------------------------------------[[ Visual ]]----------------------------------------
	
	----------------------------------------[[ Window ]]----------------------------------------
	
	loadstring(g:HttpGet("https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/Libraries/Redz/Icons.lua"))()
	local Window = Redzlib:MakeWindow({
	Title = "Someone Hub | Blox Fruits",
	SubTitle = "By Someone",
	SaveFolder = "Someone Hub.json"
	})
	
	Window:AddMinimizeButton({
	Button = {Image = "rbxassetid://80677412933527", BackgroundTransparency = 0},
	Corner = {CornerRadius = UDim.new(0, 6)}
	})
	
	Social = Window:MakeTab({Title = "Social Media", Icon = RandomIcon("Social Media")})
	if LocalPlayer.Data.Level.Value < MaxLevel then
	Stats = Window:MakeTab({Title = "Stats", Icon = RandomIcon("Stats")})
	end
	Main = Window:MakeTab({Title = "Main", Icon = RandomIcon("Main")})
	Quests = Window:MakeTab({Title = "Quests/Items", Icon = RandomIcon("Quests")})
	SeaEvents = Window:MakeTab({Title = "Sea Events", Icon = RandomIcon("Sea Events")})
	Fish = Window:MakeTab({Title = "Fishery", Icon = RandomIcon("Fishery")})
	Fruits = Window:MakeTab({Title = "Fruits", Icon = RandomIcon("Fruits")})
	Teleport = Window:MakeTab({Title = "Teleport", Icon = RandomIcon("Teleport")})
	Player = Window:MakeTab({Title = "Player", Icon = RandomIcon("Player")})
	Race = Window:MakeTab({Title = "Race", Icon = RandomIcon("Race")})
	Shop = Window:MakeTab({Title = "Shop", Icon = RandomIcon("Shop")})
	Visual = Window:MakeTab({Title = "Visual", Icon = RandomIcon("Visual")})
	Settings = Window:MakeTab({Title = "Miscellaneous", Icon = RandomIcon("Miscellaneous")})
	
	----------------------------------------[[ Information ]]----------------------------------------
	
	Social : AddSection({"Social Media"})
	
	Social : AddDiscordInvite({
	Title = "Someone Hub",
	Description = "Script Community; There You Can Find People And More Information About The Script",
	Logo = "rbxassetid://91015993743965",
	Invite = "https://discord.gg/SUNvuPyUaC",
	})
	
	----------------------------------------[[ Stats ]]----------------------------------------
	
	if LocalPlayer.Data.Level.Value < MaxLevel then
	Stats : AddSection({"Auto Stats"})
	
	Stats : AddDropdown({
	Title = "Select Where To Add",
	Description = "",
	Options = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"},
	Default = S["Select Where To Add"],
	MultiSelect = true,
	Callback = function(Value)
	_G.SelectWhereToAdd = Value
	S["Select Where To Add"] = Value
	SS()
	end})
	
	Stats : AddSlider({
    Title = "Select Points Amount",
    Description = "",
    Min = 0,
    Max = 100,
    Increase = 1,
    Default = S["Select Points Amount"],
    Callback = function(Value)
    _G.SelectPointsAmount = Value
    S["Select Points Amount"] = Value
    SS()
    end})
    
    Stats : AddToggle({
	Title = "Auto Stats",
	Description = "",
	Default = S["Auto Stats"],
	Callback = function(Value)
	_G.AutoStats = Value
	S["Auto Stats"] = Value
	SS()
	end})
	end
	
	----------------------------------------[[ Settings ]]----------------------------------------
	
	Settings : AddSection({"Main Settings"})
	
	Settings : AddDropdown({
	Title = "Select Tool Tip",
	Description = "",
	Options = {"Melee", "Sword", "Gun"},
	Default = S["Select Tool Tip"],
	Multi = false,
	Callback = function(Value)
	_G.SelectToolTip = Value
	S["Select Tool Tip"] = Value
	SS()
	end})
	
	Settings : AddSlider({
    Title = "Tween Speed",
    Description = "",
    Min = 50,
    Max = 350,
    Increase = 10,
    Default = S["Tween Speed"],
    Callback = function(Value)
    _G.TweenSpeed = Value
    S["Tween Speed"] = Value
    SS()
    end})
    
    Settings : AddToggle({
	Title = "Bring Enemies",
	Description = "",
	Default = S["Bring Enemies"],
	Callback = function(Value)
	_G.BringEnemies = Value
	S["Bring Enemies"] = Value
	SS()
	end})
    
    Settings : AddToggle({
	Title = "Auto Buso",
	Description = "",
	Default = S["Auto Buso"],
	Callback = function(Value)
	_G.AutoBuso = Value
	S["Auto Buso"] = Value
	SS()
	end})
	
	Settings : AddToggle({
	Title = "Auto Attack",
	Description = "",
	Default = S["Auto Attack"],
	Callback = function(Value)
	_G.AutoAttack = Value
	S["Auto Attack"] = Value
	SS()
	end})
	
	----------------------------------------[[ Main ]]---------------------------------------
	
	Main : AddSection({"Main Farm"})
	
	Main : AddToggle({
	Title = "Farm Level",
	Description = "",
	Default = S["Farm Level"],
	Callback = function(Value)
	_G.FarmLevel = Value
	S["Farm Level"] = Value
	SS()
	end})
	
	Main : AddToggle({
	Title = "Farm Nearest",
	Description = "",
	Default = S["Farm Nearest"],
	Callback = function(Value)
	_G.FarmNearest = Value
	S["Farm Nearest"] = Value
	SS()
	end})
	
	if Sea1 then
	Main : AddToggle({
	Title = "Farm Sky Enemies",
	Description = "",
	Default = S["Farm Sky Enemies"],
	Callback = function(Value)
	_G.FarmSkyEnemies = Value
	S["Farm Sky Enemies"] = Value
	SS()
	end})
	elseif Sea2 then
	Main : AddToggle({
	Title = "Factory Raid",
	Description = "",
	Default = S["Factory Raid"],
	Callback = function(Value)
	_G.FactoryRaid = Value
	S["Factory Raid"] = Value
	SS()
	end})
	elseif Sea3 then
	Main : AddToggle({
	Title = "Pirate Raid",
	Description = "",
	Default = S["Pirate Raid"],
	Callback = function(Value)
	_G.PirateRaid = Value
	S["Pirate Raid"] = Value
	SS()
	end})
	end
	
	Main : AddSection({"Chests"})
	
	Main : AddToggle({
	Title = "Collect Chests",
	Description = "",
	Default = S["Collect Chests"],
	Callback = function(Value)
	_G.CollectChests = Value
	S["Collect Chests"] = Value
	SS()
	end})
	
	if Sea2 then
	Main : AddSection({"Ectoplasms"})
	
	Main : AddToggle({
	Title = "Farm Ectoplasms",
	Description = "",
	Default = S["Farm Ectoplasms"],
	Callback = function(Value)
	_G.FarmEctoplasms = Value
	S["Farm Ectoplasms"] = Value
	SS()
	end})
	elseif Sea3 then
	Main : AddSection({"Bones"})
	
	Main : AddToggle({
	Title = "Farm Bones",
	Description = "",
	Default = S["Farm Bones"],
	Callback = function(Value)
	_G.FarmBones = Value
	S["Farm Bones"] = Value
	SS()
	end})
	
	Main : AddToggle({
	Title = "Farm Shinigami Boss",
	Description = "",
	Default = S["Farm Shinigami Boss"],
	Callback = function(Value)
	_G.FarmShinigamiBoss = Value
	S["Farm Shinigami Boss"] = Value
	SS()
	end})
	
	Main : AddToggle({
	Title = "Trade Bones",
	Description = "",
	Default = S["Trade Bones"],
	Callback = function(Value)
	_G.TradeBones = Value
	S["Trade Bones"] = Value
	SS()
	end})
	end
	
	Main : AddSection({"Bosses"})
	
	Main : AddButton({
    Title = "Update Bosses List",
    Description = "",
    Callback = function()
    UpdateBossesList()
    end})
    
    BossesListDrop = Main : AddDropdown({
	Title = "Select Boss",
	Description = "",
	Options = BossesList,
	Default = S["Select Boss"],
	Multi = false,
	Callback = function(Value)
	_G.SelectBoss = Value
	S["Select Boss"] = Value
	SS()
	end})
	
	Main : AddToggle({
	Title = "Defeat Selected Boss",
	Description = "",
	Default = S["Defeat Selected Boss"],
	Callback = function(Value)
	_G.DefeatSelectedBoss = Value
	S["Defeat Selected Boss"] = Value
	SS()
	end})
	
	Main : AddToggle({
	Title = "Defeat All Bosses",
	Description = "",
	Default = S["Defeat All Bosses"],
	Callback = function(Value)
	_G.DefeatAllBosses = Value
	S["Defeat All Bosses"] = Value
	SS()
	end})
	
	Main : AddButton({
    Title = "Change Server",
    Description = "",
    Callback = function()
    Hop()
    end})
    
    if Sea3 then
    Main : AddSection({"Section"})
    
    Main : AddToggle({
	Title = "Title",
	Description = "Desc",
	Default = S["Title"],
	Callback = function(Value)
	
	S["Title"] = Value
	SS()
	end})
	
	Main : AddToggle({
	Title = "Title",
	Description = "Desc",
	Default = S["Title"],
	Callback = function(Value)
	
	S["Title"] = Value
	SS()
	end})
    end
    
    if Sea3 then
    Main : AddSection({"Elite Hunters"})
    
    local EliteHunterStatus = Main : AddParagraph({
    Title = UpdateEliteStatus(),
    Description = ""
	})
	
	task.spawn(function()
		while task.wait(1) do
			EliteHunterStatus:SetTitle(UpdateEliteStatus())
		end
	end)
	
	Main : AddToggle({
	Title = "Farm Elite Hunters",
	Description = "",
	Default = S["Farm Elite Hunters"],
	Callback = function(Value)
	_G.FarmEliteHunters = Value
	S["Farm Elite Hunters"] = Value
	SS()
	end})
    end
    
    Main : AddSection({"Material"})
    
    Main : AddDropdown({
	Title = "Select Material",
	Description = "",
	Options = MaterialList,
	Default = S["Select Material"],
	Multi = false,
	Callback = function(Value)
	_G.SelectMaterial = Value
	S["Select Material"] = Value
	SS()
	end})
	
	Main : AddToggle({
	Title = "Farm Material",
	Description = "",
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
	
	----------------------------------------[[ Teleport ]]----------------------------------------
	
	Teleport : AddSection({"World"})
	
	Teleport:AddButton({
    Title = Translate("World").." 1",
    Description = "",
    Callback = function()
    CommF_("TravelMain")
    end})
    
	Teleport:AddButton({
    Title = Translate("World").." 2",
    Description = "",
    Callback = function()
    CommF_("TravelDressrosa")
    end})
	
	Teleport:AddButton({
    Title = Translate("World").." 3",
    Description = "",
    Callback = function()
    CommF_("TravelZou")
    end})

	Teleport:AddSection("Island")
	
	Teleport : AddDropdown({
	Title = "Select Island",
	Description = "",
	Options = IslandList,
	Default = "...",
	Multi = false,
	Callback = function(Value)
	_G.SelectIsland = Value
	end})
	
	Teleport:AddButton({
    Title = "Go To Island",
    Description = "",
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
	
	----------------------------------------[[ Race ]]----------------------------------------
	
	----------------------------------------[[ Shop ]]----------------------------------------
	
	----------------------------------------[[ Visual ]]----------------------------------------

	
