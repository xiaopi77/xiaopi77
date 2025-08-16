local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()

local b=game:GetService"RunService"local d=
b.Heartbeat
local e=game:GetService"UserInputService"
local f=game:GetService"TweenService"
local g=game:GetService"LocalizationService"

local h=loadstring(game:HttpGetAsync"https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua")()
h.SetIconsType"lucide"

local i={
Font="rbxassetid://18941716391",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
WindUI=nil,
Signals={},
Objects={},
LocalizationObjects={},
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
}
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
},
}



function i.Init(j)
i.WindUI=j
end


function i.AddSignal(j,l)
table.insert(i.Signals,j:Connect(l))
end

function i.DisconnectAll()
for j,l in next,i.Signals do
local m=table.remove(i.Signals,j)
m:Disconnect()
end
end


function i.SafeCallback(j,...)
if not j then
return
end

local l,m=pcall(j,...)
if not l then local
p, r=m:find":%d+: "


warn("[ WindUI: 调试方式 ] "..m)

end

function i.SetTheme(j)
i.Theme=j
i.UpdateTheme(nil,true)
end

function i.AddFontObject(j)
table.insert(i.FontObjects,j)
i.UpdateFont(i.Font)
end

function i.UpdateFont(j)
i.Font=j
for l,m in next,i.FontObjects do
m.FontFace=Font.new(j,m.FontFace.Weight,m.FontFace.Style)
end
end

function i.GetThemeProperty(j,l)
return l[j]or i.Themes.Dark[j]
end

function i.AddThemeObject(j,l)
i.Objects[j]={Object=j,Properties=l}
i.UpdateTheme(j,false)
return j
end
function i.AddLangObject(j)
local l=i.LocalizationObjects[j]
local m=l.Object
local p=currentObjTranslationId
i.UpdateLang(m,p)
return m
end

function i.UpdateTheme(j,l)
local function ApplyTheme(m)
for p,r in pairs(m.Properties or{})do
local u=i.GetThemeProperty(r,i.Theme)
if u then
if not l then
m.Object[p]=Color3.fromHex(u)
else
i.Tween(m.Object,0.08,{[p]=Color3.fromHex(u)}):Play()
end
end
end
end

if j then
local m=i.Objects[j]
if m then
ApplyTheme(m)
end
else
for m,p in pairs(i.Objects)do
ApplyTheme(p)
end
end
end

function i.SetLangForObject(j)
if i.Localization and i.Localization.Enabled then
local l=i.LocalizationObjects[j]
if not l then return end

local m=l.Object
local p=l.TranslationId

local r=i.Localization.Translations[i.Language]
if r and r[p]then
m.Text=r[p]
else
local u=i.Localization and i.Localization.Translations and i.Localization.Translations.en or nil
if u and u[p]then
m.Text=u[p]
else
m.Text="["..p.."]"
end
end
end
end


function i.ChangeTranslationKey(j,l,m)
if i.Localization and i.Localization then
local p=string.match(m,"^"..i.Localization.Prefix.."(.+)")
for r,u in ipairs(i.LocalizationObjects)do
if u.Object==l then
u.TranslationId=p
i.SetLangForObject(r)
return
end
end

table.insert(i.LocalizationObjects,{
TranslationId=p,
Object=l
})
i.SetLangForObject(#i.LocalizationObjects)
end
end


function i.UpdateLang(j)
if j then
i.Language=j
end

for l=1,#i.LocalizationObjects do
local m=i.LocalizationObjects[l]
if m.Object and m.Object.Parent~=nil then
i.SetLangForObject(l)
else
i.LocalizationObjects[l]=nil
end
end
end

function i.SetLanguage(j)
i.Language=j
i.UpdateLang()
end

function i.Icon(j)
return h.Icon(j)
end

function i.New(j,l,m)
local p=Instance.new(j)

for r,u in next,i.DefaultProperties[j]or{}do
p[r]=u
end

for v,x in next,l or{}do
if v~="ThemeTag"then
p[v]=x
end
if i.Localization and i.Localization.Enabled and v=="Text"then
local z=string.match(x,"^"..i.Localization.Prefix.."(.+)")
if z then
local A=#i.LocalizationObjects+1
i.LocalizationObjects[A]={TranslationId=z,Object=p}

i.SetLangForObject(A)
end
end
end

for z,A in next,m or{}do
A.Parent=p
end

if l and l.ThemeTag then
i.AddThemeObject(p,l.ThemeTag)
end
if l and l.FontFace then
i.AddFontObject(p)
end
return p
end

function i.Tween(j,l,m,...)
return f:Create(j,TweenInfo.new(l,...),m)
end

function i.NewRoundFrame(j,l,m,p,v)






local x=i.New(v and"ImageButton"or"ImageLabel",{
Image=l=="Squircle"and"rbxassetid://80999662900595"
or l=="SquircleOutline"and"rbxassetid://117788349049947"
or l=="SquircleOutline2"and"rbxassetid://117817408534198"
or l=="Shadow-sm"and"rbxassetid://84825982946844"
or l=="Squircle-TL-TR"and"rbxassetid://73569156276236",
ScaleType="Slice",
SliceCenter=l~="Shadow-sm"and Rect.new(256
,256
,256
,256

)or Rect.new(512,512,512,512),
SliceScale=1,
BackgroundTransparency=1,
ThemeTag=m.ThemeTag and m.ThemeTag
},p)

for z,A in pairs(m or{})do
if z~="ThemeTag"then
x[z]=A
end
end

local function UpdateSliceScale(B)
local C=l~="Shadow-sm"and(B/(256))or(B/512)
x.SliceScale=C
end

UpdateSliceScale(j)

return x
end

local j=i.New local l=
i.Tween

function i.SetDraggable(m)
i.CanDraggable=m
end

function i.Drag(m,p,v)
local x
local z,A,B,C
local F={
CanDraggable=true
}

if not p or type(p)~="table"then
p={m}
end

local function update(G)
local H=G.Position-B
i.Tween(m,0.02,{Position=UDim2.new(
C.X.Scale,C.X.Offset+H.X,
C.Y.Scale,C.Y.Offset+H.Y
)}):Play()
end

for G,H in pairs(p)do
H.InputBegan:Connect(function(J)
if(J.UserInputType==Enum.UserInputType.MouseButton1 or J.UserInputType==Enum.UserInputType.Touch)and F.CanDraggable then
if x==nil then
x=H
z=true
B=J.Position
C=m.Position

if v and type(v)=="function"then
v(true,x)
end

J.Changed:Connect(function()
if J.UserInputState==Enum.UserInputState.End then
z=false
x=nil

if v and type(v)=="function"then
v(false,x)
end
end
end)
end
end
end)

H.InputChanged:Connect(function(J)
if x==H and z then
if J.UserInputType==Enum.UserInputType.MouseMovement or J.UserInputType==Enum.UserInputType.Touch then
A=J
end
end
end)
end

e.InputChanged:Connect(function(J)
if J==A and z and x~=nil then
if F.CanDraggable then
update(J)
end
end
end)

function F.Set(J,L)
F.CanDraggable=L
end

return F
end

function i.Image(m,p,v,x,z,A,B)
local function SanitizeFilename(C)
C=C:gsub("[%s/\\:*?\"<>|]+","-")
C=C:gsub("[^%w%-_%.]","")
return C
end

x=x or"Temp"
p=SanitizeFilename(p)

local C=j("Frame",{
Size=UDim2.new(0,0,0,0),

BackgroundTransparency=1,
},{
j("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(i.Icon(m)or B)and{
ImageColor3=A and"Icon"
}or nil,
},{
j("UICorner",{
CornerRadius=UDim.new(0,v)
})
})
})
if i.Icon(m)then
C.ImageLabel.Image=i.Icon(m)[1]
C.ImageLabel.ImageRectOffset=i.Icon(m)[2].ImageRectPosition
C.ImageLabel.ImageRectSize=i.Icon(m)[2].ImageRectSize
end
if string.find(m,"http")then
local F="WindUI/"..x.."/Assets/."..z.."-"..p..".png"
local G,H=pcall(function()
task.spawn(function()
if not isfile(F)then
local G=i.Request{
Url=m,
Method="GET",
}.Body

writefile(F,G)
end
C.ImageLabel.Image=getcustomasset(F)
end)
end)
if not G then
warn("[ WindUI.Creator ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..H)

C:Destroy()
end
elseif string.find(m,"rbxassetid")then
C.ImageLabel.Image=m
end

return C
end

return i end function a.b()
local b={}







function b.New(e,f,g)
local h={
Enabled=f.Enabled or false,
Translations=f.Translations or{},
Prefix=f.Prefix or"loc:",
DefaultLanguage=f.DefaultLanguage or"en"
}

g.Localization=h

return h
end



return b end function a.c()
return{
Dark={
Name="Dark",
Accent="#18181b",
Dialog="#18181b",
Outline="#FFFFFF",
Text="#FFFFFF",
Placeholder="#999999",
Background="#101010",
Button="#52525b",
Icon="#a1a1aa",
},
Light={
Name="Light",
Accent="#FFFFFF",
Dialog="#f4f4f5",
Outline="#09090b",
Text="#000000",
Placeholder="#777777",
Background="#e4e4e7",
Button="#18181b",
Icon="#52525b",
},
Rose={
Name="Rose",
Accent="#f43f5e",
Outline="#ffe4e6",
Text="#ffe4e6",
Placeholder="#fda4af",
Background="#881337",
Button="#e11d48",
Icon="#fecdd3",
},
Plant={
Name="Plant",
Accent="#22c55e",
Outline="#dcfce7",
Text="#dcfce7",
Placeholder="#bbf7d0",
Background="#14532d",
Button="#22c55e",
Icon="#86efac",
},
Red={
Name="Red",
Accent="#ef4444",
Outline="#fee2e2",
Text="#ffe4e6",
Placeholder="#fca5a5",
Background="#7f1d1d",
Button="#ef4444",
Icon="#fecaca",
},
Indigo={
Name="Indigo",
Accent="#6366f1",
Outline="#e0e7ff",
Text="#e0e7ff",
Placeholder="#a5b4fc",
Background="#312e81",
Button="#6366f1",
Icon="#c7d2fe",
},
Sky={
Name="Sky",
Accent="#0ea5e9",
Outline="#e0f2fe",
Text="#e0f2fe",
Placeholder="#7dd3fc",
Background="#075985",
Button="#0ea5e9",
Icon="#bae6fd",
},
Violet={
Name="Violet",
Accent="#8b5cf6",
Outline="#ede9fe",
Text="#ede9fe",
Placeholder="#c4b5fd",
Background="#4c1d95",
Button="#8b5cf6",
Icon="#ddd6fe",
},
Amber={
Name="Amber",
Accent="#f59e0b",
Outline="#fef3c7",
Text="#fef3c7",
Placeholder="#fcd34d",
Background="#78350f",
Button="#f59e0b",
Icon="#fde68a",
},
Emerald={
Name="Emerald",
Accent="#10b981",
Outline="#d1fae5",
Text="#d1fae5",
Placeholder="#6ee7b7",
Background="#064e3b",
Button="#10b981",
Icon="#a7f3d0",
},
}end function a.d()











local b=4294967296;local e=b-1;local function c(f,g)local h,i=0,1;while f~=0 or g~=0 do local j,l=f%2,g%2;local m=(j+l)%2;h=h+m*i;f=math.floor(f/2)g=math.floor(g/2)i=i*2 end;return h%b end;local function k(f,g,h,...)local i;if g then f=f%b;g=g%b;i=c(f,g)if h then i=k(i,h,...)end;return i elseif f then return f%b else return 0 end end;local function n(f,g,h,...)local i;if g then f=f%b;g=g%b;i=(f+g-c(f,g))/2;if h then i=n(i,h,...)end;return i elseif f then return f%b else return e end end;local function o(f)return e-f end;local function q(f,g)if g<0 then return lshift(f,-g)end;return math.floor(f%4294967296/2^g)end;local function s(f,g)if g>31 or g<-31 then return 0 end;return q(f%b,g)end;local function lshift(f,g)if g<0 then return s(f,-g)end;return f*2^g%4294967296 end;local function t(f,g)f=f%b;g=g%32;local h=n(f,2^g-1)return s(f,g)+lshift(h,32-g)end;local f={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(g)return string.gsub(g,".",function(h)return string.format("%02x",string.byte(h))end)end;local function y(g,h)local i=""for j=1,h do local l=g%256;i=string.char(l)..i;g=(g-l)/256 end;return i end;local function D(g,h)local i=0;for j=h,h+3 do i=i*256+string.byte(g,j)end;return i end;local function E(g,h)local i=64-(h+9)%64;h=y(8*h,8)g=g.."\128"..string.rep("\0",i)..h;assert(#g%64==0)return g end;local function I(g)g[1]=0x6a09e667;g[2]=0xbb67ae85;g[3]=0x3c6ef372;g[4]=0xa54ff53a;g[5]=0x510e527f;g[6]=0x9b05688c;g[7]=0x1f83d9ab;g[8]=0x5be0cd19;return g end;local function K(g,h,i)local j={}for l=1,16 do j[l]=D(g,h+(l-1)*4)end;for l=17,64 do local m=j[l-15]local p=k(t(m,7),t(m,18),s(m,3))m=j[l-2]j[l]=(j[l-16]+p+j[l-7]+k(t(m,17),t(m,19),s(m,10)))%b end;local l,m,p,v,x,z,A,B=i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8]for C=1,64 do local F=k(t(l,2),t(l,13),t(l,22))local G=k(n(l,m),n(l,p),n(m,p))local H=(F+G)%b;local J=k(t(x,6),t(x,11),t(x,25))local L=k(n(x,z),n(o(x),A))local M=(B+J+L+f[C]+j[C])%b;B=A;A=z;z=x;x=(v+M)%b;v=p;p=m;m=l;l=(M+H)%b end;i[1]=(i[1]+l)%b;i[2]=(i[2]+m)%b;i[3]=(i[3]+p)%b;i[4]=(i[4]+v)%b;i[5]=(i[5]+x)%b;i[6]=(i[6]+z)%b;i[7]=(i[7]+A)%b;i[8]=(i[8]+B)%b end;local function Z(g)g=E(g,#g)local h=I{}for i=1,#g,64 do K(g,i,h)end;return w(y(h[1],4)..y(h[2],4)..y(h[3],4)..y(h[4],4)..y(h[5],4)..y(h[6],4)..y(h[7],4)..y(h[8],4))end;local g;local h={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local i={["/"]="/"}for j,l in pairs(h)do i[l]=j end;local m=function(m)return"\\"..(h[m]or string.format("u%04x",m:byte()))end;local p=function(p)return"null"end;local v=function(v,x)local z={}x=x or{}if x[v]then error"circular reference"end;x[v]=true;if rawget(v,1)~=nil or next(v)==nil then local A=0;for B in pairs(v)do if type(B)~="number"then error"invalid table: mixed or invalid key types"end;A=A+1 end;if A~=#v then error"invalid table: sparse array"end;for C,F in ipairs(v)do table.insert(z,g(F,x))end;x[v]=nil;return"["..table.concat(z,",").."]"else for A,B in pairs(v)do if type(A)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(z,g(A,x)..":"..g(B,x))end;x[v]=nil;return"{"..table.concat(z,",").."}"end end;local x=function(x)return'"'..x:gsub('[%z\1-\31\\"]',m)..'"'end;local z=function(z)if z~=z or z<=-math.huge or z>=math.huge then error("unexpected number value '"..tostring(z).."'")end;return string.format("%.14g",z)end;local A={["nil"]=p,table=v,string=x,number=z,boolean=tostring}g=function(B,C)local F=type(B)local G=A[F]if G then return G(B,C)end;error("unexpected type '"..F.."'")end;local B=function(B)return g(B)end;local C;local F=function(...)local F={}for G=1,select("#",...)do F[select(G,...)]=true end;return F end;local G=F(" ","\t","\r","\n")local H=F(" ","\t","\r","\n","]","}",",")local J=F("\\","/",'"',"b","f","n","r","t","u")local L=F("true","false","null")local M={["true"]=true,["false"]=false,null=nil}local N=function(N,O,P,Q)for R=O,#N do if P[N:sub(R,R)]~=Q then return R end end;return#N+1 end;local O=function(O,P,Q)local R=1;local S=1;for T=1,P-1 do S=S+1;if O:sub(T,T)=="\n"then R=R+1;S=1 end end;error(string.format("%s at line %d col %d",Q,R,S))end;local P=function(P)local Q=math.floor;if P<=0x7f then return string.char(P)elseif P<=0x7ff then return string.char(Q(P/64)+192,P%64+128)elseif P<=0xffff then return string.char(Q(P/4096)+224,Q(P%4096/64)+128,P%64+128)elseif P<=0x10ffff then return string.char(Q(P/262144)+240,Q(P%262144/4096)+128,Q(P%4096/64)+128,P%64+128)end;error(string.format("invalid unicode codepoint '%x'",P))end;local Q=function(Q)local R=tonumber(Q:sub(1,4),16)local S=tonumber(Q:sub(7,10),16)if S then return P((R-0xd800)*0x400+S-0xdc00+0x10000)else return P(R)end end;local R=function(R,S)local T=""local U=S+1;local V=U;while U<=#R do local W=R:byte(U)if W<32 then O(R,U,"control character in string")elseif W==92 then T=T..R:sub(V,U-1)U=U+1;local X=R:sub(U,U)if X=="u"then local Y=R:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",U+1)or R:match("^%x%x%x%x",U+1)or O(R,U-1,"invalid unicode escape in string")T=T..Q(Y)U=U+#Y else if not J[X]then O(R,U-1,"invalid escape char '"..X.."' in string")end;T=T..i[X]end;V=U+1 elseif W==34 then T=T..R:sub(V,U-1)return T,U+1 end;U=U+1 end;O(R,S,"expected closing quote for string")end;local S=function(S,T)local U=N(S,T,H)local V=S:sub(T,U-1)local W=tonumber(V)if not W then O(S,T,"invalid number '"..V.."'")end;return W,U end;local T=function(T,U)local V=N(T,U,H)local W=T:sub(U,V-1)if not L[W]then O(T,U,"invalid literal '"..W.."'")end;return M[W],V end;local U=function(U,V)local W={}local X=1;V=V+1;while 1 do local Y;V=N(U,V,G,true)if U:sub(V,V)=="]"then V=V+1;break end;Y,V=C(U,V)W[X]=Y;X=X+1;V=N(U,V,G,true)local _=U:sub(V,V)V=V+1;if _=="]"then break end;if _~=","then O(U,V,"expected ']' or ','")end end;return W,V end;local aa=function(V,W)local X={}W=W+1;while 1 do local Y,_;W=N(V,W,G,true)if V:sub(W,W)=="}"then W=W+1;break end;if V:sub(W,W)~='"'then O(V,W,"expected string for key")end;Y,W=C(V,W)W=N(V,W,G,true)if V:sub(W,W)~=":"then O(V,W,"expected ':' after key")end;W=N(V,W+1,G,true)_,W=C(V,W)X[Y]=_;W=N(V,W,G,true)local aa=V:sub(W,W)W=W+1;if aa=="}"then break end;if aa~=","then O(V,W,"expected '}' or ','")end end;return X,W end;local V={['"']=R,["0"]=S,["1"]=S,["2"]=S,["3"]=S,["4"]=S,["5"]=S,["6"]=S,["7"]=S,["8"]=S,["9"]=S,["-"]=S,t=T,f=T,n=T,["["]=U,["{"]=aa}C=function(W,X)local Y=W:sub(X,X)local _=V[Y]if _ then return _(W,X)end;O(W,X,"unexpected character '"..Y.."'")end;local W=function(W)if type(W)~="string"then error("expected argument of type string, got "..type(W))end;local X,Y=C(W,N(W,1,G,true))Y=N(W,Y,G,true)if Y<=#W then O(W,Y,"trailing garbage")end;return X end;
local X,Y,_=B,W,Z;





local ab={}


function ab.New(ac,ad)

local ae=ac;
local af=ad;
local ag=true;


local ah=function(ah)end;


repeat task.wait(1)until game:IsLoaded();


local ai=false;
local aj,ak,al,am,an,ao,ap,aq,ar=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return game:GetService"Players".LocalPlayer.UserId end
local as,at="",0;


local au="https://api.platoboost.com";
local av=ak{
Url=au.."/public/connectivity",
Method="GET"
};
if av.StatusCode~=200 or av.StatusCode~=429 then
au="https://api.platoboost.net";
end


function cacheLink()
if at+(600)<ao()then
local aw=ak{
Url=au.."/public/start",
Method="POST",
Body=X{
service=ae,
identifier=_(ar())
},
Headers={
["Content-Type"]="application/json"
}
};

if aw.StatusCode==200 then
local ax=Y(aw.Body);

if ax.success==true then
as=ax.data.url;
at=ao();
return true,as
else
ah(ax.message);
return false,ax.message
end
elseif aw.StatusCode==429 then
local ax="you are being rate limited, please wait 20 seconds and try again.";
ah(ax);
return false,ax
end

local ax="Failed to cache link.";
ah(ax);
return false,ax
else
return true,as
end
end

cacheLink();


local aw=function()
local aw=""
for ax=1,16 do
aw=aw..al(aq(ap()*(26))+97)
end
return aw
end


for ax=1,5 do
local ay=aw();
task.wait(0.2)
if aw()==ay then
local az="platoboost nonce error.";
ah(az);
error(az);
end
end


local ax=function()
local ax,ay=cacheLink();

if ax then
aj(ay);
end
end


local ay=function(ay)
local az=aw();
local aA=au.."/public/redeem/"..am(ae);

local aB={
identifier=_(ar()),
key=ay
}

if ag then
aB.nonce=az;
end

local aC=ak{
Url=aA,
Method="POST",
Body=X(aB),
Headers={
["Content-Type"]="application/json"
}
};

if aC.StatusCode==200 then
local aD=Y(aC.Body);

if aD.success==true then
if aD.data.valid==true then
if ag then
if aD.data.hash==_("true".."-"..az.."-"..af)then
return true
else
ah"failed to verify integrity.";
return false
end
else
return true
end
else
ah"key is invalid.";
return false
end
else
if an(aD.message,1,27)=="unique constraint violation"then
ah"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
ah(aD.message);
return false
end
end
elseif aC.StatusCode==429 then
ah"you are being rate limited, please wait 20 seconds and try again.";
return false
else
ah"server returned an invalid status code, please try again later.";
return false
end
end


local az=function(az)
if ai==true then
return false,("A request is already being sent, please slow down.")
else
ai=true;
end

local aA=aw();
local aB=au.."/public/whitelist/"..am(ae).."?identifier=".._(ar()).."&key="..az;

if ag then
aB=aB.."&nonce="..aA;
end

local aC=ak{
Url=aB,
Method="GET",
};

ai=false;

if aC.StatusCode==200 then
local aD=Y(aC.Body);

if aD.success==true then
if aD.data.valid==true then
if ag then
if aD.data.hash==_("true".."-"..aA.."-"..af)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if an(az,1,4)=="KEY_"then
return true,ay(az)
else
return false,("Key is invalid.")
end
end
else
return false,(aD.message)
end
elseif aC.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local aA=function(aA)
local aB=aw();
local aC=au.."/public/flag/"..am(ae).."?name="..aA;

if ag then
aC=aC.."&nonce="..aB;
end

local aD=ak{
Url=aC,
Method="GET",
};

if aD.StatusCode==200 then
local aE=Y(aD.Body);

if aE.success==true then
if ag then
if aE.data.hash==_(am(aE.data.value).."-"..aB.."-"..af)then
return aE.data.value
else
ah"failed to verify integrity.";
return nil
end
else
return aE.data.value
end
else
ah(aE.message);
return nil
end
else
return nil
end
end


return{
Verify=az,
GetFlag=aA,
Copy=ax,
}
end


return ab end function a.e()
local aa=game:GetService"HttpService"
local ab={}


function ab.New(ac)
local ad=gethwid or function()return game:GetService"Players".LocalPlayer.UserId end
local ae,af=request or http_request or syn_request,setclipboard or toclipboard

function ValidateKey(ag)
local ah="https://pandadevelopment.net/v2_validation?key="..tostring(ag).."&service="..tostring(ac).."&hwid="..tostring(ad())


local ai,aj=pcall(function()
return ae{
Url=ah,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"}
}
end)

if ai and aj then
if aj.Success then
local ak,al=pcall(function()
return aa:JSONDecode(aj.Body)
end)

if ak and al then
if al.V2_Authentication and al.V2_Authentication=="success"then

return true,"Authenticated"
else
local am=al.Key_Information.Notes or"Unknown reason"

return false,"Authentication failed: "..am
end
else

return false,"JSON decode error"
end
else
warn("[Pelinda Ov2.5] HTTP request was not successful. Code: "..tostring(aj.StatusCode).." Message: "..aj.StatusMessage)
return false,"HTTP request failed: "..aj.StatusMessage
end
else

return false,"Request pcall error"
end
end

function GetKeyLink()
return"https://pandadevelopment.net/getkey?service="..tostring(ac).."&hwid="..tostring(ad)
end

function CopyLink()
return af(GetKeyLink())
end

return{
Verify=ValidateKey,
Copy=CopyLink
}
end

return ab end function a.f()
return{
platoboost={
Name="Platoboost",
Icon="rbxassetid://75920162824531",
Args={"ServiceId","Secret"},


New=a.load'd'.New
},
pandadevelopment={
Name="Panda Development",
Icon="panda",
Args={"ServiceId"},


New=a.load'e'.New
},

}end function a.g()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj,ak)
ah=ah or"Primary"
local al=not ak and 10 or 99
local am
if af and af~=""then
am=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local an=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=ai,
BackgroundTransparency=1
},{
ab.NewRoundFrame(al,"Squircle",{
ThemeTag={
ImageColor3=ah~="White"and"Button"or nil,
},
ImageColor3=ah=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ah=="Primary"and 0 or ah=="White"and 0 or 1
}),

ab.NewRoundFrame(al,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ah=="Secondary"and 0.95 or 1
}),

ab.NewRoundFrame(al,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",
ImageTransparency=ah=="Secondary"and 0 or 1,
Visible=not ak
}),

