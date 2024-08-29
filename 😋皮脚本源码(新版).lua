local bin = {
    playernamedied = "",
    dropdown = {}
}

function shuaxinlb(zji)
    bin.dropdown = {}
    if zji == true then
        for _, player in pairs(game.Players:GetPlayers()) do
            table.insert(bin.dropdown, player.Name)
        end
    else
        local lp = game.Players.LocalPlayer
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= lp then
                table.insert(bin.dropdown, player.Name)
            end
        end
    end
end
wait(0.1)
shuaxinlb(true)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/%E7%9A%AE%E8%84%9A%E6%9C%ACUI%E6%BA%90%E7%A0%81.lua"))()     
local window = library:new("皮脚本")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "皮脚本"; Text ="欢迎使用皮脚本"; Duration = 6; })

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "皮脚本"; Text ="此脚本为永久免费缝合"; Duration = 6; })

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "皮脚本"; Text ="祝您使用愉快"; Duration = 6; })

local UITab1 = window:Tab("『信息』",'18930406865')

local about = UITab1:section("玩家信息",true)

    about:Label("您的注入器:"..identifyexecutor())
    about:Label("您的用户名:"..game.Players.LocalPlayer.Character.Name)
    about:Label("您的名称:"..game.Players.LocalPlayer.DisplayName)
    about:Label("您当前服务器的ID:"..game.GameId) 
    about:Label("您的用户ID:"..game.Players.LocalPlayer.UserId)
    about:Label("您当前服务器的名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
    about:Label("获取客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())
about:Label("死亡时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))

local about = UITab1:section("作者信息",true)
about:Label("皮脚本")
about:Label("永不跑路的脚本")
about:Label("作者: 小皮")
about:Label("作者QQ: 2131869117")
about:Label("QQ主群: 1002100032")
about:Label("QQ2群: 894995244")
about:Label("解卡群: 252251548")
about:Button("复制作者QQ", function()
    setclipboard("2131869117")
end)
about:Button("复制QQ主群", function()
    setclipboard("1002100032")
end)
about:Button("复制QQ2群", function()
    setclipboard("894995244")
end)
about:Button("复制解卡群", function()
    setclipboard("252251548")
end)
local about = UITab1:section("UI设置",true)

about:Toggle("脚本框架变小一点", "", false, function(state)
        if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
        else
            game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
        end
    end)
    about:Button("关闭脚本",function()
        game:GetService("CoreGui")["frosty"]:Destroy()
    end)

local UITab2 = window:Tab("『公告』",'18930406865')

local about = UITab2:section("公告",true)

      about:Label("此脚本为免费缝合")
     about:Label("不许倒卖圈钱")
     about:Label("倒卖没浮木，私全家")
     about:Label("严禁倒卖，倒卖没亩")
     about:Label("有时间就会更新")

local UITab3 = window:Tab("『点进来有惊喜』",'18930406865')

local about = UITab3:section("贝利亚",true)

about:Label("你们好啊，我是贝利亚，我要来破坏地球了")
     about:Label("奥特曼们都被我打败了")
     about:Label("你们敢不敢来阻止我")

local about = UITab3:section("回来吧迷你世界",true)

      about:Label("回来吧迷你世界")
      about:Label("我最骄傲的信仰")
      about:Label("历历在目的卡卡") 
      about:Label("眼泪莫名在流淌")
      about:Label("依稀记得花小楼")
      about:Label("还有给力的联机")
      about:Label("把友情都给创造")
      about:Label("就算通宵也不累")

local UITab4 = window:Tab("『通用』",'18930406865')

local about = UITab4:section("通用",true)

about:Slider("步行速度", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 400, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)
about:Slider("跳跃高度", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 50, 400, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)

about:Slider('设置血量', 'Sliderflag', 100, 1, 100,false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.Health = Value
    end)

about:Slider('缩放距离', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
    end)

about:Textbox("重力设置", "Gravity", "输入", function(Gravity)
  spawn(function() while task.wait() do game.Workspace.Gravity = Gravity end end)
end)

about:Toggle("夜视", "Light", false, function(Light)
  spawn(function() while task.wait() do if Light then game.Lighting.Ambient = Color3.new(1, 1, 1) else game.Lighting.Ambient = Color3.new(0, 0, 0) end end end)
end)
about:Button("透视", function()
  local Players = game:GetService("Players"):GetChildren() local RunService = game:GetService("RunService") local highlight = Instance.new("Highlight") highlight.Name = "Highlight" for i, v in pairs(Players) do repeat wait() until v.Character if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = v.Character highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart") highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop highlightClone.Name = "Highlight" end end game.Players.PlayerAdded:Connect(function(player) repeat wait() until player.Character if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = player.Character highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart") highlightClone.Name = "Highlight" end end) game.Players.PlayerRemoving:Connect(function(playerRemoved) playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy() end) RunService.Heartbeat:Connect(function() for i, v in pairs(Players) do repeat wait() until v.Character if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = v.Character highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart") highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop highlightClone.Name = "Highlight" task.wait() end end end)
end)

about:Button("隐身道具", function()
  loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
end)

about:Button("子弹追踪", function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local WTSP = Camera.WorldToScreenPoint
    local FindFirstChild = game.FindFirstChild
    local Vector2_new = Vector2.new
    local Mouse = LocalPlayer:GetMouse()
    
    function ClosestChar()
        local Max, Close = math.huge
        for _, V in pairs(Players:GetPlayers()) do
            if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
                local Torso = FindFirstChild(V.Character, "Torso")
                if Torso then
                    local Pos, OnScreen = WTSP(Camera, Torso.Position)
                    if OnScreen then
                        local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
                        if Dist < Max then
                            Max = Dist
                            Close = V.Character
                        end
                    end
                end
            end
        end
        return Close
    end

    local MT = getrawmetatable(game)
    local __namecall = MT.__namecall
    setreadonly(MT, false)
    MT.__namecall = newcclosure(function(self, ...)
        local Method = getnamecallmethod()
        if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
            local Character = ClosestChar()
            if Character then
                return Character.Torso, Character.Torso.Position
            end
        end

        return __namecall(self, ...)
    end)
    setreadonly(MT, true)

    local vu = game:GetService("VirtualUser")
    Players.LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

about:Button(
    "查看游戏中的所有玩家（包括血量条）",
    function()
loadstring(game:HttpGet(('https://pastebin.com/raw/G2zb992X'),true))()
    end)

about:Button("工具包",function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)

about:Toggle("穿墙", "NoClip", false, function(NC)
  local Workspace = game:GetService("Workspace") local Players = game:GetService("Players") if NC then Clipon = true else Clipon = false end Stepped = game:GetService("RunService").Stepped:Connect(function() if not Clipon == false then for a, b in pairs(Workspace:GetChildren()) do if b.Name == Players.LocalPlayer.Name then for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = false end end end end else Stepped:Disconnect() end end)
end)

about:Button("皮飞行",function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/07cdd3eeaf4d4928.txt_2024-08-09_090317.OTed.lua"))()
end)

about:Button("皮飞车",function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/Pi-feiche.lua"))()
end)

about:Button("皮自瞄",function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
end)

about:Button("甩飞1(有效)",function()
          loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
end)

about:Button("甩飞2(有效)",function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/hknvh/main/%E7%94%A9%E9%A3%9E.txt"))() 
end)

about:Button("死亡笔记",function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua"))()
end)

about:Button("最强透视",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
end)

about:Button("反挂机v2",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
end)
about:Button("铁拳",function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
end)
about:Button("键盘",function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
end)

about:Toggle("无法移动", "Fake flag", false, function(state)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        if state then
            -- Freeze the player to simulate lag
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Anchored = true
                end
            end
        else
            -- Unfreeze the player
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Anchored = false
                end
            end
        end
    end)

about:Button("自杀",function()
game.Players.LocalPlayer.Character.Humanoid.Health=0
end)

about:Button("踏空行走",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)

about:Button("通用ESP",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

about:Button("踢人脚本",function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/c8320f69b6aa4f5d.txt_2024-08-08_214628.OTed.lua"))()
end)

about:Button("动画中心",function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)

about:Button("爬墙",function()
  loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

about:Button(
    "转圈",
    function()
    local speed = 30

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Toggle("自动互动(自动跟NPC或物体互动)", "Auto Interact", false, function(state)
        if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25) -- Adjust the wait time as needed
            end
        else
            autoInteract = false
        end
    end)

about:Button("替身",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
end)

about:Button("操人脚本", function()
  local SimpleSexGUI = Instance.new("ScreenGui") local FGUI = Instance.new("Frame") local btnNaked = Instance.new("TextButton") local btnSex = Instance.new("TextButton") local tbxVictim = Instance.new("TextBox") local lblFUCKEMALL = Instance.new("TextLabel") local ImageLabel = Instance.new("ImageLabel") local lbltitle = Instance.new("TextLabel") local TextLabel = Instance.new("TextLabel") SimpleSexGUI.Name = "SimpleSexGUI" SimpleSexGUI.Parent = game.CoreGui FGUI.Name = "FGUI" FGUI.Parent = SimpleSexGUI FGUI.BackgroundColor3 = Color3.new(255,255,255) FGUI.BorderSizePixel = 1 FGUI.Position = UDim2.new(0,0, 0.667, 0) FGUI.Size = UDim2.new(0,317, 0,271) FGUI.Draggable = true lbltitle.Name = "Title" lbltitle.Parent = FGUI lbltitle.BackgroundColor3 = Color3.new(255,255,255) lbltitle.BorderSizePixel = 1 lbltitle.Position = UDim2.new (0, 0,-0.122, 0) lbltitle.Size = UDim2.new (0, 317,0, 33) lbltitle.Visible = true lbltitle.Active = true lbltitle.Draggable = false lbltitle.Selectable = true lbltitle.Font = Enum.Font.SourceSansBold lbltitle.Text = "一个简单的操蛋脚本!!" lbltitle.TextColor3 = Color3.new(0, 0, 0) lbltitle.TextSize = 20 btnSex.Name = "Sex" btnSex.Parent = FGUI btnSex.BackgroundColor3 = Color3.new(255,255,255) btnSex.BorderSizePixel = 1 btnSex.Position = UDim2.new (0.044, 0,0.229, 0) btnSex.Size = UDim2.new (0, 99,0, 31) btnSex.Visible = true btnSex.Active = true btnSex.Draggable = false btnSex.Selectable = true btnSex.Font = Enum.Font.SourceSansBold btnSex.Text = "让我们操蛋吧!!" btnSex.TextColor3 = Color3.new(0, 0, 0) btnSex.TextSize = 20 tbxVictim.Name = "VictimTEXT" tbxVictim.Parent = FGUI tbxVictim.BackgroundColor3 = Color3.new(255,255,255) tbxVictim.BorderSizePixel = 1 tbxVictim.Position = UDim2.new (0.533, 0,0.229, 0) tbxVictim.Size = UDim2.new (0, 133,0, 27) tbxVictim.Visible = true tbxVictim.Active = true tbxVictim.Draggable = false tbxVictim.Selectable = true tbxVictim.Font = Enum.Font.SourceSansBold tbxVictim.Text = "名字" tbxVictim.TextColor3 = Color3.new(0, 0, 0) tbxVictim.TextSize = 20 lblFUCKEMALL.Name = "FUCKEMALL" lblFUCKEMALL.Parent = FGUI lblFUCKEMALL.BackgroundColor3 = Color3.new(255,255,255) lblFUCKEMALL.BorderSizePixel = 1 lblFUCKEMALL.Position = UDim2.new (0.025, 0,0.856, 0) lblFUCKEMALL.Size = UDim2.new (0, 301,0, 27) lblFUCKEMALL.Visible = true lblFUCKEMALL.Font = Enum.Font.SourceSansBold lblFUCKEMALL.Text = "操蛋和操蛋" lblFUCKEMALL.TextColor3 = Color3.new(0, 0, 0) lblFUCKEMALL.TextSize = 20 ImageLabel.Name = "ImageLabel" ImageLabel.Parent = FGUI ImageLabel.Image = "http://www.roblox.com/asset/?id=42837..." ImageLabel.BorderSizePixel = 1 ImageLabel.Position = UDim2.new (0.274, 0,0.358, 0) ImageLabel.Size = UDim2.new (0, 106,0, 121) btnSex.MouseButton1Click:Connect(function() local player = tbxVictim.Text local stupid = Instance.new('Animation') stupid.AnimationId = 'rbxassetid://148840371' hummy = game:GetService("Players").LocalPlayer.Character.Humanoid pcall(function() hummy.Parent.Pants:Destroy() end) pcall(function() hummy.Parent.Shirt:Destroy() end) local notfunny = hummy:LoadAnimation(stupid) notfunny:Play() notfunny:AdjustSpeed(10) while hummy.Parent.Parent ~= nil do wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[tbxVictim.Text].Character.HumanoidRootPart.CFrame end end)
end)

about:Button("圈圈自瞄30", function()
    local fov = 30 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 0, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function lookAt(target) local lookVector = (target - Cam.CFrame.Position).unit local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector) Cam.CFrame = newCFrame end local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then lookAt(closest.Character.Head.Position) end end)
end)

about:Button("圈圈自瞄50", function()
    local fov = 50 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 0, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function lookAt(target) local lookVector = (target - Cam.CFrame.Position).unit local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector) Cam.CFrame = newCFrame end local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then lookAt(closest.Character.Head.Position) end end)
end)

about:Button("圈圈自瞄80", function()
    local fov = 80 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 0, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function lookAt(target) local lookVector = (target - Cam.CFrame.Position).unit local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector) Cam.CFrame = newCFrame end local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then lookAt(closest.Character.Head.Position) end end)
end)

about:Button("圈圈自瞄100", function()
    local fov = 100 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 0, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function lookAt(target) local lookVector = (target - Cam.CFrame.Position).unit local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector) Cam.CFrame = newCFrame end local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then lookAt(closest.Character.Head.Position) end end)
end)

about:Button("圈圈自瞄(可调)", function()
  local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end)
end)

