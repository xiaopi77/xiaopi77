local ULlib = loadstring(game:HttpGet("https://github.com/AURORA666Script/ui/raw/main/kinghub.txt"))()

local lib =  loadstring(game:HttpGet("https://github.com/AURORA666Script/ui/raw/main/vapeui.txt"))()
local OpenUI = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner") 
OpenUI.Name = "OpenUI" 
OpenUI.Parent = game.CoreGui 
OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
TextButton.Parent = OpenUI 
TextButton.BackgroundColor3 = Color3.fromRGB(5, 6, 7)
TextButton.BackgroundTransparency = 0.5
TextButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0) 
TextButton.Size = UDim2.new(0, 50, 0, 50)
TextButton.Text = ""
TextButton.Draggable = true
TextLabel.Parent = TextButton
TextLabel.BackgroundColor3 = Color3.fromRGB(5, 6, 7)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "皮脚本"
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)--圈内字体颜色
TextLabel.TextSize = 14
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
UICorner.CornerRadius = UDim.new(1, 0) 
UICorner.Parent = TextButton
TextButton.MouseButton1Click:Connect(function() 
  if uihide == false then
	uihide = true
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
else
	uihide = false
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
		end 
		
end)

uihide = false

local win = ULlib:Window("皮脚本-监狱人生",Color3.fromRGB(0, 255, 0), Enum.KeyCode.RightControl)

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "皮脚本-监狱人生"; Text ="欢迎使用皮脚本-监狱人生"; Duration = 4; })

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "皮脚本-监狱人生"; Text ="此脚本为永久免费缝合"; Duration = 4; })

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "皮脚本-监狱人生"; Text ="祝您使用愉快"; Duration = 4; })

local Tab = win:Tab("主要功能")
local Tab1 = win:Tab("传送功能")
local Tab2 = win:Tab("选择职业")
local Tab3 = win:Tab("其他功能")
local Tab4 = win:Tab("玩家信息")
local Tab5 = win:Tab("公告")

Tab:Button("变钢铁侠", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
end)
Tab:Button("无敌模式", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
end)
Tab:Button("杀死所有人", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
end)
Tab:Button("手里剑（秒杀）", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
end)
Tab:Button("变死神", function()
    loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()
end)
Tab:Button("变车模型", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
end)

Tab1:Button("传送警卫室", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
end)
Tab1:Button("传送监狱室内", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
end)
Tab1:Button("传送罪犯复活点", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
end)
Tab1:Button("传送监狱室外", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
end)
Tab1:Button("传送院子", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(788.5759887695312, 97.99992370605469, 2455.056640625)
end)
Tab1:Button("传送警车库", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.7301635742188, 98.20000457763672, 2503.56982421875)
end)

Tab2:Button("变成警察", function()
    workspace.Remote.TeamEvent:FireServer("Bright blue");
end)
Tab2:Button("变成囚犯", function()
    workspace.Remote.TeamEvent:FireServer("Bright orange");
end)

Tab3:Button("逮捕所有罪犯", function()
    wait(0.1)
	Player = game.Players.LocalPlayer
	Pcf = Player.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
		if v.Name ~= Player.Name then
			local i = 10
			repeat
				wait()
				i = i-1
				game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
				Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
			until i == 0
		end
	end
end)
Tab3:Button("皮飞行",function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/07cdd3eeaf4d4928.txt_2024-08-09_090317.OTed.lua"))()
end)

Tab3:Button("皮飞车",function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/c3dcf58fa8cf7277.txt_2024-08-08_160648.OTed.lua"))()
end)

Tab3:Button("皮自瞄",function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
end)
Tab3:Button("甩飞",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
end)
Tab3:Button("反挂机v2",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)
Tab3:Button("铁拳",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
end)

Tab3:Button("死亡笔记", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/dfhj/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0.txt"))()
end)

Tab4:Label("您的注入器:"..identifyexecutor())
    Tab4:Label("您的用户名:"..game.Players.LocalPlayer.Character.Name)
    Tab4:Label("您的名称:"..game.Players.LocalPlayer.DisplayName)
    Tab4:Label("您当前服务器的ID:"..game.GameId) 
    Tab4:Label("您的用户ID:"..game.Players.LocalPlayer.UserId)
    Tab4:Label("您当前服务器的名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
    Tab4:Label("获取客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())
Tab4:Label("死亡时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))

Tab5:Label("作者: 小皮")
Tab5:Label("作者QQ: 2131869117")
Tab5:Label("皮脚本群(主群): 1002100032")
Tab5:Label("皮脚本群(二群): 894995244")
Tab5:Label("此脚本为皮脚本内置监狱人生脚本，可单独一个脚本")
Tab5:Label("脚本为完全免费缝合")
Tab5:Label("请勿倒卖，严禁倒卖")
Tab5:Button("复制作者QQ", function()
    setclipboard("2131869117")
end)
Tab5:Button("复制QQ主群", function()
    setclipboard("1002100032")
end)
Tab5:Button("复制QQ二群", function()
    setclipboard("894995244")
end)