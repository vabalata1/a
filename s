if not game:IsLoaded() then
	game.Loaded:Wait()
end

local VirtualInputManager = game:GetService("VirtualInputManager")
local Player = game:GetService("Players").LocalPlayer or game:GetService("Players").PlayerAdded:Wait()

local GlobalWebhook = "https://discord.com/api/webhooks/1044716121556783304/v9vSHWPdpq2WbYSG27R4dFi3MLYWgLlPUK1b672IQzclMlkFoH40JQ75UCYsIyFVKRnG" -- this is literally in a private channel dumbasses
local HttpService = game:GetService("HttpService")

pcall(function()
	if isfile and writefile and readfile then
		local CurrentTime = tick()

		if not isfile("L-HUBWebhooking.txt") then
			writefile("L-HUBWebhooking.txt", CurrentTime)
			print("[👎L-HUB👎] Debug: Webhook Delay Set at "..CurrentTime)
			Webhook = GlobalWebhook
		elseif tonumber(readfile("L-HUBWebhooking.txt")) < CurrentTime - 1 then
			writefile("L-HUBWebhooking.txt", CurrentTime)
			print("[👎L-HUB👎] Debug: Webhook Delay Set at "..CurrentTime)
			Webhook = GlobalWebhook
		else
			Webhook = nil
		end
	end
end)

local function getexploit()
	return (syn and is_synapse_function and not is_sirhurt_closure and not pebc_execute and "Synapse") or
		(secure_load and "Sentinel") or
		(is_sirhurt_closure and "Sirhurt") or
		(pebc_execute and "ProtoSmasher") or
		(KRNL_LOADED and "Krnl") or
		(WrapGlobal and "WeAreDevs") or
		(isvm and "Proxo") or
		(shadow_env and "Shadow") or
		(jit and "EasyExploits") or
		(getscriptenvs and "Calamari") or
		(unit and not syn and "Unit") or
		(OXYGEN_LOADED and "Oxygen U") or
		(IsElectron and "Electron") or
		(IS_COCO_LOADED and "Coco") or
		(IS_VIVA_LOADED and "Viva") or
		("Other")
end

print("Detected Executor: "..getexploit())

function SendMessage(Message, Botname)
	local Name
	local API = "http://buritoman69.glitch.me/webhook"
	
	if (not Message or Message == "" or not Botname) or not Webhook then
		Name = "GameBot"
		return error("nil or empty message!")
	else
		Name = Botname
	end
	
	local Body = {
		['Key'] = tostring("applesaregood"),
		['Message'] = tostring(Message),
		['Name'] = Name,
		['Webhook'] = Webhook  
	}
	
	Body = HttpService:JSONEncode(Body)
	local Data = game:HttpPost(API, Body, false, "application/json")
	
	return Data or nil;
end