about:Button("iw指令", function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

about:Toggle("Circle ESP", "ESP", false, function(state)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.Adornee = player.Character

                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = player.Character
                    billboard.Adornee = player.Character
                    billboard.Size = UDim2.new(0, 100, 0, 100)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true

                    local circle = Instance.new("ImageLabel")
                    circle.Parent = billboard
                    circle.Size = UDim2.new(0, 50, 0, 50)
                    circle.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center the circle
                    circle.AnchorPoint = Vector2.new(0.5, 0.5) -- Set the anchor point to the center
                    circle.BackgroundTransparency = 1
                    circle.Image = "rbxassetid://2200552246" -- Replace with your circle image asset ID
                else
                    if player.Character:FindFirstChildOfClass("Highlight") then
                        player.Character:FindFirstChildOfClass("Highlight"):Destroy()
                    end
                    if player.Character:FindFirstChildOfClass("BillboardGui") then
                        player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end)

about:Toggle(
    "无敌",
    "text",
    false,
    function(Value)
    if Value then
		    local Cam = workspace.CurrentCamera
	local Pos, Char = Cam.CFrame, speaker.Character
	local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
	local nHuman = Human.Clone(Human)
	nHuman.Parent, speaker.Character = Char, nil
	nHuman.SetStateEnabled(nHuman, 15, false)
	nHuman.SetStateEnabled(nHuman, 1, false)
	nHuman.SetStateEnabled(nHuman, 0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
	speaker.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, wait() and Pos
	nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local Script = Char.FindFirstChild(Char, "Animate")
	if Script then
		Script.Disabled = true
		wait()
		Script.Disabled = false
	end
	nHuman.Health = nHuman.MaxHealth
		else
		    game.Players.LocalPlayer.Character.Humanoid.Health = 100
		end
		end)
		
about:Toggle('上帝模式', 'No Description', false, function(Value)
        if Value then
            local LP = game:GetService"Players".LocalPlayer
            local HRP = LP.Character.HumanoidRootPart
            local Clone = HRP:Clone()
            Clone.Parent = LP.Character
        else
            game.Players.LocalPlayer.Character.Head:Destroy()
        end
    end)	    						

about:Toggle("人物显示", "RWXS", false, function(RWXS)
    getgenv().enabled = RWXS getgenv().filluseteamcolor = true getgenv().outlineuseteamcolor = true getgenv().fillcolor = Color3.new(1, 0, 0) getgenv().outlinecolor = Color3.new(1, 1, 1) getgenv().filltrans = 0.5 getgenv().outlinetrans = 0.5 loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
end)

about:Button("显示FPS", function()
  local FpsGui = Instance.new("ScreenGui") local FpsXS = Instance.new("TextLabel") FpsGui.Name = "FPSGui" FpsGui.ResetOnSpawn = false FpsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling FpsXS.Name = "FpsXS" FpsXS.Size = UDim2.new(0, 100, 0, 50) FpsXS.Position = UDim2.new(0, 10, 0, 10) FpsXS.BackgroundTransparency = 1 FpsXS.Font = Enum.Font.SourceSansBold FpsXS.Text = "FPS: 0" FpsXS.TextSize = 20 FpsXS.TextColor3 = Color3.new(1, 1, 1) FpsXS.Parent = FpsGui function updateFpsXS() local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait()) FpsXS.Text = "FPS: " .. fps end game:GetService("RunService").RenderStepped:Connect(updateFpsXS) FpsGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end)

about:Button("显示时间", function()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
end)

about:Button("聊天黄油",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/%E7%A0%B4%E8%A7%A3%E8%BF%9D%E7%A6%81%E8%AF%8D%E6%96%B9%E6%B3%95.lua", true))()
end)

about:Toggle("无限跳", "IJ", false, function(IJ)
    getgenv().InfJ = IJ game:GetService("UserInputService").JumpRequest:connect(function() if InfJ == true then game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping") end end)
end)
about:Button("F3X", function()
  loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)
about:Button("保存游戏", function()
  saveinstance()
end)
about:Button("离开游戏", function()
  game:Shutdown()
end)
about:Button("玩家加入与退出提示", function()
    game.Players.PlayerAdded:Connect(function(player)
        Notify("玩家加入", player.Name .. " 加入了游戏", "rbxassetid://17360377302", 5)
    end)
    game.Players.PlayerRemoving:Connect(function(player)
        Notify("玩家离开", player.Name .. " 离开了游戏", "rbxassetid://17360377302", 5)
    end)
end)

local UITab1 = window:Tab("『传送玩家』",'18930406865')

local about = UITab1:section("传送玩家",true)

local Players = about:Dropdown("选择玩家名字已开始下面的功能", 'Dropdown', bin.dropdown, function(v)
    bin.playernamedied = v
end)

about:Button("重置玩家名字", function()
    shuaxinlb(true)
    Players:SetOptions(bin.dropdown)
end)

about:Button("传送到玩家旁边", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(bin.playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    else
        print("无法传送：未找到玩家或玩家没有角色/HumanoidRootPart")
    end
end)

local UITab4 = window:Tab("『FE』",'18930406865')

local about = UITab4:section("脚本",true)

about:Button("C00lgui", function()
    loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
end)
about:Button("1x1x1x1", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
end)
about:Button("大长腿", function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets'))()
end)
about:Button("用头", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BK4Q0DfU"))()
end)
about:Button("复仇者", function()
    loadstring(game:HttpGet(('https://pastefy.ga/iGyVaTvs/raw'),true))()
end)
about:Button("鼠标", function()
    loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()
end)
about:Button("变怪物", function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/jfryBKds"))()
end)
about:Button("香蕉枪", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/BananaGunByNerd.lua"))()
end)
about:Button("超长级把", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()
end)
about:Button("操人", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/AHAJAJAKAK/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A/A.LUA", true))()
end)
about:Button("动画中心", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
end)
about:Button("变玩家", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
end)
about:Button("猫娘R63", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end)
about:Button("FE", function()
    loadstring(game:HttpGet('https://pastefy.ga/a7RTi4un/raw'))()
end)

local UITab4 = window:Tab("『范围』",'18930406865')

local about = UITab4:section("范围",true)

about:Button("范围0", function()
    _G.HeadSize = 0 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围10", function()
    _G.HeadSize = 10 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)    

about:Button("范围20", function()
    _G.HeadSize = 20 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围50", function()
    _G.HeadSize = 50 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围100", function()
    _G.HeadSize = 100 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围150", function()
    _G.HeadSize = 150 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围200", function()
    _G.HeadSize = 200 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围300", function()
    _G.HeadSize = 300 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围400", function()
    _G.HeadSize = 400 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

about:Button("范围500", function()
    _G.HeadSize = 500 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

local UITab4 = window:Tab("『旋转』",'18930406865')

local about = UITab4:section("旋转",true)

about:Button("旋转清0(自杀)",function()
game.Players.LocalPlayer.Character.Humanoid.Health=0
end)

about:Button(
    "旋转0",
    function()
    local speed = 0

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
    

about:Button(
    "旋转30",
    function()
    local speed = 30

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转50",
    function()
    local speed = 50

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
    
about:Button(
    "旋转100",
    function()
    local speed = 100

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)    

about:Button(
    "旋转150",
    function()
    local speed = 150

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)

about:Button(
    "旋转200",
    function()
    local speed = 200

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
    
about:Button(
    "旋转250",
    function()
    local speed = 250

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
        
about:Button(
    "旋转300",
    function()
    local speed = 300

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
         
about:Button(
    "旋转400",
    function()
    local speed = 400

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
 
about:Button(
    "旋转500",
    function()
    local speed = 500

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
    
local UITab4 = window:Tab("『加入服务器』",'18930406865')    

local about = UITab4:section("加入服务器",true)

about:Button("加入极速传奇",function()
    game:GetService("TeleportService"):Teleport(1119466531) 
end)

about:Button("加入力量传奇",function()
    game:GetService("TeleportService"):Teleport(1268927906) 
end)

about:Button("加入自然灾害",function()
    game:GetService("TeleportService"):Teleport(65241) 
end)

about:Button("加入河北唐县",function()
    game:GetService("TeleportService"):Teleport(1512676568) 
end)

about:Button("加入监狱人生",function()
    game:GetService("TeleportService"):Teleport(73885730) 
end)

about:Button("加入忍者传奇",function()
    game:GetService("TeleportService"):Teleport(1335695570) 
end)

about:Button("加入疯狂电梯",function()
    game:GetService("TeleportService"):Teleport(1358133289) 
end)

about:Button("加入汽车经销大亨",function()
    game:GetService("TeleportService"):Teleport(605887098) 
end)

about:Button("加入超级大力士模拟器",function()
    game:GetService("TeleportService"):Teleport(2564505263) 
end)

about:Button("加入战争大亨",function()
    game:GetService("TeleportService"):Teleport(1526814852) 
end)

about:Button("加入兵工厂",function()
    game:GetService("TeleportService"):Teleport(111958650) 
end)

about:Button("加入巴掌模拟器",function()
    game:GetService("TeleportService"):Teleport(2380077519) 
end)
               
local UITab4 = window:Tab("『音乐』",'18930406865')

local about = UITab4:section("音乐",true)

about:Button("防空警报", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("义勇军进行曲", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("彩虹瀑布",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
    end)
    
about:Button("雨中牛郎",function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://16831108393"
    sound.Parent = game.Workspace
    sound:Play()
    end)    
    
local UITab4 = window:Tab("『画质光影』",'18930406865')

local about = UITab4:section("画质光影",true)

about:Button("动态模糊", function()
    local camera = workspace.CurrentCamera local blurAmount = 10 local blurAmplifier = 5 local lastVector = camera.CFrame.LookVector local motionBlur = Instance.new("BlurEffect", camera) local runService = game:GetService("RunService") workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() local camera = workspace.CurrentCamera if motionBlur and motionBlur.Parent then motionBlur.Parent = camera else motionBlur = Instance.new("BlurEffect", camera) end end) runService.Heartbeat:Connect(function(deltaTime) local magnitude = (camera.CFrame.LookVector - lastVector).Magnitude motionBlur.Size = math.abs(magnitude) * blurAmount * blurAmplifier / 2 lastVector = camera.CFrame.LookVector end)
end)

about:Button("光影", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("光影滤镜", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("RTX高仿", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/Bkf0BJb3'))()
end)
about:Button("超高画质", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)
about:Button("光影v4", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("光影深", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
end)
about:Button("光影浅", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end)

function GetItems() local cache = {} for i,v in pairs(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do table.insert(cache,v) end for i,v in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do table.insert(cache,v) end return cache end
function Collect(item) if item:FindFirstChildOfClass("ClickDetector") then fireclickdetector(item:FindFirstChildOfClass("ClickDetector")) elseif item:FindFirstChildOfClass("Part") then local maincrap = item:FindFirstChildOfClass("Part") fireclickdetector(maincrap:FindFirstChildOfClass("ClickDetector")) end end
ItemFarmFunc = function() while ItemFarm and task.wait() do local allitems = GetItems() for i,v in pairs(allitems) do if ItemFarm == false then break end pcall(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame task.wait(0.5) Collect(v) task.wait(0.5) end) end end end    

local UITab4 = window:Tab("『无限R币/罗宝』",'18930406865')

local about = UITab4:section("无限R币/罗宝功能",true)

about:Button("80R", function()
    loadstring(game:HttpGet("https://github.com/RunDTM/roblox-bluescreen/raw/main/bsod.lua"))() 
end)

about:Button("400R",function()
     loadstring(game:HttpGet("https://github.com/RunDTM/roblox-bluescreen/raw/main/bsod.lua"))() 
end)

about:Button("800R",function()
     loadstring(game:HttpGet("https://github.com/RunDTM/roblox-bluescreen/raw/main/bsod.lua"))() 
end)
about:Button("450R+会员",function()
     loadstring(game:HttpGet("https://github.com/RunDTM/roblox-bluescreen/raw/main/bsod.lua"))() 
end)
about:Button("1000R+会员",function()
     loadstring(game:HttpGet("https://github.com/RunDTM/roblox-bluescreen/raw/main/bsod.lua"))() 
end)

local UITab4 = window:Tab("『力量传奇』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("自动比赛", "AR", false, function(AR)
    isAutoRunning = AR if isAutoRunning then while isAutoRunning do wait(2) game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl") end end
end)

about:Toggle("自动举哑铃", "ATYL", false, function(ATYL)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local originalPosition

    if ATYL then
        if character then
            originalPosition = character.HumanoidRootPart.Position

            local part = Instance.new('Part', workspace)
            part.Size = Vector3.new(500, 20, 530.1)
            part.Position = Vector3.new(0, 100000, 133.15)
            part.CanCollide = true
            part.Anchored = true
            
            while ATYL do
                wait()
                character = player.Character
                if character then
                    character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                    for _, tool in ipairs(player.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Weight" then
                            tool.Parent = character
                        end
                    end
                    player.muscleEvent:FireServer("rep")
                end
            end
            
            if character and originalPosition then
                character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
            end

            part:Destroy()
        end
    end
end)

about:Toggle("自动俯卧撑", "ATFWC", false, function(ATFWC)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local originalPosition

    if ATFWC then
        if character then
            originalPosition = character.HumanoidRootPart.Position

            local part = Instance.new('Part', workspace)
            part.Size = Vector3.new(500, 20, 530.1)
            part.Position = Vector3.new(0, 100000, 133.15)
            part.CanCollide = true
            part.Anchored = true

            while ATFWC do
                wait()
                character = player.Character
                if character then
                    character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
                    for _, tool in ipairs(player.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool.Name == "Pushups" then
                            tool.Parent = character
                        end
                    end
                    player.muscleEvent:FireServer("rep")
                end
            end

            if character and originalPosition then
                character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
            end

            part:Destroy()
        end
    end
end)

about:Toggle("自动收集物品", "AutoCollect", false, function(AutoCollect)
    if AutoCollect then local collectPart = Instance.new('Part', Workspace) collectPart.Size = Vector3.new(10, 10, 10) collectPart.Position = Vector3.new(0, 100, 0) collectPart.Anchored = true collectPart.CanCollide = false while AutoCollect do wait(0.1) for _, item in ipairs(game:GetService("Workspace"):GetChildren()) do if item:IsA("Part") and item.Name == "Collectible" then game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = item.CFrame + Vector3.new(0, 3, 0) wait(0.5) item:Destroy() end end end collectPart:Destroy() end
end)

about:Toggle("自动倒立身体", "ATDL", false, function(ATDL)
    if ATDL then local part = Instance.new('Part', Workspace) part.Size = Vector3.new(1, 1, 1) part.Position = Vector3.new(0, 100000, 133.15) part.Anchored = true part.CanCollide = false while ATDL do wait() game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do if tool:IsA("Tool") and tool.Name == "Handstands" then tool.Parent = game:GetService("Players").LocalPlayer.Character end end game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") end part:Destroy() end
end)

about:Toggle("自动锻炼", "ATAAA", false, function(ATAAA)
    if ATAAA then local part = Instance.new('Part', Workspace) part.Size = Vector3.new(500, 20, 530.1) part.Position = Vector3.new(0, 100000, 133.15) part.Anchored = true part.CanCollide = true while ATAAA do wait() game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0) for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do if tool.ClassName == "Tool" and (tool.Name == "Handstands" or tool.Name == "Situps" or tool.Name == "Pushups" or tool.Name == "Weight") then tool:FindFirstChildOfClass("NumberValue").Value = 0 repeat wait() until game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool") game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(tool) game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep") end end end part:Destroy() end
end)

about:Toggle("自动重生", "ATRE", false, function(ATRE)
    if ATRE then while true do game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest") wait() end end
end)
about:Button("收集宝石", function()
    local jk = {} for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do if v.Name ~= "Light Karma Chest" and v.Name ~= "Evil Karma Chest" then table.insert(jk, v.Name) end end for i = 1, #jk do wait(2) game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i]) end
end)

local about = UITab4:section("跑步机",true)

about:Toggle("沙滩跑步机10", "PPJ10", false, function(PPJ10)
    getgenv().PPJ10 = PPJ10 while getgenv().PPJ10 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer local function moveCharacter() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, moveCharacter) end if not getgenv().PPJ10 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer local function stopMoving() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end RunService:UnbindFromRenderStep("move") end
end)
about:Toggle("健身房跑步机2000", "PPJ2000", false, function(PPJ2000)
    if game.Players.LocalPlayer.Agility.Value >= 2000 then getgenv().PPJ2000 = PPJ2000 while getgenv().PPJ2000 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local function moveCharacter() if game.Players.LocalPlayer.Character then local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end local RunService = game:GetService("RunService") RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, moveCharacter) end else return end if not getgenv().PPJ2000 then local RunService = game:GetService("RunService") RunService:UnbindFromRenderStep("move") end
end)
about:Toggle("神话健身房跑步机2000", "SHPPJ2000", false, function(SHPPJ2000)
  if game.Players.LocalPlayer.Agility.Value >= 2000 then getgenv().SHPPJ2000 = SHPPJ2000 while getgenv().SHPPJ2000 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end end if not getgenv().SHPPJ2000 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)
about:Toggle("永恒健身房跑步机3500", "YHPPJ3500", false, function(YHPPJ3500)
  if game.Players.LocalPlayer.Agility.Value >= 3500 then getgenv().YHPPJ3500 = YHPPJ3500 while getgenv().YHPPJ3500 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end end if not getgenv().YHPPJ3500 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)
about:Toggle("传奇健身房跑步机3000", "CQPPJ3000", false, function(CQPPJ3000)
  if game.Players.LocalPlayer.Agility.Value >= 3000 then getgenv().CQPPJ3000 = CQPPJ3000 while getgenv().CQPPJ3000 do wait() game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10 game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727) local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:WaitForChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end end if not getgenv().CQPPJ3000 then local RunService = game:GetService("RunService") local Players = game:GetService("Players") local localPlayer = Players.LocalPlayer RunService:UnbindFromRenderStep("move", Enum.RenderPriority.Character.Value + 1, function() if localPlayer.Character then local humanoid = localPlayer.Character:FindFirstChild("Humanoid") if humanoid then humanoid:Move(Vector3.new(10000, 0, -1), true) end end end) end
end)

local about = UITab4:section("打石头",true)

about:Toggle("石头0", "text",false,function(rock)
    getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end)

about:Toggle("石头10", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 10 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

about:Toggle("石头100", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 100 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

about:Toggle("石头5000", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 5000 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(329.831482, 3.66450214, -618.48407, -0.806075394, -8.67358096e-08, 0.591812849, -1.05715522e-07, 1, 2.57029176e-09, -0.591812849, -6.04919563e-08, -0.806075394)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

about:Toggle("石头150000", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 150000 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2566.78076, 3.97019577, -277.503235, -0.923934579, -4.11600105e-08, -0.382550538, -3.38838042e-08, 1, -2.57576183e-08, 0.382550538, -1.08360858e-08, -0.923934579)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

about:Toggle("石头400000", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 400000 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2155.61743, 3.79830337, 1227.06482, -0.551303148, -9.16796949e-09, -0.834304988, -5.61318245e-08, 1, 2.61027839e-08, 0.834304988, 6.12216127e-08, -0.551303148)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

about:Toggle("石头750000", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 750000 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7285.6499, 3.66624784, -1228.27417, 0.857643783, -1.58175091e-08, -0.514244199, -1.22581563e-08, 1, -5.12025977e-08, 0.514244199, 5.02172774e-08, 0.857643783)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

about:Toggle("石头100万", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 1000000 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4160.87109, 987.829102, -4136.64502, -0.893115997, 1.25481356e-05, 0.44982639, 5.02490684e-06, 1, -1.79187136e-05, -0.44982639, -1.37431543e-05, -0.893115997)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

about:Toggle("石头500万", "text",false,function(rock)
    if game.Players.LocalPlayer.Durability.Value >= 5000000 then
getgenv().rock = rock
while getgenv().rock do
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Punch" then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
end
end
for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if h:IsA("Tool") and h.Name == "Punch" then
h:Activate()
end
end
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8957.54395, 5.53625107, -6126.90186, -0.803919137, 6.6065212e-08, 0.594738603, -8.93136143e-09, 1, -1.23155459e-07, -0.594738603, -1.04318865e-07, -0.803919137)
end
if not getgenv().rock then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
end
end
end)

local about = UITab4:section("深蹲架",true)

about:Toggle("深蹲架沙滩", "text",false,function(rack)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(232.627625, 3.67689133, 96.3039856, -0.963445187, -7.78685845e-08, -0.267905563, -7.92865222e-08, 1, -5.52570167e-09, 0.267905563, 1.5917589e-08, -0.963445187)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("深蹲架霜冻健身房", "text",false,function(rack)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2629.13818, 3.36860609, -609.827454, -0.995664716, -2.67296816e-08, -0.0930150598, -1.90042453e-08, 1, -8.39415222e-08, 0.0930150598, -8.18099295e-08, -0.995664716)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("深蹲架传奇健身房", "text",false,function(rack)
    getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4443.04443, 987.521484, -4061.12988, 0.83309716, 3.33018835e-09, 0.553126693, -2.87759438e-09, 1, -1.68654424e-09, -0.553126693, -1.86619012e-10, 0.83309716)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("深蹲架肌肉健身房", "text",false,function(rack)
    getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8757.37012, 13.2186356, -6051.24365, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

local about = UITab4:section("引体向上",true)

about:Toggle("引体向上海滩", "text",false,function(pull)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
getgenv().spam = pull
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-185.157745, 5.81071186, 104.747154, 0.227061391, -8.2363325e-09, 0.97388047, 5.58502826e-08, 1, -4.56432803e-09, -0.97388047, 5.54278827e-08, 0.227061391)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)


about:Toggle("引体向上神话健身房", "text",false,function(pull)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
getgenv().spam = pull
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2315.82104, 5.81071281, 847.153076, 0.993555248, 6.99809632e-08, 0.113349125, -7.05298859e-08, 1, 8.32554692e-10, -0.113349125, -8.82168916e-09, 0.993555248)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("引体向上传奇健身房", "text",false,function(pull)
    getgenv().spam = pull
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4305.08203, 989.963623, -4118.44873, -0.953815758, -7.58000382e-08, -0.30039227, -8.98859724e-08, 1, 3.30721512e-08, 0.30039227, 5.85457904e-08, -0.953815758)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

local about = UITab4:section("硬拉",true)

about:Toggle("硬拉沙滩", "text",false,function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1500 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(136.606216, 3.67689133, 97.661499, -0.974106729, -1.89495477e-08, 0.226088539, -1.78365624e-08, 1, 6.96555214e-09, -0.226088539, 2.75254886e-09, -0.974106729)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("硬拉冰霜健身房", "text",false,function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 5000 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2916.11572, 3.67689204, -212.97438, -0.241641939, -6.10995343e-08, 0.970365465, 6.65890596e-08, 1, 7.9547597e-08, -0.970365465, 8.38377616e-08, -0.241641939)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("硬拉传奇健身房", "text",false,function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4538.42627, 987.829834, -4008.82007, -0.830109239, 2.21324914e-08, 0.557600796, 8.02302083e-08, 1, 7.97476361e-08, -0.557600796, 1.1093568e-07, -0.830109239)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("硬拉肌肉健身房", "text",false,function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8768.4375, 13.5269203, -5681.62256, -0.997508109, -5.4007393e-10, 0.0705519542, 1.52984292e-10, 1, 9.81797044e-09, -0.0705519542, 9.80429782e-09, -0.997508109)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

local about = UITab4:section("扔石头",true)

about:Toggle("扔石头海滩", "text",false,function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 3000 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-91.6730804, 3.67689133, -292.42868, -0.221022144, -2.21041621e-08, -0.975268781, 1.21414407e-08, 1, -2.54162646e-08, 0.975268781, -1.7458726e-08, -0.221022144)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("扔石头神话健身房", "text",false,function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 10000 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2486.01733, 3.67689276, 1237.89331, 0.883595645, -2.06135038e-08, -0.468250751, -3.3286871e-09, 1, -5.03036404e-08, 0.468250751, 4.60067362e-08, 0.883595645)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("扔石头传奇健身房", "text",false,function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4189.96143, 987.829773, -3903.0166, 0.422592968, 0, 0.906319559, 0, 1, 0, -0.906319559, 0, 0.422592968)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

about:Toggle("扔石头肌肉健身房", "text",false,function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(8933.69434, 13.5269222, -5700.12598, -0.823058188, 6.96304259e-09, 0.567957044, -1.19721832e-08, 1, -2.96093621e-08, -0.567957044, -3.11699146e-08, -0.823058188)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)

local about = UITab4:section("传送功能",true)

about:Toggle("X-安全地方", "TP-PLACE", false, function(Place)
  if Place then getgenv().place = true while getgenv().place do wait() game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-51.6716728, 32.2157211, 1290.41211, 0.9945544, 1.23613528e-08, -0.104218982, -7.58742402e-09, 1, 4.62031657e-08, 0.104218982, -4.51608102e-08, 0.9945544) end else getgenv().place = false wait() game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-34.1635208, 3.67689133, 219.640869, 0.599920511, -2.24152163e-09, 0.800059617, 4.46125981e-09, 1, -5.43559087e-10, -0.800059617, 3.89536625e-09, 0.599920511) end
end)
about:Button("传送到出生点", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
end)
about:Button("传送到冰霜健身房", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
end)
about:Button("传送到神话健身房", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
end)
about:Button("传送到永恒健身房", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
end)
about:Button("传送到传说健身房", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
end)
about:Button("传送到肌肉之王健身房", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
end)
about:Button("传送到安全岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
end)
about:Button("传送到幸运抽奖区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)
end)

local noCD = false
local br = false
local punchCooldown = 1

local function updatePunch()
    local player = game:GetService("Players").LocalPlayer
    local punchValue = player.Backpack.Punch:FindFirstChildOfClass("NumberValue")
    if punchValue then
        punchValue.Value = noCD and 0 or punchCooldown
    end
end

local about = UITab4:section("挥拳无间隔",true)

about:Toggle("挥拳无间隔", "AL", false, function(Value)
    noCD = Value
    updatePunch()
    
    if noCD then
        br = true
        while br do
            local players = game.Players:GetPlayers()
            if #players > 0 then
                local randomPlayer = players[math.random(1, #players)]
                if randomPlayer.Character and randomPlayer.Character:FindFirstChild("Head") then
                    local headPos = randomPlayer.Character.Head.Position
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                        Vector3.new(headPos.X, headPos.Y, headPos.Z)
                    )
                end
            end
            wait(0.2)
        end
    else
        br = false
    end
end)

local UITab4 = window:Tab("『速度传奇』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("自动重生", "ARS", false, function(ARS)
  if ARS then _G.loop = true while _G.loop == true do wait() game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest") end else _G.loop = false end
end)
about:Toggle("自动刷等级", "SHUA", false, function(SHUA)
  if SHUA then shuajingyan = true while shuajingyan == true do wait(0.04) local A_1 = "collectOrb" local A_2 = "Gem" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) local A_1 = "collectOrb" local A_2 = "Yellow Orb" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) local A_1 = "collectOrb" local A_2 = "Orange Orb" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) local A_1 = "collectOrb" local A_2 = "Blue Orb" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) local A_1 = "collectOrb" local A_2 = "Gem" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) end else shuajingyan = false end
end)
about:Toggle("开启卡宠", "KA", false, function(KA)
  if KA then kachong = true while kachong == true do wait(0.02) local A_1 = "collectOrb" local A_2 = "Yellow Orb" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) local A_1 = "collectOrb" local A_2 = "Yellow Orb" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) local A_1 = "collectOrb" local A_2 = "Yellow Orb" local A_3 = "City" local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent Event:FireServer(A_1, A_2, A_3) end else kachong = false end
end)

about:Button("反踢出", function()
  local vu = game:GetService("VirtualUser") game:GetService("Players").LocalPlayer.Idled:connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)
end)

local about = UITab4:section("传送功能",true)

about:Button("城市", function()
  game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-559.2, -7.45058e-08, 417.4))
end)
about:Button("雪城", function()
  game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-858.358, 0.5, 2170.35))
end)
about:Button("岩浆城", function()
  game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1707.25, 0.550008, 4331.05))
end)
about:Button("公路传奇", function()
  game.Players.LocalPlayer.Character:MoveTo(Vector3.new(3594.68, 214.804, 7274.56))
end)

local UITab4 = window:Tab("『忍者传奇』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("自动挥舞", "AT", false, function(AL)
    if v or not v then
        getgenv().autoswing = AL
            while true do
                if not getgenv().autoswing then return end
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:FindFirstChild("ninjitsuGain") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        break
                    end
                end
                local A_1 = "swingKatana"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1)
                wait()
            end
        end
end)
about:Toggle("自动售卖", "ATSELL", false, function(ATSELL)
  getgenv().autosell = ATSELL while true do if not getgenv().autosell then return end game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame wait(0.1) game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0) wait(0.1) end
end)
about:Toggle("自动购买排名", "ATBP", false, function(ATBP)
  getgenv().autobuyranks = ATBP while true do if not getgenv().autobuyranks then return end local deku1 = "buyRank" for i = 1, #ranks do game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(deku1, ranks[i]) end wait(0.1) end
end)
about:Toggle("自动购买腰带", "ATBYD", false, function(ATBYD)
  getgenv().autobuybelts = ATBYD while true do if not getgenv().autobuybelts then return end local A_1 = "buyAllBelts" local A_2 = "Inner Peace Island" local Event = game:GetService("Players").LocalPlayer.ninjaEvent Event:FireServer(A_1, A_2) wait(0.5) end
end)
about:Toggle("自动购买技能", "ATB", false, function(ATB)
  getgenv().autobuyskills = ATB while true do if not getgenv().autobuyskills then return end local A_1 = "buyAllSkills" local A_2 = "Inner Peace Island" local Event = game:GetService("Players").LocalPlayer.ninjaEvent Event:FireServer(A_1, A_2) wait(0.5) end
end)
about:Toggle("自动购买剑", "ATBS", false, function(ATBS)
  getgenv().autobuy = ATBS while true do if not getgenv().autobuy then return end local A_1 = "buyAllSwords" local A_2 = "Inner Peace Island" local Event = game:GetService("Players").LocalPlayer.ninjaEvent Event:FireServer(A_1, A_2) wait(0.5) end
end)
about:Button("解锁所有岛", function()
  for _, v in next, game.workspace.islandUnlockParts:GetChildren() do if v then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame wait(.5) end end
end)

local about = UITab4:section("传送功能",true)

about:Button("传送到出生点", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
end)
about:Button("传送到附魔岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)
end)
about:Button("传送到神秘岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
end)
about:Button("传送到太空岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
end)
about:Button("传送到冻土岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
end)
about:Button("传送到永恒岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
end)
about:Button("传送到沙暴岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
end)
about:Button("传送到雷暴岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
end)
about:Button("传送到远古炼狱岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
end)
about:Button("传送到午夜暗影岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
end)
about:Button("传送到神秘灵魂岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
end)
about:Button("传送到冬季奇迹岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
end)
about:Button("传送到黄金大师岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
end)
about:Button("传送到龙传奇岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
end)
about:Button("传送到赛博传奇岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
end)
about:Button("传送到天岚超能岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
end)
about:Button("传送到混沌传奇岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
end)
about:Button("传送到混沌传奇岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
end)
about:Button("传送到灵魂融合岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
end)
about:Button("传送到黑暗元素岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
end)
about:Button("传送到内心和平岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
end)
about:Button("传送到炽烈漩涡岛", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
end)
about:Button("传送到35倍金币区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
end)
about:Button("传送到死亡宠物", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
end)

local UITab4 = window:Tab("『监狱人生』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("变钢铁侠", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
end)
about:Button("无敌模式", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
end)
about:Button("杀死所有人", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
end)
about:Button("手里剑（秒杀）", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
end)
about:Button("变死神", function()
    loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()
end)
about:Button("变车模型", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
end)
about:Button("逮捕所有罪犯", function()
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

local about = UITab4:section("传送功能",true)

about:Button("传送警卫室", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
end)
about:Button("传送监狱室内", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
end)
about:Button("传送罪犯复活点", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
end)
about:Button("传送监狱室外", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
end)
about:Button("传送院子", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(788.5759887695312, 97.99992370605469, 2455.056640625)
end)
about:Button("传送警车库", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.7301635742188, 98.20000457763672, 2503.56982421875)
end)

local about = UITab4:section("选择职业",true)

about:Button("变成警察", function()
    workspace.Remote.TeamEvent:FireServer("Bright blue");
end)
about:Button("变成囚犯", function()
    workspace.Remote.TeamEvent:FireServer("Bright orange");
end)

local UITab4 = window:Tab("『战斗勇士』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("无限体力", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/DssJhd7Z"))()
end)
about:Button("自动打人", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/Bc9w49bu"))()
end)
about:Button("自动格挡", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/p80SKVYg"))()
end)