ab.NewRoundFrame(al,not ak and"SquircleOutline"or"SquircleOutline2",{
ThemeTag={
ImageColor3=ah~="White"and"Outline"or nil,
},
Size=UDim2.new(1,0,1,0),
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=ah=="Primary"and.95 or.85,
Name="SquircleOutline",
}),

ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=ah~="White"and"Text"or nil
},
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
am,
ac("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ae or"Button",
ThemeTag={
TextColor3=(ah~="Primary"and ah~="White")and"Text",
},
TextColor3=ah=="Primary"and Color3.new(1,1,1)or ah=="White"and Color3.new(0,0,0)or nil,
AutomaticSize="XY",
TextSize=18,
})
})
})

ab.AddSignal(an.MouseEnter,function()
ad(an.Frame,.047,{ImageTransparency=.95}):Play()
end)
ab.AddSignal(an.MouseLeave,function()
ad(an.Frame,.047,{ImageTransparency=1}):Play()
end)
ab.AddSignal(an.MouseButton1Up,function()
if aj then
aj:Close()()
end
if ag then
ab.SafeCallback(ag)
end
end)

return an
end


return aa end function a.h()
local aa={}

local ab=a.load'a'
local ac=ab.New local ad=
ab.Tween


function aa.New(ae,af,ag,ah,ai)
ah=ah or"Input"
local aj=10
local ak
if af and af~=""then
ak=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local al=ah~="Input"

local am=ac("TextBox",{
BackgroundTransparency=1,
TextSize=16,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ak and-29 or 0,1,0),
PlaceholderText=ae,
ClearTextOnFocus=false,
ClipsDescendants=true,
TextWrapped=al,
MultiLine=al,
TextXAlignment="Left",
TextYAlignment=ah=="Input"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local an=ac("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(aj,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
ab.NewRoundFrame(aj,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,ah=="Input"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,ah=="Input"and 0 or 12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=ah=="Input"and"Center"or"Top",
HorizontalAlignment="Left",
}),
ak,
am,
})
})
})










ab.AddSignal(am.FocusLost,function()
if ai then
ab.SafeCallback(ai,am.Text)
end
end)

return an
end


return aa end function a.i()
local aa=a.load'a'
local ab=aa.New
local ac=aa.Tween

local ad={
Holder=nil,
Window=nil,
Parent=nil,
}

function ad.Init(ae,af)
ad.Window=ae
ad.Parent=af
return ad
end

function ad.Create(ae)
local af={
UICorner=32,
UIPadding=12,
UIElements={}
}

if ae then af.UIPadding=0 end
if ae then af.UICorner=26 end

if not ae then
af.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=ad.Parent or(ad.Window and ad.Window.UIElements and ad.Window.UIElements.Main and ad.Window.UIElements.Main.Main)
},{
ab("UICorner",{
CornerRadius=UDim.new(0,ad.Window.UICorner)
})
})
end

af.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3="Dialog",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,af.UIPadding),
PaddingLeft=UDim.new(0,af.UIPadding),
PaddingRight=UDim.new(0,af.UIPadding),
PaddingBottom=UDim.new(0,af.UIPadding),
})
})

af.UIElements.MainContainer=aa.NewRoundFrame(af.UICorner,"Squircle",{
Visible=false,

ImageTransparency=ae and 0.15 or 0,
Parent=ae and ad.Parent or af.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3="Dialog"
},
ZIndex=9999,
},{





af.UIElements.Main,



aa.NewRoundFrame(af.UICorner,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ThemeTag={
ImageColor3="Outline",
},
},{
ab("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

function af.Open(ag)
if not ae then
af.UIElements.FullScreen.Visible=true
af.UIElements.FullScreen.Active=true
end

task.spawn(function()
af.UIElements.MainContainer.Visible=true

if not ae then
ac(af.UIElements.FullScreen,0.1,{BackgroundTransparency=.3}):Play()
end
ac(af.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
af.UIElements.Main.Visible=true
end)
end)
end
function af.Close(ag)
if not ae then
ac(af.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
af.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(.1)
af.UIElements.FullScreen.Visible=false
end)
end
af.UIElements.Main.Visible=false

ac(af.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(.1)
if not ae then
af.UIElements.FullScreen:Destroy()
else
af.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return af
end

return ad end function a.j()
local aa={}


local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween

local ae=a.load'g'.New
local af=a.load'h'.New

function aa.new(ag,ah,ai)
local aj=a.load'i'.Init(nil,ag.WindUI.ScreenGui.KeySystem)
local ak=aj.Create(true)

local al={}

local am

local an=200

local ao=430
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
ao=430+(an/2)
end

ak.UIElements.Main.AutomaticSize="Y"
ak.UIElements.Main.Size=UDim2.new(0,ao,0,0)

local ap

if ag.Icon then

ap=ab.Image(
ag.Icon,
ag.Title..":"..ag.Icon,
0,
"Temp",
"KeySystem",
ag.IconThemed
)
ap.Size=UDim2.new(0,24,0,24)
ap.LayoutOrder=-1
end

local aq=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ag.Title,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})
local ar=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16
})

local as=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
ap,aq
})

local at=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





as,ar,
})

local au=af("Enter Key","key",nil,"Input",function(au)
am=au
end)

local av
if ag.KeySystem.Note and ag.KeySystem.Note~=""then
av=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.KeySystem.Note,
TextSize=18,
TextTransparency=.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local aw=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
})
})
})


local ax
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
local ay
if ag.KeySystem.Thumbnail.Title then
ay=ac("TextLabel",{
Text=ag.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ax=ac("ImageLabel",{
Image=ag.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,an,1,0),
Parent=ak.UIElements.Main,
ScaleType="Crop"
},{
ay,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,ax and-an or 0,1,0),
Position=UDim2.new(0,ax and an or 0,0,0),
BackgroundTransparency=1,
Parent=ak.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
at,
av,
au,
aw,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})





local ay=ae("Exit","log-out",function()
ak:Close()()
end,"Tertiary",aw.Frame)

if ax then
ay.Parent=ax
ay.Size=UDim2.new(0,0,0,42)
ay.Position=UDim2.new(0,16,1,-16)
ay.AnchorPoint=Vector2.new(0,1)
end

if ag.KeySystem.URL then
ae("Get key","key",function()
setclipboard(ag.KeySystem.URL)
end,"Secondary",aw.Frame)
end

if ag.KeySystem.API then








local az=240
local aA=false
local aB=ae("Get key","key",nil,"Secondary",aw.Frame)

local aC=ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,1,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.9,
})

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=aB.Frame,
},{
aC,
ac("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
})
})

local aD=ab.Image(
"chevron-down",
"chevron-down",
0,
"Temp",
"KeySystem",
true
)

aD.Size=UDim2.new(1,0,1,0)

ac("Frame",{
Size=UDim2.new(0,21,0,21),
Parent=aB.Frame,
BackgroundTransparency=1,
},{
aD
})

local aE=ab.NewRoundFrame(15,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Background",
},
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,5),
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
}),
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
})
})

local b=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,az,0,0),
ClipsDescendants=true,
AnchorPoint=Vector2.new(1,0),
Parent=aB,
Position=UDim2.new(1,0,1,15)
},{
aE
})

ac("TextLabel",{
Text="Select Service",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
Parent=aE,
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
})
})

for e,g in next,ag.KeySystem.API do
local h=ag.WindUI.Services[g.Type]
if h then
local i={}
for j,l in next,h.Args do
table.insert(i,g[l])
end

local m=h.New(table.unpack(i))
m.Type=g.Type
table.insert(al,m)

local p=ab.Image(
g.Icon or h.Icon or Icons[g.Type]or"user",
g.Icon or h.Icon or Icons[g.Type]or"user",
0,
"Temp",
"KeySystem",
true
)
p.Size=UDim2.new(0,24,0,24)

local v=ab.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=1,
Parent=aE,
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,10),
VerticalAlignment="Center",
}),
p,
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-34,0,0),
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
HorizontalAlignment="Center",
}),
ac("TextLabel",{
Text=g.Title or h.Name,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
TextSize=18,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
}),
ac("TextLabel",{
Text=g.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=g.Desc and true or false,
TextXAlignment="Left",
})
})
},true)

ab.AddSignal(v.MouseEnter,function()
ad(v,0.08,{ImageTransparency=.95}):Play()
end)
ab.AddSignal(v.InputEnded,function()
ad(v,0.08,{ImageTransparency=1}):Play()
end)
ab.AddSignal(v.MouseButton1Click,function()
m.Copy()
ag.WindUI:Notify{
Title="Key System",
Content="Key link copied to clipboard.",
Image="key",
}
end)
end
end