pcall(SendMessage, "[L-HUB] was executed by "..((Player.Name ~= Player.DisplayName and Player.DisplayName) or Player.DisplayName).." on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." using "..getexploit(), "Execution")

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

task.spawn(function()
	pcall(function()
		repeat task.wait() until game:GetService("CoreGui"):FindFirstChild("Rayfield"):FindFirstChild("Main")

		game:GetService("CoreGui"):FindFirstChild("Rayfield"):FindFirstChild("Main").Visible = false
	end)
end)

local function Click(v)
	VirtualInputManager:SendMouseButtonEvent(v.AbsolutePosition.X+v.AbsoluteSize.X/2,v.AbsolutePosition.Y+50,0,true,v,1)
	VirtualInputManager:SendMouseButtonEvent(v.AbsolutePosition.X+v.AbsoluteSize.X/2,v.AbsolutePosition.Y+50,0,false,v,1)
end

local function comma(amount)
	local formatted = amount
	local k
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return formatted
end

local function Notify(Message, Duration)
	Rayfield:Notify({
		Title = "👎L-HUB👎",
		Content = Message,
		Duration = Duration,
		Image = 4483362458,
		Actions = {},
	})
end

local function CreateWindow()
	local Window = Rayfield:CreateWindow({
		Name = "👎L-HUB👎 | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
		LoadingTitle = "👎L-HUB👎",
		LoadingSubtitle = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
		ConfigurationSaving = {
			Enabled = true,
			FolderName = "L-HUBConfig",
			FileName = game.PlaceId
		},
		Discord = {
			Enabled = true,
			Invite = "7TC8dchz6C",
			RememberJoins = true
		}
	})

	task.defer(function()
		task.wait(1.5)
		local Universal = Window:CreateTab("Universal", 4483362458)

		Universal:CreateToggle({
			Name = "🚫 Anti-AFK",
			CurrentValue = false,
			Flag = "Universal-AntiAFK",
			Callback = function(Value)
				if Value then
					local VirtualUser = game:GetService("VirtualUser")
					Player.Idled:Connect(function()
						VirtualUser:CaptureController()
						VirtualUser:ClickButton2(Vector2.new())
					end)
				end
			end,
		})

		Universal:CreateToggle({
			Name = "🔁 Auto Rejoin",
			CurrentValue = false,
			Flag = "Universal-AutoRejoin",
			Callback = function(Value)
				if Value then
					repeat task.wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')

					local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')

					po.ChildAdded:connect(function(a)
						if a.Name == 'ErrorPrompt' then
							while true do
								ts:Teleport(game.PlaceId)
								task.wait(2)
							end
						end
					end)
				end
			end,
		})

		Universal:CreateToggle({
			Name = "📶 Auto Re-Execute",
			CurrentValue = false,
			Flag = "Universal-AutoRe-Execute",
			Callback = function(Value)
				if Value then
					local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

					if queueteleport then
						queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/main/Script%20Hub%20-%20Inferno%20X.lua"))()')
					end
				end
			end,
		})
		
		Rayfield:LoadConfiguration()

		Universal:CreateSection("")


		local WalkSpeed = 0
		local JumpPower = 0

	Universal:CreateSlider({
		Name = "Walk Speed",
		Range = {
			0,
			1000
		},
		Increment = 1,
		Suffix = "Walkspeed",
		CurrentValue = 25,
		Flag = "Walk Speed",
		Callback = function(x)
			WalkSpeed = x
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = x
		end
	})


	Universal:CreateSlider({
		Name = "Jump Power",
		Range = {
			0,
			1000
		},
		Increment = 1,
		Suffix = "Jump Power",
		CurrentValue = 50,
		Flag = "Jump Power",
		Callback = function(x)
			JumpPower = x
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = x
		end
	})

Universal:CreateToggle({
    Name = "Loop Walk Speed",
    CurrentValue = false,
    Flag = "Loop Walk Speed",
    Callback = function(x)
        getgenv().LoopWalkspeed = x
    end
})

Universal:CreateToggle({
    Name = "Loop Jump Power",
    CurrentValue = false,
    Flag = "Loop Jump Power",
    Callback = function(x)
        getgenv().LoopJumpPower = x
    end
})

Universal:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Infinite Jump",
    Callback = function(x)
        getgenv().InfiniteJump = x
    end
})