local UITab4 = window:Tab("『自然灾害』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("自动存活", "ToggleInfo", false, function(bool)
    _G.autowinfarm = bool;
    while wait(.1) do
        if _G.autowinfarm == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-236, 180, 360, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        end
end
end)

local nextdis
about:Toggle("预测灾害", "t", false, function(val)
		nextdis = val

		while wait(1) and nextdis do
			local SurvivalTag = plr.Character:FindFirstChild("SurvivalTag")
			if SurvivalTag then
				if SurvivalTag.Value == "Blizzard" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：暴风雪"
				elseif SurvivalTag.Value == "Sandstorm" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：沙尘暴"
				elseif SurvivalTag.Value == "Tornado" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：龙卷风"
				elseif SurvivalTag.Value == "Volcanic Eruption" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：火山"
				elseif SurvivalTag.Value == "Flash Flood" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：洪水"
				elseif SurvivalTag.Value == "Deadly Virus" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：病毒"
				elseif SurvivalTag.Value == "Tsunami" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：海啸"
				elseif SurvivalTag.Value == "Acid Rain" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：酸雨"
				elseif SurvivalTag.Value == "Fire" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：火焰"
				elseif SurvivalTag.Value == "Meteor Shower" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：流星雨"
				elseif SurvivalTag.Value == "Earthquake" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：地震"
				elseif SurvivalTag.Value == "Thunder Storm" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：暴风雨"
				else
					Message.Visible = false
				end
			end
		end
	end)

about:Toggle("禁用掉落伤害", "AJH", false, function(AJH)
  _G.NoFallDamage = AJH; while wait(0.5) do if _G.NoFallDamage == true then local FallDamageScript = (game.Players.LocalPlayer.Character ~= nil) and game.Players.LocalPlayer.Character:FindFirstChild("FallDamageScript") or nil if FallDamageScript then FallDamageScript:Destroy() end end end
end)

