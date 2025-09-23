local tweensvc = game:GetService("TweenService")
local players = game:GetService("Players")
local plr = players.LocalPlayer
local gui = Instance.new("ScreenGui")
local img = Instance.new("ImageLabel")
local snd = Instance.new("Sound")
gui.Parent = plr:WaitForChild("PlayerGui")
gui.Name = "imgfade"
gui.DisplayOrder = 10 ^ 6
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
img.Parent = gui
img.Name = "fadingimg"
img.Size = UDim2.new(0, 563, 0, 124)
img.Position = UDim2.new(0.5, -563 / 2, 0, -124)
img.Image = "rbxassetid://15613384506"
img.BackgroundTransparency = 1
img.ImageTransparency = 1
img.ScaleType = Enum.ScaleType.Stretch
img.ZIndex = 10 ^ 6
snd.Parent = gui
snd.SoundId = "rbxassetid://8795831946"
snd.Volume = 1
snd.Looped = false
snd:Play()
local movetime = 1
local fadetime = 1
local movetweeninfo = TweenInfo.new(movetime, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local fadetweeninfo = TweenInfo.new(fadetime, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local movegoal = {Position = UDim2.new(0.5, -563 / 2, 0.5, -124 / 2)}
local movetween = tweensvc:Create(img, movetweeninfo, movegoal)
local fadeingoal = {ImageTransparency = 0}
local fadeoutgoal = {ImageTransparency = 1}
local fadeintween = tweensvc:Create(img, fadetweeninfo, fadeingoal)
local fadeouttween = tweensvc:Create(img, fadetweeninfo, fadeoutgoal)
local function fiam()
    fadeintween:Play()
    movetween:Play()
    movetween.Completed:Connect(function()
        wait(1)
        fadeouttween:Play()
        fadeouttween.Completed:Connect(function()
            gui:Destroy()
        end)

    end)

end

fiam()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.IgnoreGuiInset = true


local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0, 400, 0, 100)
notificationFrame.Position = UDim2.new(0.5, 0, 1, 100) 
notificationFrame.AnchorPoint = Vector2.new(0.5, 1) 
notificationFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
notificationFrame.BackgroundTransparency = 0.3
notificationFrame.BorderSizePixel = 0
notificationFrame.Parent = screenGui
notificationFrame.Visible = false
notificationFrame.ClipsDescendants = true


local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 20)
uiCorner.Parent = notificationFrame


local checkmarkIcon = Instance.new("ImageLabel")
checkmarkIcon.Size = UDim2.new(0, 40, 0, 40)
checkmarkIcon.Position = UDim2.new(0, 15, 0, 30)
checkmarkIcon.BackgroundTransparency = 1
checkmarkIcon.Image = "rbxassetid://18923878915" 
checkmarkIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
checkmarkIcon.Parent = notificationFrame


local thanksText = Instance.new("TextLabel")
thanksText.Size = UDim2.new(1, -80, 0, 30) 
thanksText.Position = UDim2.new(0, 65, 0, 20)
thanksText.BackgroundTransparency = 1
thanksText.Font = Enum.Font.GothamBold
thanksText.Text = "谢谢你的资助"
thanksText.TextSize = 24
thanksText.TextColor3 = Color3.fromRGB(255, 255, 255)
thanksText.TextXAlignment = Enum.TextXAlignment.Left
thanksText.Parent = notificationFrame


local messageText = Instance.new("TextLabel")
messageText.Size = UDim2.new(1, -80, 0, 40) 
messageText.Position = UDim2.new(0, 65, 0, 50)
messageText.BackgroundTransparency = 1
messageText.Font = Enum.Font.Gotham
messageText.Text = "无敌木木大王"
messageText.TextSize = 16
messageText.TextColor3 = Color3.fromRGB(200, 200, 200)
messageText.TextXAlignment = Enum.TextXAlignment.Left
messageText.TextWrapped = true
messageText.Parent = notificationFrame


local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)


notificationFrame.Visible = true
local showTween = TweenService:Create(notificationFrame, tweenInfo, {Position = UDim2.new(0.5, 0, 0.9, 0)})
showTween:Play()

wait(4)


local fadeOutDuration = 1
local fadeTween = TweenService:Create(notificationFrame, TweenInfo.new(fadeOutDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1})
fadeTween:Play()


local function fadeOutElement(element)
    local fadeOutTween = TweenService:Create(element, TweenInfo.new(fadeOutDuration), {TextTransparency = 1})
    fadeOutTween:Play()
end

fadeOutElement(thanksText)
fadeOutElement(messageText)
local fadeOutTweenIcon = TweenService:Create(checkmarkIcon, TweenInfo.new(fadeOutDuration), {ImageTransparency = 1})
fadeOutTweenIcon:Play()


fadeTween.Completed:Connect(function()
    screenGui:Destroy()
end)

DTNAME = "脚本名"
local uiName = DTNAME;
local a =
    setmetatable(
    {},
    {__index = function(self, b)
            return game.GetService(game, b)
        end, __call = function(self, b)
            return game.GetService(game, b)
        end}
)
if a.CoreGui:FindFirstChild(uiName) then
    if run then
        run:Disconnect()
        run = nil
    end
    if full then
        full:Disconnect()
        full = nil
    end
    a.CoreGui[uiName]:Destroy()
end
local c = UDim.new
local d = UDim2.new
local e = Color3.fromRGB
local f = Instance.new
local g = function()
end
local h = a.Players.LocalPlayer:GetMouse()
getgenv().library = {flags = {GetState = function(i, j)
            return library.flags[j].State
        end}, modules = {}, currentTab = nil}
function library:UpdateToggle(j, k)
    local k = k or library.flags:GetState(j)
    if k == library.flags:GetState(j) then
        return
    end
    library.flags[j]:SetState(k)