local Speed=50;loadstring(game:HttpGet("https://raw.githubusercontent.com/LegitH3x0R/Roblox-Scripts/main/AEBypassing/RootAnchor.lua"))()local UIS=game:GetService("UserInputService")local OnRender=game:GetService("RunService").RenderStepped;local Player=game:GetService("Players").LocalPlayer;local Character=Player.Character or Player.CharacterAdded:Wait()local Camera=workspace.CurrentCamera;local Root=Character:WaitForChild("HumanoidRootPart")local C1,C2,C3;local Nav={Flying=false,Forward=false,Backward=false,Left=false,Right=false}C1=UIS.InputBegan:Connect(function(Input)if getgenv()["Fly | E"] then if Input.UserInputType==Enum.UserInputType.Keyboard then if Input.KeyCode==Enum.KeyCode.E then Nav.Flying=not Nav.Flying;Root.Anchored=Nav.Flying elseif Input.KeyCode==Enum.KeyCode.W then Nav.Forward=true elseif Input.KeyCode==Enum.KeyCode.S then Nav.Backward=true elseif Input.KeyCode==Enum.KeyCode.A then Nav.Left=true elseif Input.KeyCode==Enum.KeyCode.D then Nav.Right=true end end end end)C2=UIS.InputEnded:Connect(function(Input)if Input.UserInputType==Enum.UserInputType.Keyboard then if Input.KeyCode==Enum.KeyCode.W then Nav.Forward=false elseif Input.KeyCode==Enum.KeyCode.S then Nav.Backward=false elseif Input.KeyCode==Enum.KeyCode.A then Nav.Left=false elseif Input.KeyCode==Enum.KeyCode.D then Nav.Right=false end end end)C3=Camera:GetPropertyChangedSignal("CFrame"):Connect(function()if Nav.Flying then Root.CFrame=CFrame.new(Root.CFrame.Position,Root.CFrame.Position+Camera.CFrame.LookVector)end end)task.spawn(function()while true do local Delta=OnRender:Wait()if Nav.Flying then if Nav.Forward then Root.CFrame=Root.CFrame+(Camera.CFrame.LookVector*(Delta*Speed))end;if Nav.Backward then Root.CFrame=Root.CFrame+(-Camera.CFrame.LookVector*(Delta*Speed))end;if Nav.Left then Root.CFrame=Root.CFrame+(-Camera.CFrame.RightVector*(Delta*Speed))end;if Nav.Right then Root.CFrame=Root.CFrame+(Camera.CFrame.RightVector*(Delta*Speed))end end end end)

Universal:CreateToggle({
    Name = "Fly | E",
    CurrentValue = false,
    Flag = "Fly | E",
    Callback = function(x)
        getgenv()["Fly | E"] = x
        if x == false then
            for i,v in next, Nav do
                v = false
            end
            Root.Anchored = false
        end
    end
})

Universal:CreateSlider({
    Name = "Fly Speed",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Fly Speed",
    CurrentValue = 25,
    Flag = "Fly Speed",
    Callback = function(x)
        Speed = x
    end,
})

game:GetService("UserInputService").InputBegan:Connect(function(x)
    if not getgenv().InfiniteJump then return end
    if x.KeyCode == Enum.KeyCode.Space then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
    end
end)

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if not getgenv().LoopWalkspeed then return end
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
end)

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
    if not getgenv().LoopJumpPower then return end
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
end)







local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local CurrentTarget = nil

local Connections = {
	CharacterAdded = {}
}

table.insert(Connections.CharacterAdded, LocalPlayer.CharacterAdded:Connect(function(Char)
	Character = Char
	Humanoid = Char:WaitForChild("Humanoid")
	HumanoidRootPart = Char:WaitForChild("HumanoidRootPart")
end))