ab.AddSignal(aB.MouseButton1Click,function()
if not aA then
ad(b,.3,{Size=UDim2.new(0,az,0,aE.AbsoluteSize.Y+1)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aD,.3,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
else
ad(b,.25,{Size=UDim2.new(0,az,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aD,.25,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
aA=not aA
end)

end

local function handleSuccess(az)
ak:Close()()
writefile((ag.Folder or ag.Title).."/"..ah..".key",tostring(az))
task.wait(.4)
ai(true)
end

local az=ae("Submit","arrow-right",function()
local az=tostring(am or"empty")local aA=
ag.Folder or ag.Title

if not ag.KeySystem.API then
local aB=type(ag.KeySystem.Key)=="table"
and table.find(ag.KeySystem.Key,az)
or ag.KeySystem.Key==az

if aB then
if ag.KeySystem.SaveKey then
handleSuccess(az)
else
ak:Close()()
task.wait(.4)
ai(true)
end
end
else
local aB,aC
for aD,aE in next,al do
local b,e=aE.Verify(az)
if b then
aB,aC=true,e
break
end
aC=e
end

if aB then
handleSuccess(az)
else
ag.WindUI:Notify{
Title="Key System. Error",
Content=aC,
Icon="triangle-alert",
}
end
end
end,"Primary",aw)

az.AnchorPoint=Vector2.new(1,0.5)
az.Position=UDim2.new(1,0,0.5,0)










ak:Open()
end

return aa end function a.k()
local aa=a.load'a'
local ab=aa.New
local ac=aa.Tween

local ad={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=16,
UIPadding=14,
ButtonPadding=9,
Holder=nil,
NotificationIndex=0,
Notifications={}
}

function ad.Init(ae)
local af={
Lower=false
}

function af.SetLower(ag)
af.Lower=ag
af.Frame.Size=ag and ad.SizeLower or ad.Size
end

af.Frame=ab("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=ad.Size,
Parent=ae,
BackgroundTransparency=1,




},{
ab("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
ab("UIPadding",{
PaddingBottom=UDim.new(0,29)
})
})
return af
end

function ad.New(ae)
local af={
Title=ae.Title or"Notification",
Content=ae.Content or nil,
Icon=ae.Icon or nil,
IconThemed=ae.IconThemed,
Background=ae.Background,
BackgroundImageTransparency=ae.BackgroundImageTransparency,
Duration=ae.Duration or 5,
Buttons=ae.Buttons or{},
CanClose=true,
UIElements={},
Closed=false,
}
if af.CanClose==nil then
af.CanClose=true
end
ad.NotificationIndex=ad.NotificationIndex+1
ad.Notifications[ad.NotificationIndex]=af

local ag=ab("UICorner",{
CornerRadius=UDim.new(0,ad.UICorner),
})

local ah=ab("UIStroke",{
ThemeTag={
Color="Text"
},
Transparency=1,
Thickness=.6,
})

local ai

if af.Icon then





















ai=aa.Image(
af.Icon,
af.Title..":"..af.Icon,
0,
ae.Window,
"Notification",
af.IconThemed
)
ai.Size=UDim2.new(0,26,0,26)
ai.Position=UDim2.new(0,ad.UIPadding,0,ad.UIPadding)

end

local aj
if af.CanClose then
aj=ab("ImageButton",{
Image=aa.Icon"x"[1],
ImageRectSize=aa.Icon"x"[2].ImageRectSize,
ImageRectOffset=aa.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-ad.UIPadding,0,ad.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text"
}
},{
ab("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})
end

local ak=ab("Frame",{
Size=UDim2.new(1,0,0,3),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text",
},

})

local al=ab("Frame",{
Size=UDim2.new(1,
af.Icon and-28-ad.UIPadding or 0,
1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,ad.UIPadding),
PaddingLeft=UDim.new(0,ad.UIPadding),
PaddingRight=UDim.new(0,ad.UIPadding),
PaddingBottom=UDim.new(0,ad.UIPadding),
}),
ab("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-ad.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=16,
ThemeTag={
TextColor3="Text"
},
Text=af.Title,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold)
}),
ab("UIListLayout",{
Padding=UDim.new(0,ad.UIPadding/3)
})
})

if af.Content then
ab("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=15,
ThemeTag={
TextColor3="Text"
},
Text=af.Content,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Parent=al
})
end


local am=ab("CanvasGroup",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
BackgroundTransparency=.25,
ThemeTag={
BackgroundColor3="Accent"
},

},{
ab("ImageLabel",{
Name="Background",
Image=af.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=af.BackgroundImageTransparency

}),

ah,ag,
al,
ai,aj,
ak,

})

local an=ab("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=ae.Holder
},{
am
})

function af.Close(ao)
if not af.Closed then
af.Closed=true
ac(an,0.45,{Size=UDim2.new(1,0,0,-8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ac(am,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(.45)
an:Destroy()
end
end

task.spawn(function()
task.wait()
ac(an,0.45,{Size=UDim2.new(
1,
0,
0,
am.AbsoluteSize.Y
)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ac(am,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if af.Duration then
ac(ak,af.Duration,{Size=UDim2.new(0,0,0,3)},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
task.wait(af.Duration)
af:Close()
end
end)

if aj then
aa.AddSignal(aj.TextButton.MouseButton1Click,function()
af:Close()
end)
end


return af
end

return ad end function a.l()
local aa={}

local ab=a.load'a'
local ac=ab.New local ad=
ab.Tween


function aa.new(ae)
local af={
Title=ae.Title or"Dialog",
Content=ae.Content,
Icon=ae.Icon,
IconThemed=ae.IconThemed,
Thumbnail=ae.Thumbnail,
Buttons=ae.Buttons
}

local ag=a.load'i'.Init(nil,ae.WindUI.ScreenGui.Popups)
local ah=ag.Create(true)

local ai=200

local aj=430
if af.Thumbnail and af.Thumbnail.Image then
aj=430+(ai/2)
end

ah.UIElements.Main.AutomaticSize="Y"
ah.UIElements.Main.Size=UDim2.new(0,aj,0,0)



local ak

if af.Icon then
ak=ab.Image(
af.Icon,
af.Title..":"..af.Icon,
0,
ae.WindUI.Window,
"Popup",
ae.IconThemed
)
ak.Size=UDim2.new(0,22,0,22)
ak.LayoutOrder=-1
end


local al=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=af.Title,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})

local am=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
ak,al
})

local an=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





am,
})

local ao
if af.Content and af.Content~=""then
ao=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=af.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true
})
end

local ap=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local aq
if af.Thumbnail and af.Thumbnail.Image then
local ar
if af.Thumbnail.Title then
ar=ac("TextLabel",{
Text=af.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
aq=ac("ImageLabel",{
Image=af.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ai,1,0),
Parent=ah.UIElements.Main,
ScaleType="Crop"
},{
ar,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,aq and-ai or 0,1,0),
Position=UDim2.new(0,aq and ai or 0,0,0),
BackgroundTransparency=1,
Parent=ah.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
an,
ao,
ap,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local ar=a.load'g'.New

for as,at in next,af.Buttons do
ar(at.Title,at.Icon,at.Callback,at.Variant,ap,ah)
end

ah:Open()


return af
end

return aa end function a.m()
local aa={}

local ab=a.load'a'
local ac=ab.New local ad=
ab.Tween


function aa.New(ae,af,ag)
local ah=10
local ai
if af and af~=""then
ai=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local aj=ac("TextLabel",{
BackgroundTransparency=1,
TextSize=16,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ai and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3="Text",
},
Text=ae,
})

local ak=ac("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
Text="",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(ah,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
ab.NewRoundFrame(ah,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
ab.NewRoundFrame(ah,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ai,
aj,
})
})
})

return ak
end


return aa end function a.n()
local aa={}

local ab=game:GetService"UserInputService"

local ac=a.load'a'
local ad=ac.New local ae=
ac.Tween


function aa.New(af,ag,ah,ai)
local aj=ad("Frame",{
Size=UDim2.new(0,ai,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ag,
ZIndex=999,
Active=true,
})

local ak=ac.NewRoundFrame(ai/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=aj,
})

local al=ad("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=ak,
})

local am=false
local an=0

local function updateSliderSize()
local ao=af
local ap=ao.AbsoluteCanvasSize.Y
local aq=ao.AbsoluteWindowSize.Y

if ap<=aq then
ak.Visible=false
return
end

local ar=math.clamp(aq/ap,0.1,1)
ak.Size=UDim2.new(1,0,ar,0)
ak.Visible=true
end

local function updateScrollingFramePosition()
local ao=ak.Position.Y.Scale
local ap=af.AbsoluteCanvasSize.Y
local aq=af.AbsoluteWindowSize.Y
local ar=math.max(ap-aq,0)

if ar<=0 then return end

local as=math.max(1-ak.Size.Y.Scale,0)
if as<=0 then return end

local at=ao/as

af.CanvasPosition=Vector2.new(
af.CanvasPosition.X,
at*ar
)
end

local function updateThumbPosition()
if am then return end

local ao=af.CanvasPosition.Y
local ap=af.AbsoluteCanvasSize.Y
local aq=af.AbsoluteWindowSize.Y
local ar=math.max(ap-aq,0)

if ar<=0 then
ak.Position=UDim2.new(0,0,0,0)
return
end

local as=ao/ar
local at=math.max(1-ak.Size.Y.Scale,0)
local au=math.clamp(as*at,0,at)

ak.Position=UDim2.new(0,0,au,0)
end

ac.AddSignal(aj.InputBegan,function(ao)
if(ao.UserInputType==Enum.UserInputType.MouseButton1 or ao.UserInputType==Enum.UserInputType.Touch)then
local ap=ak.AbsolutePosition.Y
local aq=ap+ak.AbsoluteSize.Y

if not(ao.Position.Y>=ap and ao.Position.Y<=aq)then
local ar=aj.AbsolutePosition.Y
local as=aj.AbsoluteSize.Y
local at=ak.AbsoluteSize.Y

local au=ao.Position.Y-ar-at/2
local av=as-at

local aw=math.clamp(au/av,0,1-ak.Size.Y.Scale)

ak.Position=UDim2.new(0,0,aw,0)
updateScrollingFramePosition()
end
end
end)

ac.AddSignal(al.InputBegan,function(ao)
if ao.UserInputType==Enum.UserInputType.MouseButton1 or ao.UserInputType==Enum.UserInputType.Touch then
am=true
an=ao.Position.Y-ak.AbsolutePosition.Y

local ap
local aq

ap=ab.InputChanged:Connect(function(ar)
if ar.UserInputType==Enum.UserInputType.MouseMovement or ar.UserInputType==Enum.UserInputType.Touch then
local as=aj.AbsolutePosition.Y
local at=aj.AbsoluteSize.Y
local au=ak.AbsoluteSize.Y

local av=ar.Position.Y-as-an
local aw=at-au

local ax=math.clamp(av/aw,0,1-ak.Size.Y.Scale)

ak.Position=UDim2.new(0,0,ax,0)
updateScrollingFramePosition()
end
end)

aq=ab.InputEnded:Connect(function(ar)
if ar.UserInputType==Enum.UserInputType.MouseButton1 or ar.UserInputType==Enum.UserInputType.Touch then
am=false
if ap then ap:Disconnect()end
if aq then aq:Disconnect()end
end
end)
end
end)

ac.AddSignal(af:GetPropertyChangedSignal"AbsoluteWindowSize",function()
updateSliderSize()
updateThumbPosition()
end)

ac.AddSignal(af:GetPropertyChangedSignal"AbsoluteCanvasSize",function()
updateSliderSize()
updateThumbPosition()
end)

ac.AddSignal(af:GetPropertyChangedSignal"CanvasPosition",function()
if not am then
updateThumbPosition()
end
end)

updateSliderSize()
updateThumbPosition()

return aj
end


return aa end function a.o()
local aa={}


local ab=a.load'a'
local ac=ab.New

local function Color3ToHSB(ad)
local ae,af,ag=ad.R,ad.G,ad.B
local ah=math.max(ae,af,ag)
local ai=math.min(ae,af,ag)
local aj=ah-ai

local ak=0
if aj~=0 then
if ah==ae then
ak=(af-ag)/aj%6
elseif ah==af then
ak=(ag-ae)/aj+2
else
ak=(ae-af)/aj+4
end
ak=ak*60
else
ak=0
end

local al=(ah==0)and 0 or(aj/ah)
local am=ah

return{
h=math.floor(ak+0.5),
s=al,
b=am
}
end

local function GetPerceivedBrightness(ad)
local ae=ad.R
local af=ad.G
local ag=ad.B
return 0.299*ae+0.587*af+0.114*ag
end

local function GetTextColorForHSB(ad)
local ae=Color3ToHSB(ad)local
af, ag, ah=ae.h, ae.s, ae.b
if GetPerceivedBrightness(ad)>0.5 then
return Color3.fromHSV(af/360,0,0.05)
else
return Color3.fromHSV(af/360,0,0.98)
end
end


function aa.New(ad,ae,af)
local ag={
Title=ae.Title or"Tag",
Color=ae.Color or Color3.fromHex"#315dff",

TagFrame=nil,
Height=30,
Padding=12,
TextSize=16,
}

local ah=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ag.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ag.Title,
TextColor3=GetTextColorForHSB(ag.Color)
})

ab.NewRoundFrame(999,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ag.Height),
Parent=af,
ImageColor3=ag.Color,
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,ag.Padding),
PaddingRight=UDim.new(0,ag.Padding),
}),
ah,
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
})
})


return ag
end


return aa end function a.p()

local aa=game:GetService"HttpService"

local ab
ab={
Window=nil,
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(ac)
return{
__type=ac.__type,
value=ac.Default:ToHex(),
transparency=ac.Transparency or nil,
}
end,
Load=function(ac,ad)
if ac then
ac:Update(Color3.fromHex(ad.value),ad.transparency or nil)
end
end
},
Dropdown={
Save=function(ac)
return{
__type=ac.__type,
value=ac.Value,
}
end,
Load=function(ac,ad)
if ac then
ac:Select(ad.value)
end
end
},
Input={
Save=function(ac)
return{
__type=ac.__type,
value=ac.Value,
}
end,
Load=function(ac,ad)
if ac then
ac:Set(ad.value)
end
end
},
Keybind={
Save=function(ac)
return{
__type=ac.__type,
value=ac.Value,
}
end,
Load=function(ac,ad)
if ac then
ac:Set(ad.value)
end
end
},
Slider={
Save=function(ac)
return{
__type=ac.__type,
value=ac.Value.Default,
}
end,
Load=function(ac,ad)
if ac then
ac:Set(ad.value)
end
end
},
Toggle={
Save=function(ac)
return{
__type=ac.__type,
value=ac.Value,
}
end,
Load=function(ac,ad)
if ac then
ac:Set(ad.value)
end
end
},
}
}

function ab.Init(ac,ad)
if not ad.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
return false
end

ab.Window=ad
ab.Folder=ad.Folder
ab.Path="WindUI/"..tostring(ab.Folder).."/config/"


local ae=ab:AllConfigs()

for af,ag in next,ae do
if isfile(ag..".json")then
ab.Configs[ag]=readfile(ag..".json")
end
end


return ab
end

function ab.CreateConfig(ac,ad)
local ae={
Path=ab.Path..ad..".json",
Elements={},
CustomData={},
Version=1.1
}

if not ad then
return false,"No config file is selected"
end

function ae.Register(af,ag,ah)
ae.Elements[ag]=ah
end

function ae.Set(af,ag,ah)
ae.CustomData[ag]=ah
end

function ae.Get(af,ag)
return ae.CustomData[ag]
end

function ae.Save(af)
local ag={
__version=ae.Version,
__elements={},
__custom=ae.CustomData
}

for ah,ai in next,ae.Elements do
if ab.Parser[ai.__type]then
ag.__elements[tostring(ah)]=ab.Parser[ai.__type].Save(ai)
end
end

local aj=aa:JSONEncode(ag)
writefile(ae.Path,aj)
end

function ae.Load(af)
if not isfile(ae.Path)then
return false,"Config file does not exist"
end

local ag,ah=pcall(function()
return aa:JSONDecode(readfile(ae.Path))
end)

if not ag then
return false,"Failed to parse config file"
end

if not ah.__version then
local ai={
__version=ae.Version,
__elements=ah,
__custom={}
}
ah=ai
end

for ai,aj in next,(ah.__elements or{})do
if ae.Elements[ai]and ab.Parser[aj.__type]then
task.spawn(function()
ab.Parser[aj.__type].Load(ae.Elements[ai],aj)
end)
end
end

ae.CustomData=ah.__custom or{}

return ae.CustomData
end

function ae.GetData(af)
return{
elements=ae.Elements,
custom=ae.CustomData
}
end

ab.Configs[ad]=ae
return ae
end

function ab.AllConfigs(ac)
if not listfiles then return{}end

local ad={}
if not isfolder(ab.Path)then
makefolder(ab.Path)
return ad
end

for ae,af in next,listfiles(ab.Path)do
local ag=af:match"([^\\/]+)%.json$"
if ag then
table.insert(ad,ag)
end
end

return ad
end

function ab.GetConfig(ac,ad)
return ab.Configs[ad]
end

return ab end function a.q()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween

local ae=game:GetService"UserInputService"


function aa.New(af)
local ag={
Button=nil
}

local ah