about:Button(
    "黑洞脚本（按E）",
    function()
        local UserInputService = game:GetService("UserInputService")
        local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local Folder = Instance.new("Folder", game:GetService("Workspace"))
        local Part = Instance.new("Part", Folder)
        local Attachment1 = Instance.new("Attachment", Part)
        Part.Anchored = true
        Part.CanCollide = false
        Part.Transparency = 1
        local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
        local NetworkAccess =
            coroutine.create(
            function()
                settings().Physics.AllowSleep = false
                while game:GetService("RunService").RenderStepped:Wait() do
                    for _, Players in next, game:GetService("Players"):GetPlayers() do
                        if Players ~= game:GetService("Players").LocalPlayer then
                            Players.MaximumSimulationRadius = 0
                            sethiddenproperty(Players, "SimulationRadius", 0)
                        end
                    end
                    game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
                    setsimulationradius(math.huge)
                end
            end
        )
        coroutine.resume(NetworkAccess)

        local function EnhanceAndInvinciblePart(part)
            if
                part:IsA("Part") and part.Anchored == false and part.Parent:FindFirstChild("Humanoid") == nil and
                    part.Parent:FindFirstChild("Head") == nil and
                    part.Name ~= "Handle"
             then
                Mouse.TargetFilter = part
                for _, x in next, part:GetChildren() do
                    if
                        x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or
                            x:IsA("BodyThrust") or
                            x:IsA("BodyVelocity") or
                            x:IsA("RocketPropulsion")
                     then
                        x:Destroy()
                    end
                end
                if part:FindFirstChild("Attachment") then
                    part:FindFirstChild("Attachment"):Destroy()
                end
                if part:FindFirstChild("AlignPosition") then
                    part:FindFirstChild("AlignPosition"):Destroy()
                end
                if part:FindFirstChild("Torque") then
                    part:FindFirstChild("Torque"):Destroy()
                end
                part.CanCollide = false
                local Torque = Instance.new("Torque", part)
                Torque.Torque = Vector3.new(100000, 100000, 100000)
                local AlignPosition = Instance.new("AlignPosition", part)
                local Attachment2 = Instance.new("Attachment", part)
                Torque.Attachment0 = Attachment2
                AlignPosition.MaxForce = 9999999999999999
                AlignPosition.MaxVelocity = math.huge
                AlignPosition.Responsiveness = 200
                AlignPosition.Attachment0 = Attachment2
                AlignPosition.Attachment1 = Attachment1
            end
        end

        for _, part in next, game:GetService("Workspace"):GetDescendants() do
            EnhanceAndInvinciblePart(part)
        end

        game:GetService("Workspace").DescendantAdded:Connect(
            function(part)
                EnhanceAndInvinciblePart(part)
            end
        )
        -- 监听按键事件
        UserInputService.InputBegan:Connect(
            function(input, isProcessed)
                if input.KeyCode == Enum.KeyCode.E and not isProcessed then
                    Updated = Mouse.Hit + Vector3.new(0, 5, 0)
                end
            end
        )

        -- 使用物理引擎移动所有物体
        spawn(
            function()
                while game:GetService("RunService").RenderStepped:Wait() do
                    Attachment1.WorldCFrame = Updated
                end
            end
        )
    end
)

about:Button("获取气球", function()
    plyr = game.Players.LocalPlayer char = plyr.Character torso = char.Torso mouse = plyr:GetMouse() Run = game:service'RunService' deb = game:service'Debris' ra = char["Right Arm"] la = char["Left Arm"] rs = char.Torso["Right Shoulder"] ls = char.Torso["Left Shoulder"] local platform = false local idle = true iliketrains = {} part1 = Instance.new("Part", char) part1.FormFactor = "Symmetric" part1.Size = Vector3.new(1, 3, 1) part1.TopSurface = 0 part1.BottomSurface = 0 part1:BreakJoints() special = Instance.new("SpecialMesh", part1) special.MeshId = "http://www.roblox.com/asset/?id=25498565" special.TextureId = "http://www.roblox.com/asset/?id=26725707" special.Scale = Vector3.new(2, 2, 2) w = Instance.new("Weld", char) w.Part0 = part1 w.Part1 = torso w.C0 = CFrame.new(-0.4, -1.4, -0.5) * CFrame.Angles(-0.5, 0, 0.2) part2 = Instance.new("Part", char) part2.FormFactor = "Symmetric" part2.Size = Vector3.new(1, 3, 1) part2.TopSurface = 0 part2.BottomSurface = 0 part2:BreakJoints() special2 = Instance.new("SpecialMesh", part2) special2.MeshId = "http://www.roblox.com/asset/?id=25498565" special2.TextureId = "http://www.roblox.com/asset/?id=26725707" special2.Scale = Vector3.new(2, 2, 2) w2 = Instance.new("Weld", char) w2.Part0 = part2 w2.Part1 = torso w2.C0 = CFrame.new(0.4, -1.4, -0.5) * CFrame.Angles(-0.5, 0, -0.2) tool = Instance.new("HopperBin", plyr.Backpack) tool.Name = " " tool.TextureId = "http://www.roblox.com/asset/?id=27471616" tool.Selected:connect(function(mouse) mouse.Button1Down:connect(function(mouse) if equipped then return end equipped = true coroutine.wrap(function() while equipped do rs.DesiredAngle = 0 rs.CurrentAngle = 0 ls.DesiredAngle = 0 ls.CurrentAngle = 0 Run.Stepped:wait() end end)() coroutine.wrap(function() idle = false coroutine.wrap(function() for i = 0, 3 do w.C0 = w.C0 * CFrame.new(0, 0.05, 0) w2.C0 = w2.C0 * CFrame.new(0, 0.05, 0) Run.Stepped:wait() end wait(0.147) for i = 0, 3 do w.C0 = w.C0 * CFrame.new(0, -0.05, 0) w2.C0 = w2.C0 * CFrame.new(0, -0.05, 0) Run.Stepped:wait() end end)() local p = Instance.new("Part", char) p.FormFactor = "Custom" p.Name = "Platform" p.Transparency = 1 p.Size = Vector3.new(4, 1, 4) p.Anchored = true for i = 2.5, 6, 0.05 do p.CFrame = CFrame.new(torso.CFrame.x, torso.CFrame.y-i, torso.CFrame.z) Run.Stepped:wait() end coroutine.wrap(function() p:Destroy() end)() end)() for i = 0, 4 do ls.C0 = ls.C0 * CFrame.Angles(-0.25, 0, 0) rs.C0 = rs.C0 * CFrame.Angles(-0.25, 0, 0) Run.Stepped:wait() end wait(0.02) for i = 0, 4 do ls.C0 = ls.C0 * CFrame.Angles(0.25, 0, 0) rs.C0 = rs.C0 * CFrame.Angles(0.25, 0, 0) Run.Stepped:wait() end idle = true equipped = false end) end) while idle do for i = 0, 3 do w.C0 = w.C0 * CFrame.Angles(0, 0.002 * i, 0) w2.C0 = w2.C0 * CFrame.Angles(0, -0.002 * i, 0) Run.Stepped:wait() end wait(0.112687) for i = 0, 3 do w.C0 = w.C0 * CFrame.Angles(0, -0.002 * i, 0) w2.C0 = w2.C0 * CFrame.Angles(0, 0.002 * i, 0) Run.Stepped:wait() end wait(0.312687) end
end)

about:Toggle("地图投票用户界面", "Map Voting UI", false, function(bool)
if bool == false then do game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = false
    end
end
if bool == true then do game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = true
    end
end
end)

about:Toggle("在水上行走", "ToggleInfo", false, function(bool)
 if bool == false then do game.Workspace.WaterLevel.CanCollide = false
                            game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
                        end
                    end
                    if bool == true then do game.Workspace.WaterLevel.CanCollide = true
                            game.Workspace.WaterLevel.Size = Vector3.new(5000, 1, 5000)
                        end
                    end
end)

about:Toggle("开启游戏岛悬崖碰撞体积", "Togglelnfo", false, function(bool)
for i, v in pairs (game.workspace:GetDescendants())do
                                if v.Name == 'LowerRocks' then
                                    v.CanCollide = bool
                                end
                            end
end)

local about = UITab4:section("传送功能",true)

about:Button("传送到地图",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-115.828506, 65.4863434, 18.8461514, 0.00697017973, 0.0789371505, -0.996855199, -3.13589936e-07, 0.996879458, 0.0789390653, 0.999975681, -0.000549906865, 0.00694845384)
end)

about:Button("传送到游戏岛",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-83.5, 38.5, -27.5, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

about:Button("传送到产卵塔",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-280, 170, 341, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local UITab4 = window:Tab("『火箭发射模拟器』",'18930406865')

local about = UITab4:section("功能",true)

about:Toggle("自动收集燃料", "ARL", false, function(ARL)
    isFuelScoopEnabled = ARL while true do wait() if isFuelScoopEnabled then for i, h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if h:IsA("Tool") and h.Name == "FuelScoop" then h:Activate() end end end end
end)
about:Button("登上火箭", function()
    game:GetService("ReplicatedStorage"):WaitForChild("BoardRocket"):FireServer()
end)
about:Button("将玩家从所有者座位移除", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RemovePlayer"):FireServer()
end)

local about = UITab4:section("传送",true)

about:Button("发射台岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-123.15931701660156, 2.7371432781219482, 3.491959810256958)
end)
about:Button("白云岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.13252258300781, 170.55825805664062, -60.4516716003418)
end)
about:Button("浮漂岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-66.51714324951172, 720.4866333007812, -5.391753196716309)
end)
about:Button("卫星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-34.2462043762207, 1429.4990234375, 1.3739361763000488)
end)
about:Button("蜜蜂迷宫岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6.5361199378967285, 3131.249267578125, -29.759048461914062)
end)
about:Button("月球人救援", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7.212917804718018, 5016.341796875, -19.815933227539062)
end)
about:Button("暗物质岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.43186950683594, 6851.94091796875, 7.890637397766113)
end)
about:Button("太空岩石岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(49.92888641357422, 8942.955078125, 8.674375534057617)
end)
about:Button("零号火星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(54.44503402709961, 11270.0927734375, -1.273137092590332)
end)
about:Button("太空水晶小行星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.579089164733887, 15295.6318359375, -27.54974365234375)
end)
about:Button("月球浆果岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-14.601255416870117, 18410.9609375, 0.9418511986732483)
end)
about:Button("铺路石岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3.272758960723877, 22539.494140625, 63.283935546875)
end)
about:Button("流星岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45.515689849853516, 27961.560546875, -7.358333110809326)
end)
about:Button("升级岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2.7595248222351074, 33959.98828125, 53.93095397949219)
end)

local UITab4 = window:Tab("『巴掌模拟器』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("无CD","Toggle" ,false, function(Value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    
    bazhangmnq = Value
    
    while bazhangmnq do
    local localscript = tool:FindFirstChildOfClass("LocalScript")
    local localscriptclone = localscript:Clone()
    localscriptclone = localscript:Clone()
    localscriptclone:Clone()
    localscript:Destroy()
    localscriptclone.Parent = tool
    wait(0.1)
    end
    end)
    
    about:Button("获取计数器手套", function()
    fireclickdetector(game.Workspace.CounterLever.ClickDetector)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(121)
    for i,v in pairs(workspace.Maze:GetDescendants()) do
    if v:IsA("ClickDetector") then
    fireclickdetector(v)
    end
    end
    end)
    
    about:Toggle("地牢亮度","Toggle" ,false, function(Value)
     Light = Value
        if not Light then
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end)
    
    about:Dropdown("传送","Dropdown",{"安全区","竞技场","埃及岛","果实岛","盘子","锦标赛","默认竞技场"},function(Value)
    if Value == "安全区" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0,40,0)
    elseif Value == "竞技场" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
    elseif Value == "埃及岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5)
    elseif Value == "果实岛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0,3.25,0)
    elseif Value == "盘子" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
    elseif Value == "锦标赛" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
    elseif Value == "默认竞技场" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,360,-3)
    end
    end)
    
    about:Toggle("复古技能","Toggle" ,false, function(Value)
    RetroSpam = Value
    while RetroSpam do
    game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
    task.wait()
    end
    end)
    
    about:Dropdown("复古技能选择","Dropdown",{"Rocket Launcher","Ban Hammer","Bomb"}, function(Value)
    RetroAbility = Value
    end)
    
    about:Toggle("自动捡糖果","Toggle",false, function(Value)
    CandyCornFarm = Value
    while CandyCornFarm do
    for i, v in pairs(workspace.CandyCorns:GetChildren()) do
                    if v:FindFirstChildWhichIsA("TouchTransmitter") then
    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
    task.wait()
    end
    end)
    
    about:Toggle("获取炼金术师材料","Toggle", false, function(Value)
    AlchemistIngredients = Value
    if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
    while AlchemistIngredients do
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
    task.wait()
    end
    end
    end)
    
    about:Toggle("自动加入竞技场","Toggle", false, function(Value)
    AutoEnterArena = Value
    while AutoEnterArena do
    if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
        end
    task.wait()
    end
    end)
    
    about:Toggle("自动光波球","Toggle", false, function(Value)
    if Person == nil then
    Person = game.Players.LocalPlayer.Name
    end
    _G.RojoSpam = Value
    while _G.RojoSpam do
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
    task.wait()
    end
    end)
    
    about:Button("Rojo技能", function(Value)
    _G.RojoSpam = Value
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
    wait(6)
    game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
    task.wait()
    end)
    
    about:Toggle("音符技能","Toggle", false, function(Value)
    _G.RhythmSpam = Value
    while _G.RhythmSpam do
    game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
    task.wait()
    end
    end)
    
    about:Toggle("Null技能","Toggle", false, function(Value)
    NullSpam = Value
    while NullSpam do
    game:GetService("ReplicatedStorage").NullAbility:FireServer()
    task.wait()
    end
    end)
    
    about:Toggle("自动拾取黄金果实","Toggle", false, function(Value)
    SlappleFarm = Value
    while SlappleFarm do
    for i, v in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Glove" and v:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
    task.wait()
    end
    end)
    
    about:Toggle("自动捡飞行宝珠","Toggle", false, function(Value)
    Jetfarm = Value
    while Jetfarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "JetOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("自动捡相位球","Toggle", false, function(Value)
    Phasefarm = Value
    while Phasefarm do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "PhaseOrb" and v:FindFirstChild("TouchInterest") then
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("自动刷bob","Toggle", false, function(Value)
    ReplicaFarm = Value
    while ReplicaFarm do
    for i, v in pairs(workspace:GetChildren()) do
                    if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
    game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                    end
                end
    task.wait()
    game:GetService("ReplicatedStorage").Duplicate:FireServer()
    task.wait(7)
    end
    end)
    
    about:Toggle("无限反转","Toggle", false, function(Value)
    _G.InfReverse = Value
    while _G.InfReverse do
    game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
    wait(6)
    end
    end)
    
    about:Toggle("彩虹角色(装备黄金手套)","Toggle", false, function(Value)
    _G.Rainbow = Value
    while _G.Rainbow do
    for i = 0,1,0.001*25 do
    game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(i,1,1)))
    task.wait()
    end
    end
    end)
    
    about:Toggle("防击飞","Toggle", false, function(Value)
    AntiRagdoll = Value
    if AntiRagdoll then
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
    if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
    repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
    until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
    game.Players.LocalPlayer.Character.Torso.Anchored = false
    end
    end)
    end)
    end
    end)
    
    about:Toggle("反虚空(锦标赛也有效果)","Toggle", false, function(Value)
    game.Workspace.dedBarrier.CanCollide = Value
    game.Workspace.TAntiVoid.CanCollide = Value
    end)

about:Toggle("防死亡屏障","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = false
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = false
    workspace.DEATHBARRIER2.CanTouch = false
    workspace.dedBarrier.CanTouch = false
    workspace.ArenaBarrier.CanTouch = false
    workspace.AntiDefaultArena.CanTouch = false
    else
    for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                        if v.ClassName == "Part" and v.Name == "BLOCK" then
                            v.CanTouch = true
                        end
                    end
    workspace.DEATHBARRIER.CanTouch = true
    workspace.DEATHBARRIER2.CanTouch = true
    workspace.dedBarrier.CanTouch = true
    workspace.ArenaBarrier.CanTouch = true
    workspace.AntiDefaultArena.CanTouch = true
    end
    end)
    
    about:Toggle("反巴西","Toggle", false, function(Value)
    if Value == true then
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = false
                    end
    else
    for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                            v.CanTouch = true
                    end
    end
    end)
    
    about:Toggle("反死亡方块","Toggle", false, function(Value)
    if Value == true then
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
            else
                    workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
            end
    end)
    
    about:Toggle("反上帝技能","Toggle", false, function(Value)
    AntiTimestop = Value
    while AntiTimestop do
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v.ClassName == "Part" then
                            v.Anchored = false
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("反鱿鱼","Toggle", false, function(Value)
    AntiSquid = Value
    if AntiSquid == false then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
            end
    while AntiSquid do
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
            game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
    end
    task.wait()
    end
    end)
    
    about:Toggle("反神圣杰克","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
    end)
    
    about:Toggle("反传送带","Toggle", false, function(Value)
    game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
    end)
    
    about:Toggle("反板砖","Toggle", false, function(Value)
    AntiBrick = Value
    while AntiBrick do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Union" then
                            v.CanTouch = false
                        end
                    end
    task.wait()
    end
    end)
    
    about:Toggle("反Null","Toggle", false, function(Value)
    AntiNull = Value
    while AntiNull do
    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "Imp" and v:FindFirstChild("Body") then
    shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
    end
    end
    task.wait()
    end
    end)
    
about:Button("自动刷巴掌",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm'))()
end)
local UITab4 = window:Tab("『河北唐县』",'18930406865')

local about = UITab4:section("自动刷钱功能",true)

about:Label("需要先选择送货司机(delivery driver)职业，才能自动刷钱")
local virtualUser = game:GetService('VirtualUser')
virtualUser:CaptureController()

function teleportTo(CFrame) 
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
end

_G.autoFarm = false

function autoFarm()
	while _G.autoFarm do
		fireclickdetector(game:GetService("Workspace").DeliverySys.Misc["Package Pile"].ClickDetector)
		task.wait(2.2)
		for _,point in pairs(game:GetService("Workspace").DeliverySys.DeliveryPoints:GetChildren()) do
			if point.Locate.Locate.Enabled then
				teleportTo(point.CFrame)
			end
		end
		task.wait(0)
	end
end
about:Toggle("自动刷钱①","text",false,function(value)
_G.autoFarm = value
	if value then
		autoFarm()
	end
end)

about:Button("自动刷钱②", function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/Update-V3.10-T-ang-County-Hebei-Auo-Farm-15577"))()
end)

local about = UITab4:section("传送功能",true)

about:Button("传送到警察局", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5513.97412109375, 8.656171798706055, 4964.291015625)
end)
about:Button("传送到出生点", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3338.31982421875, 10.048742294311523, 3741.84033203125)
end)
about:Button("传送到医院", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5471.482421875, 14.149418830871582, 4259.75341796875)
end)
about:Button("传送到手机店", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6789.2041015625, 11.197686195373535, 1762.687255859375)
end)
about:Button("传送到火锅店", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5912.84765625, 12.217276573181152, 1058.29443359375)
end)