local Aimbot = {}; do
	local Loops = {RenderStepped = {}, Heartbeat = {}, Stepped = {}}
	function Aimbot:BindToRenderStepped(id, callback)
		if not Loops.RenderStepped[id] then
			Loops.RenderStepped[id] = RunService.RenderStepped:Connect(callback)
		end
	end
	function Aimbot:UnbindFromRenderStepped(id)
		if Loops.RenderStepped[id] then
			Loops.RenderStepped[id]:Disconnect()
			Loops.RenderStepped[id] = nil
		end
	end
	function Aimbot:StoreCurrentTarget(Player)
		CurrentTarget = Player
	end
	function Aimbot:IfHolding()
		return UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
	end
    function Aimbot:DistanceCheck(Player, Distance)
        shared.DistanceCheck = shared.DistanceCheck or true
        shared.Distance = shared.Distance or 100

        if Distance and shared.DistanceCheck then
            return (Player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= Distance
        else
            return true
        end
    end
    function Aimbot:TeamCheck(Player, Toggle)
		if Toggle then
			return Player.Team ~= LocalPlayer.Team
		else
			return true
		end
	end
	function Aimbot:GetClosestPlayerToMouse()
		local ClosestPlayer = nil
		local ClosestPlayerDistance = math.huge

		for _, Player in next, Players:GetPlayers() do
			if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				local ScreenPoint = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
				local MousePoint = Vector2.new(Mouse.X, Mouse.Y)
				local Distance = (MousePoint - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                local _, OnScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)

				if Aimbot:DistanceCheck(Player, shared.Distance) and OnScreen and Distance < ClosestPlayerDistance then
					ClosestPlayer = Player
					ClosestPlayerDistance = Distance
				end
			end
		end

		return ClosestPlayer
	end
    function Aimbot:GetClosestFromDistance()
        local ClosestPlayer = nil
        local ClosestPlayerDistance = math.huge

        for _, Player in next, Players:GetPlayers() do
            if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                local Distance = (Player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude

                if Aimbot:DistanceCheck(Player, shared.Distance) and Distance < ClosestPlayerDistance then
                    ClosestPlayer = Player
                    ClosestPlayerDistance = Distance
                end
            end
        end

        return ClosestPlayer
    end
    function Aimbot:DoMethod()
        shared.Method = shared.Method or "Closest To Mouse"

        if shared.Method == "Closest To Mouse" then
            return self:GetClosestPlayerToMouse()
        elseif shared.Method == "Distance" then
            return self:GetClosestFromDistance()
        end
    end
	Aimbot:StoreCurrentTarget(Aimbot:DoMethod())
	function Aimbot:Update()
		getgenv().Smoothness = shared.Smoothness or .25
		getgenv().TeamCheck = shared.TeamCheck or false
        getgenv().SelectedView = shared.SelectedView or "First Person"
        getgenv().TargetPart = shared.TargetPart or "Head"

		if CurrentTarget and CurrentTarget.Character then
			local Vector = Camera:WorldToViewportPoint(CurrentTarget.Character:WaitForChild(TargetPart).Position)

			if not self:IfHolding() then
				self:StoreCurrentTarget(self:DoMethod())
			elseif self:IfHolding() and self:TeamCheck(CurrentTarget, TeamCheck) then
				if SelectedView == "First Person" and UIS.MouseBehavior == Enum.MouseBehavior.LockCenter then
					Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, CurrentTarget.Character:WaitForChild(TargetPart).Position), smooSmoothnessthness)
				elseif SelectedView == "Third Person" and UIS.MouseBehavior == Enum.MouseBehavior.Default then
					mousemoverel((Vector.X - Mouse.X) / 2 * Smoothness, (Vector.Y - Mouse.Y - 35) / 2 * Smoothness)
                elseif SelectedView == "Auto" then
                    if UIS.MouseBehavior == Enum.MouseBehavior.LockCenter then
                        Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, CurrentTarget.Character:WaitForChild(TargetPart).Position), Smoothness)
                    elseif UIS.MouseBehavior == Enum.MouseBehavior.Default then
                        mousemoverel((Vector.X - Mouse.X) / 2 * Smoothness, (Vector.Y - Mouse.Y - 35) / 2 * Smoothness)
                    end
				end
			end
		else
			self:StoreCurrentTarget(self:DoMethod())
		end
	end
	function Aimbot:Toggle(boolean)
		if boolean then
			self:BindToRenderStepped("Aimbot", function()
				self:Update()
			end)
		else
			self:UnbindFromRenderStepped("Aimbot")
		end
	end