local ai=ac("TextLabel",{
Text=af.Title,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local aj=ac("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
ac("ImageLabel",{
Image=ab.Icon"move"[1],
ImageRectOffset=ab.Icon"move"[2].ImageRectPosition,
ImageRectSize=ab.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
})
})
local ak=ac("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local al=ac("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=af.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})
local am=ac("TextButton",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=al,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{



ac("UICorner",{
CornerRadius=UDim.new(1,0)
}),
ac("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
ac("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
aj,
ak,

ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

ac("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
ah,
ac("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ai,
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

ag.Button=am



function ag.SetIcon(an,ao)
if ah then
ah:Destroy()
end
if ao then
ah=ab.Image(
ao,
af.Title,
0,
af.Folder,
"OpenButton",
true,
af.IconThemed
)
ah.Size=UDim2.new(0,22,0,22)
ah.LayoutOrder=-1
ah.Parent=ag.Button.TextButton
end
end

if af.Icon then
ag:SetIcon(af.Icon)
end



ab.AddSignal(am:GetPropertyChangedSignal"AbsoluteSize",function()
al.Size=UDim2.new(
0,am.AbsoluteSize.X,
0,am.AbsoluteSize.Y
)
end)

ab.AddSignal(am.TextButton.MouseEnter,function()
ad(am.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
ab.AddSignal(am.TextButton.MouseLeave,function()
ad(am.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local an=ab.Drag(al)


function ag.Visible(ao,ap)
al.Visible=ap
end

function ag.Edit(ao,ap)
local aq={
Title=ap.Title,
Icon=ap.Icon,
Enabled=ap.Enabled,
Position=ap.Position,
Draggable=ap.Draggable,
OnlyMobile=ap.OnlyMobile,
CornerRadius=ap.CornerRadius or UDim.new(1,0),
StrokeThickness=ap.StrokeThickness or 2,
Color=ap.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if aq.Enabled==false then
af.IsOpenButtonEnabled=false
end
if aq.Draggable==false and aj and ak then
aj.Visible=aq.Draggable
ak.Visible=aq.Draggable

if an then
an:Set(aq.Draggable)
end
end
if aq.Position and OpenButtonContainer then
OpenButtonContainer.Position=aq.Position

end

local ar=ae.KeyboardEnabled or not ae.TouchEnabled
aa.Visible=not aq.OnlyMobile or not ar

if not aa.Visible then return end

if ai then
if aq.Title then
ai.Text=aq.Title
ab:ChangeTranslationKey(ai,aq.Title)
elseif aq.Title==nil then

end
end

if aq.Icon then
ag:SetIcon(aq.Icon)
end

am.UIStroke.UIGradient.Color=aq.Color
if Glow then
Glow.UIGradient.Color=aq.Color
end

am.UICorner.CornerRadius=aq.CornerRadius
am.TextButton.UICorner.CornerRadius=UDim.new(aq.CornerRadius.Scale,aq.CornerRadius.Offset-4)
am.UIStroke.Thickness=aq.StrokeThickness
end

return ag
end



return aa end function a.r()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af)
local ag={
Container=nil,
ToolTipSize=16,
}

local ah=ac("TextLabel",{
AutomaticSize="XY",
TextWrapped=true,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=ae,
TextSize=17,
ThemeTag={
TextColor3="Text",
}
})

local ai=ac("UIScale",{
Scale=.9
})

local aj=ac("CanvasGroup",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=af,
GroupTransparency=1,
Visible=false
},{
ac("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=false
},{
ac("ImageLabel",{
Size=UDim2.new(0,ag.ToolTipSize,0,ag.ToolTipSize/2),
BackgroundTransparency=1,
Rotation=180,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Accent",
},
},{
ac("ImageLabel",{
Size=UDim2.new(0,ag.ToolTipSize,0,ag.ToolTipSize/2),
BackgroundTransparency=1,
LayoutOrder=99,
ImageTransparency=.9,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Text",
},
}),
}),
}),
ac("Frame",{
AutomaticSize="XY",
ThemeTag={
BackgroundColor3="Accent",
},

},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("Frame",{
ThemeTag={
BackgroundColor3="Text",
},
AutomaticSize="XY",
BackgroundTransparency=.9,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

ah,
ac("UIPadding",{
PaddingTop=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
}),
})
}),
ai,
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
ag.Container=aj

function ag.Open(ak)
aj.Visible=true

ad(aj,.16,{GroupTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ai,.18,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function ag.Close(ak)
ad(aj,.2,{GroupTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ai,.2,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.25)

aj.Visible=false
aj:Destroy()
end

return ag
end


return aa end function a.s()
local aa=a.load'a'
local ab=aa.New
local ac=aa.NewRoundFrame
local ad=aa.Tween

game:GetService"UserInputService"


return function(ae)
local af={
Title=ae.Title,
Desc=ae.Desc or nil,
Hover=ae.Hover,
Thumbnail=ae.Thumbnail,
ThumbnailSize=ae.ThumbnailSize or 80,
Image=ae.Image,
IconThemed=ae.IconThemed or false,
ImageSize=ae.ImageSize or 30,
Color=ae.Color,
Scalable=ae.Scalable,
Parent=ae.Parent,
UIPadding=14,
UICorner=14,
UIElements={}
}

local ag=af.ImageSize
local ah=af.ThumbnailSize
local ai=true


local aj=0

local ak
local al
if af.Thumbnail then
ak=aa.Image(
af.Thumbnail,
af.Title,
af.UICorner-3,
ae.Window.Folder,
"Thumbnail",
false,
af.IconThemed
)
ak.Size=UDim2.new(1,0,0,ah)
end
if af.Image then
al=aa.Image(
af.Image,
af.Title,
af.UICorner-3,
ae.Window.Folder,
"Image",
af.Color and true or false
)
if af.Color=="White"then
al.ImageLabel.ImageColor3=Color3.new(0,0,0)
elseif af.Color then
al.ImageLabel.ImageColor3=Color3.new(1,1,1)
end
al.Size=UDim2.new(0,ag,0,ag)

aj=ag
end

local function CreateText(am,an)
return ab("TextLabel",{
BackgroundTransparency=1,
Text=am or"",
TextSize=an=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not af.Color and(an=="Desc"and"Icon"or"Text")or nil,
},
TextColor3=af.Color and(af.Color=="White"and Color3.new(0,0,0)or af.Color~="White"and Color3.new(1,1,1))or nil,
TextTransparency=af.Color and(an=="Desc"and.3 or 0),
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium)
})
end

local am=CreateText(af.Title,"Title")
local an=CreateText(af.Desc,"Desc")
if not af.Desc or af.Desc==""then
an.Visible=false
end

af.UIElements.Container=ab("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
ak,
ab("Frame",{
Size=UDim2.new(1,-ae.TextOffset,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
al,
ab("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,-aj,0,(50-(af.UIPadding*2)))
},{
ab("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
am,
an
}),
})
})

af.UIElements.Locked=ac(af.UICorner,"Squircle",{
Size=UDim2.new(1,af.UIPadding*2,1,af.UIPadding*2),
ImageTransparency=.4,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
ZIndex=9999999,
})

af.UIElements.Main=ac(af.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,50),
AutomaticSize="Y",
ImageTransparency=af.Color and.1 or.95,



Parent=ae.Parent,
ThemeTag={
ImageColor3=not af.Color and"Text"or nil
},
ImageColor3=af.Color and Color3.fromHex(aa.Colors[af.Color])or nil
},{
af.UIElements.Container,
af.UIElements.Locked,
ab("UIPadding",{
PaddingTop=UDim.new(0,af.UIPadding),
PaddingLeft=UDim.new(0,af.UIPadding),
PaddingRight=UDim.new(0,af.UIPadding),
PaddingBottom=UDim.new(0,af.UIPadding),
}),
},true)

if af.Hover then
aa.AddSignal(af.UIElements.Main.MouseEnter,function()
if ai then
ad(af.UIElements.Main,.05,{ImageTransparency=af.Color and.15 or.9}):Play()
end
end)
aa.AddSignal(af.UIElements.Main.InputEnded,function()
if ai then
ad(af.UIElements.Main,.05,{ImageTransparency=af.Color and.1 or.95}):Play()
end
end)
end

function af.SetTitle(ao,ap)
am.Text=ap
end

function af.SetDesc(ao,ap)
an.Text=ap or""
if not ap then
an.Visible=false
elseif not an.Visible then
an.Visible=true
end
end






function af.Destroy(ao)
af.UIElements.Main:Destroy()
end


function af.Lock(ao)
ai=false
af.UIElements.Locked.Active=true
af.UIElements.Locked.Visible=true
end

function af.Unlock(ao)
ai=true
af.UIElements.Locked.Active=false
af.UIElements.Locked.Visible=false
end





return af
end end function a.t()
local aa=a.load'a'
local ab=aa.New

local ac={}

function ac.New(ad,ae)
local af={
__type="Button",
Title=ae.Title or"Button",
Desc=ae.Desc or nil,
Locked=ae.Locked or false,
Callback=ae.Callback or function()end,
UIElements={}
}

local ag=true

af.ButtonFrame=a.load's'{
Title=af.Title,
Desc=af.Desc,
Parent=ae.Parent,




Window=ae.Window,
TextOffset=20,
Hover=true,
Scalable=true,
}

af.UIElements.ButtonIcon=ab("ImageLabel",{
Image=aa.Icon"mouse-pointer-click"[1],
ImageRectOffset=aa.Icon"mouse-pointer-click"[2].ImageRectPosition,
ImageRectSize=aa.Icon"mouse-pointer-click"[2].ImageRectSize,
BackgroundTransparency=1,
Parent=af.ButtonFrame.UIElements.Main,
Size=UDim2.new(0,20,0,20),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ThemeTag={
ImageColor3="Text"
}
})

function af.Lock(ah)
ag=false
return af.ButtonFrame:Lock()
end
function af.Unlock(ah)
ag=true
return af.ButtonFrame:Unlock()
end

if af.Locked then
af:Lock()
end

aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if ag then
task.spawn(function()
aa.SafeCallback(af.Callback)
end)
end
end)
return af.__type,af
end

return ac end function a.u()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah)
local ai={}


local aj=13
local ak
if af and af~=""then
ak=ac("ImageLabel",{
Size=UDim2.new(1,-7,1,-7),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(af)[1],
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local al=ab.NewRoundFrame(aj,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=ag,
Size=UDim2.new(0,42,0,26),
},{
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),


ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(0,3,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=0,
ImageColor3=Color3.new(1,1,1),
Name="Frame",
},{
ak,
})
})

function ai.Set(am,an)
if an then
ad(al.Frame,0.1,{
Position=UDim2.new(1,-22,0.5,0),

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al.Layer,0.1,{
ImageTransparency=0,
}):Play()
ad(al.Stroke,0.1,{
ImageTransparency=0.95,
}):Play()

if ak then
ad(ak,0.1,{
ImageTransparency=0,
}):Play()
end
else
ad(al.Frame,0.1,{
Position=UDim2.new(0,4,0.5,0),
Size=UDim2.new(0,18,0,18),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al.Layer,0.1,{
ImageTransparency=1,
}):Play()
ad(al.Stroke,0.1,{
ImageTransparency=1,
}):Play()

if ak then
ad(ak,0.1,{
ImageTransparency=1,
}):Play()
end
end

task.spawn(function()
if ah then
ab.SafeCallback(ah,an)
end
end)


end

return al,ai
end


return aa end function a.v()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah)
local ai={}

af=af or"check"

local aj=10
local ak=ac("ImageLabel",{
Size=UDim2.new(1,-10,1,-10),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(af)[1],
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(1,1,1),
})

local al=ab.NewRoundFrame(aj,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=ag,
Size=UDim2.new(0,27,0,27),
},{
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),

ak,
})

function ai.Set(am,an)
if an then
ad(al.Layer,0.06,{
ImageTransparency=0,
}):Play()
ad(al.Stroke,0.06,{
ImageTransparency=0.95,
}):Play()
ad(ak,0.06,{
ImageTransparency=0,
}):Play()
else
ad(al.Layer,0.05,{
ImageTransparency=1,
}):Play()
ad(al.Stroke,0.05,{
ImageTransparency=1,
}):Play()
ad(ak,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if ah then
ab.SafeCallback(ah,an)
end
end)
end

return al,ai
end


return aa end function a.w()
local aa=a.load'a'local ab=
aa.New local ac=
aa.Tween

local ad=a.load'u'.New
local ae=a.load'v'.New

local af={}

function af.New(ag,ah)
local ai={
__type="Toggle",
Title=ah.Title or"Toggle",
Desc=ah.Desc or nil,
Value=ah.Value,
Icon=ah.Icon or nil,
Type=ah.Type or"Toggle",
Callback=ah.Callback or function()end,
UIElements={}
}
ai.ToggleFrame=a.load's'{
Title=ai.Title,
Desc=ai.Desc,




Window=ah.Window,
Parent=ah.Parent,
TextOffset=44,
Hover=false,
}

local aj=true

if ai.Value==nil then
ai.Value=false
end



function ai.Lock(ak)
aj=false
return ai.ToggleFrame:Lock()
end
function ai.Unlock(ak)
aj=true
return ai.ToggleFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ak=ai.Value

local al,am
if ai.Type=="Toggle"then
al,am=ad(ak,ai.Icon,ai.ToggleFrame.UIElements.Main,ai.Callback)
elseif ai.Type=="Checkbox"then
al,am=ae(ak,ai.Icon,ai.ToggleFrame.UIElements.Main,ai.Callback)
else
error("Unknown Toggle Type: "..tostring(ai.Type))
end

al.AnchorPoint=Vector2.new(1,0.5)
al.Position=UDim2.new(1,0,0.5,0)

function ai.Set(an,ao)
if aj then
am:Set(ao)
ak=ao
ai.Value=ao
end
end

ai:Set(ak)

aa.AddSignal(ai.ToggleFrame.UIElements.Main.MouseButton1Click,function()
ai:Set(not ak)
end)

return ai.__type,ai
end

return af end function a.x()
local aa=a.load'a'
local ac=aa.New
local ad=aa.Tween

local ae={}

local af=false

function ae.New(ag,ah)
local ai={
__type="Slider",
Title=ah.Title or"Slider",
Desc=ah.Desc or nil,
Locked=ah.Locked or nil,
Value=ah.Value or{},
Step=ah.Step or 1,
Callback=ah.Callback or function()end,
UIElements={},
IsFocusing=false,
}
local aj
local ak
local al
local am=ai.Value.Default or ai.Value.Min or 0

local an=am
local ao=(am-(ai.Value.Min or 0))/((ai.Value.Max or 100)-(ai.Value.Min or 0))

local ap=true
local aq=ai.Step%1~=0

local function FormatValue(ar)
if aq then
return string.format("%.2f",ar)
else
return tostring(math.floor(ar+0.5))
end
end

local function CalculateValue(ar)
if aq then
return math.floor(ar/ai.Step+0.5)*ai.Step
else
return math.floor(ar/ai.Step+0.5)*ai.Step
end
end

ai.SliderFrame=a.load's'{
Title=ai.Title,
Desc=ai.Desc,
Parent=ah.Parent,
TextOffset=0,
Hover=false,
}

ai.UIElements.SliderIcon=aa.NewRoundFrame(99,"Squircle",{
ImageTransparency=.95,
Size=UDim2.new(1,-68,0,4),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
aa.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(ao,0,1,0),
ImageTransparency=.1,
ThemeTag={
ImageColor3="Button",
},
},{
aa.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,13,0,13),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Text",
},
})
})
})

ai.UIElements.SliderContainer=ac("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Parent=ai.SliderFrame.UIElements.Container,
},{
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ai.UIElements.SliderIcon,
ac("TextBox",{
Size=UDim2.new(0,60,0,0),
TextXAlignment="Left",
Text=FormatValue(am),
ThemeTag={
TextColor3="Text"
},
TextTransparency=.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
})
})

function ai.Lock(ar)
ap=false
return ai.SliderFrame:Lock()
end
function ai.Unlock(ar)
ap=true
return ai.SliderFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

function ai.Set(ar,as,at)
if ap then
if not ai.IsFocusing and not af and(not at or(at.UserInputType==Enum.UserInputType.MouseButton1 or at.UserInputType==Enum.UserInputType.Touch))then
as=math.clamp(as,ai.Value.Min or 0,ai.Value.Max or 100)

local au=math.clamp((as-(ai.Value.Min or 0))/((ai.Value.Max or 100)-(ai.Value.Min or 0)),0,1)
as=CalculateValue(ai.Value.Min+au*(ai.Value.Max-ai.Value.Min))

if as~=an then
ad(ai.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(au,0,1,0)}):Play()
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(as)
ai.Value.Default=FormatValue(as)
an=as
aa.SafeCallback(ai.Callback,FormatValue(as))
end

if at then
aj=(at.UserInputType==Enum.UserInputType.Touch)
ai.SliderFrame.Parent.ScrollingEnabled=false
af=true
ak=game:GetService"RunService".RenderStepped:Connect(function()
local av=aj and at.Position.X or game:GetService"UserInputService":GetMouseLocation().X
local aw=math.clamp((av-ai.UIElements.SliderIcon.AbsolutePosition.X)/ai.UIElements.SliderIcon.AbsoluteSize.X,0,1)
as=CalculateValue(ai.Value.Min+aw*(ai.Value.Max-ai.Value.Min))

if as~=an then
ad(ai.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(aw,0,1,0)}):Play()
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(as)
ai.Value.Default=FormatValue(as)
an=as
aa.SafeCallback(ai.Callback,FormatValue(as))
end
end)
al=game:GetService"UserInputService".InputEnded:Connect(function(av)
if(av.UserInputType==Enum.UserInputType.MouseButton1 or av.UserInputType==Enum.UserInputType.Touch)and at==av then
ak:Disconnect()
al:Disconnect()
af=false
ai.SliderFrame.Parent.ScrollingEnabled=true
end
end)
end
end
end
end

aa.AddSignal(ai.UIElements.SliderContainer.TextBox.FocusLost,function(ar)
if ar then
local as=tonumber(ai.UIElements.SliderContainer.TextBox.Text)
if as then
ai:Set(as)
else
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(an)
end
end
end)

aa.AddSignal(ai.UIElements.SliderContainer.InputBegan,function(ar)
ai:Set(am,ar)
end)

return ai.__type,ai
end

return ae end function a.y()
local aa=game:GetService"UserInputService"

local ac=a.load'a'
local ad=ac.New local ae=
ac.Tween

local af={
UICorner=6,
UIPadding=8,
}

local ag=a.load'm'.New

function af.New(ah,ai)
local aj={
__type="Keybind",
Title=ai.Title or"Keybind",
Desc=ai.Desc or nil,
Locked=ai.Locked or false,
Value=ai.Value or"F",
Callback=ai.Callback or function()end,
CanChange=ai.CanChange or true,
Picking=false,
UIElements={},
}

local ak=true

aj.KeybindFrame=a.load's'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=85,
Hover=aj.CanChange,
}

aj.UIElements.Keybind=ag(aj.Value,nil,aj.KeybindFrame.UIElements.Main)

aj.UIElements.Keybind.Size=UDim2.new(
0,24
+aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
aj.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
aj.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)

ad("UIScale",{
Parent=aj.UIElements.Keybind,
Scale=.85,
})

ac.AddSignal(aj.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",function()
aj.UIElements.Keybind.Size=UDim2.new(
0,24
+aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
end)

function aj.Lock(al)
ak=false
return aj.KeybindFrame:Lock()
end
function aj.Unlock(al)
ak=true
return aj.KeybindFrame:Unlock()
end

function aj.Set(al,am)
aj.Value=am
aj.UIElements.Keybind.Frame.Frame.TextLabel.Text=am
end

if aj.Locked then
aj:Lock()
end

ac.AddSignal(aj.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if ak then
if aj.CanChange then
aj.Picking=true
aj.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."

task.wait(0.2)

local al
al=aa.InputBegan:Connect(function(am)
local an

if am.UserInputType==Enum.UserInputType.Keyboard then
an=am.KeyCode.Name
elseif am.UserInputType==Enum.UserInputType.MouseButton1 then
an="MouseLeft"
elseif am.UserInputType==Enum.UserInputType.MouseButton2 then
an="MouseRight"
end

local ao
ao=aa.InputEnded:Connect(function(ap)
if ap.KeyCode.Name==an or an=="MouseLeft"and ap.UserInputType==Enum.UserInputType.MouseButton1 or an=="MouseRight"and ap.UserInputType==Enum.UserInputType.MouseButton2 then
aj.Picking=false

aj.UIElements.Keybind.Frame.Frame.TextLabel.Text=an
aj.Value=an

al:Disconnect()
ao:Disconnect()
end
end)
end)
end
end
end)
ac.AddSignal(aa.InputBegan,function(al)
if ak then
if al.KeyCode.Name==aj.Value then
ac.SafeCallback(aj.Callback,al.KeyCode.Name)
end
end
end)
return aj.__type,aj
end

return af end function a.z()
local aa=a.load'a'
local ac=aa.New local ad=
aa.Tween

local ae={
UICorner=8,
UIPadding=8,
}local af=a.load'g'


.New
local ag=a.load'h'.New

function ae.New(ah,ai)
local aj={
__type="Input",
Title=ai.Title or"Input",
Desc=ai.Desc or nil,
Type=ai.Type or"Input",
Locked=ai.Locked or false,
InputIcon=ai.InputIcon or false,
Placeholder=ai.Placeholder or"Enter Text...",
Value=ai.Value or"",
Callback=ai.Callback or function()end,
ClearTextOnFocus=ai.ClearTextOnFocus or false,
UIElements={},
}

local ak=true

aj.InputFrame=a.load's'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=0,
Hover=false,
}