end
local l = {}
function l:Tween(m, n, o, p, q)
    return a.TweenService:Create(
        n,
        TweenInfo.new(o or 0.25, Enum.EasingStyle[p or "Linear"], Enum.EasingDirection[q or "InOut"]),
        m
    )
end
function l:SwitchTab(r)
    local s = library.currentTab
    if s == r then
        return
    end
    library.currentTab = r
    l:Tween({Transparency = 1}, s[2].Glow):Play()
    l:Tween({Transparency = 0}, r[2].Glow):Play()
    s[1].Visible = false
    r[1].Visible = true
end
local t = f("ScreenGui")
local u = f("TextButton")
local v = f("ImageLabel")
local w = f("UICorner")
local x = f("TextLabel")
local y = f("UICorner")
local z = f("Frame")
local A = f("UICorner")
local B = f("ScrollingFrame")
local C = f("UIListLayout")
local D = f("UIPadding")
local E = f("Frame")
local F = f("UICorner")
local DTImageLabel = f("ImageLabel")
local DTImageLabelCorner = f("UICorner")
t.Name = uiName
t.Parent = a.CoreGui
v.Name = "Main"
v.Parent = t
v.BackgroundColor3 = e(52, 62, 72)
v.BorderSizePixel = 0
v.Position = d(0.5, 0, 0.5, 0)
v.Size = d(0, 448, 0, 280)
v.AnchorPoint = Vector2.new(0.5, 0.5)
v.Active = true
v.Draggable = true

w.CornerRadius = c(0, 6)
w.Name = "MainCorner"
w.Parent = v
x.Parent = v
x.BackgroundColor3 = e(25, 25, 25)
x.BorderSizePixel = 0
x.Position = d(0, 6, 0, 6)
x.Size = d(0, 436, 0, 24)
x.Font = Enum.Font.GothamBold--x
x.Text = "  " .. uiName
x.TextColor3 = e(255, 255, 255)
x.TextSize = 14.000
x.TextXAlignment = Enum.TextXAlignment.Left
x.BackgroundTransparency = 0.75

u.Name = "Open"
u.Parent = t
u.BackgroundColor3 = v.BackgroundColor3--u的
u.Position = UDim2.new(0.839879155, 0, -0.0123076923, 0)
u.BorderSizePixel = 2
u.BorderColor3 = x.BackgroundColor3
u.Size = UDim2.new(0, 55, 0, 25)
u.Font = Enum.Font.SourceSans
u.Text = "林"
u.TextColor3 = Color3.fromRGB(255, 255, 255)
u.TextSize = 14.000
u.Active = true
u.Draggable = true
u.MouseButton1Down:connect(
    function()
        TOGGLE = not TOGGLE
        v.Visible = TOGGLE
        u.Text = TOGGLE and "林" or "林"
    end
)
y.CornerRadius = c(0, 6)
y.Name = "TextLabelCorner"
y.Parent = x
z.Name = "Sidebar"
z.Parent = v
z.BackgroundColor3 = e(58, 69, 80)
z.BorderSizePixel = 0
z.Position = d(0, 6, 0, 36)
z.Size = d(0, 106, 0, 238)
z.BackgroundTransparency = 0.75

A.CornerRadius = c(0, 6)
A.Name = "SidebarCorner"
A.Parent = z
B.Name = "TabButtons"
B.Parent = z
B.Active = true
B.BackgroundColor3 = e(255, 255, 255)
B.BackgroundTransparency = 1.000
B.BorderSizePixel = 0
B.Size = d(0, 106, 0, 238)
B.ScrollBarThickness = 0
C.Parent = B
C.HorizontalAlignment = Enum.HorizontalAlignment.Center--C
C.SortOrder = Enum.SortOrder.LayoutOrder
C.Padding = c(0, 5)
D.Parent = B
D.PaddingTop = c(0, 6)
E.Name = "TabHolder"
E.Parent = v
E.BackgroundColor3 = e(58, 69, 80)
E.BorderSizePixel = 0
E.Position = d(0, 118, 0, 36)
E.Size = d(0, 324, 0, 238)
E.BackgroundTransparency = 0.75