local UITab4 = window:Tab("『战争大亨』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("范围", function()
    _G.HeadSize = 150 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)
about:Toggle("无限跳", "IJ", false, function(IJ)
    getgenv().InfJ = IJ game:GetService("UserInputService").JumpRequest:connect(function() if InfJ == true then game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping") end end)
end)
about:Button(
    "删除所有门",
    function()
        for k,v in pairs(Workspace.Tycoon.Tycoons:GetChildren()) do
            for x,y in pairs(v.PurchasedObjects:GetChildren()) do
                if(y.Name:find("Door") or y.Name:find("Gate")) then y:destroy(); end;
            end;
        end;
    end
)
about:Button(
    "防暴盾牌",
    function()
ReplicatedStorage.BulletFireSystem.GunReload:destroy();
        local gunReload = Instance.new("Part");
        gunReload.Name = "GunReload";
        gunReload.Parent = ReplicatedStorage.BulletFireSystem;
        while true do
            wait(0);
            for _,v in pairs(Player.Character:GetChildren()) do
                if(v.ClassName == "Tool") then v.ACS_Modulo.Variaveis.Ammo.Value = 9999; end;
            end;
        end;
    end
)
about:Button(
    "删除你的视觉盔甲和头盔",
    function()
        for k,v in pairs(Player.Character:GetChildren()) do
            if(v.ClassName == "Accessory") then v:destroy() end;
            if(v.Name:find("Armor")) then v.Mesh:destroy() end;
            if(v.Name:find("Helmet")) then v:destroy() end;
        end;
    end
)
about:Button(
    "查看游戏中的所有玩家（包括血量条）",
    function()
loadstring(game:HttpGet(('https://pastebin.com/raw/G2zb992X'),true))()
    end
)

about:Button("一枪秒人", function()
  loadstring(game:HttpGet('https://pastebin.com/raw/6b4XEjQF'))()  
end)

about:Button("全图杀人(需要火箭筒才能用)", function()
    local argsTemplate = {
    [1] = Vector3.new(), -- 动态设置位置
    [2] = Vector3.new(0, 1, 0), -- 向上的方向向量
    [3] = game:GetService("Players").LocalPlayer.Character.RPG,
    [4] = game:GetService("Players").LocalPlayer.Character.RPG,
    -- [5] 会为每个玩家/护盾设置
    [7] = "zxcvbnm4189Rocket2"
}

local localPlayer = game:GetService("Players").LocalPlayer
local localPlayerTeam = localPlayer.Team

while true do
    local players = game:GetService("Players"):GetPlayers() -- 每次循环时重新获取玩家列表
    local localPlayerPosition = localPlayer.Character.HumanoidRootPart.Position
    local upwardVector = Vector3.new(0, 1, 0)
    local targetPosition = localPlayerPosition + upwardVector * 1000

    for _, player in ipairs(players) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Torso") then
            local args = table.clone(argsTemplate) -- 克隆模板
            args[1] = targetPosition -- 设置为本地玩家上方500单位的位置
            args[5] = player.Character.Torso -- 设置为玩家的躯干

            game:GetService("ReplicatedStorage"):WaitForChild("RocketSystem"):WaitForChild("RocketHit"):FireServer(unpack(args))
        end

        if player ~= localPlayer and player.Team ~= localPlayerTeam then
            local playerTeamName = player.Team and player.Team.Name
            if playerTeamName then
                local shield = workspace:WaitForChild("Tycoon"):WaitForChild("Tycoons"):FindFirstChild(playerTeamName)
                if shield then
                    shield = shield:FindFirstChild("PurchasedObjects")
                    if shield then
                        shield = shield:FindFirstChild("Base Shield")
                        if shield then
                            shield = shield:FindFirstChild("Shield")
                            if shield then
                                shield = shield:FindFirstChild("Shield4")
                                if shield then
                                    local args = table.clone(argsTemplate) -- 克隆模板
                                    args[1] = targetPosition -- 设置为本地玩家上方500单位的位置
                                    args[5] = shield -- 设置为护盾

                                    game:GetService("ReplicatedStorage"):WaitForChild("RocketSystem"):WaitForChild("RocketHit"):FireServer(unpack(args))
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    wait(0) -- 微小延迟以分配负载
end
end)

about:Button("无限子弹", function()
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    
    local function modifyGun(gun)
        if gun then
            gun.Ammo = 999999999999999
            gun.Mode = "Auto"
            gun.FireModes.Auto = true
            gun.FireRate = 9999999999999999
            gun.DamageMultiplier = 1000000000
            gun.Distance = 1000000000
            
            gun.VRecoil = {0, 0}
            gun.HRecoil = {0, 0}
            gun.RecoilPunch = 0
            gun.VPunchBase = 0
            gun.HPunchBase = 0
            gun.DPunchBase = 0
            gun.MinRecoilPower = 0
            gun.MaxRecoilPower = 0
            
            gun.BSpeed = 100000000
            
            gun.BDrop = 0
            
            gun.MinSpread = 0
            gun.MaxSpread = 0
        end
    end
    
    for _, tool in ipairs(backpack:GetChildren()) do
        local settingsModule = tool:FindFirstChild("ACS_Modulo") and tool["ACS_Modulo"]:FindFirstChild("Variaveis") and tool["ACS_Modulo"]["Variaveis"]:FindFirstChild("Settings")
        if settingsModule then
            local success, gun = pcall(require, settingsModule)
            if success then
                modifyGun(gun)
            else
                warn("Failed to modify gun: " .. tostring(gun))
            end
        end
    end
end)
about:Button("爆炸狙", function()
    local player = game.Players.LocalPlayer
local backpack = player.Backpack

for _, tool in ipairs(backpack:GetChildren()) do
    local settingsModule = tool:FindFirstChild("ACS_Modulo") and tool["ACS_Modulo"]:FindFirstChild("Variaveis") and tool["ACS_Modulo"]["Variaveis"]:FindFirstChild("Settings")
    if settingsModule then
        local gun = require(settingsModule)
        
        if gun["Bullets"] then
            gun["Bullets"] = 1
        end
        
        if gun["Ammo"] then
            gun["Ammo"] = 5000000
        end
        
        if gun["Mode"] then
            gun["Mode"] = "Auto"
        end
        
        if gun["FireModes"] and gun["FireModes"]["Auto"] ~= nil then
            gun["FireModes"]["Auto"] = true
        end
        
        if gun["FireRate"] then
            gun["FireRate"] = 1000000000
        end
        
        if gun["DamageMultiplier"] then
            gun["DamageMultiplier"] = 1000000000
        end
        
        if gun["Distance"] then
            gun["Distance"] = 1000000000
        end
        
        if gun["VRecoil"] then
            gun["VRecoil"] = {0, 0}
        end
        
        if gun["HRecoil"] then
            gun["HRecoil"] = {0, 0}
        end
        
        if gun["RecoilPunch"] then
            gun["RecoilPunch"] = 0
        end
        
        if gun["VPunchBase"] then
            gun["VPunchBase"] = 0
        end
        
        if gun["HPunchBase"] then
            gun["HPunchBase"] = 0
        end
        
        if gun["DPunchBase"] then
            gun["DPunchBase"] = 0
        end
        
        if gun["MinRecoilPower"] then
            gun["MinRecoilPower"] = 0
        end
        
        if gun["MaxRecoilPower"] then
            gun["MaxRecoilPower"] = 0
        end

        if gun["BSpeed"] then
            gun["BSpeed"] = 100000000
        end
        
        if gun["BDrop"] then
            gun["BDrop"] = 0
        end

        if gun["MinSpread"] then
            gun["MinSpread"] = 0
        end
        
        if gun["MaxSpread"] then
            gun["MaxSpread"] = 0
        end
    end
end
end)
about:Button(
    "车辆货箱",
    function()
for _,v in pairs(Workspace.Beams:GetChildren()) do
            if(v.Name:find("Airdrop_")) then Player.Character.HumanoidRootPart.CFrame = v.CFrame; end;
        end;
    end
)

about:Button(
    "隔空投送",
    function()
for _, v in pairs(Workspace.Beams:GetChildren()) do
            if(v.Name:find("Warehouse")) then
                Player.Character.HumanoidRootPart.CFrame = Workspace.Beams[v.Name].CFrame;
                break
            end;
        end;
    end
)

about:Button(
    "油桶",
    function()
for _, v in pairs(Workspace.Beams:GetChildren()) do
            if(v.Name:find("Warehouse")) then
                Player.Character.HumanoidRootPart.CFrame = Workspace.Beams[v.Name].CFrame;
                break
            end;
        end;
    end
)


local about = UITab4:section("传送功能",true)

about:Button("传送到空投", function()
    local Folder = workspace["Game Systems"] local player = game.Players.LocalPlayer.Character.HumanoidRootPart for _, Child in ipairs(Folder:GetDescendants()) do if Child.Name:match("Airdrop_") then player.CFrame = Child.MainPart.CFrame end end
end)

about:Button("传送自己的基地", function()
    game:GetService("Players").LocalPlayer.Character:MoveTo(workspace.Tycoon.Tycoons[game:GetService("Players").LocalPlayer.leaderstats.Team.Value].Essentials.Spawn.Position)
end)

about:Button(
    "酒店基地",
    function()
local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(2853, 48, -1282)
local Humanoid = game.Players.LocalPlayer.Character.Humanoid
Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.2)
pl.CFrame = location
    end
)

about:Button("传送旗帜", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(73.22032928466797, 47.9999885559082, 191.06993103027344)
end)
about:Button("传送油桶1", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9.748652458190918, 48.662540435791016, 700.2245483398438)
end)
about:Button("传送油桶2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(76.48243713378906, 105.25657653808594, -2062.3896484375)
end)
about:Button("传送油桶3", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28.840208053588867, 49.34040069580078, -416.9921569824219)
end)
about:Button("传送油桶4", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(69.48390197753906, 105.25657653808594, 3434.9033203125)
end)

local about = UITab4:section("基地传送",true)

about:Button("Alpha", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/VLnX6Etv'),true))()
    end)
about:Button("Bravo", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/EAHNuVVe'),true))()
end)
 
    about:Button("Charlie",function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/KqKHx9nA'),true))()
    end)
 
    about:Button("Delta", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/U6jGwTNk'),true))()
    end)
 
    about:Button("Echo", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/WsGaXzcC'),true))()
    end)
 
    about:Button("Foxtrot", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/eKKY3utm'),true))()
    end)
 
    about:Button("Golf", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/H4jmV6nm'),true))()
    end)
 
    about:Button("Hotel", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/sdCc3K6N'),true))()
    end)
 
    about:Button("Kilo", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/6JJCWSH5'),true))()
    end)
 
    about:Button("Lima", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/uZVAeiix'),true))()
    end)
 
    about:Button("Omega", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/j47JwdUX'),true))()
    end)
 
    about:Button("Romeo", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/Wf2ehBSp'),true))()
    end)
 
    about:Button("Sierra", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/Mnd2qp98'),true))()
    end)
 
    about:Button("Tango", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/qjAXwLzt'),true))()
    end)
 
    about:Button("Victor", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/D1ADj7qa'),true))()
    end)
 
    about:Button("Zulu", function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/BeJeZcGc'),true))()
    end)
    
local UITab4 = window:Tab("『灭霸模拟器』",'18930406865')    

local about = UITab4:section("主要功能",true)

about:Button("出生/复活的地方",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,153,-20)
end)

about:Button("刷碎片/铸造的地方",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20,115,-695)
end)

about:Button("商店/升级的地方",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28,1061,1590)
end)

about:Button("时间宝石的位置",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(444.5,117,443.5)
end)

about:Button("空间宝石的位置",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-412,73,-444)
end)

about:Button("现实宝石位置",function()
       loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
end)

about:Button("能量宝石怪位置",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(433,55,-326)
end)

about:Button("快速自杀",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99999,-4985,99999)
end)

local UITab4 = window:Tab("『鲨口求生』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Dropdown("选择船只", "FreeBoat", {"未知", "未知", "摩托艇", "摩托艇", "独角兽挺", "摩托艇", "红马林鱼", "单栀帆船", "拖船", "小船摩托艇", "摩托艇甜甜圈", "马林鱼", "管船", "渔船", "维京船", "小木帆船", "红顶摩托艇", "双体船", "战舰", "旅游船", "鸭子船", "派对船", "军事潜艇", "姜饼蒸汽船", "雪橇2022", "雪地摩托艇", "游轮"}, function(SC)
  game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(SC)
end)
about:Button("自动杀鲨鱼", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
end)

local UITab4 = window:Tab("『门DOORS』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("十字架", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
end)
about:Button("夜视仪", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/4Vsv1Xwn"))()
end)
about:Button("神圣炸弹", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/u5B1UjGv"))()
end)
about:Button("吸铁石", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/xHxGDp51"))()
end)
about:Button("剪刀", function()
  loadstring(game:HttpGet("https://pastebin.com/raw/v2yEJYmu"))()
end)
about:Button("rooms自动行走", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/DaRealGeo/roblox/master/rooms-autowalk"))()
end)