local al=ag(aj.Placeholder,aj.InputIcon,aj.InputFrame.UIElements.Container,aj.Type,function(al)
aj:Set(al)
end)
al.Size=UDim2.new(1,0,0,aj.Type=="Input"and 42 or 148)

ac("UIScale",{
Parent=al,
Scale=1,
})

function aj.Lock(am)
ak=false
return aj.InputFrame:Lock()
end
function aj.Unlock(am)
ak=true
return aj.InputFrame:Unlock()
end


function aj.Set(am,an)
if ak then
aa.SafeCallback(aj.Callback,an)

al.Frame.Frame.TextBox.Text=an
aj.Value=an
end
end
function aj.SetPlaceholder(am,an)
al.Frame.Frame.TextBox.PlaceholderText=an
aj.Placeholder=an
end

aj:Set(aj.Value)

if aj.Locked then
aj:Lock()
end

return aj.__type,aj
end

return ae end function a.A()
local aa=game:GetService"UserInputService"
local ac=game:GetService"Players".LocalPlayer:GetMouse()
local ae=game:GetService"Workspace".CurrentCamera

local af=a.load'a'
local ag=af.New
local ah=af.Tween

local ai=a.load'm'.New

local aj={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
}

function aj.New(ak,al)
local am={
__type="Dropdown",
Title=al.Title or"Dropdown",
Desc=al.Desc or nil,
Locked=al.Locked or false,
Values=al.Values or{},
MenuWidth=al.MenuWidth or 170,
Value=al.Value,
AllowNone=al.AllowNone,
Multi=al.Multi,
Callback=al.Callback or function()end,

UIElements={},

Opened=false,
Tabs={}
}

if am.Multi and not am.Value then
am.Value={}
end

local an=true

am.DropdownFrame=a.load's'{
Title=am.Title,
Desc=am.Desc,
Parent=al.Parent,
TextOffset=0,
Hover=false,
}


am.UIElements.Dropdown=ai("",nil,am.DropdownFrame.UIElements.Container)

am.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
am.UIElements.Dropdown.Frame.Frame.TextLabel.Size=UDim2.new(1,am.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

am.UIElements.Dropdown.Size=UDim2.new(1,0,0,40)






ag("ImageLabel",{
Image=af.Icon"chevrons-up-down"[1],
ImageRectOffset=af.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=af.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-12,0.5,0),
ThemeTag={
ImageColor3="Icon"
},
AnchorPoint=Vector2.new(1,0.5),
Parent=am.UIElements.Dropdown.Frame
})

am.UIElements.UIListLayout=ag("UIListLayout",{
Padding=UDim.new(0,aj.MenuPadding),
FillDirection="Vertical"
})

am.UIElements.Menu=af.NewRoundFrame(aj.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="Background",
},
ImageTransparency=0.05,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,aj.MenuPadding),
PaddingLeft=UDim.new(0,aj.MenuPadding),
PaddingRight=UDim.new(0,aj.MenuPadding),
PaddingBottom=UDim.new(0,aj.MenuPadding),
}),
ag("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),

ClipsDescendants=true
},{
ag("UICorner",{
CornerRadius=UDim.new(0,aj.MenuCorner-aj.MenuPadding),
}),
ag("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
am.UIElements.UIListLayout,
})
})
})

am.UIElements.MenuCanvas=ag("Frame",{
Size=UDim2.new(0,am.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=al.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
am.UIElements.Menu,






ag("UISizeConstraint",{
MinSize=Vector2.new(170,0)
})
})

function am.Lock(ao)
an=false
return am.DropdownFrame:Lock()
end
function am.Unlock(ao)
an=true
return am.DropdownFrame:Unlock()
end

if am.Locked then
am:Lock()
end

local function RecalculateCanvasSize()
am.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,am.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
if#am.Values>10 then
am.UIElements.MenuCanvas.Size=UDim2.fromOffset(am.UIElements.MenuCanvas.AbsoluteSize.X,392)
else
am.UIElements.MenuCanvas.Size=UDim2.fromOffset(am.UIElements.MenuCanvas.AbsoluteSize.X,am.UIElements.UIListLayout.AbsoluteContentSize.Y+(aj.MenuPadding*2))
end
end

function UpdatePosition()
local ao=am.UIElements.Dropdown
local ap=am.UIElements.MenuCanvas

local aq=ae.ViewportSize.Y-(ao.AbsolutePosition.Y+ao.AbsoluteSize.Y)-aj.MenuPadding-54
local ar=ap.AbsoluteSize.Y+aj.MenuPadding

local as=-54
if aq<ar then
as=ar-aq-54
end

ap.Position=UDim2.new(
0,
ao.AbsolutePosition.X+ao.AbsoluteSize.X,
0,
ao.AbsolutePosition.Y+ao.AbsoluteSize.Y-as+aj.MenuPadding
)
end



function am.Display(ao)
local ap=am.Values
local aq=""

if am.Multi then
for ar,as in next,ap do
if table.find(am.Value,as)then
aq=aq..as..", "
end
end
aq=aq:sub(1,#aq-2)
else
aq=am.Value or""
end

am.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(aq==""and"--"or aq)
end

function am.Refresh(ao,ap)
for aq,ar in next,am.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not ar:IsA"UIListLayout"then
ar:Destroy()
end
end

am.Tabs={}

for as,at in next,ap do

local au={
Name=at,
Selected=false,
UIElements={},
}
au.UIElements.TabItem=af.NewRoundFrame(aj.MenuCorner-aj.MenuPadding,"Squircle",{
Size=UDim2.new(1,0,0,34),

ImageTransparency=1,
Parent=am.UIElements.Menu.Frame.ScrollingFrame,

ImageColor3=Color3.new(1,1,1),

},{
af.NewRoundFrame(aj.MenuCorner-aj.MenuPadding,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
Name="Highlight",
},{
ag("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ag("UIPadding",{

PaddingLeft=UDim.new(0,aj.TabPadding),
PaddingRight=UDim.new(0,aj.TabPadding),

}),
ag("UICorner",{
CornerRadius=UDim.new(0,aj.MenuCorner-aj.MenuPadding)
}),













ag("TextLabel",{
Text=at,
TextXAlignment="Left",
FontFace=Font.new(af.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=.4,
AutomaticSize="Y",

Size=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
})
})
},true)


if am.Multi then
au.Selected=table.find(am.Value or{},au.Name)
else
au.Selected=am.Value==au.Name
end

if au.Selected then
au.UIElements.TabItem.ImageTransparency=.95
au.UIElements.TabItem.Highlight.ImageTransparency=.75


au.UIElements.TabItem.Frame.TextLabel.TextTransparency=0.05
end

am.Tabs[as]=au

am:Display()

local function Callback()
am:Display()
task.spawn(function()
af.SafeCallback(am.Callback,am.Value)
end)
end

af.AddSignal(au.UIElements.TabItem.MouseButton1Click,function()
if am.Multi then
if not au.Selected then
au.Selected=true
ah(au.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
ah(au.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

ah(au.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0}):Play()
table.insert(am.Value,au.Name)
else
if not am.AllowNone and#am.Value==1 then
return
end
au.Selected=false
ah(au.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
ah(au.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

ah(au.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.4}):Play()
for av,aw in ipairs(am.Value)do
if aw==au.Name then
table.remove(am.Value,av)
break
end
end
end
else
for av,aw in next,am.Tabs do

ah(aw.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
ah(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

ah(aw.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.5}):Play()
aw.Selected=false
end
au.Selected=true
ah(au.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
ah(au.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

ah(au.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0.05}):Play()
am.Value=au.Name
end
Callback()
end)

RecalculateCanvasSize()
RecalculateListSize()
end

local au=0
for av,aw in next,am.Tabs do
if aw.UIElements.TabItem.Frame.TextLabel then

local ax=aw.UIElements.TabItem.Frame.TextLabel.TextBounds.X
au=math.max(au,ax)
end
end

am.UIElements.MenuCanvas.Size=UDim2.new(0,au+6+6+5+5+18+6+6,am.UIElements.MenuCanvas.Size.Y.Scale,am.UIElements.MenuCanvas.Size.Y.Offset)

end


am:Refresh(am.Values)

function am.Select(ao,ap)
if ap then
am.Value=ap
else
if am.Multi then
am.Value={}
else
am.Value=nil

end
end
am:Refresh(am.Values)
end


RecalculateListSize()

function am.Open(ao)
if an then
am.UIElements.Menu.Visible=true
am.UIElements.MenuCanvas.Visible=true
am.UIElements.MenuCanvas.Active=true
am.UIElements.Menu.Size=UDim2.new(
1,0,
0,0
)
ah(am.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
1,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(.1)
am.Opened=true
end)




UpdatePosition()
end
end
function am.Close(ao)
am.Opened=false

ah(am.UIElements.Menu,0.25,{
Size=UDim2.new(
1,0,
0,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()


task.spawn(function()
task.wait(.2)
am.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(.25)
am.UIElements.MenuCanvas.Visible=false
am.UIElements.MenuCanvas.Active=false
end)
end

af.AddSignal(am.UIElements.Dropdown.MouseButton1Click,function()
am:Open()
end)

af.AddSignal(aa.InputBegan,function(ao)
if
ao.UserInputType==Enum.UserInputType.MouseButton1
or ao.UserInputType==Enum.UserInputType.Touch
then
local ap,ar=am.UIElements.MenuCanvas.AbsolutePosition,am.UIElements.MenuCanvas.AbsoluteSize
if
al.Window.CanDropdown
and am.Opened
and(ac.X<ap.X
or ac.X>ap.X+ar.X
or ac.Y<(ap.Y-20-1)
or ac.Y>ap.Y+ar.Y
)
then
am:Close()
end
end
end)

af.AddSignal(am.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition",UpdatePosition)

return am.__type,am
end

return aj end function a.B()






local aa={}
local ac={
lua={
"and","break","or","else","elseif","if","then","until","repeat","while","do","for","in","end",
"local","return","function","export",
},
rbx={
"game","workspace","script","math","string","table","task","wait","select","next","Enum",
"tick","assert","shared","loadstring","tonumber","tostring","type",
"typeof","unpack","Instance","CFrame","Vector3","Vector2","Color3","UDim","UDim2","Ray","BrickColor",
"OverlapParams","RaycastParams","Axes","Random","Region3","Rect","TweenInfo",
"collectgarbage","not","utf8","pcall","xpcall","_G","setmetatable","getmetatable","os","pairs","ipairs"
},
operators={
"#","+","-","*","%","/","^","=","~","=","<",">",
}
}

local ae={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(af)
local ag={}
for ah,ai in ipairs(af)do
ag[ai]=true
end
return ag
end

local af=createKeywordSet(ac.lua)
local ag=createKeywordSet(ac.rbx)
local ah=createKeywordSet(ac.operators)

local function getHighlight(ai,aj)
local ak=ai[aj]

if ae[ak.."_color"]then
return ae[ak.."_color"]
end

if tonumber(ak)then
return ae.numbers
elseif ak=="nil"then
return ae.null
elseif ak:sub(1,2)=="--"then
return ae.comment
elseif ah[ak]then
return ae.operator
elseif af[ak]then
return ae.lua
elseif ag[ak]then
return ae.rbx
elseif ak:sub(1,1)=="\""or ak:sub(1,1)=="\'"then
return ae.str
elseif ak=="true"or ak=="false"then
return ae.boolean
end

if ai[aj+1]=="("then
if ai[aj-1]==":"then
return ae.self_call
end

return ae.call
end

if ai[aj-1]=="."then
if ai[aj-2]=="Enum"then
return ae.rbx
end

return ae.local_property
end
end

function aa.run(ai)
local aj={}
local ak=""

local al=false
local am=false
local an=false

for ao=1,#ai do
local ap=ai:sub(ao,ao)

if am then
if ap=="\n"and not an then
table.insert(aj,ak)
table.insert(aj,ap)
ak=""

am=false
elseif ai:sub(ao-1,ao)=="]]"and an then
ak..="]"

table.insert(aj,ak)
ak=""

am=false
an=false
else
ak=ak..ap
end
elseif al then
if ap==al and ai:sub(ao-1,ao-1)~="\\"or ap=="\n"then
ak=ak..ap
al=false
else
ak=ak..ap
end
else
if ai:sub(ao,ao+1)=="--"then
table.insert(aj,ak)
ak="-"
am=true
an=ai:sub(ao+2,ao+3)=="[["
elseif ap=="\""or ap=="\'"then
table.insert(aj,ak)
ak=ap
al=ap
elseif ah[ap]then
table.insert(aj,ak)
table.insert(aj,ap)
ak=""
elseif ap:match"[%w_]"then
ak=ak..ap
else
table.insert(aj,ak)
table.insert(aj,ap)
ak=""
end
end
end

table.insert(aj,ak)

local ao={}

for ap,ar in ipairs(aj)do
local as=getHighlight(aj,ap)

if as then
local at=string.format("<font color = \"#%s\">%s</font>",as:ToHex(),ar:gsub("<","&lt;"):gsub(">","&gt;"))

table.insert(ao,at)
else
table.insert(ao,ar)
end
end

return table.concat(ao)
end

return aa end function a.C()
local aa={}

local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'B'

function aa.New(ah,ai,aj,ak,al)
local am={
Radius=12,
Padding=10
}

local an=ae("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=14,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,am.Padding+3),
PaddingLeft=UDim.new(0,am.Padding+3),
PaddingRight=UDim.new(0,am.Padding+3),
PaddingBottom=UDim.new(0,am.Padding+3),
})
})
an.Font="Code"

local ao=ae("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize="X",
ScrollingDirection="X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
an
})

local ap=ae("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,30,0,30),
Position=UDim2.new(1,-am.Padding/2,0,am.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=ak and true or false,
},{
ac.NewRoundFrame(am.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
ae("UIScale",{
Scale=1,
}),
ae("ImageLabel",{
Image=ac.Icon"copy"[1],
ImageRectSize=ac.Icon"copy"[2].ImageRectSize,
ImageRectOffset=ac.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.1,
})
})
})

ac.AddSignal(ap.MouseEnter,function()
af(ap.Button,.05,{ImageTransparency=.95}):Play()
af(ap.Button.UIScale,.05,{Scale=.9}):Play()
end)
ac.AddSignal(ap.InputEnded,function()
af(ap.Button,.08,{ImageTransparency=1}):Play()
af(ap.Button.UIScale,.08,{Scale=1}):Play()
end)

ac.NewRoundFrame(am.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=.035,
Size=UDim2.new(1,0,0,20+(am.Padding*2)),
AutomaticSize="Y",
Parent=aj,
},{
ac.NewRoundFrame(am.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.955,
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
},{
ac.NewRoundFrame(am.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.96,
Size=UDim2.new(1,0,0,20+(am.Padding*2)),
Visible=ai and true or false
},{
ae("ImageLabel",{
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Image="rbxassetid://132464694294269",



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.2,
}),
ae("TextLabel",{
Text=ai,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=.2,
TextSize=16,
AutomaticSize="Y",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,ap and-20-(am.Padding*2),0,0)
}),
ae("UIPadding",{

PaddingLeft=UDim.new(0,am.Padding+3),
PaddingRight=UDim.new(0,am.Padding+3),

}),
ae("UIListLayout",{
Padding=UDim.new(0,am.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ao,
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
})
}),
ap,
})

ac.AddSignal(an:GetPropertyChangedSignal"TextBounds",function()
ao.Size=UDim2.new(1,0,0,(an.TextBounds.Y/(al or 1))+((am.Padding+3)*2))
end)

function am.Set(ar)
an.Text=ag.run(ar)
end

am.Set(ah)

ac.AddSignal(ap.MouseButton1Click,function()
if ak then
ak()
local ar=ac.Icon"check"
ap.Button.ImageLabel.Image=ar[1]
ap.Button.ImageLabel.ImageRectSize=ar[2].ImageRectSize
ap.Button.ImageLabel.ImageRectOffset=ar[2].ImageRectPosition
end
end)
return am
end


return aa end function a.D()
local aa=a.load'a'local ac=
aa.New


local ae=a.load'C'

local af={}

function af.New(ag,ah)
local ai={
__type="Code",
Title=ah.Title,
Code=ah.Code,
UIElements={}
}

local aj=not ai.Locked











local ak=ae.New(ai.Code,ai.Title,ah.Parent,function()
if aj then
local ak=ai.Title or"code"
local al,am=pcall(function()
toclipboard(ai.Code)
end)
if al then
ah.WindUI:Notify{
Title="Success",
Content="The "..ak.." copied to your clipboard.",
Icon="check",
Duration=5,
}
else
ah.WindUI:Notify{
Title="Error",
Content="The "..ak.." is not copied. Error: "..am,
Icon="x",
Duration=5,
}
end
end
end,ah.WindUI.UIScale)

function ai.SetCode(al,am)
ak.Set(am)
end

return ai.__type,ai
end

return af end function a.E()
local aa=a.load'a'
local ac=aa.New local ae=
aa.Tween

local af=game:GetService"UserInputService"
game:GetService"TouchInputService"
local ag=game:GetService"RunService"
local ah=game:GetService"Players"

local ai=ag.RenderStepped
local aj=ah.LocalPlayer
local ak=aj:GetMouse()

local al=a.load'g'.New
local am=a.load'h'.New

local an={
UICorner=8,
UIPadding=8
}

function an.Colorpicker(ao,ap,ar)
local as={
__type="Colorpicker",
Title=ap.Title,
Desc=ap.Desc,
Default=ap.Default,
Callback=ap.Callback,
Transparency=ap.Transparency,
UIElements=ap.UIElements,
}

function as.SetHSVFromRGB(at,au)
local av,aw,ax=Color3.toHSV(au)
as.Hue=av
as.Sat=aw
as.Vib=ax
end

as:SetHSVFromRGB(as.Default)

local at=a.load'i'.Init(ap.Window)
local au=at.Create()

as.ColorpickerFrame=au



local av,aw,ax=as.Hue,as.Sat,as.Vib

as.UIElements.Title=ac("TextLabel",{
Text=as.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=au.UIElements.Main
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
})
})





local ay=ac("ImageLabel",{
Size=UDim2.new(0,18,0,18),
ScaleType=Enum.ScaleType.Fit,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=4805639000",
})

as.UIElements.SatVibMap=ac("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(av,1,1),
BackgroundTransparency=0,
Parent=au.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
ac("UIStroke",{
Thickness=.6,
ThemeTag={
Color="Text"
},
Transparency=.8,
}),
ay,
})

as.UIElements.Inputs=ac("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(as.Transparency and 240 or 210,40),
BackgroundTransparency=1,
Parent=au.UIElements.Main
},{
ac("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Vertical",
})
})





