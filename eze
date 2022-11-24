local Player, Rayfield, Click, comma, Notify, CreateWindow = loadstring(game:HttpGet("https://raw.githubusercontent.com/vabalata1/a/main/ty"))()

	local Window = CreateWindow()

	local Farm = Window:CreateTab("Farm", 4483362458)



	local Toggle = Farm:CreateToggle({
		Name = "Auto Quest",
		CurrentValue = false,
		Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Value)
				FarmLooping = Value
				OriginalFarmLooping = Value
				end,
	})
	
		task.spawn(function()
			while task.wait() do
				if FarmLooping then
					game:GetService("ReplicatedStorage").StartMission:FireServer()
				end
			end
		end)

	
        local Toggle = Farm:CreateToggle({
            Name = "Rebirth",
            CurrentValue = false,
            Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
            Callback = function(Value)
                    Rebirth = Value
                    end,
        })
        
            task.spawn(function()
                while task.wait() do
                    if Rebirth then
                        game:GetService("ReplicatedStorage").Rebirth:FireServer()
                    end
                end
            end)



		local Toggle = Farm:CreateToggle({
			Name = "Infinite Money",
			CurrentValue = false,
			Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
			Callback = function(Value)
					InfiniteMoney = Value
					end,
		})
		
			task.spawn(function()
				while task.wait() do
					if InfiniteMoney then
							game:GetService("ReplicatedStorage").Remote.Shoes.SellShoes:FireServer(
								game:GetService("Players").LocalPlayer.ownedShoes["2"],
								0,
								math.huge
							)   
					end
				end
			end)




                local Toggle = Farm:CreateToggle({
                    Name = "Auto Buy Ball",
                    CurrentValue = false,
                    Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
                    Callback = function(Value)
                            AutoBuyBall = Value
                            end,
                })
                
                    task.spawn(function()
                        while task.wait() do
                            if AutoBuyBall then
                                local args = {[1] = 1}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 2}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 3}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 4}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 5}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 6}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 7}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 8}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 9}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 10}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 11}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 12}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 13}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 14}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 15}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 16}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                                local args = {[1] = 17}game:GetService("ReplicatedStorage").BuyBall:FireServer(unpack(args))
                            end
                        end
                    end)



                    local Toggle = Farm:CreateToggle({
                        Name = "Auto Buy Jersey",
                        CurrentValue = false,
                        Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
                        Callback = function(Value)
                                AutoBuyJersey = Value
                                end,
                    })
                    
                        task.spawn(function()
                            while task.wait() do
                                if AutoBuyJersey then
                                    local args = {[1] = 1}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 2}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 3}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 4}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 5}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 6}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 7}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 8}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 9}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 10}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                    local args = {[1] = 11}game:GetService("ReplicatedStorage").BuyJersey:FireServer(unpack(args))
                                end
                            end
                        end)
    





	



	local Button = Farm:CreateButton({
		Name = "Equipe Best[Need GamePass",
		Callback = function()
				wait(0.1)
                local args = {[1] = 28}game:GetService("ReplicatedStorage").EquipBall:FireServer(unpack(args))
                local args = {[1] = 22}game:GetService("ReplicatedStorage").EquipJersey:FireServer(unpack(args))
                game:GetService("ReplicatedStorage").Remote.Shoes.QuestReward:FireServer(32)
		end,
	})








	local Button = Farm:CreateButton({
		Name = "Max Upgrade[Need Money or Infinte Money]",
		Callback = function()
				local args = {[1] = 10,[2] = 10,[3] = 10,[4] = 10}game:GetService("ReplicatedStorage").UpgradeStats:FireServer(unpack(args))
		end,
	})










		local Utility = Window:CreateTab("Utility", 4483362458)



                local Button = Utility:CreateButton({
                    Name = "All GamePass",
                    Callback = function()
                            game:GetService("ReplicatedStorage").BuyBall:FireServer(11)
                            game:GetService("ReplicatedStorage").BuyBall:FireServer(12)
                            game:GetService("ReplicatedStorage").BuyBall:FireServer(13)
                            game:GetService("ReplicatedStorage").BuyBall:FireServer(27)
                            game:GetService("ReplicatedStorage").BuyBall:FireServer(28)
                            wait(0.1)
                            game:GetService("ReplicatedStorage").BuyJersey:FireServer(22)
                            game:GetService("ReplicatedStorage").BuyJersey:FireServer(9)
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Remote.Shoes.QuestReward:FireServer(32)		
                    end,
                })



				local Button = Utility:CreateButton({
					Name = "Get Badge",
					Callback = function()
						
						local a = {2127480711,2125747688,2127480708,2127480712}
						for i = 1,#a do
							game:GetService("ReplicatedStorage"):WaitForChild("AwardBadge"):FireServer(a[i])
						end
			
					end,
				})


				local Button = Utility:CreateButton({
					Name = "Redeem All Codes",
					Callback = function()
                        local args = {[1] = "2KMISSED"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
                        local args = {[1] = "10KFLIER"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
                        local args = {[1] = "MOREDUNKS10K"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
                        local args = {[1] = "LIBERTY"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
                        local args = {[1] = "XBOX"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
                        local args = {[1] = "2xCash"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
                        local args = {[1] = "onfire"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
                        local args = {[1] = "TYSMFORLIKES"}game:GetService("ReplicatedStorage").UseCode:InvokeServer(unpack(args))
					end,
				})




				
		










			