local UITab4 = window:Tab("『超级大力士模拟器』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("自动锻炼", "AS", false, function(HG)
    _G.On2 = HG
    local character = game.Players.LocalPlayer.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(-79.9094696, 19.8263607, 8124.82129, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        humanoidRootPart.Anchored = false
    end
    
    wait(0.1)
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.On2 then
            workspace.Gravity = math.huge
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(-79.9094696, 19.8263607, 8124.82129, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                if _G.Prox then
                    fireproximityprompt(_G.Prox, 0)
                end
            end
        else
            workspace.Gravity = 196.2
        end
    end)
end)
about:Toggle("自动强度", "AQQD", false, function(AQQD)
  _G.auto = AQQD if _G.auto then pcall(function() game:GetService("CoreGui").PurchasePromptApp.Enabled = false end) task_defer(autoworkout) else pcall(function() game:GetService("CoreGui").PurchasePromptApp.Enabled = true end) end
end)
about:Toggle("删除购买提示", "DBY", false, function(DBY)
  _G.Value = DBY if _G.value then game:GetService("CoreGui").PurchasePromptApp.Enabled = false else _G.Value = value game:GetService("CoreGui").PurchasePromptApp.Enabled = true end
end)

about:Button("获取所有勋章", function()
  GetBadges()
end)

local about = UITab4:section("传送功能",true)

about:Button("传送到开始区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.86943817138672, 11.751949310302734, -198.07127380371094)
end)
about:Button("传送到健身区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93.60747528076172, 11.751947402954102, -10.266206741333008)
end)
about:Button("传送到食物区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.86384582519531, 11.751947402954102, 228.9690399169922)
end)
about:Button("传送到街机区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.99887084960938, 11.751949310302734, 502.90997314453125)
end)
about:Button("传送到农场区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.6707763671875, 11.751947402954102, 788.5997314453125)
end)
about:Button("传送到城堡区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.87281036376953, 11.84177017211914, 1139.7509765625)
end)
about:Button("传送到蒸汽朋克区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92.63227081298828, 11.841767311096191, 1692.7890625)
end)
about:Button("传送到迪斯科区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.69613647460938, 16.015085220336914, 2505.213134765625)
end)
about:Button("传送到太空区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.42948150634766, 11.841769218444824, 3425.941650390625)
end)
about:Button("传送到糖果区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.55805969238281, 11.841663360595703, 4340.69921875)
end)
about:Button("送到实验室区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.00920867919922, 11.841663360595703, 5226.60205078125)
end)
about:Button("传送到热带区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80.26090240478516, 12.0902681350708, 6016.16552734375)
end)
about:Button("传送到恐龙区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38.4753303527832, 25.801530838012695, 6937.779296875)
end)
about:Button("传送到复古区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.81867218017578, 12.89099407196045, 7901.74755859375)
end)
about:Button("传送到冬季区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.47243881225586, 11.841662406921387, 8983.810546875)
end)
about:Button("传送到深海区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105.36250305175781, 26.44820213317871, 9970.0849609375)
end)
about:Button("传送到狂野西部区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.69414520263672, 15.108586311340332, 10938.654296875)
end)
about:Button("传送到豪华公寓区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.75145721435547, 11.313281059265137, 12130.349609375)
end)
about:Button("传送到宝剑战斗区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111.25597381591797, 11.408829689025879, 12945.57421875)
end)
about:Button("传送到童话区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.14932250976562, 11.313281059265137, 14034.50390625)
end)
about:Button("传送到桃花区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108.2142333984375, 11.813281059265137, 15131.861328125)
end)
about:Button("传送到厨房区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.78338623046875, 21.76291847229004, 16204.9755859375)
end)
about:Button("传送到下水道区域", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(47.36086654663086, 12.25178050994873, 17656.04296875)
end)

local UITab4 = window:Tab("『51区』",'18930406865')

local about = UITab4:section("获取枪械",true)

about:Button("步枪", function()
local x = 122
local y = 323.5
local z = 699
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
end)

about:Button("冲锋枪", function()
local x = 231.32
local y = 373.5
local z = 39.78
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
end)

about:Button("闪电枪", function()
local x = 112.07
local y = 335.5
local z = 556
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
end)

about:Button("喷子", function()
local x = 143
local y = 333
local z = 500
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
end)

local about = UITab4:section("传送功能",true)

about:Button("传送出生点", function()
local x = 324.54
local y = 511.5
local z = 419.38
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
end)

about:Button("无敌点", function()
Local = game:GetService('Players').LocalPlayer
Char  = Local.Character
touched,tpdback = false, false
Local.CharacterAdded:connect(function(char)
    if script.Disabled ~= true then
        wait(.25)
        loc = Char.HumanoidRootPart.Position
        Char:MoveTo(box.Position + Vector3.new(0,.5,0))
    end
end)
game:GetService('UserInputService').InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.Equals then
        if script.Disabled ~= true then
            script.Disabled = true
            print'you may re-execute'
        end
    end
end)
box = Instance.new('Part',workspace)
box.Anchored = true
box.CanCollide = true
box.Size = Vector3.new(10,1,10)
box.Position = Vector3.new(0,10000,0)
box.Touched:connect(function(part)
    if (part.Parent.Name == Local.Name) then
        if touched == false then
            touched = true
            function apply()
                if script.Disabled ~= true then
                    no = Char.HumanoidRootPart:Clone()
                    wait(.25)
                    Char.HumanoidRootPart:Destroy()
                    no.Parent = Char
                    Char:MoveTo(loc)
                    touched = false
                end end
            if Char then
                apply()
            end
        end
    end
end)
repeat wait() until Char
loc = Char.HumanoidRootPart.Position
Char:MoveTo(box.Position + Vector3.new(0,.5,0))
end)

about:Button("传送弹药库", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.0356903076172, 314.1027526855469, 437.3685607910156)
end)

about:Button("传送武器改造", function()
local x = 281
local y = 325.5
local z = 784
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
end)

about:Button("指令区域", function()
local x = 138.42
local y = 333.5
local z = 535.41
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(x,y,z))
game.StarterGui:SetCore("SendNotification", {
    Title = "您的代码是: 81975";
    Text = "感谢您使用皮脚本"; -- what the text says (ofc)
    Duration = 20;
})
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "传送成功";
    Text = "感谢您使用皮脚本"; -- what the text says (ofc)
    Duration = 20;
})
end)

local UITab4 = window:Tab("『兵工厂』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("快速射击",function()
local replicationstorage = game.ReplicatedStorage

for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do

   if v.Name == "Auto" then

       v.Value = true

   end

   if v.Name == "RecoilControl" then

       v.Value = 0

   end

   if v.Name == "MaxSpread" then

       v.Value = 0

   end

   if v.Name == "ReloadTime" then

      v.Value = 0

   end

   if v.Name == "FireRate" then

       v.Value = 0.05

   end

   if v.Name == "Crit" then

       v.Value = 20

   end

end
end)
about:Button("透视",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)
about:Button("无限子弹",function()
print("114514");while wait() do

        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999

        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999

    end
end)

about:Button("范围", function()
    _G.HeadSize = 30 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
end)

local UITab4 = window:Tab("『感染性微笑』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("防止微笑感染",function()
for _,v in pairs(game.workspace:GetDescendants()) do

if string.find(v.Name,"Infector") then
v:Destroy()
end
end
end)
about:Button("删除门",function()
for _,v in pairs(game.workspace:GetDescendants()) do

if string.find(v.Name,"AntiSmiler") then
v:Destroy()
end
end
end)
about:Button("反外挂",function()
workspace.Map.AntiHack:Destroy() game.Players.LocalPlayer.Character.AntiFly:Destroy()
end)
about:Toggle("速度-微笑感染","text",false,function(s)
getgenv().SlowDownSpeed = getgenv().SlowDownSpeed or 16
        getgenv().NoSlowDown = Value
        if getgenv().NoSlowDown then
            SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SlowDownSpeed
                end)
            end)
        else
            if SteppedConnection then
                SteppedConnection:Disconnect()
                SteppedConnection = nil
            end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
end)
about:Toggle("打击微笑感染","text",false,function(s)
getgenv().InfectAura = Value
        if getgenv().InfectAura then
            getgenv().InfectAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character.Infected.InfectEvent:FireServer()
                end)
            end)
        else
            if getgenv().InfectAuraConnection then
                getgenv().InfectAuraConnection:Disconnect()
                getgenv().InfectAuraConnection = nil
            end
        end
end)
about:Toggle("Bat自动打击","text",false,function(s)
getgenv().HitAura = s
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bat = character:FindFirstChildOfClass("Tool")
                        if bat and bat.Name == "Bat" and bat:FindFirstChild("SwingEvent") then
                            bat.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)
about:Toggle("瓶子自动打击","text",false,function(s)
getgenv().HitAura = s
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bottle = character:FindFirstChildOfClass("Tool")
                        if bottle and bottle.Name == "Bottle" and bottle:FindFirstChild("SwingEvent") then
                            bottle.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)    

local UITab4 = window:Tab("『铲雪模拟器』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle(
    "自动收集雪",
    "text",
    false,
    function(s)
    toggle = Value
while toggle do wait()
local args = {
    [1] = workspace:WaitForChild("HitParts"):WaitForChild("Snow1"),
    [2] = "Snow1",
    [3] = "MagicWand"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(unpack(args))
    end
    end
)
about:Toggle(
    "自动出售雪",
    "text",
    false,
    function(s)
    toggle = Value
while toggle do wait()
local args = {
    [1] = "SellSnow",
    [2] = "Frosty"
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
    end
)

about:Button(
    "传送出售雪的地方",
    function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.4659423828125, 15.846257209777832, -66.55204010009766)
    end
)

local about = UITab4:section("传送功能",true)

about:Button(
    "传送买车的地方",
    function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.10160064697266, 16.051794052124023, -141.703125)
    end
)
about:Button(
    "传送买工具的地方",
    function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.7429962158203, 16.39700698852539, -12.935890197753906)
    end
)
about:Button(
    "传送买背包的地方",
    function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(348.6633605957031, 17.03822898864746, -16.793842315673828)
    end
)
about:Button(
    "传送买假日礼物的地方",
    function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(154.57424926757812, 16.215335845947266, 147.10423278808594)
    end
)
about:Button(
    "传送买宠物的地方",
    function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.49563598632812, 17.887277603149414, 278.3686218261719)
    end
)
about:Button(
    "传送超大铲雪的地方",
    function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-391.4309997558594, 15.84949016571045, 150.15187072753906)
    end
)

local UITab4 = window:Tab("进攻的僵尸",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button(
    "自动传送僵尸",
    function()
      local groundDistance = 8
local Player = game:GetService("Players").LocalPlayer
local function getNearest()
local nearest, dist = nil, 99999
for _,v in pairs(game.Workspace.BossFolder:GetChildren()) do
if(v:FindFirstChild("Head")~=nil)then
local m =(Player.Character.Head.Position-v.Head.Position).magnitude
if(m<dist)then
dist = m
nearest = v
end
end
end
for _,v in pairs(game.Workspace.enemies:GetChildren()) do
if(v:FindFirstChild("Head")~=nil)then
local m =(Player.Character.Head.Position-v.Head.Position).magnitude
if(m<dist)then
dist = m
nearest = v
end
end
end
return nearest
end
_G.farm2 = true
Player.Chatted:Connect(function(m)
if(m==";autofarm false")then
_G.farm2 = false
elseif(m==";autofarm true")then
_G.farm2 = true
end
end)
_G.globalTarget = nil
game:GetService("RunService").RenderStepped:Connect(function()
if(_G.farm2==true)then
local target = getNearest()
if(target~=nil)then
game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, target.Head.Position)
Player.Character.HumanoidRootPart.CFrame = (target.HumanoidRootPart.CFrame * CFrame.new(0, groundDistance, 9))
_G.globalTarget = target
end
end
end)
spawn(function()
while wait() do
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
game.Players.LocalPlayer.Character.Torso.Velocity = Vector3.new(0,0,0)
end
end)
while wait() do
if(_G.farm2==true and _G.globalTarget~=nil and _G.globalTarget:FindFirstChild("Head") and Player.Character:FindFirstChildOfClass("Tool"))then
local target = _G.globalTarget
game.ReplicatedStorage.Gun:FireServer({["Normal"] = Vector3.new(0, 0, 0), ["Direction"] = target.Head.Position, ["Name"] = Player.Character:FindFirstChildOfClass("Tool").Name, ["Hit"] = target.Head, ["Origin"] = target.Head.Position, ["Pos"] = target.Head.Position,})
wait()
end
end
    end
)

local UITab4 = window:Tab("『造船寻宝』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle(
    "自动刷金条",
    "text",
    false,
    function(FARM)
        _G.FARMs = FARM
        while _G.FARMs do
            wait()
            pcall(
                function()
                    game.Workspace.Gravity = 0
                    wait(0.5)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -51.05019,
                                43.5682182,
                                702.193481,
                                -0.999886811,
                                -0.000135422233,
                                0.0150433034,
                                8.65181704e-09,
                                0.999959469,
                                0.00900237076,
                                -0.0150439134,
                                0.00900135189,
                                -0.999846339
                            )
                        }
                    ):Play()
                    wait(1)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -50.4467354,
                                34.108551,
                                8676.95117,
                                -0.999937415,
                                -0.000405743311,
                                0.0111814411,
                                -6.1212857e-09,
                                0.999342263,
                                0.0362627953,
                                -0.0111888004,
                                0.0362605266,
                                -0.999279737
                            )
                        }
                    ):Play()
                    wait(30)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -54.1517258,
                                -359.077667,
                                9497.03418,
                                -0.99982208,
                                0.00359633542,
                                -0.0185163822,
                                -7.16419102e-09,
                                0.981655717,
                                0.190661997,
                                0.0188623965,
                                0.190628082,
                                -0.981481075
                            )
                        }
                    ):Play()
                    wait(5)
                    game.Workspace.Gravity = 200
                    wait(20)
                end
            )
        end
    end
)
about:Toggle(
    "自动刷金条快速版",
    "text",
    false,
    function(FARM2)
        _G.FARM2s = FARM2
        while _G.FARM2s do
            wait()
            pcall(
                function()
                    game.Workspace.Gravity = 0
                    wait(0.5)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -51.05019,
                                43.5682182,
                                702.193481,
                                -0.999886811,
                                -0.000135422233,
                                0.0150433034,
                                8.65181704e-09,
                                0.999959469,
                                0.00900237076,
                                -0.0150439134,
                                0.00900135189,
                                -0.999846339
                            )
                        }
                    ):Play()
                    wait(1)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -50.4467354,
                                34.108551,
                                8676.95117,
                                -0.999937415,
                                -0.000405743311,
                                0.0111814411,
                                -6.1212857e-09,
                                0.999342263,
                                0.0362627953,
                                -0.0111888004,
                                0.0362605266,
                                -0.999279737
                            )
                        }
                    ):Play()
                    wait(5)
                    local TweenService = game:GetService("TweenService")
                    local Tw =
                        TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {
                            CFrame = CFrame.new(
                                -51.05019,
                                43.5682182,
                                702.193481,
                                -0.999886811,
                                -0.000135422233,
                                0.0150433034,
                                8.65181704e-09,
                                0.999959469,
                                0.00900237076,
                                -0.0150439134,
                                0.00900135189,
                                -0.999846339
                            )
                        }
                    ):Play()
                    wait(5)
                    local Event = game:GetService("Workspace").ClaimRiverResultsGold
                    Event:FireServer()
                    wait(0.1)
                    game.Players.LocalPlayer.Character.Humanoid.Health = -1000
                    wait(0.1)
                    game.Workspace.Gravity = 200
                    wait(7)
                end
            )
        end
    end
)
about:Toggle(
    "自动索赔金条",
    "text",
    false,
    function(GlaimGold)
        _G.ClaimGolds = ClaimGold
        while _G.ClaimGolds do
            wait()
            pcall(
                function()
                    local Event = game:GetService("Workspace").ClaimRiverResultsGold
                    Event:FireServer()
                end
            )
        end

        MainSection:Button(
            "ClearAllBoatParts",
            function()
                local Event = game:GetService("Workspace").ClearAllPlayersBoatParts
                Event:FireServer()
            end
        )

        wait(0.5)
        local ba = Instance.new("ScreenGui")
        local ca = Instance.new("TextLabel")
        local da = Instance.new("Frame")
        local _b = Instance.new("TextLabel")
        local ab = Instance.new("TextLabel")
        ba.Parent = game.CoreGui
        ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ca.Parent = ba
        ca.Active = true
        ca.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        ca.Draggable = true
        ca.Position = UDim2.new(0.698610067, 0, 0.098096624, 0)
        ca.Size = UDim2.new(0, 370, 0, 52)
        ca.Font = Enum.Font.SourceSansSemibold
        ca.Text = "Anti AFK Script"
        ca.TextColor3 = Color3.new(0, 1, 1)
        ca.TextSize = 22
        da.Parent = ca
        da.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
        da.Position = UDim2.new(0, 0, 1.0192306, 0)
        da.Size = UDim2.new(0, 370, 0, 107)
        _b.Parent = da
        _b.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        _b.Position = UDim2.new(0, 0, 0.800455689, 0)
        _b.Size = UDim2.new(0, 370, 0, 21)
        _b.Font = Enum.Font.Arial
        _b.Text = "made by simon"
        _b.TextColor3 = Color3.new(0, 1, 1)
        _b.TextSize = 20
        ab.Parent = da
        ab.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
        ab.Position = UDim2.new(0, 0, 0.158377, 0)
        ab.Size = UDim2.new(0, 370, 0, 44)
        ab.Font = Enum.Font.ArialBold
        ab.Text = "Status: Active"
        ab.TextColor3 = Color3.new(0, 1, 1)
        ab.TextSize = 20

        local bb = game:service "VirtualUser"
        game:service "Players".LocalPlayer.Idled:connect(
            function()
                bb:CaptureController()
                bb:ClickButton2(Vector2.new())
                ab.Text = "机器人想踢你，但我踢了他"
                wait(2)
                ab.Text = "状态：Active"
            end
        )
    end
)

about:Button(
    "无限方块",
    function()
        spawn(
            function()
                local guiinf =
                    game:GetService("Players").LocalPlayer.PlayerGui.BuildGui.InventoryFrame.ScrollingFrame.BlocksFrame
                _G.Blocks = false
                while game:GetService("RunService").RenderStepped:wait() do
                    if _G.Blocks then
                        return
                    end
                    for i, v in pairs(guiinf:GetDescendants()) do
                        if v.Name == "AmountText" then
                            v.Text = math.huge
                        end
                    end
                end
            end
        )
    end
)

about:Button("复制别人的船",function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()  
end)