F.CornerRadius = c(0, 6)
F.Name = "TabHolderCorner"
F.Parent = E
C:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
    function()
        B.CanvasSize = d(0, 0, 0, C.AbsoluteContentSize.Y + 12)
    end
)
function createBaseNotifications()
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationHolder") then
        return game:GetService("Players").LocalPlayer.PlayerGui.NotificationHolder
    end
    local G = Instance.new("ScreenGui")
    G.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local H = Instance.new("Frame")
    H.Name = "ToggleNotif"
    H.ZIndex = 5
    H.AnchorPoint = Vector2.new(1, 1)
    H.Visible = false
    H.Size = UDim2.new(0, 291, 0, 56)
    H.Position = UDim2.new(1, 0, 1, 0)
    H.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    H.Parent = G
    local I = Instance.new("UICorner")
    I.Name = "UiCorner"
    I.Parent = H
    local J = Instance.new("UIStroke")
    J.Name = "Dropshadow"
    J.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    J.Transparency = 0.8
    J.Thickness = 2
    J.Color = Color3.fromRGB(20, 20, 20)
    J.Parent = H
    local K = Instance.new("Frame")
    K.Name = "SepVertical"
    K.Size = UDim2.new(0, 2, 0, 56)
    K.BackgroundTransparency = 0.5
    K.Position = UDim2.new(0.7423077, 0, 0, 0)
    K.BorderSizePixel = 0
    K.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
    K.Parent = H
    local L = Instance.new("Frame")
    L.Name = "SepHorizontal"
    L.Size = UDim2.new(0, 72, 0, 2)
    L.BackgroundTransparency = 0.5
    L.Position = UDim2.new(0.75, 0, 0.4464286, 2)
    L.BorderSizePixel = 0
    L.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
    L.Parent = H
    local M = Instance.new("TextLabel")
    M.Name = "Title"
    M.Size = UDim2.new(0, 216, 0, 19)
    M.BackgroundTransparency = 1
    M.BorderSizePixel = 0
    M.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    M.FontSize = Enum.FontSize.Size14
    M.TextSize = 14
    M.TextColor3 = Color3.fromRGB(255, 255, 255)
    M.Font = Enum.Font.SourceSans
    M.Parent = H
    local N = Instance.new("TextLabel")
    N.Name = "Paragraph"
    N.Size = UDim2.new(0, 218, 0, 37)
    N.BackgroundTransparency = 1
    N.Position = UDim2.new(0, 0, 0.3392857, 0)
    N.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    N.FontSize = Enum.FontSize.Size14
    N.TextSize = 14
    N.TextColor3 = Color3.fromRGB(255, 255, 255)
    N.Text = ""
    N.TextYAlignment = Enum.TextYAlignment.Top
    N.TextWrapped = true
    N.Font = Enum.Font.SourceSans
    N.TextWrap = true
    N.TextXAlignment = Enum.TextXAlignment.Left
    N.Parent = H
    local O = Instance.new("UIPadding")
    O.PaddingLeft = UDim.new(0, 10)
    O.PaddingRight = UDim.new(0, 5)
    O.Parent = N
    local P = Instance.new("TextButton")
    P.Name = "True"
    P.Size = UDim2.new(0, 72, 0, 27)
    P.BackgroundTransparency = 1
    P.Position = UDim2.new(0.75, 0, 0, 0)
    P.BorderSizePixel = 0
    P.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    P.FontSize = Enum.FontSize.Size14
    P.TextSize = 14
    P.TextColor3 = Color3.fromRGB(255, 255, 255)
    P.Text = "Yes"
    P.Font = Enum.Font.SourceSans
    P.Parent = H
    local Q = Instance.new("TextButton")
    Q.Name = "False"
    Q.Size = UDim2.new(0, 72, 0, 27)
    Q.BackgroundTransparency = 1
    Q.Position = UDim2.new(0.75, 0, 0.5178571, 0)
    Q.BorderSizePixel = 0
    Q.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Q.FontSize = Enum.FontSize.Size14
    Q.TextSize = 14
    Q.TextColor3 = Color3.fromRGB(255, 255, 255)
    Q.Text = "No"
    Q.Font = Enum.Font.SourceSans
    Q.Parent = H
    local R = Instance.new("LocalScript")
    R.Parent = G
    local S = Instance.new("Frame")
    S.Name = "DefaultNotif"
    S.ZIndex = 5
    S.AnchorPoint = Vector2.new(1, 1)
    S.Visible = false
    S.Size = UDim2.new(0, 291, 0, 56)
    S.Position = UDim2.new(1, 0, 0.9999999, 0)
    S.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    S.Parent = G
    local T = Instance.new("UICorner")
    T.Name = "UiCorner"
    T.Parent = S
    local U = Instance.new("UIStroke")
    U.Name = "Dropshadow"
    U.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    U.Transparency = 0.8
    U.Thickness = 2
    U.Color = Color3.fromRGB(20, 20, 20)
    U.Parent = S
    local V = Instance.new("TextLabel")
    V.Name = "Title"
    V.Size = UDim2.new(0, 291, 0, 19)
    V.BackgroundTransparency = 1
    V.BorderSizePixel = 0
    V.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    V.FontSize = Enum.FontSize.Size14
    V.TextSize = 14
    V.TextColor3 = Color3.fromRGB(255, 255, 255)
    V.Font = Enum.Font.SourceSans
    V.Parent = S
    local W = Instance.new("TextLabel")
    W.Name = "Paragraph"
    W.Size = UDim2.new(0, 291, 0, 37)
    W.BackgroundTransparency = 1
    W.Position = UDim2.new(0, 0, 0.3392857, 0)
    W.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    W.FontSize = Enum.FontSize.Size14
    W.TextSize = 14
    W.TextColor3 = Color3.fromRGB(255, 255, 255)
    W.Text = ""
    W.TextYAlignment = Enum.TextYAlignment.Top
    W.TextWrapped = true
    W.Font = Enum.Font.SourceSans
    W.TextWrap = true
    W.TextXAlignment = Enum.TextXAlignment.Left
    W.Parent = S
    local X = Instance.new("UIPadding")
    X.PaddingLeft = UDim.new(0, 10)
    X.PaddingRight = UDim.new(0, 5)
    X.Parent = W
    if syn then
        syn.protect_gui(G)
    end
    G.Parent = game:GetService("Players").LocalPlayer.PlayerGui
    return G