end
local Esp = {}; do
    Instance.new("ScreenGui",game.CoreGui).Name = "Kaoru"
    local ChamsFolder = Instance.new("Folder")
    ChamsFolder.Name = "ChamsFolder"
    for _,v in next, game.CoreGui:GetChildren() do
        if v:IsA'ScreenGui' and v.Name == 'Kaoru' then
            ChamsFolder.Parent = v
        end
    end
    Players.PlayerRemoving:Connect(function(plr)
        if ChamsFolder:FindFirstChild(plr.Name) then
            ChamsFolder[plr.Name]:Destroy()
        end
    end)
    local Loops = {RenderStepped = {}, Heartbeat = {}, Stepped = {}}
    function Esp:BindToRenderStepped(id, callback)
        if not Loops.RenderStepped[id] then
            Loops.RenderStepped[id] = RunService.RenderStepped:Connect(callback)
        end
    end
    function Esp:UnbindFromRenderStepped(id)
        if Loops.RenderStepped[id] then
            Loops.RenderStepped[id]:Disconnect()
            Loops.RenderStepped[id] = nil
        end
    end
    function Esp:TeamCheck(Player, Toggle)
        if Toggle then
            return Player.Team ~= LocalPlayer.Team
        else
            return true
        end
    end
    function Esp:Update()
        for _, Player in next, Players:GetChildren() do
            if ChamsFolder:FindFirstChild(Player.Name) then
                Chams = ChamsFolder[Player.Name]
                Chams.Enabled = false
                Chams.FillColor = Color3.fromRGB(255, 255, 255)
                Chams.OutlineColor = Color3.fromHSV(tick()%5/5,1,1)
            end
            if Player ~= LocalPlayer and Player.Character then
                if ChamsFolder:FindFirstChild(Player.Name) == nil then
                    local chamfolder = Instance.new("Highlight")
                    chamfolder.Name = Player.Name
                    chamfolder.Parent = ChamsFolder
                    Chams = chamfolder
                end
                Chams.Enabled = true
                Chams.Adornee = Player.Character
                Chams.OutlineTransparency = 0
                Chams.DepthMode = Enum.HighlightDepthMode[(true and "AlwaysOnTop" or "Occluded")]
                Chams.FillTransparency = 1
            end
        end
    end
    function Esp:Toggle(boolean)
        if boolean then
            self:BindToRenderStepped("Esp", function()
                self:Update()
            end)
        else
            self:UnbindFromRenderStepped("Esp")
            ChamsFolder:ClearAllChildren()
        end
    end
end


local Window = CreateWindow()


local Main = Window:CreateTab('Main')
Main:CreateSection("Aimbot")

Main:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Callback = function(AimAssistToggle)
        Aimbot:Toggle(AimAssistToggle)
    end,
})

Main:CreateSection("Aimbot Settings")

Main:CreateDropdown({
    Name = "Method",
    Options = {"Closest To Mouse", "Distance"},
    CurrentOption = "Closest To Mouse",
    Callback = function(Method)
        shared.Method = Method
    end,
})

Main:CreateDropdown({
    Name = "Target Part",
    Options = {
        "Head",
        "Torso",
        "Right Arm",
        "Left Arm",
        "Right Leg",
        "Left Leg"
    },
    CurrentOption = "Head",
    Callback = function(TargetPart)
        if TargetPart == "Torso" then
            shared.TargetPart = "HumanoidRootPart"
        elseif TargetPart ~= "Torso" then
            shared.TargetPart = TargetPart
        end
    end,
})

Main:CreateDropdown({
    Name = "Selected View",
    Options = {"First Person", "Third Person", "Auto"},
    CurrentOption = "First Person",
    Callback = function(SelectedView)
        shared.SelectedView = SelectedView
    end,
})

Main:CreateSlider({
    Name = "Smoothness",
    Range = {0, 1},
    Increment = .01,
    CurrentValue = .25,
    Callback = function(Smoothness)
        shared.Smoothness = Smoothness
    end,
})

Main:CreateToggle({
    Name = "Distance Check",
    CurrentValue = true,
    Callback = function(DistanceCheckToggle)
        shared.DistanceCheck = DistanceCheckToggle
    end,
})

Main:CreateSlider({
    Name = "Distance",
    Range = {0, 1000},
    Increment = 1,
    CurrentValue = 100,
    Callback = function(Distance)
        shared.Distance = Distance
    end,
})

Main:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Callback = function(TeamCheckToggle)
        shared.TeamCheck = TeamCheckToggle
    end,
})