local UITab4 = window:Tab("『奎尔湖』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("无敌模式","", false, function(Value)
        game.ReplicatedStorage.DamageHumanoid:FireServer(-2e9)
    end)
    
    about:Button("无限金钱", function()
    local money = {
       [1] = -9999,
       [2] = "Buy"
    }
    
    game:GetService("ReplicatedStorage").Pay:FireServer(unpack(money))
    end)
    
    about:Button("无限金币", function()
    local gold = {
       [1] = game:GetService("Players").LocalPlayer.GoldCoins,
       [2] = 99999
    }
    
    game:GetService("ReplicatedStorage").ChangeValue:FireServer(unpack(gold))
    end)
    
    about:Button("给所有物品", function()
    game.ReplicatedStorage.GiveTool:FireServer("SeaScooter")
    game.ReplicatedStorage.GiveTool:FireServer("Lantern")
    game.ReplicatedStorage.GiveTool:FireServer("Compass")
    game.ReplicatedStorage.GiveTool:FireServer("ItemFinder")
    game.ReplicatedStorage.GiveTool:FireServer("Aquabreather")
    end)
    
    about:Button("红色套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("FireSuit")
    end)
    
    about:Button("黄色套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("HazmatSuit")
    end)
    
    about:Button("海盗套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("PirateCostume")
    end)
    
    about:Button("动力套装", function()
    game.ReplicatedStorage.ChangeOutfits:FireServer("SuperScuba")
    end)

local UITab4 = window:Tab("『彩虹朋友』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle(
    "收集物品项目",
    "text",
    false,
    function()
    for _,v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("TouchTrigger") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TouchTrigger.CFrame
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(52, 140, -8)
            wait(0.2)
        end
    end
    end
)

about:Toggle(
    "怪物ESP",
    "text",
    false,
    function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                if not v:FindFirstChild("Lol") then
                    local esp = Instance.new("Highlight", v)
                    esp.Name = "Lol"
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    esp.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
            v:FindFirstChild("Lol"):Destroy()
        end
    end
    end
)

local UITab4 = window:Tab("『奶酪逃生』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("获取所有奶酪", function()
for _, v in pairs (game.Workspace.FindCheese:GetDescendants())do
   if v.Name == 'Cheese' then
    fireclickdetector(v.ClickDetector)
         end
     end
end)

about:Button("打开所有门", function()
local toggle = off
    wait()
    toggle = on
    repeat wait()
    fireclickdetector(game.Workspace.Cheese.ClickDetector)
    until toggle
end)

about:Label("锁门密码: 3842", function()
end)

local about = UITab4:section("传送",true)

about:Button("出生点", function()
    game.Players.LocalPlayer.Character:MoveTo(game.Workspace.SpawnLocation.Position)
end)

about:Button("安全区", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-73.6963, 4.2, -109.536))
end)

about:Button("奶酪1",  function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-264.393, 4.19329, -56.25))
end)

about:Button("奶酪2", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-275.163, 4.19329, -149.3))
end)

about:Button("奶酪3", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-271.628, 4.19329, -33.53))
end)

about:Button("安全区", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-272.487, 48.5, -150.641))
end)

about:Button("奶酪4", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-205.069, 4.19329, -180.7))
end)

about:Button("跑酷", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-25.2942, 100.5, -1037.5))
end)

about:Button("离开", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-24.3932, 5, 24.3302))
end)

about:Button("锁定区域", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-220.522, 4, -452.123))
end)

about:Button("地下室", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-88.9135, 4, -451.278))
end)

about:Button("终点", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1758.41, 57, -137.61))
end)

local UITab4 = window:Tab("『最强战场』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button(
    "SOON..",
    function()
      print("1")
    end
)
about:Button(
    "脚本",
    function()
      loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))()
    end
)
about:Button(
    "多功能",
    function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
    end
)
about:Button(
    "功能",
    function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripterbacon/TSBobfuscator/main/Main.Lua"))()
    end
)

local UITab4 = window:Tab("『动感星期五』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("辅助自动点击",function()
loadstring(game:HttpGet("https://scriptblox.com/raw/XMAS-Event-or-Funky-Friday-Auto-Player-Mobile-6721"))()
end)
about:Button("动感星期五-主要的",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua",true))()
end)

local UITab4 = window:Tab("『bf』",'18930406865')

local about = UITab4:section("脚本",true)

about:Button("bf ① ",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Xiao-Yun-UWU/main/%E6%B5%B7%E8%B4%BC%E7%8E%8Bbf.lua", true))()
end)
about:Button("bf ②",function()
loadstring(game:GetObjects("rbxassetid://10218248730")[1].Source)()
end)
about:Button("bf ③",function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/xDepressionx/Free-Script/main/AllScript.lua")()
end)
about:Button("HOHO HUB",function()
oadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))() 
end)

local UITab4 = window:Tab("『恐怖小猪』",'18930406865')

local about = UITab4:section("脚本",true)

about:Button("恐怖小猪 ①",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/79-x/W/main/Piggy%20Script"))()
end)
about:Button("恐怖小猪 ②",function()
loadstring(game:HttpGet("https://encurtador.com.br/fiyFJ"))();
end)

local UITab4 = window:Tab("『钓鱼模拟器』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("跳跃","text",false,function(s)
shared.toggle = State
     if shared.toggle then
    fuckMonster = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name
                        end
                    end

                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMonster:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
about:Toggle("自动杀鲨鱼","text",false,function(State)
 shared.toggle = State
     if shared.toggle then
    fuckMonster = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name
                        end
                    end

                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMonster:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
about:Toggle("自动钓鱼","text",false,function(bool)
 if bool then
            local rodName = false
            while not rodName do
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:FindFirstChild("FishingRodScript") then
                        rodName = v.Name
                        break
                    end
                end
                wait()
            end

            bBobber = game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber.Fish.Changed:Connect(
                function(fishVal)
                    if fishVal ~= nil then
                        --if not legendToggle then
                            game.Workspace:WaitForChild(tostring(fishVal))
                            wait()
                            game.ReplicatedStorage.CloudClientResources.Communication.Events.FishedDone:FireServer()
                            wait()
                            game.ReplicatedStorage.CloudClientResources.Communication.Events.ResetFishingRod:FireServer()
                            wait()
                        --[[else
                            if game.Workspace:WaitForChild(tostring(fishVal)).RarityLevel.Value >= 5 then
                                game.ReplicatedStorage.CloudClientResources.Communication.Events.FishedDone:FireServer()
                                wait()
                                game.ReplicatedStorage.CloudClientResources.Communication.Events.ResetFishingRod:FireServer()
                                wait()
                            end                                                                                                 
                        end                                                                                                        --]]
					end
					if game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber:FindFirstChild("FishWeld") then
						for p, q in pairs(game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber:GetChildren()) do
							if q.Name == "FishWeld" then
								q:Destroy()
							end
						end
					end
                end
            )
        else 
            bBobber:Disconnect()
        end
end)
about:Toggle("自动杀boss","text",false,function(State)
 shared.toggle = State
     if shared.toggle then
    fuckMobby = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "MobbyWood" then
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then


                    for i, getTools in pairs(player.Character:GetChildren()) do
                        if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                            plrTools = getTools.Name
                        end
                    end

                    teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
                    wait(1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                    break
                elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    EquipTool()
               break
            end
        end
     end
     end)
    else
         fuckMobby:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)
about:Toggle("减少延迟","text",false,function(State)
 toggle = State
     if toggle then
        while toggle do 
            wait(30)
            for i, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
                if v:IsA("Model") then
                    v:Destroy()
                end
            end
        end
      end
end)
about:Toggle("自动锁定稀有物品","text",false,function(State)
 toggle = State
     if toggle then
        while toggle do 
            wait(.1)
for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetChildren()) do
        if string.match(v.Name, "key") then
            for i, model in pairs(v:GetDescendants()) do
                if model:IsA("Tool") then
                    if model.RarityLevel.Value >= 5 then

                        if v.DraggableComponent.Contents.LockIcon.Visible == false then
                            print(v.Name, model.Name, model.RarityLevel.Value)
                        local args = {
                            [1] = "Tools",
                            [2] = v.Name,
                            [3] = true
                        }
                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))

                        end
                    end
                end
            end
        end
end

        end
      end
end)
Janab:Toggle("自动抓捕","text",false,function(State)
 toggle = State
    while toggle do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
    end
end)
about:Toggle("自动售卖","text",false,function(State)
 toggle = State
    while toggle do
        wait(2.6)
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
    end
end)
about:Toggle("每日宝箱","text",false,function(State)
 toggle = State
        while toggle do
                for i, v in pairs(game.Workspace.Islands:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
        end
end)
about:Toggle("随机宝箱","text",false,function(State)
 toggle = State
        while toggle do
                for i, v in pairs(game.Workspace.RandomChests:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
        end
end)
local wood_types = {"选择", "Earth Egg","Alien Egg","Dominus Egg","Ice Egg","Lava Egg","Heavens Egg","Toy Egg","Mine Egg"}
if not game.workspace:FindFirstChild("PFA") then 
    local part = Instance.new("Part") 
    part.Name = "PFA" 
    part.Parent = game.workspace 
    part.CFrame = CFrame.new(-1087, -40, 1670) 
    part.Size = Vector3.new(50, 0, 50) 
    part.Anchored = true 
    part.Reflectance = 1 
end

function C() 
    spawn(function () 
        while getgenv().C do
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                TPCFrame(CFrame.new(-1087, -35, 1670))
                if v.ToolTip == "Weight" then 
                    v.Parent = game.Players.LocalPlayer.Character 
                end
                if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then 
                    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate() 
                end
            end 
            wait()
        end
    end)
end

function U() 
    spawn(function () 
        while getgenv().U do
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Damage_Multiplier"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Health_Multiplier"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Jump_Power"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Walk_Speed"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Pet_Space"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Pet_Inventory"}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function R() 
    spawn(function () 
        while getgenv().R do
            local args = {[1] = "S_Controller_Rebirth_Rebirth",[2] = {}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function H(E) 
    spawn(function () 
        while getgenv().H do
            local args = {[1] = "S_Controller_Eggs_Buy",[2] = {[1] = E}}
            game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteFunction:InvokeServer(unpack(args))
            wait()
        end
    end)
end

local UITab4 = window:Tab("『住宅大屠杀』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("传送到手电筒",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-29.9, 7.8, -76.4)
end)
about:Button("传送到木板放置工具",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-34.5, 23.8, -66.5)
end)
about:Button("传送到梯子",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-67.4, 4.2, -133.2)
end)
about:Button("传送到电力箱",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2.3, 4.7, -93.6)
end)
about:Button("传送到加油小屋",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-79.2, 4.8, -126.1)
end)
about:Button("传送到柜子1",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4.3, 7.8, -39.5)
end)
about:Button("传送到柜子2",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-22.1, 23.8, -69.3)
end)
about:Button("传送到监控查看位置",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20.4, 25.8, -80.5)
end)
about:Button("传送到监控1",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-14.6, 4.2, -120.4)
end)
about:Button("传送到监控2",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-49.6, 4.2, -93.2)
end)
about:Button("传送到监控3",function()
print("114514");game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-18.4, 4.2, 25.1)
end)

local UITab4 = window:Tab("『俄亥俄州』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("自动抢银行","text",false,function(v)
AutoRobBank = v
        
        if AutoRobBank then
            pcall(function()
                AutoRobBankFunc()
            end)
        end
end)
AutoRobBankFunc = function()
    while AutoRobBank and task.wait() do
        local bankthing = game:GetService("Workspace").BankRobbery.BankCash
        if #bankthing.Cash:GetChildren() > 0 then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = bankthing.Main.CFrame
           task.wait()
           fireproximityprompt(game:GetService("Workspace").BankRobbery.BankCash.Main.Attachment.ProximityPrompt)
        end
    end
end
about:Toggle("自动收集物品现金","text",false,function(v)
ItemFarm = v
        
        if ItemFarm then
            pcall(function()
                ItemFarmFunc()
            end)
        end
end)

function GetItems()
   local cache = {}
   
   for i,v in pairs(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
       table.insert(cache,v)
   end
   
   for i,v in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
       table.insert(cache,v)
   end
   
   return cache
end

function Collect(item)
    if item:FindFirstChildOfClass("ClickDetector") then
        fireclickdetector(item:FindFirstChildOfClass("ClickDetector"))
    elseif item:FindFirstChildOfClass("Part") then
        local maincrap = item:FindFirstChildOfClass("Part")
        fireclickdetector(maincrap:FindFirstChildOfClass("ClickDetector"))
    end
end

ItemFarmFunc = function()
    while ItemFarm and task.wait() do
        local allitems = GetItems()
        
        for i,v in pairs(allitems) do
            if ItemFarm == false then break end
            pcall(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame
                task.wait(0.5)
                Collect(v)
                task.wait(0.5)
            end)
            continue
        end
    end
end

local UITab4 = window:Tab("『怪兽宇宙』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("自动使用所有能力","text",false,function(state)
print("s");_G.abilitiestouse = (state and true or false)
    while _G.abilitiestouse do
        wait(0.5)
        pcall(function()
    for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"globalCooldown") ~= nil then
task.wait()
for a,b in pairs(v) do
if a == "ID" then
task.wait(0.1)
game.Players.LocalPlayer.Character.ClientRunner.KaijuControlEvent:FireServer(b)
    end
    end
end
end
end)
end
end)
about:Toggle("自动使用所有攻击能力","text",false,function(state)
print("s");_G.abilitiestouse2 = (state and true or false)
    while _G.abilitiestouse2 do
        wait(0.5)
        pcall(function()
			for i,v in pairs(getgc(true)) do
				if type(v) == "table" and rawget(v,"globalCooldown") ~= nil then
			task.wait()
			if v.Cooldown < 6.1 then
				wait(0.5)
			game.Players.LocalPlayer.Character.ClientRunner.KaijuControlEvent:FireServer(v.ID)
			end
			end
			end			
end)
end
end)
about:Toggle("自动传送","text",false,function(state)
print("s");_G.test = (state and true or false)
while _G.test do
wait()
pcall(function()
_G.rat = nil
		local distance = math.huge
		for i,v in pairs(game:GetService("Workspace").Map:GetDescendants()) do
			if v.Name == "BoundingBox" and _G.test == true   and v.Parent:FindFirstChild("bValues") and v.Parent.bValues:FindFirstChild("Health") and v.Parent.bValues:FindFirstChild("Health").Value > v.Parent.bValues:FindFirstChild("MaxHealth").Value/2  and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude < _G.distance then
		local Dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
		if Dist < distance then
		distance = Dist
		_G.rat = v
		end
        task.wait()
			end
	end
repeat wait()
		local location = _G.rat.Position
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local PlayerModule = require(LocalPlayer.PlayerScripts.PlayerModule)
        local ClickToMoveController = PlayerModule:GetClickToMoveController()
        ClickToMoveController:SetShowPath(false)
        ClickToMoveController:SetUserJumpEnabled(false)
        ClickToMoveController:MoveTo(location,true)
until game.Players.LocalPlayer:DistanceFromCharacter(_G.rat.Position) < 60 or _G.test == false
    game.Players.LocalPlayer.Character.ClientRunner.KaijuControlEvent:FireServer(_G.skillname)
end)
end
end)
about:Toggle("自动重生","text",false,function(state)
print("s");_G.autospawn = (state and true or false)
    while _G.autospawn do
        wait()
        pcall(function()
  if _G.crack ~= nil and game:GetService("Players").LocalPlayer.PlayerGui.newUI.PlayingUI.Visible == false  then
    game:GetService("ReplicatedStorage").Packages.Knit.Services.KaijuService.RF.Morph:InvokeServer(_G.crack, _G.crack1,nil,_G.crack3)
    wait(5)
for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"ID") ~= nil then
if type(v.ID) ~= "number" then
local test = v.ID:split("#")
local test2 = _G.skillname:split("#")
if test[1] == test2[1] then
 _G.skillname = v.ID
    end
    end
end
end
    wait(10)
    elseif _G.crack2 ~= nil and game:GetService("Players").LocalPlayer.PlayerGui.newUI.PlayingUI.Visible == false then
    local test = math.random(1,4)
    for i,v in pairs(game:GetService("ReplicatedStorage").ReplicatedAssets.SpawnLocations:GetChildren()) do
     if i == test and game.Players.LocalPlayer.Character.Parent == nil then
    game:GetService("ReplicatedStorage").Packages.Knit.Services.KaijuService.RF.Morph:InvokeServer(_G.crack2,v,nil,_G.crack3)
    wait(5)
for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"ID") ~= nil then
if type(v.ID) ~= "number" then
local test = v.ID:split("#")
local test2 = _G.skillname:split("#")
if test[1] == test2[1] then
 _G.skillname = v.ID
    end
    end
end
end
             end
    end
    wait(1)
    end