end
notificationHolder = createBaseNotifications()
notifAmount = 0
removedPos = nil
function library:SelectNotify(Y)
    Y = Y or {}
    Y.TweenSpeed = Y.TweenSpeed or 1
    Y.TweenInSpeed = Y.TweenInSpeed or Y.TweenSpeed
    Y.TweenOutSpeed = Y.TweenOutSpeed or Y.TweenSpeed
    Y.TweenVerticalSpeed = Y.TweenVerticalSpeed or Y.TweenSpeed
    Y.Title = Y.Title or "Title"
    Y.Text = Y.Text or "Text"
    Y.TrueText = Y.TrueText or "Yes"
    Y.FalseText = Y.FalseText or "No"
    Y.Duration = Y.Duration or 5
    Y.Callback = Y.Callback or function()
            warn("No callback for notif")
        end
    notifAmount = notifAmount + 1
    local Z = notifAmount
    local _ = notifAmount
    local a0 = true
    local a1 = notificationHolder.ToggleNotif:Clone()
    local a2 = false
    a1.Parent = notificationHolder
    a1.Visible = true
    a1.Position = UDim2.new(1, 300, 1, -5)
    a1.Transparency = 0.05
    a1.True.Text = Y.TrueText
    a1.False.Text = Y.FalseText
    task.spawn(
        function()
            task.wait(Y.Duration + Y.TweenInSpeed)
            a0 = false
        end
    )
    a1.True.MouseButton1Click:Connect(
        function()
            a0 = false
            a2 = true
            notifAmount = notifAmount - 1
            removedPos = a1.Position.Y.Offset
            pcall(Y.Callback, true)
        end
    )
    a1.False.MouseButton1Click:Connect(
        function()
            a0 = false
            a2 = true
            notifAmount = notifAmount - 1
            removedPos = a1.Position.Y.Offset
            pcall(Y.Callback, false)
        end
    )
    a1.Paragraph.Text = Y.Text
    a1.Title.Text = Y.Title
    a1:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, Y.TweenInSpeed)
    task.spawn(
        function()
            local a3 = a1.Position
            while a0 and task.wait() do
                local a4 = a1.Position
                if notifAmount > Z then
                    a1:TweenPosition(
                        UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quint,
                        Y.TweenVerticalSpeed,
                        true
                    )
                    Z = Z + 1
                end
                if notifAmount < Z then
                    if removedPos > a4.Y.Offset then
                        a1:TweenPosition(
                            UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quint,
                            Y.TweenVerticalSpeed,
                            true
                        )
                    else
                        _ = _ - 1
                    end
                    Z = Z - 1
                end
            end
            local a4 = a1.Position
            if a2 == false then
                notifAmount = notifAmount - 1
                removedPos = a1.Position.Y.Offset
            end
            a1:TweenPosition(
                UDim2.new(1, 300, 1, a4.Y.Offset),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quint,
                Y.TweenOutSpeed,
                true
            )
            task.wait(Y.TweenOutSpeed)
            a1:Destroy()
        end
    )
end
function library:Notify(Y)
    Y = Y or {}
    Y.TweenSpeed = Y.TweenSpeed or 1
    Y.TweenInSpeed = Y.TweenInSpeed or Y.TweenSpeed
    Y.TweenOutSpeed = Y.TweenOutSpeed or Y.TweenSpeed
    Y.TweenVerticalSpeed = Y.TweenVerticalSpeed or Y.TweenSpeed
    Y.Title = Y.Title or "Title"
    Y.Text = Y.Text or "Text"
    Y.Duration = Y.Duration or 5
    notifAmount = notifAmount + 1
    local Z = notifAmount
    local _ = notifAmount
    local a2 = false
    local a0 = true
    local a1 = notificationHolder.DefaultNotif:Clone()
    a1.Parent = notificationHolder
    a1.Visible = true
    a1.Position = UDim2.new(1, 300, 1, -5)
    a1.Transparency = 0.05
    a1.InputBegan:Connect(
        function(a5)
            if a5.UserInputType == Enum.UserInputType.MouseButton1 then
                task.spawn(
                    function()
                        local a6 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
                        game:GetService("TweenService"):Create(a1, a6, {Transparency = 0.8}):Play()
                    end
                )
                a0 = false
                a2 = true
                notifAmount = notifAmount - 1
                removedPos = a1.Position.Y.Offset
            end
        end
    )
    task.spawn(
        function()
            task.wait(Y.Duration + Y.TweenInSpeed)
            a0 = false
        end
    )
    a1.Paragraph.Text = Y.Text
    a1.Title.Text = Y.Title
    a1:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, Y.TweenInSpeed)
    task.spawn(
        function()
            local a3 = a1.Position
            while a0 and task.wait() do
                local a4 = a1.Position
                if notifAmount > Z then
                    a1:TweenPosition(
                        UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quint,
                        Y.TweenVerticalSpeed,
                        true
                    )
                    Z = Z + 1
                end
                if notifAmount < Z then
                    if removedPos > a4.Y.Offset then
                        a1:TweenPosition(
                            UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quint,
                            Y.TweenVerticalSpeed,
                            true
                        )
                    else
                        _ = _ - 1
                    end
                    Z = Z - 1
                end
            end
            local a4 = a1.Position
            if a2 == false then
                notifAmount = notifAmount - 1
                removedPos = a1.Position.Y.Offset
            end
            a1:TweenPosition(
                UDim2.new(1, 300, 1, a4.Y.Offset),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quint,
                Y.TweenOutSpeed,
                true
            )
            task.wait(Y.TweenOutSpeed)
            a1:Destroy()
        end
    )