local az=ac("Frame",{
BackgroundColor3=as.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=as.Transparency,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ac("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208),
Size=UDim2.fromOffset(75,24),
Parent=au.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
ac("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
az,
})

local aA=ac("Frame",{
BackgroundColor3=as.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ac("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208),
Size=UDim2.fromOffset(75,24),
Parent=au.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
ac("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
aA,
})

local aB={}

for aC=0,1,0.1 do
table.insert(aB,ColorSequenceKeypoint.new(aC,Color3.fromHSV(aC,1,1)))
end

local aC=ac("UIGradient",{
Color=ColorSequence.new(aB),
Rotation=90,
})

local aD=ac("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local aE=ac("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=aD,


BackgroundColor3=as.Default
},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local b=ac("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(180,40),
Parent=au.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
aC,
aD,
})


function CreateNewInput(e,g)
local h=am(e,nil,as.UIElements.Inputs)

ac("TextLabel",{
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=h.Frame,
Text=e,
})

ac("UIScale",{
Parent=h,
Scale=.85,
})

h.Frame.Frame.TextBox.Text=g
h.Size=UDim2.new(0,150,0,42)

return h
end

local function ToRGB(e)
return{
R=math.floor(e.R*255),
G=math.floor(e.G*255),
B=math.floor(e.B*255)
}
end

local e=CreateNewInput("Hex","#"..as.Default:ToHex())

local g=CreateNewInput("Red",ToRGB(as.Default).R)
local h=CreateNewInput("Green",ToRGB(as.Default).G)
local i=CreateNewInput("Blue",ToRGB(as.Default).B)
local j
if as.Transparency then
j=CreateNewInput("Alpha",((1-as.Transparency)*100).."%")
end

local l=ac("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254),
BackgroundTransparency=1,
Parent=au.UIElements.Main,
LayoutOrder=4,
},{
ac("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),
})

local m={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Apply",
Icon="chevron-right",
Variant="Primary",
Callback=function()ar(Color3.fromHSV(as.Hue,as.Sat,as.Vib),as.Transparency)end
}
}

for p,v in next,m do
local x=al(v.Title,v.Icon,v.Callback,v.Variant,l,au,true)
x.Size=UDim2.new(0.5,-3,0,40)
x.AutomaticSize="None"
end



local x,z,A
if as.Transparency then
local B=ac("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

z=ac("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=B,

},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})

})

A=ac("Frame",{
Size=UDim2.fromScale(1,1),
},{
ac("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
ac("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

x=ac("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(210,40),
Parent=au.UIElements.Main,
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
ac("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
A,
B,
})
end

function as.Round(B,C,F)
if F==0 then
return math.floor(C)
end
C=tostring(C)
return C:find"%."and tonumber(C:sub(1,C:find"%."+F))or C
end


function as.Update(B,C,F)
if C then av,aw,ax=Color3.toHSV(C)else av,aw,ax=as.Hue,as.Sat,as.Vib end

as.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(av,1,1)
ay.Position=UDim2.new(aw,0,1-ax,0)
aA.BackgroundColor3=Color3.fromHSV(av,aw,ax)
aE.BackgroundColor3=Color3.fromHSV(av,1,1)
aE.Position=UDim2.new(0.5,0,av,0)

e.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(av,aw,ax):ToHex()
g.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(av,aw,ax)).R
h.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(av,aw,ax)).G
i.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(av,aw,ax)).B

if F or as.Transparency then
aA.BackgroundTransparency=as.Transparency or F
A.BackgroundColor3=Color3.fromHSV(av,aw,ax)
z.BackgroundColor3=Color3.fromHSV(av,aw,ax)
z.BackgroundTransparency=as.Transparency or F
z.Position=UDim2.new(0.5,0,1-as.Transparency or F,0)
j.Frame.Frame.TextBox.Text=as:Round((1-as.Transparency or F)*100,0).."%"
end
end

as:Update(as.Default,as.Transparency)




local function GetRGB()
local B=Color3.fromHSV(as.Hue,as.Sat,as.Vib)
return{R=math.floor(B.r*255),G=math.floor(B.g*255),B=math.floor(B.b*255)}
end



local function clamp(B,C,F)
return math.clamp(tonumber(B)or 0,C,F)
end

aa.AddSignal(e.Frame.Frame.TextBox.FocusLost,function(B)
if B then
local C=e.Frame.Frame.TextBox.Text:gsub("#","")
local F,G=pcall(Color3.fromHex,C)
if F and typeof(G)=="Color3"then
as.Hue,as.Sat,as.Vib=Color3.toHSV(G)
as:Update()
as.Default=G
end
end
end)

local function updateColorFromInput(B,C)
aa.AddSignal(B.Frame.Frame.TextBox.FocusLost,function(F)
if F then
local G=B.Frame.Frame.TextBox
local H=GetRGB()
local J=clamp(G.Text,0,255)
G.Text=tostring(J)

H[C]=J
local L=Color3.fromRGB(H.R,H.G,H.B)
as.Hue,as.Sat,as.Vib=Color3.toHSV(L)
as:Update()
end
end)
end

updateColorFromInput(g,"R")
updateColorFromInput(h,"G")
updateColorFromInput(i,"B")

if as.Transparency then
aa.AddSignal(j.Frame.Frame.TextBox.FocusLost,function(B)
if B then
local C=j.Frame.Frame.TextBox
local F=clamp(C.Text,0,100)
C.Text=tostring(F)

as.Transparency=1-F*0.01
as:Update(nil,as.Transparency)
end
end)
end



local B=as.UIElements.SatVibMap
aa.AddSignal(B.InputBegan,function(C)
if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local F=B.AbsolutePosition.X
local G=F+B.AbsoluteSize.X
local H=math.clamp(ak.X,F,G)

local J=B.AbsolutePosition.Y
local L=J+B.AbsoluteSize.Y
local M=math.clamp(ak.Y,J,L)

as.Sat=(H-F)/(G-F)
as.Vib=1-((M-J)/(L-J))
as:Update()

ai:Wait()
end
end
end)

aa.AddSignal(b.InputBegan,function(C)
if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local F=b.AbsolutePosition.Y
local G=F+b.AbsoluteSize.Y
local H=math.clamp(ak.Y,F,G)

as.Hue=((H-F)/(G-F))
as:Update()

ai:Wait()
end
end
end)

if as.Transparency then
aa.AddSignal(x.InputBegan,function(C)
if C.UserInputType==Enum.UserInputType.MouseButton1 or C.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local F=x.AbsolutePosition.Y
local G=F+x.AbsoluteSize.Y
local H=math.clamp(ak.Y,F,G)

as.Transparency=1-((H-F)/(G-F))
as:Update()

ai:Wait()
end
end
end)
end

return as
end

function an.New(ao,ap)
local ar={
__type="Colorpicker",
Title=ap.Title or"Colorpicker",
Desc=ap.Desc or nil,
Locked=ap.Locked or false,
Default=ap.Default or Color3.new(1,1,1),
Callback=ap.Callback or function()end,
Window=ap.Window,
Transparency=ap.Transparency,
UIElements={}
}

local as=true


ar.ColorpickerFrame=a.load's'{
Title=ar.Title,
Desc=ar.Desc,
Parent=ap.Parent,
TextOffset=40,
Hover=false,
}

ar.UIElements.Colorpicker=aa.NewRoundFrame(an.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=ar.Default,
Parent=ar.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,30,0,30),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ZIndex=2
},nil,true)


function ar.Lock(at)
as=false
return ar.ColorpickerFrame:Lock()
end
function ar.Unlock(at)
as=true
return ar.ColorpickerFrame:Unlock()
end

if ar.Locked then
ar:Lock()
end


function ar.Update(at,au,av)
ar.UIElements.Colorpicker.ImageTransparency=av or 0
ar.UIElements.Colorpicker.ImageColor3=au
ar.Default=au
if av then
ar.Transparency=av
end
end

function ar.Set(at,au,av)
return ar:Update(au,av)
end

aa.AddSignal(ar.UIElements.Colorpicker.MouseButton1Click,function()
if as then
an:Colorpicker(ar,function(at,au)
ar:Update(at,au)
ar.Default=at
ar.Transparency=au
aa.SafeCallback(ar.Callback,at,au)
end).ColorpickerFrame:Open()
end
end)

return ar.__type,ar
end

return an end function a.F()
local aa=a.load'a'
local ac=aa.New
local ae=aa.Tween

local af={}

function af.New(ag,ah)
local ai={
__type="Section",
Title=ah.Title or"Section",
Icon=ah.Icon,
TextXAlignment=ah.TextXAlignment or"Left",
TextSize=ah.TextSize or 19,
UIElements={},
}

local aj
if ai.Icon then
aj=aa.Image(
ai.Icon,
ai.Icon..":"..ai.Title,
0,
ah.Window.Folder,
ai.__type,
true
)
aj.Size=UDim2.new(0,24,0,24)
end

ai.UIElements.Main=ac("TextLabel",{
BackgroundTransparency=1,
TextXAlignment="Left",
AutomaticSize="XY",
TextSize=ai.TextSize,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),


Text=ai.Title,
})

ac("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ah.Parent,
},{
aj,
ai.UIElements.Main,
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=ai.TextXAlignment,
}),
ac("UIPadding",{
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,2),
})
})





function ai.SetTitle(ak,al)
ai.UIElements.Main.Text=al
end
function ai.Destroy(ak)
ai.UIElements.Main.AutomaticSize="None"
ai.UIElements.Main.Size=UDim2.new(1,0,0,ai.UIElements.Main.TextBounds.Y)

ae(ai.UIElements.Main,.1,{TextTransparency=1}):Play()
task.wait(.1)
ae(ai.UIElements.Main,.15,{Size=UDim2.new(1,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

return ai.__type,ai
end

return af end function a.G()
game:GetService"UserInputService"
local aa=game.Players.LocalPlayer:GetMouse()

local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'g'.New
local ah=a.load'r'.New
local ai=a.load'n'.New


local aj={
Window=nil,
WindUI=nil,
Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(aj)end
}

function aj.Init(ak,al,am,an)
aj.Window=ak
aj.WindUI=al
aj.ToolTipParent=am
aj.TabHighlight=an
return aj
end

function aj.New(ak)
local al={
__type="Tab",
Title=ak.Title or"Tab",
Desc=ak.Desc,
Icon=ak.Icon,
IconThemed=ak.IconThemed,
Locked=ak.Locked,
ShowTabTitle=ak.ShowTabTitle,
Selected=false,
Index=nil,
Parent=ak.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=aj.Window.UICorner-(aj.Window.UIPadding/2),
}

local am=aj.Window
local an=aj.WindUI

aj.TabCount=aj.TabCount+1
local ao=aj.TabCount
al.Index=ao

al.UIElements.Main=ac.NewRoundFrame(al.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=ak.Parent,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
},{
ac.NewRoundFrame(al.UICorner,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ae("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ac.NewRoundFrame(al.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ae("TextLabel",{
Text=al.Title,
ThemeTag={
TextColor3="Text"
},
TextTransparency=not al.Locked and 0.4 or.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,2+(am.UIPadding/2)),
PaddingLeft=UDim.new(0,4+(am.UIPadding/2)),
PaddingRight=UDim.new(0,4+(am.UIPadding/2)),
PaddingBottom=UDim.new(0,2+(am.UIPadding/2)),
})
}),
},true)

local ap=0
local ar
local as

if al.Icon then
ar=ac.Image(
al.Icon,
al.Icon..":"..al.Title,
0,
aj.Window.Folder,
al.__type,
true,
al.IconThemed
)
ar.Size=UDim2.new(0,16,0,16)
ar.Parent=al.UIElements.Main.Frame
ar.ImageLabel.ImageTransparency=not al.Locked and 0 or.7
al.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,-30,0,0)
ap=-30

al.UIElements.Icon=ar


as=ac.Image(
al.Icon,
al.Icon..":"..al.Title,
0,
aj.Window.Folder,
al.__type,
true,
al.IconThemed
)
as.Size=UDim2.new(0,16,0,16)
as.ImageLabel.ImageTransparency=not al.Locked and 0 or.7
ap=-30




end

al.UIElements.ContainerFrame=ae("ScrollingFrame",{
Size=UDim2.new(1,0,1,al.ShowTabTitle and-((am.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,6),
HorizontalAlignment="Center",
})
})





al.UIElements.ContainerFrameCanvas=ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=am.UIElements.MainBar,
ZIndex=5,
},{
al.UIElements.ContainerFrame,
ae("Frame",{
Size=UDim2.new(1,0,0,((am.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=al.ShowTabTitle or false,
Name="TabTitle"
},{
as,
ae("TextLabel",{
Text=al.Title,
ThemeTag={
TextColor3="Text"
},
TextSize=20,
TextTransparency=.1,
Size=UDim2.new(1,-ap,1,0),
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
TextTruncate="AtEnd",
RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ae("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
},
Position=UDim2.new(0,0,0,((am.UIPadding*2.4)+12)),
Visible=al.ShowTabTitle or false,
})
})

aj.Containers[ao]=al.UIElements.ContainerFrameCanvas
aj.Tabs[ao]=al

al.ContainerFrame=ContainerFrameCanvas

ac.AddSignal(al.UIElements.Main.MouseButton1Click,function()
if not al.Locked then
aj:SelectTab(ao)
end
end)

ai(al.UIElements.ContainerFrame,al.UIElements.ContainerFrameCanvas,am,3)

local at
local au
local av
local aw=false



if al.Desc then


ac.AddSignal(al.UIElements.Main.InputBegan,function()
aw=true
au=task.spawn(function()
task.wait(0.35)
if aw and not at then
at=ah(al.Desc,aj.ToolTipParent)

local function updatePosition()
if at then
at.Container.Position=UDim2.new(0,aa.X,0,aa.Y-20)
end
end

updatePosition()
av=aa.Move:Connect(updatePosition)
at:Open()
end
end)
end)

end

ac.AddSignal(al.UIElements.Main.MouseEnter,function()
if not al.Locked then
af(al.UIElements.Main.Frame,0.08,{ImageTransparency=.97}):Play()
end
end)
ac.AddSignal(al.UIElements.Main.InputEnded,function()
if al.Desc then
aw=false
if au then
task.cancel(au)
au=nil
end
if av then
av:Disconnect()
av=nil
end
if at then
at:Close()
at=nil
end
end

if not al.Locked then
af(al.UIElements.Main.Frame,0.08,{ImageTransparency=1}):Play()
end
end)



local ax={
Button=a.load't',
Toggle=a.load'w',
Slider=a.load'x',
Keybind=a.load'y',
Input=a.load'z',
Dropdown=a.load'A',
Code=a.load'D',
Colorpicker=a.load'E',
Section=a.load'F',
}

function al.Divider(ay)
local az=ae("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local aA=ae("Frame",{
Parent=al.UIElements.ContainerFrame,
Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
az
})

return aA
end

function al.Paragraph(ay,az)
az.Parent=al.UIElements.ContainerFrame
az.Window=am
az.Hover=false

az.TextOffset=0
az.IsButtons=az.Buttons and#az.Buttons>0 and true or false

local aA={
__type="Paragraph",
Title=az.Title or"Paragraph",
Desc=az.Desc or nil,

Locked=az.Locked or false,
}
local aB=a.load's'(az)

aA.ParagraphFrame=aB
if az.Buttons and#az.Buttons>0 then
local aC=ae("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=aB.UIElements.Container
},{
ae("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
})
})


for aD,aE in next,az.Buttons do
local b=ag(aE.Title,aE.Icon,aE.Callback,"White",aC)
b.Size=UDim2.new(1,0,0,38)

end
end

function aA.SetTitle(aC,aD)
aA.ParagraphFrame:SetTitle(aD)
end
function aA.SetDesc(aC,aD)
aA.ParagraphFrame:SetDesc(aD)
end
function aA.Destroy(aC)
aA.ParagraphFrame:Destroy()
end

table.insert(al.Elements,aA)
return aA
end

for ay,az in pairs(ax)do
al[ay]=function(aA,aB)
aB.Parent=aA.UIElements.ContainerFrame
aB.Window=am
aB.WindUI=an local

aC, aD=az:New(aB)
table.insert(aA.Elements,aD)

local aE
for b,e in pairs(aD)do
if typeof(e)=="table"and b:match"Frame$"then
aE=e
break
end
end

if aE then
function aD.SetTitle(g,h)
aE:SetTitle(h)
end
function aD.SetDesc(g,h)
aE:SetDesc(h)
end
function aD.Destroy(g)
aE:Destroy()
end
end
return aD
end
end


task.spawn(function()
local aA=ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-am.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=al.UIElements.ContainerFrame
},{
ae("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),
ae("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=ac.Icon"frown"[1],
ImageRectOffset=ac.Icon"frown"[2].ImageRectPosition,
ImageRectSize=ac.Icon"frown"[2].ImageRectSize,
ThemeTag={
ImageColor3="Icon"
},
BackgroundTransparency=1,
ImageTransparency=.6,
}),
ae("TextLabel",{
AutomaticSize="XY",
Text="This tab is empty",
ThemeTag={
TextColor3="Text"
},
TextSize=18,
TextTransparency=.5,
BackgroundTransparency=1,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
})
})





ac.AddSignal(al.UIElements.ContainerFrame.ChildAdded,function()
aA.Visible=false
end)
end)

return al
end

function aj.OnChange(ak,al)
aj.OnChangeFunc=al
end

function aj.SelectTab(ak,al)
if not aj.Tabs[al].Locked then
aj.SelectedTab=al

for am,an in next,aj.Tabs do
if not an.Locked then
af(an.UIElements.Main,0.15,{ImageTransparency=1}):Play()
af(an.UIElements.Main.Outline,0.15,{ImageTransparency=1}):Play()
af(an.UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0.3}):Play()
if an.UIElements.Icon then
af(an.UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.4}):Play()
end
an.Selected=false
end
end
af(aj.Tabs[al].UIElements.Main,0.15,{ImageTransparency=0.95}):Play()
af(aj.Tabs[al].UIElements.Main.Outline,0.15,{ImageTransparency=0.85}):Play()
af(aj.Tabs[al].UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0}):Play()
if aj.Tabs[al].UIElements.Icon then
af(aj.Tabs[al].UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.1}):Play()
end
aj.Tabs[al].Selected=true