end)
end
end)
about:Toggle("自动隐藏用户","text",false,function(state)
print("s");_G.nametag = (state and true or false)
    while _G.nametag do
    wait()
    pcall(function()
    if game.Players.LocalPlayer.Character.Head:FindFirstChild("Nametag") then
    game.Players.LocalPlayer.Character.Head.Nametag:Destroy()
    wait()
    end
end)
end
end)
if game.PlaceId == 4282985734 then
local gs = function(service)
    return game:GetService(service)
end
_G.Settings = {
    enabled = false,
    antistuck = true,
    esp = false,
    autoequip = false,
    autospawn = false,
    antiparry = false,
    followclosest = false,
    autohit = false,
    antiradgoll = false,
}

function addEsp()
    for m, n in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if not n.HumanoidRootPart:FindFirstChild("eyeesspee") then
                local u = Instance.new("BillboardGui", n:WaitForChild("Head"))
                u.LightInfluence = 0
                u.Size = UDim2.new(40, 40, 1, 1)
                u.StudsOffset = Vector3.new(0, 3, 0)
                u.ZIndexBehavior = "Global"
                u.ClipsDescendants = false
                u.AlwaysOnTop = true
                u.Name = "Head"
                local v = Instance.new("BillboardGui", n:WaitForChild("HumanoidRootPart"))
                v.LightInfluence = 0
                v.Size = UDim2.new(3, 3, 5, 5)
                v.StudsOffset = Vector3.new(0, 0, 0)
                v.ZIndexBehavior = "Global"
                v.ClipsDescendants = false
                v.AlwaysOnTop = true
                v.Name = "eyeesspee"
                local w = Instance.new("TextBox", u)
                w.BackgroundTransparency = 1
                w.ClearTextOnFocus = false
                w.MultiLine = true
                w.Size = UDim2.new(1, 1, 1, 1)
                w.Font = "GothamBold"
                w.Text = n.Name
                w.TextScaled = true
                w.TextYAlignment = "Top"
                w.TextColor3 = Color3.fromRGB(255, 55, 55)
                local x = Instance.new("TextBox", v)
                x.BackgroundTransparency = 1
                x.ClearTextOnFocus = false
                x.MultiLine = true
                x.Size = UDim2.new(1, 1, 1, 1)
                x.Font = "GothamBold"
                x.Text = " "
                x.BackgroundTransparency = 0.85
                x.TextScaled = true
                x.TextYAlignment = "Top"
                x.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
            end
        end
    end
end
function removeEsp()
    for m, n in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.HumanoidRootPart:FindFirstChild("eyeesspee") then
                n.HumanoidRootPart:FindFirstChild("eyeesspee"):Destroy()
                n.Head.Head:Destroy()
            end
        end
    end
end
function randomPlayer()
    math.randomseed(os.time())
    local y = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    return y.DisplayName
end
local z = {""}
local function A(B)
    return B[math.random(1, #B)]
end
function remLine(q)
    if q.Parent.Torso:FindFirstChild("Beam") then
        q.Parent.Torso:FindFirstChild("Beam"):Destroy()
    end
end
function walkToClosest()
    local C = nil
    local D = 999999
    local p = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    for m, n in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.Humanoid.Health ~= 0 then
                local q = n:FindFirstChild("HumanoidRootPart")
                if (p.Position - q.Position).Magnitude < D then
                    if q.Parent.Humanoid.Health ~= 0 then
                        D = (p.Position - q.Position).Magnitude
                        C = q
                    end
                end
            end
        end
    end
    if _G.Settings.autojump == true then
    end
    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid").WalkToPoint = C.Position
end
function getClosestHrp()
    local C = nil
    local D = 999999
    local p = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    for m, n in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.Humanoid.Health ~= 0 then
                local q = n:FindFirstChild("HumanoidRootPart")
                if (p.Position - q.Position).Magnitude < D then
                    if (p.Position - q.Position).Magnitude <= _G.Settings.range and q.Parent.Humanoid.Health ~= 0 then
                        D = (p.Position - q.Position).Magnitude
                        C = q
                        addLine(p, q)
                    else
                        remLine(q)
                    end
                end
            end
        end
    end
    return C
end
function setAttachmentWorldCFrame(E, F)
    E.CFrame = E.Parent.CFrame:toObjectSpace(F)
end
local G = 0
local H = 0
local I = 0
local J = 0
local K = false
local L = 0
game:GetService("RunService").RenderStepped:connect(
    function()
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("RoactUI") and _G.Settings.autospawn == true then
            keypress(0x20)
            keyrelease(0x20)
        end
        if _G.Settings.autoequip == true then
            if
                not game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool") and
                    not game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")
             then
                keypress(0x31)
                keyrelease(0x31)
            end
        end
        if I == 60 then
            if _G.Settings.esp == true then
                addEsp()
            else
                removeEsp()
            end
            I = 0
        end
        I = I + 1
        J = J + 1
        L = L + 1
        if H == 10 then
            if _G.Settings.followclosest == true then
                walkToClosest()
            end
            H = 0
        end
        H = H + 1
        if
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild(
                "Hitbox2"
            )
         then
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild(
                "Hitbox2"
            ):Destroy()
        end
        local M =
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool"):FindFirstChild(
            "ClientEquipProgress"
        )
        local q = getClosestHrp()
        if _G.Settings.usemethod2 == false then
            if J == _G.Settings.loopspeed or J > _G.Settings.loopspeed then
                J = 0
                for m, n in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes.Hitbox:GetChildren(

                    )
                ) do
                    if m <= _G.Settings.usehitbox then
                        if n.Name == "DmgPoint" then
                            if _G.Settings.antiparry == true then
                                if q.Parent.SemiTransparentShield.Transparency == 1 then
                                    M.Value = 1
                                    if _G.Settings.enabled == true then
                                        setAttachmentWorldCFrame(
                                            n,
                                            CFrame.new(
                                                q.Position +
                                                    Vector3.new(
                                                        math.random(-1, 1),
                                                        math.random(-1, 1),
                                                        math.random(-1, 1)
                                                    )
                                            )
                                        )
                                    end
                                else
                                    setAttachmentWorldCFrame(n, CFrame.new(q.Position + Vector3.new(123, 123, 123)))
                                    M.Value = 0
                                end
                            else
                                if _G.Settings.enabled == true then
                                    setAttachmentWorldCFrame(
                                        n,
                                        CFrame.new(
                                            q.Position +
                                                Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                        )
                                    )
                                end
                            end
                        end
                    else
                        setAttachmentWorldCFrame(
                            n,
                            CFrame.new(
                                game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Head").Position +
                                    Vector3.new(0, 10, 0)
                            )
                        )
                    end
                end
            end
            if _G.Settings.stompaura == true then
                for m, N in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren(

                    )
                ) do
                    if N.Name == "DmgPoint" then
                        N.Visible = true
                        if m <= _G.Settings.usehitbox then
                            if q.Parent.Humanoid.Health <= 15 then
                                setAttachmentWorldCFrame(
                                    N,
                                    CFrame.new(
                                        q.Position +
                                            Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                    )
                                )
                                if L >= 30 then
                                    keypress(0x51)
                                    keyrelease(0x51)
                                    L = 0
                                end
                            end
                        end
                    end
                end
            end
        else
            local O =
                game:GetService("Workspace").PlayerCharacters:FindFirstChild(
                game:GetService("Players").LocalPlayer.Name
            )
            local P = O:FindFirstChildOfClass("Tool").Hitboxes.Hitbox
            local Q = O:FindFirstChildOfClass("Tool").Hitboxes
            local R = O:FindFirstChildOfClass("Tool")
            local M = R:FindFirstChild("ClientEquipProgress")
            if Q:FindFirstChild("Hitbox2") then
                Q:FindFirstChild("Hitbox2"):Destroy()
            end
            if _G.Settings.stompaura == true then
                for m, N in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren(

                    )
                ) do
                    if N.Name == "DmgPoint" then
                        N.Visible = true
                        if m <= _G.Settings.usehitbox then
                            if q.Parent.Humanoid.Health <= 15 then
                                setAttachmentWorldCFrame(
                                    N,
                                    CFrame.new(
                                        q.Position +
                                            Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                    )
                                )
                                if L >= 30 then
                                    keypress(0x51)
                                    keyrelease(0x51)
                                    L = 0
                                end
                            end
                        end
                    end
                end
            end
        end
    end
)

local UITab4 = window:Tab("『逃离建筑』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Toggle("门-透视","text",false,function(state)
if state == true then
getgenv().DoorESP = false
	spawn(function()
		--single doors
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "SingleDoor" then
				pcall(function()
					local ESP = Instance.new("Highlight")
					ESP.Parent = v.Door
				end)

			end
		end
		wait(1)

		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "SingleDoor" then
				spawn(function()
					while true do
						pcall(function()
							if v.DoorTrigger.ActionSign.Value == 11 then
								v.Door.Highlight.FillColor = Color3.new(0,1,0)
							elseif v.DoorTrigger.ActionSign.Value == 10 then
								v.Door.Highlight.FillColor = Color3.new(1,0,0)
							end
						end)
						if getgenv().DoorESP == true then
						    break;
						end
						wait(0.1)
					end
				end)
				
				
			end
		end
		
	end)
	--double doors
	spawn(function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "DoubleDoor" then
				pcall(function()
					local ESP = Instance.new("Highlight")
					ESP.Parent = v
				end)

			end
		end
		wait(1)

		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "DoubleDoor" then
				spawn(function()
					while true do
						pcall(function()
							if v.DoorTrigger.ActionSign.Value == 11 then
								v.Highlight.FillColor = Color3.new(0,1,0)
							elseif v.DoorTrigger.ActionSign.Value == 10 then
								v.Highlight.FillColor = Color3.new(1,0,0)
							end
						end)
                        if getgenv().DoorESP == true then
                             print("Stopped itLop!2")
                             break
                        end
                        wait(0.1)
					end
				end)
			end
		end
	end)
else
getgenv().DoorESP = true
	--signle door
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "SingleDoor" then
			pcall(function()
				v.Door.Highlight:Destroy()
			end)

		end
	end

	--double doors
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "DoubleDoor" then
			pcall(function()
				v.Highlight:Destroy()
			end)

		end
	end
end
end)
about:Toggle("电脑透视","text",false,function(state)
    if state == true then
getgenv().StopComputerESP = false
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "ComputerTable" then
        pcall(function()
        local ESP = Instance.new("Highlight",v)
        end)
    end
end

spawn(function()
while true do
for i,v in pairs(workspace:GetDescendants()) do
    if v.Name == "ComputerTable" then
        if v.Screen.BrickColor == BrickColor.new("Bright blue") then
            pcall(function()
          v.Highlight.FillColor = Color3.new(0,0,1)
            end)
        elseif v.Screen.BrickColor == BrickColor.new("Dark green") then
            pcall(function()
          v.Highlight.FillColor = Color3.new(0,1,0)
            end)
        end
        if getgenv().StopComputerESP == true then
          print("Stopped itLop!PC")
          break
        end
    end
end
wait(1)
end
end)
else
getgenv().StopComputerESP = true
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "ComputerTable" then
        pcall(function()
        v.Highlight:Destroy()
        end)
    end
end
end
end)

about:Toggle("冷冻舱透视","text",false,function(state)
    if state == true then
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "FreezePod" then
        pcall(function()
        local ESP = Instance.new("Highlight",v)
        end)
    end
end
else
for i,v in pairs(workspace:GetDescendants()) do 
    if v.Name == "FreezePod" then
        pcall(function()
        v.Highlight:Destroy()
        end)
    end
end
end
end)

about:Toggle("加速","text",false,function(Value)
    function isNumber(str)
  if tonumber(str) ~= nil or str == 'inf' then
    return true
  end
end
local tspeed = 1
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed and isNumber(tspeed) then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)

about:Toggle("黑客永不失败","text",false,function(Value)
    spawn(function()
while wait() do
game.ReplicatedStorage.RemoteEvent:FireServer("SetPlayerMinigameResult",true)
end
end)
end)

about:Toggle("抓捕范围","text",false,function(Value)
    if game.Players.LocalPlayer.TempPlayerStatsModule.IsBeast.Value == true then
game:GetService("Players").LocalPlayer.TempPlayerStatsModule.DisableCrawl.Value = false
end
end)

local UITab4 = window:Tab("『最强拳击模拟器』",'18930406865')

local about = UITab4:section("主要功能",true)

about:Button("TP到游戏！",function()
    game:GetService("TeleportService"):Teleport(11224587399) 
end)

about:Button("删除无用的用户界面！",function()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("AutoClicker") then 
        game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("AutoClicker"):Destroy() 
    end
    if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Limited") then 
        game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("Limited"):Destroy() 
    end
    -- 添加其他界面的删除
end)

about:Toggle("Inf力量","text",false,function(val)
    getgenv().C = val
    C()
end)

about:Toggle("Inf再生","text",false,function(val)
    getgenv().R = val
    R()
end)

about:Toggle("提升","text",false,function(val)
    getgenv().U = val
    U()
end)

about:Toggle("舱口","text",false,function(val)
    getgenv().H = val
    H(E)
end)
wait(1)
about:Dropdown("选择的", "Wood Type", wood_types, function(val)
    E = val
end)

function TPCFrame(Player_CFrame) 
    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player_CFrame 
    end
    end
    
local UITab4 = window:Tab("『伐木大亨2』",'18930406865')    

local about = UITab4:section("脚本",true)

about:Button("bark2.0", function()
       loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,110,111,111,98,54,49,54,49,54,49,47,82,79,66,76,79,88,47,109,97,105,110,47,98,97,114,107,50,46,48,46,108,117,97})end)())))();     
end)    
                      
    
about:Button(" 忍-伐木大亨2(盗版浮光掠影)", function()
      loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,98,51,115,84,68,86,112,116})end)())))();
 end)
about:Button(
    "DarkX（白脚本）",
    function()
        loadstring(game:HttpGet "https://raw.githubusercontent.com/darkxwin/darkxsourcethinkyoutousedarkx/main/darkx")()
    end
)
about:Button(
    "LuaWare汉 化 版",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/LuaWare.lua", true))()
    end
)
about:Button(
    "LuaWare",
    function()
        loadstring(
            game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf", true)
        )()
    end
)

about:Button(
    "ButterHub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt"))()
    end
)
about:Button("白脚本伐木大亨2[免费](已修复)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/noob616161/KphoooOooooOoOo-wprfbdksorbfKvsdcIUH-194jddJ-___-_-lIlIIIllIIIlllIIIIlIlIIlIllIIIllllllIllllllIIIl/main/bai/%E4%BC%90%E6%9C%A8"))();
end)
    
about:Button("伐木大亨2多功能", function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt'))()
end)

local about = UITab4:section("传送功能",true)

about:Dropdown("传送", 'Dropdown',
    {'出生点', '木材反斗城', '土地商店', '桥', '码头', '椰子岛', '洞穴', '鲨鱼斧合成',
     '火山', '沼泽', '家具店', '盒子车行', '连锁逻辑店', '鲍勃的小店', '画廊', '雪山',
     '灵视神殿', '怪人', '小绿盒', '滑雪小屋', '黄金木洞穴', '小鸟斧头', "灯塔"},
    function(b)
        if b == '木材反斗城' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(270, 4, 60)
        elseif b == '出生点' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(174, 10.5, 66)
        elseif b == '土地商店' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(270, 3, -98)
        elseif b == '桥' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112, 37, -892)
        elseif b == '码头' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1136, 0, -206)
        elseif b == '椰子岛' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2614, -4, -34)
        elseif b == '洞穴' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3590, -177, 415)
        elseif b == '火山' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1588, 623, 1069)
        elseif b == '沼泽' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1216, 131, -822)
        elseif b == '家具店' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(486, 3, -1722)
        elseif b == '盒子车行' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(509, 3, -1458)
        elseif b == '雪山' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1487, 415, 3259)
        elseif b == '连锁逻辑店' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4615, 7, -794)
        elseif b == '鲍勃的小店' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(292, 8, -2544)
        elseif b == '画廊' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5217, -166, 721)
        elseif b == '灵视神殿' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1608, 195, 928)
        elseif b == '怪人' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1071, 16, 1141)
        elseif b == '小绿盒' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1667, 349, 1474)
        elseif b == '滑雪小屋' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1244, 59, 2290)
        elseif b == '黄金木洞穴' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1080, -5, -942)
        elseif b == '鲨鱼斧合成' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(330.259735, 45.7998505, 1943.30823, 0.972010553, -8.07546598e-08, 0.234937176,
                7.63610259e-08, 1, 2.77986647e-08, -0.234937176, -9.08055142e-09, 0.972010553)
        elseif b == '小鸟斧头' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4813.1, 33.5, -978.8)
        elseif b == '灯塔' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1464.8, 356.3, 3257.2)
        end

    end)