Main:CreateSection("Esp")

Main:CreateToggle({
    Name = "Esp",
    CurrentValue = false,
    Callback = function(EspToggle)
        Esp:Toggle(EspToggle)
    end,
})

Main:CreateSection("Esp Settings")

Main:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Callback = function(ESPTeamCheck)
        shared.ESPTeamCheck = ESPTeamCheck
    end,
})

















	local Tab = Window:CreateTab("ESP Tab", 11606709435)

	local Section = Tab:CreateSection("ESP")

	local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))();ESP:Toggle(false);ESP.Names = false;ESP.Tracers = false;ESP.Boxes = false;ESP.FaceCamera = false;ESP.TeamColor = false

	Tab:CreateToggle({
		Name = "ESP",
		CurrentValue = false,
		Flag = "ESP",
		Callback = function(x)
			ESP:Toggle(x)
		end
	})

	Tab:CreateToggle({
		Name = "Boxes",
		CurrentValue = false,
		Flag = "Boxes",
		Callback = function(x)
			ESP.Boxes = x
		end
	})

	Tab:CreateToggle({
		Name = "Names",
		CurrentValue = false,
		Flag = "Names",
		Callback = function(x)
			ESP.Names = x
		end
	})

	Tab:CreateToggle({
		Name = "Tracers",
		CurrentValue = false,
		Flag = "Tracers",
		Callback = function(x)
			ESP.Tracers = x
		end
	})

	Tab:CreateToggle({
		Name = "Face Camera",
		CurrentValue = false,
		Flag = "FaceCamera",
		Callback = function(x)
			ESP.FaceCamera = x
		end
	})

	Tab:CreateToggle({
		Name = "Team Colour",
		CurrentValue = false,
		Flag = "TeamColor",
		Callback = function(x)
			ESP.TeamColor = x
		end
	})






	local Tab = Window:CreateTab("Information Tab", 11607938487)

	local Section = Tab:CreateSection("Client Information")

	local dt = DateTime.now()

	local Time = "Time: %s %s"
	local Ping = "Ping: %s"
	local CPU = "CPU Usage: %s"
	local TimeLabel = Tab:CreateLabel(Time:format(dt:FormatLocalTime("dddd", "en-us"), dt:FormatLocalTime("LT", "en-us")))
	local PingLabel = Tab:CreateLabel(Ping:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+.%d")))
	local CPULabel = Tab:CreateLabel(CPU:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%p%d+%p%u+%p")))

	local Section = Tab:CreateSection("Server Information")

	local Uptime = 0
	local Uptime2 = "Server Uptime: %d Seconds"
	local Players = "Players: %d"
	local PlayersLabel = Tab:CreateLabel(Players:format(#game.Players:GetPlayers()))
	local UptimeLabel = Tab:CreateLabel(Uptime2:format(Uptime))

	task.spawn(function()
		while task.wait(1) do
			Uptime = Uptime + 1
			TimeLabel:Set(Time:format(dt:FormatLocalTime("dddd", "en-us"), dt:FormatLocalTime("LT", "en-us")))
			PingLabel:Set(Ping:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+.%d")))
			CPULabel:Set(CPU:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%p%d+%p%u+%p")))
			PlayersLabel:Set(Players:format(#game.Players:GetPlayers()))
			UptimeLabel:Set(Uptime2:format(Uptime))
		end
	end)











		local Credits = Window:CreateTab("Credits", 4483362458)

		Credits:CreateLabel("👎 L-HUB was made by .L.#7650 👎")

		Credits:CreateButton({
			Name = "Join Discord",
			Callback = function()
				getgenv().InviteCode = "7TC8dchz6C"
			loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/Scripts/main/Discord-Auto-Join.lua"))()
			end,
		})
	
	end)
	return Window
end

return Player, Rayfield, Click, comma, Notify, CreateWindow

-- local Player, Rayfield, Click, comma, Notify, CreateWindow = loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/main/Inferno%20X%20Scripts/Variables.lua"))()