task.spawn(function()
for ao,ap in next,aj.Containers do
ap.AnchorPoint=Vector2.new(0,0.05)
ap.Visible=false
end
aj.Containers[al].Visible=true
af(aj.Containers[al],0.15,{AnchorPoint=Vector2.new(0,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
end)

aj.OnChangeFunc(al)
end
end

return aj end function a.H()
local aa={}


local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'G'

function aa.New(ah,ai,aj,ak)
local al={
Title=ah.Title or"Section",
Icon=ah.Icon,
IconThemed=ah.IconThemed,
Opened=ah.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local am
if al.Icon then
am=ac.Image(
al.Icon,
al.Icon,
0,
aj,
"Section",
true,
al.IconThemed
)

am.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
am.ImageLabel.ImageTransparency=.25
end

local an=ae("Frame",{
Size=UDim2.new(0,al.IconSize,0,al.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ae("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=ac.Icon"chevron-down"[1],
ImageRectSize=ac.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=ac.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local ao=ae("Frame",{
Size=UDim2.new(1,0,0,al.HeaderSize),
BackgroundTransparency=1,
Parent=ai,
ClipsDescendants=true,
},{
ae("TextButton",{
Size=UDim2.new(1,0,0,al.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
am,
ae("TextLabel",{
Text=al.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
am and(-al.IconSize-10)*2
or(-al.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
ae("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
an,
ae("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,al.HeaderSize)
},{
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,0),
VerticalAlignment="Bottom",
}),
})
})


function al.Tab(ap,ar)
if not al.Expandable then
al.Expandable=true
an.Visible=true
end
ar.Parent=ao.Content
return ag.New(ar)
end

function al.Open(ap)
if al.Expandable then
al.Opened=true
af(ao,0.33,{
Size=UDim2.new(1,0,0,al.HeaderSize+(ao.Content.AbsoluteSize.Y/ak))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

af(an.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function al.Close(ap)
if al.Expandable then
al.Opened=false
af(ao,0.26,{
Size=UDim2.new(1,0,0,al.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
af(an.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

ac.AddSignal(ao.TextButton.MouseButton1Click,function()
if al.Expandable then
if al.Opened then
al:Close()
else
al:Open()
end
end
end)

if al.Opened then
task.spawn(function()
task.wait()
al:Open()
end)
end



return al
end


return aa end function a.I()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.J()
game:GetService"UserInputService"

local aa={
Margin=8,
Padding=9,
}


local ac=a.load'a'
local ae=ac.New
local af=ac.Tween


function aa.new(ag,ah,ai)
local aj={
IconSize=14,
Padding=14,
Radius=18,
Width=400,
MaxHeight=380,

Icons=a.load'I'
}


local ak=ae("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(
1,
-((aj.IconSize*2)+(aj.Padding*2)),
0,
0
),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Regular),
TextSize=17,
})

local al=ae("ImageLabel",{
Image=ac.Icon"x"[1],
ImageRectSize=ac.Icon"x"[2].ImageRectSize,
ImageRectOffset=ac.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
},{
ae("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})

local am=ae("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false
},{
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,aj.Padding),
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
PaddingBottom=UDim.new(0,aj.Padding),
})
})

local an=ac.NewRoundFrame(aj.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=0,
},{
ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
},{
ae("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ae("ImageLabel",{
Image=ac.Icon"search"[1],
ImageRectSize=ac.Icon"search"[2].ImageRectSize,
ImageRectOffset=ac.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.05,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
}),
ak,
al,
ae("UIListLayout",{
Padding=UDim.new(0,aj.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ae("UIPadding",{
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
})
})
}),
ae("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
ae("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=.9,
Visible=false,
}),
am,
ae("UISizeConstraint",{
MaxSize=Vector2.new(aj.Width,aj.MaxHeight),
}),
}),
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
})
})

local ao=ae("Frame",{
Size=UDim2.new(0,aj.Width,0,0),
AutomaticSize="Y",
Parent=ah,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
ae("UIScale",{
Scale=.9,
}),
an,
ac.NewRoundFrame(aj.Radius,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=.7,
},{
ae("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

local function CreateSearchTab(ap,ar,as,at,au,av)
local aw=ae("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=at or nil
},{
ac.NewRoundFrame(aj.Radius-4,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main"
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,aj.Padding-2),
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
PaddingBottom=UDim.new(0,aj.Padding-2),
}),
ae("ImageLabel",{
Image=ac.Icon(as)[1],
ImageRectSize=ac.Icon(as)[2].ImageRectSize,
ImageRectOffset=ac.Icon(as)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
}),
ae("Frame",{
Size=UDim2.new(1,-aj.IconSize-aj.Padding,0,0),
BackgroundTransparency=1,
},{
ae("TextLabel",{
Text=ap,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title"
}),
ae("TextLabel",{
Text=ar or"",
Visible=ar and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=.2,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc"
})or nil,
ae("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
})
}),
ae("UIListLayout",{
Padding=UDim.new(0,aj.Padding),
FillDirection="Horizontal",
})
},true),
ae("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-aj.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=au,

},{
ac.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.9,
}),
ae("Frame",{
Size=UDim2.new(1,-aj.Padding-2,0,0),
Position=UDim2.new(0,aj.Padding+2,0,0),
BackgroundTransparency=1,
},{
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right"
})
})



aw.Main.Size=UDim2.new(
1,
0,
0,
aw.Main.Frame.Desc.Visible and(((aj.Padding-2)*2)+aw.Main.Frame.Title.TextBounds.Y+6+aw.Main.Frame.Desc.TextBounds.Y)
or(((aj.Padding-2)*2)+aw.Main.Frame.Title.TextBounds.Y)
)

ac.AddSignal(aw.Main.MouseEnter,function()
af(aw.Main,.04,{ImageTransparency=.95}):Play()
end)
ac.AddSignal(aw.Main.InputEnded,function()
af(aw.Main,.08,{ImageTransparency=1}):Play()
end)
ac.AddSignal(aw.Main.MouseButton1Click,function()
if av then
av()
end
end)

return aw
end

local function ContainsText(ap,ar)
if not ar or ar==""then
return false
end

if not ap or ap==""then
return false
end

local as=string.lower(ap)
local at=string.lower(ar)

return string.find(as,at,1,true)~=nil
end

local function Search(ap)
if not ap or ap==""then
return{}
end

local ar={}
for as,at in next,ag.Tabs do
local au=ContainsText(at.Title or"",ap)
local av={}

for aw,ax in next,at.Elements do
if ax.__type~="Section"then
local ay=ContainsText(ax.Title or"",ap)
local az=ContainsText(ax.Desc or"",ap)

if ay or az then
av[aw]={
Title=ax.Title,
Desc=ax.Desc,
Original=ax,
__type=ax.__type
}
end
end
end

if au or next(av)~=nil then
ar[as]={
Tab=at,
Title=at.Title,
Icon=at.Icon,
Elements=av,
}
end
end
return ar
end

function aj.Search(ap,ar)
ar=ar or""

local as=Search(ar)

am.Visible=true
an.Frame.Results.Frame.Visible=true
for at,au in next,am:GetChildren()do
if au.ClassName~="UIListLayout"and au.ClassName~="UIPadding"then
au:Destroy()
end
end

if as and next(as)~=nil then
for av,aw in next,as do
local ax=aj.Icons.Tab
local ay=CreateSearchTab(aw.Title,nil,ax,am,true,function()
aj:Close()
ag:SelectTab(av)
end)
if aw.Elements and next(aw.Elements)~=nil then
for az,aA in next,aw.Elements do
local aB=aj.Icons[aA.__type]
CreateSearchTab(aA.Title,aA.Desc,aB,ay:FindFirstChild"ParentContainer"and ay.ParentContainer.Frame or nil,false,function()
aj:Close()
ag:SelectTab(av)

end)

end
end
end
elseif ar~=""then
ae("TextLabel",{
Size=UDim2.new(1,0,0,70),
BackgroundTransparency=1,
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=.2,
BackgroundTransparency=1,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Parent=am,
Name="NotFound",
})
else
am.Visible=false
an.Frame.Results.Frame.Visible=false
end
end

ac.AddSignal(ak:GetPropertyChangedSignal"Text",function()
aj:Search(ak.Text)
end)

ac.AddSignal(am.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

af(am,.06,{Size=UDim2.new(
1,
0,
0,
math.clamp(am.UIListLayout.AbsoluteContentSize.Y+(aj.Padding*2),0,aj.MaxHeight)
)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function aj.Open(ap)
task.spawn(function()
an.Frame.Visible=true
ao.Visible=true
af(ao.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function aj.Close(ap)
task.spawn(function()
ai()
an.Frame.Visible=false
af(ao.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.12)
ao.Visible=false
end)
end

ac.AddSignal(al.TextButton.MouseButton1Click,function()
aj:Close()
end)

aj:Open()

return aj
end

return aa end function a.K()

local aa=game:GetService"UserInputService"
game:GetService"RunService"

local ac=workspace.CurrentCamera

local ae=a.load'a'
local af=ae.New
local ag=ae.Tween


local ah=a.load'm'.New
local ai=a.load'g'.New
local aj=a.load'n'.New
local ak=a.load'o'

local al=a.load'p'



return function(am)
local an={
Title=am.Title or"UI Library",
Author=am.Author,
Icon=am.Icon,
IconThemed=am.IconThemed,
Folder=am.Folder,
Resizable=am.Resizable,
Background=am.Background,
BackgroundImageTransparency=am.BackgroundImageTransparency or 0,
User=am.User or{},
Size=am.Size and UDim2.new(
0,math.clamp(am.Size.X.Offset,480,700),
0,math.clamp(am.Size.Y.Offset,350,520))or UDim2.new(0,580,0,460),
ToggleKey=am.ToggleKey or Enum.KeyCode.G,
Transparent=am.Transparent or false,
HideSearchBar=am.HideSearchBar,
ScrollBarEnabled=am.ScrollBarEnabled or false,
SideBarWidth=am.SideBarWidth or 200,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=am.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=false,
IsOpenButtonEnabled=true,

ConfigManager=nil,
CurrentTab=nil,
TabModule=nil,

OnCloseCallback=nil,
OnDestroyCallback=nil,

TopBarButtons={},

}

if an.HideSearchBar~=false then
an.HideSearchBar=true
end
if an.Resizable~=false then
an.CanResize=true
an.Resizable=true
end

if an.Folder then
makefolder("WindUI/"..an.Folder)
end

local ao=af("UICorner",{
CornerRadius=UDim.new(0,an.UICorner)
})

an.ConfigManager=al:Init(an)



local ap=af("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(.5,.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true
},{
af("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
})
})
local ar=ae.NewRoundFrame(an.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
af("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=ae.Icon"expand"[1],
ImageRectOffset=ae.Icon"expand"[2].ImageRectPosition,
ImageRectSize=ae.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local as=ae.NewRoundFrame(an.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})










an.UIElements.SideBar=af("ScrollingFrame",{
Size=UDim2.new(
1,
an.ScrollBarEnabled and-3-(an.UIPadding/2)or 0,
1,
not an.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
af("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
af("UIPadding",{
PaddingTop=UDim.new(0,an.UIPadding/2),


PaddingBottom=UDim.new(0,an.UIPadding/2),
}),
af("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,0)
})
}),
af("UIPadding",{

PaddingLeft=UDim.new(0,an.UIPadding/2),
PaddingRight=UDim.new(0,an.UIPadding/2),

}),

})

an.UIElements.SideBarContainer=af("Frame",{
Size=UDim2.new(0,an.SideBarWidth,1,an.User.Enabled and-94-(an.UIPadding*2)or-52),
Position=UDim2.new(0,0,0,52),
BackgroundTransparency=1,
Visible=true,
},{
af("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(
1,
0,
1,
not an.HideSearchBar and-45-an.UIPadding/2 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
}),
an.UIElements.SideBar,
})

if an.ScrollBarEnabled then
aj(an.UIElements.SideBar,an.UIElements.SideBarContainer.Content,an,3)
end


an.UIElements.MainBar=af("Frame",{
Size=UDim2.new(1,-an.UIElements.SideBarContainer.AbsoluteSize.X,1,-52),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
ae.NewRoundFrame(an.UICorner-(an.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ZIndex=3,
ImageTransparency=.95,
Name="Background",
}),
af("UIPadding",{
PaddingTop=UDim.new(0,an.UIPadding/2),
PaddingLeft=UDim.new(0,an.UIPadding/2),
PaddingRight=UDim.new(0,an.UIPadding/2),
PaddingBottom=UDim.new(0,an.UIPadding/2),
})
})

local at=af("ImageLabel",{
Image="rbxassetid://8992230677",
ImageColor3=Color3.new(0,0,0),
ImageTransparency=1,
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0,-60,0,-58),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

local au

if aa.TouchEnabled and not aa.KeyboardEnabled then
au=false
elseif aa.KeyboardEnabled then
au=true
else
au=nil
end









local av
if an.User.Enabled then local
aw, ax=game.Players:GetUserThumbnailAsync(
an.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)

av=af("TextButton",{
Size=UDim2.new(0,
(an.UIElements.SideBarContainer.AbsoluteSize.X)-(an.UIPadding/2),
0,
42+(an.UIPadding)
),
Position=UDim2.new(0,an.UIPadding/2,1,-(an.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
},{
ae.NewRoundFrame(an.UICorner-(an.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
af("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ae.NewRoundFrame(an.UICorner-(an.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
af("ImageLabel",{
Image=aw,
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=.93,
},{
af("UICorner",{
CornerRadius=UDim.new(1,0)
})
}),
af("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
af("TextLabel",{
Text=an.User.Anonymous and"Anonymous"or game.Players.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
af("TextLabel",{
Text=an.User.Anonymous and"@anonymous"or"@"..game.Players.LocalPlayer.Name,
TextSize=15,
TextTransparency=.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
af("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
})
}),
af("UIListLayout",{
Padding=UDim.new(0,an.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
af("UIPadding",{
PaddingLeft=UDim.new(0,an.UIPadding/2),
PaddingRight=UDim.new(0,an.UIPadding/2),
})
})
})

if an.User.Callback then
ae.AddSignal(av.MouseButton1Click,function()
an.User.Callback()
end)
ae.AddSignal(av.MouseEnter,function()
ag(av.UserIcon,0.04,{ImageTransparency=.95}):Play()
ag(av.Outline,0.04,{ImageTransparency=.85}):Play()
end)
ae.AddSignal(av.InputEnded,function()
ag(av.UserIcon,0.04,{ImageTransparency=1}):Play()
ag(av.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local aw
local ax



local ay=false
local az

local aA=typeof(an.Background)=="string"and string.match(an.Background,"^video:(.+)")or nil

if typeof(an.Background)=="string"and aA then
ay=true

if string.find(aA,"http")then
local function SanitizeFilename(aB)
aB=aB:gsub("[%s/\\:*?\"<>|]+","-")
aB=aB:gsub("[^%w%-_%.]","")
return aB
end

local aB=an.Folder.."/Assets/."..SanitizeFilename(aA)..".webm"
if not isfile(aB)then
local aC,aD=pcall(function()
local aC=game:HttpGet(aA)
writefile(aB,aC)
end)

if not aC then
warn("[ WindUI.Background ]  Failed to download video: "..tostring(aD))
return
end
end
aA=getcustomasset(aB)
end

az=af("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=aA,
Looped=true,
Volume=0,
},{
af("UICorner",{
CornerRadius=UDim.new(0,an.UICorner)
}),
})
az:Play()
elseif an.Background then
az=af("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(an.Background)=="string"and an.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
af("UICorner",{
CornerRadius=UDim.new(0,an.UICorner)
}),
})
end


local aB=ae.NewRoundFrame(99,"Squircle",{
ImageTransparency=.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
af("Frame",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
})
})

local aC=af("TextLabel",{
Text=an.Title,
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="Text"
}
})

an.UIElements.Main=af("Frame",{
Size=an.Size,
Position=an.Position,
BackgroundTransparency=1,
Parent=am.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
},{
at,
ae.NewRoundFrame(an.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,-240),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="Background"
},

},{
az,
aB,
ap,



}),
UIStroke,
ao,
ar,
as,
af("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
af("UICorner",{
CornerRadius=UDim.new(0,an.UICorner)
}),
an.UIElements.SideBarContainer,
an.UIElements.MainBar,

av,

ax,
af("Frame",{
Size=UDim2.new(1,0,0,52),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar"
},{
aw,






af("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left"
},{
af("UIListLayout",{
Padding=UDim.new(0,an.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
af("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
af("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
aC,
}),
af("UIPadding",{
PaddingLeft=UDim.new(0,4)
})
}),
af("ScrollingFrame",{
Name="Center",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
Visible=false,
},{
af("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,an.UIPadding/2)
})
}),
af("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Name="Right",
},{
af("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),

}),
af("UIPadding",{
PaddingTop=UDim.new(0,an.UIPadding),
PaddingLeft=UDim.new(0,an.UIPadding),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,an.UIPadding),
})
})
})
})

ae.AddSignal(an.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
an.UIElements.Main.Main.Topbar.Center.Position=UDim2.new(0,an.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X+an.UIPadding,0.5,0)
an.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-an.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X-an.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X-an.UIPadding-an.UIPadding,
1,
0
)
end)

function an.CreateTopbarButton(aD,aE,b,e,g,h)
local i=ae.Image(
b,
b,
0,
an.Folder,
"TopbarIcon",
true,
h
)
i.Size=UDim2.new(0,16,0,16)
i.AnchorPoint=Vector2.new(0.5,0.5)
i.Position=UDim2.new(0.5,0,0.5,0)

local j=ae.NewRoundFrame(9,"Squircle",{
Size=UDim2.new(0,36,0,36),
LayoutOrder=g or 999,
Parent=an.UIElements.Main.Main.Topbar.Right,

ZIndex=9999,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=1
},{
ae.NewRoundFrame(9,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
af("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
i
},true)



an.TopBarButtons[100-g]={
Name=aE,
Object=j
}

ae.AddSignal(j.MouseButton1Click,function()
e()
end)
ae.AddSignal(j.MouseEnter,function()
ag(j,.15,{ImageTransparency=.93}):Play()
ag(j.Outline,.15,{ImageTransparency=.75}):Play()

end)
ae.AddSignal(j.MouseLeave,function()
ag(j,.1,{ImageTransparency=1}):Play()
ag(j.Outline,.1,{ImageTransparency=1}):Play()

end)

return j
end



local aD=ae.Drag(
an.UIElements.Main,
{an.UIElements.Main.Main.Topbar,aB.Frame},
function(aD,aE)
if not an.Closed then
if aD and aE==aB.Frame then
ag(aB,.1,{ImageTransparency=.35}):Play()
else
ag(aB,.2,{ImageTransparency=.8}):Play()
end
end
end
)

if not ay and an.Background and typeof(an.Background)=="table"then

local aE=af"UIGradient"
for b,e in next,an.Background do
aE[b]=e
end

an.UIElements.BackgroundGradient=ae.NewRoundFrame(an.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=an.UIElements.Main.Background,
ImageTransparency=an.Transparent and am.WindUI.TransparencyValue or 0
},{
aE
})
end














if an.Author then
af("TextLabel",{
Text=an.Author,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.4,
AutomaticSize="XY",
Parent=an.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
}
})

end

local aE=a.load'q'.New(an)


task.spawn(function()
if an.Icon then

local b=ae.Image(
an.Icon,
an.Title,
0,
an.Folder,
"Window",
true,
an.IconThemed
)
b.Parent=an.UIElements.Main.Main.Topbar.Left
b.Size=UDim2.new(0,22,0,22)

aE:SetIcon(an.Icon)











else
aE:SetIcon(an.Icon)
OpenButtonIcon.Visible=false
end
end)

function an.SetToggleKey(b,e)
an.ToggleKey=e
end

function an.SetBackgroundImage(b,e)
an.UIElements.Main.Background.ImageLabel.Image=e
end
function an.SetBackgroundImageTransparency(b,e)
an.UIElements.Main.Background.ImageLabel.ImageTransparency=e
an.BackgroundImageTransparency=e
end

local b
local e
ae.Icon"minimize"
ae.Icon"maximize"

an:CreateTopbarButton("Fullscreen","maximize",function()
an:ToggleFullscreen()
end,998)

function an.ToggleFullscreen(g)
local h=an.IsFullscreen

aD:Set(h)

if not h then
b=an.UIElements.Main.Position
e=an.UIElements.Main.Size

an.CanResize=false
else
if an.Resizable then
an.CanResize=true
end
end

ag(an.UIElements.Main,0.45,{Size=h and e or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ag(an.UIElements.Main,0.45,{Position=h and b or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()



an.IsFullscreen=not h
end


an:CreateTopbarButton("Minimize","minus",function()
an:Close()
task.spawn(function()
task.wait(.3)
if not au and an.IsOpenButtonEnabled then

aE:Visible(true)
end
end)















end,997)

function an.OnClose(g,h)
an.OnCloseCallback=h
end
function an.OnDestroy(g,h)
an.OnDestroyCallback=h
end

function an.Open(g)
task.spawn(function()
task.wait(.06)
an.Closed=false

ag(an.UIElements.Main.Background,0.2,{
ImageTransparency=an.Transparent and am.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if an.UIElements.BackgroundGradient then
ag(an.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ag(an.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,0),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if az then
if az:IsA"VideoFrame"then
az.Visible=true
end
ag(az,0.2,{
ImageTransparency=az:IsA"ImageLabel"and 0 or nil,

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end


ag(at,0.25,{ImageTransparency=.7},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
ag(UIStroke,0.25,{Transparency=.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

task.spawn(function()
task.wait(.5)
ag(aB,.45,{Size=UDim2.new(0,200,0,4),ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
aD:Set(true)
task.wait(.45)
if an.Resizable then
ag(ap.ImageLabel,.45,{ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
an.CanResize=true
end
end)


an.CanDropdown=true

an.UIElements.Main.Visible=true
task.spawn(function()
task.wait(.05)
an.UIElements.Main:WaitForChild"Main".Visible=true
end)
end)
end
function an.Close(g)
local h={}

if an.OnCloseCallback then
task.spawn(function()
ae.SafeCallback(an.OnCloseCallback)
end)
end

an.UIElements.Main:WaitForChild"Main".Visible=false

an.CanDropdown=false
an.Closed=true

ag(an.UIElements.Main.Background,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
if an.UIElements.BackgroundGradient then
ag(an.UIElements.BackgroundGradient,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

ag(an.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,-240),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()


if az then
if az:IsA"VideoFrame"then
az.Visible=false
end
ag(az,0.2,{
ImageTransparency=az:IsA"ImageLabel"and 1 or nil,

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
ag(at,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
ag(UIStroke,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ag(aB,.3,{Size=UDim2.new(0,0,0,4),ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()
ag(ap.ImageLabel,.3,{ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
aD:Set(false)
an.CanResize=false

task.spawn(function()
task.wait(0.4)
an.UIElements.Main.Visible=false
end)

function h.Destroy(i)
if an.OnDestroyCallback then
task.spawn(function()
ae.SafeCallback(an.OnDestroyCallback)
end)
end
an.Destroyed=true
task.wait(0.4)
am.Parent.Parent:Destroy()


end

return h
end

function an.ToggleTransparency(g,h)

an.Transparent=h
am.WindUI.Transparent=h

an.UIElements.Main.Background.ImageTransparency=h and am.WindUI.TransparencyValue or 0

an.UIElements.MainBar.Background.ImageTransparency=h and 0.97 or 0.95

end


function an.SetUIScale(g,h)
am.WindUI.UIScale=h
ag(am.WindUI.ScreenGui.UIScale,.2,{Scale=h},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

do

if(ac.ViewportSize.X-40<an.UIElements.Main.AbsoluteSize.X)
or(ac.ViewportSize.Y-40<an.UIElements.Main.AbsoluteSize.Y)then
if not an.IsFullscreen then
an:SetUIScale(.9)
end
end
end

if not au and an.IsOpenButtonEnabled then
ae.AddSignal(aE.Button.TextButton.MouseButton1Click,function()

aE:Visible(false)
an:Open()
end)
end

ae.AddSignal(aa.InputBegan,function(g,h)
if h then return end

if g.KeyCode==an.ToggleKey then
if an.Closed then
an:Open()
else
an:Close()
end
end
end)

task.spawn(function()

an:Open()
end)

function an.EditOpenButton(g,h)
return aE:Edit(h)
end


local g=a.load'G'
local h=a.load'H'
local i=g.Init(an,am.WindUI,am.Parent.Parent.ToolTips)
i:OnChange(function(j)an.CurrentTab=j end)

an.TabModule=g

function an.Tab(j,l)
l.Parent=an.UIElements.SideBar.Frame
return i.New(l)
end

function an.SelectTab(j,l)
i:SelectTab(l)
end

function an.Section(j,l)
return h.New(l,an.UIElements.SideBar.Frame,an.Folder,am.WindUI.UIScale)
end

function an.IsResizable(j,l)
an.Resizable=l
an.CanResize=l
end

function an.Divider(j)
local l=af("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local m=af("Frame",{
Parent=an.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
l
})

return m
end

local j=a.load'i'.Init(an,nil)
function an.Dialog(l,m)
local p={
Title=m.Title or"Dialog",
Width=m.Width or 320,
Content=m.Content,
Buttons=m.Buttons or{},

TextPadding=10,
}
local v=j.Create(false)

v.UIElements.Main.Size=UDim2.new(0,p.Width,0,0)

local x=af("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=v.UIElements.Main
},{
af("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,v.UIPadding),
VerticalAlignment="Center"
}),
af("UIPadding",{
PaddingTop=UDim.new(0,p.TextPadding),
PaddingLeft=UDim.new(0,p.TextPadding),
PaddingRight=UDim.new(0,p.TextPadding),
})
})

local z
if m.Icon then
z=ae.Image(
m.Icon,
p.Title..":"..m.Icon,
0,
an,
"Dialog",
true,
m.IconThemed
)
z.Size=UDim2.new(0,22,0,22)
z.Parent=x
end

v.UIElements.UIListLayout=af("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
Parent=v.UIElements.Main
})

af("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=v.UIElements.Main,
})


v.UIElements.Title=af("TextLabel",{
Text=p.Title,
TextSize=20,
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,z and-26-v.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=x
})
if p.Content then
af("TextLabel",{
Text=p.Content,
TextSize=18,
TextTransparency=.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=v.UIElements.Main
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,p.TextPadding),
PaddingRight=UDim.new(0,p.TextPadding),
PaddingBottom=UDim.new(0,p.TextPadding),
})
})
end

local A=af("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
})

local B=af("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=v.UIElements.Main,
LayoutOrder=4,
},{
A,
})


local C={}

for F,G in next,p.Buttons do
local H=ai(G.Title,G.Icon,G.Callback,G.Variant,B,v,true)
table.insert(C,H)
end

local function CheckButtonsOverflow()
A.FillDirection=Enum.FillDirection.Horizontal
A.HorizontalAlignment=Enum.HorizontalAlignment.Right
A.VerticalAlignment=Enum.VerticalAlignment.Center
B.AutomaticSize=Enum.AutomaticSize.None

for H,J in ipairs(C)do
J.Size=UDim2.new(0,0,1,0)
J.AutomaticSize=Enum.AutomaticSize.X
end

wait()

local L=A.AbsoluteContentSize.X
local M=B.AbsoluteSize.X

if L>M then
A.FillDirection=Enum.FillDirection.Vertical
A.HorizontalAlignment=Enum.HorizontalAlignment.Right
A.VerticalAlignment=Enum.VerticalAlignment.Bottom
B.AutomaticSize=Enum.AutomaticSize.Y

for N,O in ipairs(C)do
O.Size=UDim2.new(1,0,0,40)
O.AutomaticSize=Enum.AutomaticSize.None
end
else
local N=M-L
if N>0 then
local O
local P=math.huge

for Q,R in ipairs(C)do
local S=R.AbsoluteSize.X
if S<P then
P=S
O=R
end
end

if O then
O.Size=UDim2.new(0,P+N,1,0)
O.AutomaticSize=Enum.AutomaticSize.None
end
end
end
end

ae.AddSignal(v.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",CheckButtonsOverflow)
CheckButtonsOverflow()

wait()
v:Open()

return v
end


an:CreateTopbarButton("Close","x",function()
ag(an.UIElements.Main,0.35,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
an:Dialog{

Title="是否关闭此脚本",
Content="请选择下方按钮 是或不是 ^ω^",
Buttons={
{
Title="不是",

Callback=function()end,
Variant="Secondary",
},
{
Title="是",

Callback=function()an:Close():Destroy()end,
Variant="Primary",
}
}
}
end,999)

function an.Tag(l,m)
if an.UIElements.Main.Main.Topbar.Center.Visible==false then an.UIElements.Main.Main.Topbar.Center.Visible=true end
return ak:New(m,an.UIElements.Main.Main.Topbar.Center)
end


local function startResizing(l)
if an.CanResize then
isResizing=true
ar.Active=true
initialSize=an.UIElements.Main.Size
initialInputPosition=l.Position
ag(ar,0.12,{ImageTransparency=.65}):Play()
ag(ar.ImageLabel,0.12,{ImageTransparency=0}):Play()
ag(ap.ImageLabel,0.1,{ImageTransparency=.35}):Play()

ae.AddSignal(l.Changed,function()
if l.UserInputState==Enum.UserInputState.End then
isResizing=false
ar.Active=false
ag(ar,0.2,{ImageTransparency=1}):Play()
ag(ar.ImageLabel,0.17,{ImageTransparency=1}):Play()
ag(ap.ImageLabel,0.17,{ImageTransparency=.8}):Play()
end
end)
end
end

ae.AddSignal(ap.InputBegan,function(l)
if l.UserInputType==Enum.UserInputType.MouseButton1 or l.UserInputType==Enum.UserInputType.Touch then
if an.CanResize then
startResizing(l)
end
end
end)

ae.AddSignal(aa.InputChanged,function(l)
if l.UserInputType==Enum.UserInputType.MouseMovement or l.UserInputType==Enum.UserInputType.Touch then
if isResizing and an.CanResize then
local m=l.Position-initialInputPosition
local p=UDim2.new(0,initialSize.X.Offset+m.X*2,0,initialSize.Y.Offset+m.Y*2)

ag(an.UIElements.Main,0,{
Size=UDim2.new(
0,math.clamp(p.X.Offset,480,700),
0,math.clamp(p.Y.Offset,350,520)
)}):Play()
end
end
end)




if not an.HideSearchBar then
local l=a.load'J'
local m=false





















local p=ah("Search","search",an.UIElements.SideBarContainer)
p.Size=UDim2.new(1,-an.UIPadding/2,0,39)
p.Position=UDim2.new(0,an.UIPadding/2,0,an.UIPadding/2)

ae.AddSignal(p.MouseButton1Click,function()
if m then return end

l.new(an.TabModule,an.UIElements.Main,function()

m=false
if an.Resizable then
an.CanResize=true
end

ag(as,0.1,{ImageTransparency=1}):Play()
as.Active=false
end)
ag(as,0.1,{ImageTransparency=.65}):Play()
as.Active=true

m=true
an.CanResize=false
end)
end




function an.DisableTopbarButtons(l,m)
for p,v in next,m do
for x,z in next,an.TopBarButtons do
if z.Name==v then
z.Object.Visible=false
end
end
end
end

return an
end end end
local aa={
Window=nil,
Theme=nil,
Creator=a.load'a',
LocalizationModule=a.load'b',
Themes=a.load'c',
Transparent=false,

TransparencyValue=.15,

UIScale=1,

ConfigManager=nil,
Version="1.6.4",

Services=a.load'f'
}


local ac=a.load'j'local ae=

aa.Services

local af=aa.Themes
local ag=aa.Creator

local ah=ag.New local ai=
ag.Tween

ag.Themes=af local aj=

game:GetService"Players"and game:GetService"Players".LocalPlayer or nil
aa.Themes=af

local ak=protectgui or(syn and syn.protect_gui)or function()end

local al=gethui and gethui()or game.CoreGui


aa.ScreenGui=ah("ScreenGui",{
Name="WindUI",
Parent=al,
IgnoreGuiInset=true,
ScreenInsets="None",
},{
ah("UIScale",{
Scale=aa.Scale,
}),
ah("Folder",{
Name="Window"
}),






ah("Folder",{
Name="KeySystem"
}),
ah("Folder",{
Name="Popups"
}),
ah("Folder",{
Name="ToolTips"
})
})

aa.NotificationGui=ah("ScreenGui",{
Name="WindUI/Notifications",
Parent=al,
IgnoreGuiInset=true,
})
aa.DropdownGui=ah("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=al,
IgnoreGuiInset=true,
})
ak(aa.ScreenGui)
ak(aa.NotificationGui)
ak(aa.DropdownGui)

ag.Init(aa)

math.clamp(aa.TransparencyValue,0,1)

local am=a.load'k'
local an=am.Init(aa.NotificationGui)

function aa.Notify(ao,ap)
ap.Holder=an.Frame
ap.Window=aa.Window
ap.WindUI=aa
return am.New(ap)
end

function aa.SetNotificationLower(ao,ap)
an.SetLower(ap)
end

function aa.SetFont(ao,ap)
ag.UpdateFont(ap)
end

function aa.AddTheme(ao,ap)
af[ap.Name]=ap
return ap
end

function aa.SetTheme(ao,ap)
if af[ap]then
aa.Theme=af[ap]
ag.SetTheme(af[ap])


return af[ap]
end
return nil
end

function aa.GetThemes(ao)
return af
end
function aa.GetCurrentTheme(ao)
return aa.Theme.Name
end
function aa.GetTransparency(ao)
return aa.Transparent or false
end
function aa.GetWindowSize(ao)
return Window.UIElements.Main.Size
end
function aa.Localization(ao,ap)
return aa.LocalizationModule:New(ap,ag)
end

function aa.SetLanguage(ao,ap)
if ag.Localization then
return ag.SetLanguage(ap)
end
return false
end


aa:SetTheme"Dark"
aa:SetLanguage(ag.Language)


function aa.Gradient(ao,ap,ar)
local as={}
local at={}

for au,av in next,ap do
local aw=tonumber(au)
if aw then
aw=math.clamp(aw/100,0,1)
table.insert(as,ColorSequenceKeypoint.new(aw,av.Color))
table.insert(at,NumberSequenceKeypoint.new(aw,av.Transparency or 0))
end
end

table.sort(as,function(aw,ax)return aw.Time<ax.Time end)
table.sort(at,function(aw,ax)return aw.Time<ax.Time end)


if#as<2 then
error"ColorSequence requires at least 2 keypoints"
end


local aw={
Color=ColorSequence.new(as),
Transparency=NumberSequence.new(at),
}

if ar then
for ax,ay in pairs(ar)do
aw[ax]=ay
end
end

return aw
end


function aa.Popup(ao,ap)
ap.WindUI=aa
return a.load'l'.new(ap)
end


function aa.CreateWindow(ao,ap)
local ar=a.load'K'

if not isfolder"WindUI"then
makefolder"WindUI"
end
if ap.Folder then
makefolder(ap.Folder)
else
makefolder(ap.Title)
end

ap.WindUI=aa
ap.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

local as=true

local at=af[ap.Theme or"Dark"]

aa.Theme=at

ag.SetTheme(at)

local au=gethwid or function()
return game:GetService"Players".LocalPlayer.UserId
end

local av=au()

if ap.KeySystem then
as=false

local function loadKeysystem()
ac.new(ap,av,function(aw)as=aw end)
end

local aw=ap.Folder.."/"..av..".key"

if not ap.KeySystem.API and ap.KeySystem.SaveKey and ap.Folder then
if isfile(aw)then
local ax=readfile(aw)
local ay=(type(ap.KeySystem.Key)=="table")
and table.find(ap.KeySystem.Key,ax)
or tostring(ap.KeySystem.Key)==tostring(ax)

if ay then
as=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(aw)then
local ax=readfile(aw)
local ay=false

for az,aA in next,ap.KeySystem.API do
local aB=aa.Services[aA.Type]
if aB then
local aC={}
for aD,aE in next,aB.Args do
table.insert(aC,aA[aE])
end

local b=aB.New(table.unpack(aC))
local e=b.Verify(ax)
if e then
ay=true
break
end
end
end

as=ay
if not ay then loadKeysystem()end
else
loadKeysystem()
end
end

repeat task.wait()until as
end

local aw=ar(ap)

aa.Transparent=ap.Transparent
aa.Window=aw














return aw
end

return aa