end
function library:CreateTab(a7)
    local a8 = f("TextButton")
    local a9 = f("UICorner")
    local aa = f("Frame")
    local ab = f("UICorner")
    local ac = f("UIGradient")--UI界面渐变
    local ad = f("ScrollingFrame")--滑动框架
    local ae = f("UIPadding")--UI填充
    local af = f("UIListLayout")--UI列表布局
    a8.Name = "TabButton"
    a8.Parent = B
    a8.BackgroundColor3 = e(52, 62, 72)
    a8.BorderSizePixel = 0
    a8.Size = d(0, 94, 0, 28)
    a8.AutoButtonColor = false
    a8.Font = Enum.Font.GothamSemibold
    a8.Text = a7
    a8.TextColor3 = e(255, 255, 255)
    a8.TextSize = 14.000
    a8.BackgroundTransparency = 0.75
    
    a9.CornerRadius = c(0, 6)
    a9.Name = "TabButtonCorner"
    a9.Parent = a8
    aa.Name = "Glow"
    aa.Parent = a8
    aa.BackgroundColor3 = e(255, 255, 255)
    aa.BorderSizePixel = 0
    aa.Position = d(0, 0, 0.928571463, 0)
    aa.Size = d(0, 94, 0, 2)
    aa.Transparency = 1
    ab.CornerRadius = c(0, 6)
    ab.Name = "GlowCorner"
    ab.Parent = aa
    ac.Color =
        ColorSequence.new {--渐变颜色顺序
        ColorSequenceKeypoint.new(0.00, e(255, 255, 255)),--颜色顺序关键点
        ColorSequenceKeypoint.new(0.50, e(255, 255, 255)),
        ColorSequenceKeypoint.new(1.00, e(255, 255, 255))
    }
    ac.Name = "GlowGradient"
    ac.Parent = aa
    ad.Name = "Tab"
    ad.Parent = E
    ad.Active = true
    ad.BackgroundColor3 = e(255, 255, 255)
    ad.BackgroundTransparency = 1.000
    ad.BorderSizePixel = 0
    ad.Size = d(0, 324, 0, 238)
    ad.ScrollBarThickness = 0
    ad.Visible = false
    if library.currentTab == nil then
        library.currentTab = {ad, a8}
        aa.Transparency = 0
        ad.Visible = true
    end
    ae.Name = "TabPadding"
    ae.Parent = ad
    ae.PaddingTop = c(0, 6)
    af.Name = "TabLayout"
    af.Parent = ad
    af.HorizontalAlignment = Enum.HorizontalAlignment.Center
    af.SortOrder = Enum.SortOrder.LayoutOrder
    af.Padding = c(0, 5)
    af:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            ad.CanvasSize = d(0, 0, 0, af.AbsoluteContentSize.Y + 12)
        end
    )
    a8.MouseButton1Click:Connect(
        function()
            l:SwitchTab({ad, a8})
        end
    )
    local ag = {}
    function ag:Separator()
        local ah = f("Frame")
        ah.Transparency = 1
        ah.Size = d(0, 0, 0, 0)
        ah.BorderSizePixel = 0
        ah.Parent = ad
    end
    function ag:Button(ai, aj)
        local aj = aj or g
        local ak = f("TextButton")
        local al = f("UICorner")
        ak.Name = "BtnModule"
        ak.Parent = ad
        ak.BackgroundColor3 = e(52, 62, 72)
        ak.BorderSizePixel = 0
        ak.Size = d(0, 312, 0, 28)
        ak.AutoButtonColor = false
        ak.Font = Enum.Font.GothamSemibold
        ak.Text = "  " .. ai
        ak.TextColor3 = e(255, 255, 255)
        ak.TextSize = 14.000
        ak.TextXAlignment = Enum.TextXAlignment.Left
        ak.BackgroundTransparency = 0.75
        al.CornerRadius = c(0, 6)
        al.Name = "BtnModuleCorner"
        al.Parent = ak
        ak.MouseButton1Click:Connect(aj)
    end
    function ag:Toggle(ai, j, am, aj)
        local aj = aj or g
        local am = am or false
        local an = f("TextButton")
        local ao = f("UICorner")
        local ap = f("Frame")
        local aq = f("UIGradient")
        local ar = f("UICorner")
        local as = f("Frame")
        local at = f("UICorner")
        local au = f("UIGradient")
        library.flags[j or ai] = {
            State = false,
            Callback = aj,
            SetState = function(self, k)
                local k = k ~= nil and k or not library.flags:GetState(j)
                library.flags[j].State = k
                task.spawn(
                    function()
                        library.flags[j].Callback(k)
                    end
                )
                l:Tween({Transparency = k and 1 or 0}, ap):Play()
                l:Tween({Transparency = k and 0 or 1}, as):Play()
            end
        }
        an.Name = "ToggleModule"
        an.Parent = ad
        an.BackgroundColor3 = e(52, 62, 72)
        an.BorderSizePixel = 0
        an.Size = d(0, 312, 0, 28)
        an.AutoButtonColor = false
        an.Font = Enum.Font.GothamSemibold
        an.Text = "  " .. ai
        an.TextColor3 = e(255, 255, 255)
        an.TextSize = 14.000
        an.TextXAlignment = Enum.TextXAlignment.Left
        an.BackgroundTransparency = 0.75
        ao.CornerRadius = c(0, 6)
        ao.Name = "ToggleModuleCorner"
        ao.Parent = an
        ap.Name = "OffStatus"
        ap.Parent = an
        ap.BackgroundColor3 = e(255, 255, 255)
        ap.BorderSizePixel = 0
        ap.Position = d(0.878205061, 0, 0.178571433, 0)
        ap.Size = d(0, 34, 0, 18)
        aq.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, e(255, 83, 83)),
            ColorSequenceKeypoint.new(1.00, e(255, 83, 83))
        }
        aq.Rotation = 300
        aq.Name = "OffGrad"
        aq.Parent = ap
        ar.CornerRadius = c(0, 4)
        ar.Name = "OffStatusCorner"
        ar.Parent = ap
        as.Name = "OnStatus"
        as.Parent = an
        as.BackgroundColor3 = e(255, 255, 255)
        as.BackgroundTransparency = 1.000
        as.BorderSizePixel = 0
        as.Position = d(0.878205121, 0, 0.178571433, 0)
        as.Size = d(0, 34, 0, 18)
        as.Transparency = 1
        at.CornerRadius = c(0, 4)
        at.Name = "OnStatusCorner"
        at.Parent = as
        au.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, e(53, 255, 134)),
            ColorSequenceKeypoint.new(1.00, e(53, 255, 134))
        }
        au.Rotation = 300
        au.Name = "OnGrad"
        au.Parent = as
        an.MouseButton1Click:Connect(
            function()
                library.flags[j or ai]:SetState()
            end
        )
        if am then
            library.flags[j or ai]:SetState(am)
        end
    end
    function ag:NewBind(ai, av, aj)
        local av = Enum.KeyCode[av]
        local aw = {
            Return = true,
            Space = true,
            Tab = true,
            Backquote = true,
            CapsLock = true,
            Escape = true,
            Unknown = true
        }
        local ax = {
            RightControl = "Right Ctrl",
            LeftControl = "Left Ctrl",
            LeftShift = "Left Shift",
            RightShift = "Right Shift",
            Semicolon = ";",
            Quote = '"',
            LeftBracket = "[",
            RightBracket = "]",
            Equals = "=",
            Minus = "-",
            RightAlt = "Right Alt",
            LeftAlt = "Left Alt"
        }
        local ay = av
        local az = av and (ax[av.Name] or av.Name) or "None"
        local aA = f("TextButton")
        local aB = f("UICorner")
        local aC = f("TextButton")
        local aD = f("UICorner")
        aA.Name = "KeybindModule"
        aA.Parent = ad
        aA.BackgroundColor3 = e(52, 62, 72)
        aA.BorderSizePixel = 0
        aA.Size = d(0, 312, 0, 28)
        aA.AutoButtonColor = false
        aA.Font = Enum.Font.GothamSemibold
        aA.Text = "  " .. ai
        aA.TextColor3 = e(255, 255, 255)
        aA.TextSize = 14.000
        aA.TextXAlignment = Enum.TextXAlignment.Left
        aB.CornerRadius = c(0, 6)
        aB.Name = "KeybindModuleCorner"
        aB.Parent = aA
        aC.Name = "KeybindValue"
        aC.Parent = aA
        aC.BackgroundColor3 = e(58, 69, 80)
        aC.BorderSizePixel = 0
        aC.Position = d(0.75, 0, 0.178571433, 0)
        aC.Size = d(0, 74, 0, 18)
        aC.AutoButtonColor = false
        aC.Font = Enum.Font.Gotham
        aC.Text = az
        aC.TextColor3 = e(255, 255, 255)
        aC.TextSize = 12.000
        aD.CornerRadius = c(0, 4)
        aD.Name = "KeybindValueCorner"
        aD.Parent = aC
        a.UserInputService.InputBegan:Connect(
            function(aE, aF)
                if aF then
                    return
                end
                if aE.UserInputType ~= Enum.UserInputType.Keyboard then
                    return
                end
                if aE.KeyCode ~= ay then
                    return
                end
                aj(ay.Name)
            end
        )
        aC.MouseButton1Click:Connect(
            function()
                aC.Text = "..."
                wait()
                local aG, aH = a.UserInputService.InputEnded:Wait()
                local aI = tostring(aG.KeyCode.Name)
                if aG.UserInputType ~= Enum.UserInputType.Keyboard then
                    aC.Text = az
                    return
                end
                if aw[aI] then
                    aC.Text = az
                    return
                end
                wait()
                ay = Enum.KeyCode[aI]
                aC.Text = ax[aI] or aI
            end
        )
    end
    function ag:Slider(ai, j, av, aJ, aK, aL, aj)
        local av = av or aJ
        local aj = aj or g
        local aM = f("TextButton")
        local aN = f("UICorner")
        local aO = f("Frame")
        local aP = f("UICorner")
        local aQ = f("Frame")
        local aR = f("UICorner")
        local aS = f("TextBox")
        local aT = f("UICorner")
        local aU = f("TextButton")
        local aV = f("TextButton")
        library.flags[j] = {State = av, SetValue = function(self, k)
                local aW = (h.X - aO.AbsolutePosition.X) / aO.AbsoluteSize.X
                if k then
                    aW = (k - aJ) / (aK - aJ)
                end
                aW = math.clamp(aW, 0, 1)
                if aL then
                    k = k or tonumber(string.format("%.1f", tostring(aJ + (aK - aJ) * aW)))
                else
                    k = k or math.floor(aJ + (aK - aJ) * aW)
                end
                library.flags[j].State = tonumber(k)
                aS.Text = tostring(k)
                aQ.Size = d(aW, 0, 1, 0)
                aj(tonumber(k))
            end}
        aM.Name = "SliderModule"
        aM.Parent = ad
        aM.BackgroundColor3 = e(52, 62, 72)
        aM.BorderSizePixel = 0
        aM.Position = d(0, 0, -0.140425533, 0)
        aM.Size = d(0, 312, 0, 28)
        aM.AutoButtonColor = false
        aM.Font = Enum.Font.GothamSemibold
        aM.Text = "  " .. ai
        aM.TextColor3 = e(255, 255, 255)
        aM.TextSize = 14.000
        aM.TextXAlignment = Enum.TextXAlignment.Left
        aM.BackgroundTransparency = 0.75
        aN.CornerRadius = c(0, 6)
        aN.Name = "SliderModuleCorner"
        aN.Parent = aM
        aO.Name = "SliderBar"
        aO.Parent = aM
        aO.BackgroundColor3 = e(58, 69, 80)
        aO.BackgroundTransparency = 0.75
        aO.BorderSizePixel = 0
        aO.Position = d(0.442307681, 0, 0.392857134, 0)
        aO.Size = d(0, 108, 0, 6)
        aP.CornerRadius = c(0, 2)
        aP.Name = "SliderBarCorner"
        aP.Parent = aO
        aQ.Name = "SliderPart"
        aQ.Parent = aO
        aQ.BackgroundColor3 = e(255, 255, 255)
        aQ.BorderSizePixel = 0
        aQ.Size = d(0, 0, 0, 6)
        aR.CornerRadius = c(0, 2)
        aR.Name = "SliderPartCorner"
        aR.Parent = aQ
        aS.Name = "SliderValue"
        aS.Parent = aM
        aS.BackgroundColor3 = e(58, 69, 80)
        aS.BackgroundTransparency = 0.75
        aS.BorderSizePixel = 0
        aS.Position = d(0.884615362, 0, 0.178571433, 0)
        aS.Size = d(0, 32, 0, 18)
        aS.Font = Enum.Font.Gotham
        aS.Text = av or aJ
        aS.TextColor3 = e(255, 255, 255)
        aS.TextSize = 12.000
        aT.CornerRadius = c(0, 4)
        aT.Name = "SliderValueCorner"
        aT.Parent = aS
        aU.Name = "AddSlider"
        aU.Parent = aM
        aU.BackgroundColor3 = e(255, 255, 255)
        aU.BackgroundTransparency = 1.000
        aU.BorderSizePixel = 0
        aU.Position = d(0.807692289, 0, 0.178571433, 0)
        aU.Size = d(0, 18, 0, 18)
        aU.Font = Enum.Font.Gotham
        aU.Text = "+"
        aU.TextColor3 = e(255, 255, 255)
        aU.TextSize = 18.000
        aV.Name = "MinusSlider"
        aV.Parent = aM
        aV.BackgroundColor3 = e(255, 255, 255)
        aV.BackgroundTransparency = 1.000
        aV.BorderSizePixel = 0
        aV.Position = d(0.365384609, 0, 0.178571433, 0)
        aV.Size = d(0, 18, 0, 18)
        aV.Font = Enum.Font.Gotham
        aV.Text = "-"
        aV.TextColor3 = e(255, 255, 255)
        aV.TextSize = 18.000
        aV.MouseButton1Click:Connect(
            function()
                local aX = library.flags:GetState(j)
                aX = math.clamp(aX - 1, aJ, aK)
                library.flags[j]:SetValue(aX)
            end
        )
        aU.MouseButton1Click:Connect(
            function()
                local aX = library.flags:GetState(j)
                aX = math.clamp(aX + 1, aJ, aK)
                library.flags[j]:SetValue(aX)
            end
        )
        library.flags[j]:SetValue(av)
        local aY, aZ, a_ = false, false, {[""] = true, ["-"] = true}
        aO.InputBegan:Connect(
            function(b0)
                if b0.UserInputType == Enum.UserInputType.MouseButton1 or b0.UserInputType == Enum.UserInputType.Touch then
                    library.flags[j]:SetValue()
                    aY = true
                end
            end
        )
        a.UserInputService.InputEnded:Connect(
            function(b0)
                if
                    aY and b0.UserInputType == Enum.UserInputType.MouseButton1 or
                        b0.UserInputType == Enum.UserInputType.Touch
                 then
                    aY = false
                end
            end
        )
        a.UserInputService.InputChanged:Connect(
            function(b0)
                if aY == true then
                    library.flags[j]:SetValue()
                end
            end
        )
        aS.Focused:Connect(
            function()
                aZ = true
            end
        )
        aS.FocusLost:Connect(
            function()
                aZ = false
                if aS.Text == "" then
                    library.flags[j]:SetValue(av)
                end
            end
        )
        aS:GetPropertyChangedSignal("Text"):Connect(
            function()
                if not aZ then
                    return
                end
                aS.Text = aS.Text:gsub("%D+", "")
                local ai = aS.Text
                if not tonumber(ai) then
                    aS.Text = aS.Text:gsub("%D+", "")
                elseif not a_[ai] then
                    if tonumber(ai) > aK then
                        ai = aK
                        aS.Text = tostring(aK)
                    end
                    library.flags[j]:SetValue(tonumber(ai))
                end
            end
        )
    end
    function ag:Dropdown(ai, j, b1, aj)
        local aj = aj or g
        library.flags[j] = {State = b1[1]}
        local b2 = f("TextButton")
        local b3 = f("UICorner")
        local b4 = f("TextBox")
        local b5 = f("TextButton")
        local b6 = f("TextButton")
        local b7 = f("UICorner")
        local b8 = f("UIListLayout")
        local b9 = f("UIPadding")
        b2.Name = "DropdownModule"
        b2.Parent = ad
        b2.BackgroundColor3 = e(52, 62, 72)
        b2.BorderSizePixel = 0
        b2.Size = d(0, 312, 0, 28)
        b2.AutoButtonColor = false
        b2.Font = Enum.Font.GothamSemibold
        b2.Text = ""
        b2.TextColor3 = e(255, 255, 255)
        b2.TextSize = 14.000
        b2.TextXAlignment = Enum.TextXAlignment.Left
        b2.BackgroundTransparency = 0.75
        
        b3.CornerRadius = c(0, 6)
        b3.Name = "DropdownModuleCorner"
        b3.Parent = b2
        b4.Name = "DropdownText"
        b4.Parent = b2
        b4.BackgroundColor3 = e(255, 255, 255)
        b4.BackgroundTransparency = 1.000
        b4.Position = d(0.025641026, 0, 0, 0)
        b4.Size = d(0, 192, 0, 28)
        b4.Font = Enum.Font.GothamSemibold
        b4.PlaceholderText = ai
        b4.PlaceholderColor3 = e(255, 255, 255)
        b4.TextColor3 = e(255, 255, 255)
        b4.TextSize = 14.000
        b4.TextXAlignment = Enum.TextXAlignment.Left
        b4.Text = ""
        b5.Name = "OpenDropdown"
        b5.Parent = b2
        b5.BackgroundColor3 = e(255, 255, 255)
        b5.BackgroundTransparency = 1.000
        b5.BorderSizePixel = 0
        b5.Position = d(0.907051265, 0, 0.178571433, 0)
        b5.Size = d(0, 18, 0, 18)
        b5.Font = Enum.Font.Gotham
        b5.Text = "+"
        b5.TextColor3 = e(255, 255, 255)
        b5.TextSize = 22.000
        b6.Name = "DropdownBottom"
        b6.Parent = ad
        b6.BackgroundColor3 = e(52, 62, 72)
        b6.BackgroundTransparency = 0.75
        b6.BorderSizePixel = 0
        b6.ClipsDescendants = true
        b6.Position = d(0.0185185187, 0, 0.206896558, 0)
        b6.Size = d(0, 312, 0, 0)
        b6.AutoButtonColor = false
        b6.Font = Enum.Font.GothamSemibold
        b6.Text = ""
        b6.TextColor3 = e(255, 255, 255)
        b6.TextSize = 14.000
        b6.TextXAlignment = Enum.TextXAlignment.Left
        b6.Visible = false
        b7.CornerRadius = c(0, 6)
        b7.Name = "DropdownBottomCorner"
        b7.Parent = b6
        b8.Name = "DropdownBottomLayout"
        b8.Parent = b6
        b8.HorizontalAlignment = Enum.HorizontalAlignment.Center
        b8.SortOrder = Enum.SortOrder.LayoutOrder
        b8.Padding = c(0, 6)
        b9.Name = "DropdownBottomPadding"
        b9.Parent = b6
        b9.PaddingTop = c(0, 6)
        local ba = false
        b8:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                if not ba then
                    return
                end
                l:Tween({Size = d(0, 312, 0, b8.AbsoluteContentSize.Y + 12)}, b6, 0.1):Play()
            end
        )
        local bb = function()
            local bc = b4.Text
            for bd, be in next, b6:GetChildren() do
                if be:IsA("TextButton") then
                    if string.find(be.Name:lower(), bc:lower()) then
                        be.Visible = true
                    else
                        be.Visible = false
                    end
                end
            end
        end
        local bf = function(ai)
            local b1 = b6:GetChildren()
            for bg = 1, #b1 do
                local bh = b1[bg]
                if ai == "" then
                    bb()
                else
                    if bh:IsA("TextButton") then
                        if bh.Name:lower():sub(1, string.len(ai)) == ai:lower() then
                            bh.Visible = true
                        else
                            bh.Visible = false
                        end
                    end
                end
            end
        end
        local bi = function()
            ba = not ba
            if ba then
                b6.Visible = true
                bb()
            else
                task.spawn(
                    function()
                        task.wait(0.35)
                        b6.Visible = false
                    end
                )
            end
            b5.Text = ba and "-" or "+"
            l:Tween({Size = d(0, 312, 0, ba and b8.AbsoluteContentSize.Y + 12 or 0)}, b6, 0.35):Play()
        end
        b5.MouseButton1Click:Connect(bi)
        b4.Focused:Connect(
            function()
                if ba then
                    return
                end
                bi()
            end
        )
        b4:GetPropertyChangedSignal("Text"):Connect(
            function()
                local bc = b4.Text
                for bd, be in next, b6:GetChildren() do
                    if be:IsA("TextButton") then
                        if string.find(be.Name:lower(), bc:lower()) then
                            be.Visible = true
                        else
                            be.Visible = false
                        end
                    end
                end
            end
        )
        library.flags[j].SetOptions = function(self, b1)
            library.flags[j]:ClearOptions()
            for bg = 1, #b1 do
                library.flags[j]:AddOption(b1[bg])
            end
        end
        library.flags[j].ClearOptions = function(self)
            local bj = b6:GetChildren()
            for bg = 1, #bj do
                local n = bj[bg]
                if n:IsA("TextButton") then
                    n:Destroy()
                end
            end
        end
        library.flags[j].AddOption = function(self, bh)
            local bk = f("TextButton")
            local bl = f("UICorner")
            bk.Name = bh
            bk.Parent = b6
            bk.BackgroundColor3 = e(58, 69, 80)
            bk.BackgroundTransparency = 0.75
            bk.BorderSizePixel = 0
            bk.Size = d(0, 300, 0, 28)
            bk.AutoButtonColor = false
            bk.Font = Enum.Font.GothamSemibold
            bk.Text = bh
            bk.TextColor3 = e(255, 255, 255)
            bk.TextSize = 14.000
            bl.CornerRadius = c(0, 6)
            bl.Name = "OptionCorner"
            bl.Parent = bk
            bk.MouseButton1Click:Connect(
                function()
                    b4.PlaceholderText = bh
                    b4.Text = ""
                    library.flags[j].State = bh
                    task.spawn(bi)
                    aj(bh)
                end
            )
        end
        library.flags[j].RemoveOption = function(self, bh)
            b6:WaitForChild(bh):Destroy()
        end
        library.flags[j]:SetOptions(b1)
    end
    function ag:Textbox(ai, j, aj)
        local aj = aj or g
        local aM = f("TextButton")
        local aN = f("UICorner")
        local aS = f("TextBox")
        local aT = f("UICorner")
        aM.Name = "SliderModule"
        aM.Parent = ad
        aM.BackgroundColor3 = e(52, 62, 72)
        aM.BackgroundTransparency = 0.75
        aM.BorderSizePixel = 0
        aM.Position = d(0, 0, -0.140425533, 0)
        aM.Size = d(0, 312, 0, 28)
        aM.AutoButtonColor = false
        aM.Font = Enum.Font.GothamSemibold
        aM.Text = "  " .. ai
        aM.TextColor3 = e(255, 255, 255)
        aM.TextSize = 14.000
        aM.TextXAlignment = Enum.TextXAlignment.Left
        aN.CornerRadius = c(0, 6)
        aN.Name = "BoxButtonCorner"
        aN.Parent = aM
        aS.Name = "Box"
        aS.Parent = aM
        aS.BackgroundColor3 = e(58, 69, 80)
        aS.BackgroundTransparency = 0.75
        aS.BorderSizePixel = 0
        aS.Position = d(0.774615362, 0, 0.178571433, 0)
        aS.Size = d(0, 65, 0, 18)
        aS.Font = Enum.Font.Gotham
        aS.Text = ""
        aS.PlaceholderText = j
        aS.TextColor3 = e(255, 255, 255)
        aS.TextSize = 12.000
        aT.CornerRadius = c(0, 4)
        aT.Name = "BoxCorner"
        aT.Parent = aS
        aS.FocusLost:Connect(
            function(bm)
                if not bm then
                    return
                else
                    aj(aS.Text)
                    if getgenv().ClearTextBoxText then
                        wait(0.10)
                        aS.Text = ""
                    end
                end
            end
        )
    end
    return ag
end
setmetatable(
    getgenv().library,
    {__newindex = function(self, bn, bo)
            if bn == "Name" then
                x.Text = "   " .. bo
                return true
            end
            rawset(self, bn, bo)
        end}
)

local lin1 = library:CreateTab("")

lin1:Button("",function()



end)

