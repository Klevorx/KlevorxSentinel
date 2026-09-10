-- ==============================================================================
-- KLEVORX SENTINEL (v39 - ELITE ENTERPRISE SECURITY SUITE)
-- Advanced Heuristic Vulnerability Scanner, Universal Deep Scanner & Command Console
-- Author: Klevorx (Community: https://discord.gg/YgYgPZHuHN)
-- ==============================================================================

local _0x1a2b = {
    [string.byte("P",1)] = game:GetService("Players"),
    [string.byte("R",1)] = game:GetService("ReplicatedStorage"),
    [string.byte("W",1)] = game:GetService("Workspace"),
    [string.byte("C",1)] = game:GetService("CoreGui"),
    [string.byte("H",1)] = game:GetService("HttpService"),
    [string.byte("U",1)] = game:GetService("UserInputService"),
    [string.byte("S",1)] = game:GetService("RunService")
}

local Players = _0x1a2b[80]
local ReplicatedStorage = _0x1a2b[82]
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Workspace = _0x1a2b[87]
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local StarterPlayer = game:GetService("StarterPlayer")
local UserInputService = _0x1a2b[85]
local CoreGui = _0x1a2b[67]
local HttpService = _0x1a2b[72]
local RunService = _0x1a2b[83]
local LocalPlayer = Players.LocalPlayer

local DISCORD_LINK = "\x68\x74\x74\x70\x73\x3a\x2f\x2f\x64\x69\x73\x63\x6f\x72\x64\x2e\x67\x67\x2f\x59\x67\x59\x67\x50\x5a\x48\x75\x48\x4e"

if CoreGui:FindFirstChild("\x4b\x6c\x65\x76\x6f\x72\x78\x53\x65\x6e\x74\x69\x6e\x65\x6c") then
    CoreGui.KlevorxSentinel:Destroy()
end
if CoreGui:FindFirstChild("\x4b\x6c\x65\x76\x6f\x72\x78\x4c\x6f\x61\x64\x65\x72") then
    CoreGui.KlevorxLoader:Destroy()
end
if CoreGui:FindFirstChild("\x4b\x6c\x65\x76\x6f\x72\x78\x41\x64\x6d\x69\x6e\x4d\x65\x6e\x75") then
    CoreGui.KlevorxAdminMenu:Destroy()
end
if CoreGui:FindFirstChild("\x4b\x6c\x65\x76\x6f\x72\x78\x44\x69\x73\x63\x6f\x72\x64\x50\x6f\x70\x75\x70") then
    CoreGui.KlevorxDiscordPopup:Destroy()
end

local UtilsModule = {}
function UtilsModule.CalculateEntropy(_0x3c)
    if not _0x3c or #_0x3c == 0 then return 0 end
    local _0x4d = {}
    for _0x5e = 1, #_0x3c do
        local _0x6f = _0x3c:sub(_0x5e, _0x5e)
        _0x4d[_0x6f] = (_0x4d[_0x6f] or 0) + 1
    end
    local _0x70 = 0
    local _0x81 = #_0x3c
    for _, _0x92 in pairs(_0x4d) do
        local _0xa3 = _0x92 / _0x81
        _0x70 = _0x70 - (_0xa3 * math.log(_0xa3, 2))
    end
    return _0x70
end

function UtilsModule.IsObfuscated(_0xb4)
    return #_0xb4 > 10 and UtilsModule.CalculateEntropy(_0xb4) > 3.8
end

local ConfigModule = {
    Categories = {"\x41\x4c\x4c", "\x41\x44\x4d\x49\x4e", "\x45\x43\x4f\x4e", "\x47\x41\x4d\x45\x50\x41\x53\x53", "\x4d\x4f\x56\x45\x4d\x45\x4e\x54", "\x4f\x42\x46\x55\x53\x43\x41\x54\x45\x44", "\x4d\x41\x4c\x49\x43\x49\x4f\x55\x53"},
    SuspiciousPatterns = {
        {pattern = "admin", category = "ADMIN", color = Color3.fromRGB(255, 90, 90)},
        {pattern = "ban", category = "ADMIN", color = Color3.fromRGB(255, 90, 90)},
        {pattern = "kick", category = "ADMIN", color = Color3.fromRGB(255, 90, 90)},
        {pattern = "mod", category = "ADMIN", color = Color3.fromRGB(255, 90, 90)},
        {pattern = "auth", category = "ADMIN", color = Color3.fromRGB(255, 90, 90)},
        {pattern = "godmode", category = "ADMIN", color = Color3.fromRGB(255, 50, 50)},
        {pattern = "cash", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "money", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "buy", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "give", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "coin", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "gem", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "shop", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "purchase", category = "ECON", color = Color3.fromRGB(255, 190, 50)},
        {pattern = "dupe", category = "ECON", color = Color3.fromRGB(255, 160, 50)},
        {pattern = "speed", category = "MOVEMENT", color = Color3.fromRGB(50, 200, 255)},
        {pattern = "teleport", category = "MOVEMENT", color = Color3.fromRGB(50, 200, 255)},
        {pattern = "fly", category = "MOVEMENT", color = Color3.fromRGB(50, 200, 255)},
        {pattern = "noclip", category = "MOVEMENT", color = Color3.fromRGB(50, 200, 255)},
        {pattern = "gamepass", category = "GAMEPASS", color = Color3.fromRGB(220, 100, 255)},
        {pattern = "pass", category = "GAMEPASS", color = Color3.fromRGB(220, 100, 255)},
        {pattern = "vip", category = "GAMEPASS", color = Color3.fromRGB(220, 100, 255)},
    }
}

local CoreModule = {
    Logs = {},
    LogNodes = {},
    ActiveTarget = nil,
    ScanningActive = false,
    ObfuscatedCount = 0
}

function CoreModule.AnalyzeObject(_0xc5)
    local _0xd6 = _0xc5.Name:lower()
    for _, _0xe7 in ipairs(ConfigModule.SuspiciousPatterns) do
        if _0xd6:find(_0xe7.pattern) then
            return true, _0xe7.category, _0xe7.color, "\x47\x4f\x4f\x44"
        end
    end
    if UtilsModule.IsObfuscated(_0xc5.Name) then
        CoreModule.ObfuscatedCount = CoreModule.ObfuscatedCount + 1
        return true, "\x4f\x42\x46\x55\x53\x43\x41\x54\x45\x44", Color3.fromRGB(220, 80, 255), "\x47\x4f\x4f\x44"
    end
    if _0xc5.Parent == LocalPlayer or (_0xc5:IsA("\x4c\x6f\x63\x61\x6c\x53\x63\x72\x69\x70\x74") and not _0xc5.Parent:IsA("\x50\x6c\x61\x79\x65\x72\x53\x63\x72\x69\x70\x74\x73")) then
        return true, "\x4d\x41\x4c\x49\x43\x49\x4f\x55\x53", Color3.fromRGB(255, 60, 100), "\x47\x4f\x4f\x44"
    end
    return false, "\x41\x4c\x4c", Color3.fromRGB(130, 130, 145), "\x55\x53\x45\x4c\x45\x53\x53"
end

function CoreModule.ExportToJson()
    local _0xf8 = {}
    for _, _0x109 in ipairs(CoreModule.Logs) do
        table.insert(_0xf8, {
            text = _0x109.text,
            category = _0x109.category,
            quality = _0x109.quality,
            path = _0x109.instance and _0x109.instance:GetFullName() or "\x4e\x2f\x41"
        })
    end
    local _0x11a, _0x12b = pcall(function() return HttpService:JSONEncode(_0xf8) end)
    if _0x11a and writefile then
        local _0x13c = "\x4b\x6c\x65\x76\x6f\x72\x78\x53\x65\x6e\x74\x69\x6e\x65\x6c\x5f" .. os.time() .. "\x2e\x6a\x73\x6f\x6e"
        writefile(_0x13c, _0x12b)
        return true, _0x13c
    end
    return false, "\x45\x78\x70\x6f\x72\x74\x20\x63\x61\x70\x61\x62\x69\x6c\x69\x74\x79\x20\x75\x6e\x61\x76\x61\x69\x6c\x61\x62\x6c\x65\x2e"
end

local HooksModule = {
    SpyActive = false,
    OldNamecall = nil
}

function HooksModule.Initialize(_0x14d)
    pcall(function()
        local _0x15e = 0
        HooksModule.OldNamecall = hookmetamethod(game, "\x5f\x5f\x6e\x61\x6d\x65\x63\x61\x6c\x6c", function(_0x16f, ...)
            if HooksModule.SpyActive and (typeof(_0x16f) == "\x49\x6e\x73\x74\x61\x6e\x63\x65") then
                local _0x170 = getnamecallmethod()
                if _0x170 == "\x46\x69\x72\x65\x53\x65\x72\x76\x65\x72" or _0x170 == "\x49\x6e\x76\x6f\x6b\x65\x53\x65\x72\x76\x65\x72" then
                    local _0x181 = tick()
                    if (_0x181 - _0x15e) >= 0.05 then
                        _0x15e = _0x181
                        local _0x192 = _0x16f
                        task.defer(function()
                            if _0x192 and _0x192.Parent then
                                _0x14d(string.format("[TRAFFIC] %s -> %s", _0x170, _0x192.Name), Color3.fromRGB(255, 150, 50), _0x192, "\x41\x4c\x4c", "\x47\x4f\x4f\x44")
                            end
                        end)
                    end
                end
            end
            return HooksModule.OldNamecall(_0x16f, ...)
        end)
    end)
end

local PromptGui = Instance.new("\x53\x63\x72\x65\x65\x6e\x47\x75\x69")
PromptGui.Name = "\x4b\x6c\x65\x76\x6f\x72\x78\x44\x69\x73\x63\x6f\x72\x64\x50\x6f\x70\x75\x70"
PromptGui.ResetOnSpawn = false
PromptGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
PromptGui.DisplayOrder = 9999
PromptGui.IgnoreGuiInset = true
PromptGui.Parent = CoreGui

local PopupFrame = Instance.new("\x46\x72\x61\x6d\x65", PromptGui)
PopupFrame.Size = UDim2.new(0, 360, 0, 160)
PopupFrame.Position = UDim2.new(0.5, -180, 0.5, -80)
PopupFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
PopupFrame.BorderSizePixel = 0
PopupFrame.ZIndex = 10
Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", PopupFrame).CornerRadius = UDim.new(0, 10)

local PopupStroke = Instance.new("\x55\x49\x53\x74\x72\x6f\x6b\x65", PopupFrame)
PopupStroke.Color = Color3.fromRGB(88, 101, 242)
PopupStroke.Thickness = 1.5

local PopupTitle = Instance.new("\x54\x65\x78\x74\x4c\x61\x62\x65\x6c", PopupFrame)
PopupTitle.Size = UDim2.new(1, -20, 0, 30)
PopupTitle.Position = UDim2.new(0, 10, 0, 12)
PopupTitle.BackgroundTransparency = 1
PopupTitle.Text = "\x4a\x6f\x69\x6e\x20\x4b\x6c\x65\x76\x6f\x72\x78\x20\x53\x65\x6e\x74\x69\x6e\x65\x6c\x20\x43\x6f\x6d\x6d\x75\x6e\x69\x74\x79"
PopupTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupTitle.Font = Enum.Font.GothamBold
PopupTitle.TextSize = 13
PopupTitle.ZIndex = 11
PopupTitle.TextXAlignment = Enum.TextXAlignment.Center

local PopupDesc = Instance.new("\x54\x65\x78\x74\x4c\x61\x62\x65\x6c", PopupFrame)
PopupDesc.Size = UDim2.new(1, -30, 0, 45)
PopupDesc.Position = UDim2.new(0, 15, 0, 45)
PopupDesc.BackgroundTransparency = 1
PopupDesc.Text = "\x43\x6c\x69\x63\x6b\x20\x62\x65\x6c\x6f\x77\x20\x74\x6f\x20\x63\x6f\x70\x79\x20\x79\x6f\x75\x72\x20\x69\x6e\x76\x69\x74\x65\x20\x6c\x69\x6e\x6b\x20\x6f\x72\x20\x6f\x70\x65\x6e\x20\x74\x68\x65\x20\x62\x72\x6f\x77\x73\x65\x72\x20\x74\x6f\x20\x6a\x6f\x69\x6e\x20\x6f\x75\x72\x20\x6f\x66\x66\x69\x63\x69\x61\x6c\x20\x44\x69\x73\x63\x6f\x72\x64\x20\x73\x65\x72\x76\x65\x72\x2e"
PopupDesc.TextColor3 = Color3.fromRGB(180, 180, 200)
PopupDesc.Font = Enum.Font.Gotham
PopupDesc.TextSize = 10
PopupDesc.ZIndex = 11
PopupDesc.TextWrapped = true
PopupDesc.TextXAlignment = Enum.TextXAlignment.Center

local JoinBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e", PopupFrame)
JoinBtn.Size = UDim2.new(0, 160, 0, 32)
JoinBtn.Position = UDim2.new(0.5, -85, 0, 105)
JoinBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
JoinBtn.Text = "\x4a\x6f\x69\x6e\x20\x44\x69\x73\x63\x6f\x72\x64"
JoinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinBtn.Font = Enum.Font.GothamBold
JoinBtn.TextSize = 11
JoinBtn.ZIndex = 11
JoinBtn.BorderSizePixel = 0
Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", JoinBtn).CornerRadius = UDim.new(0, 6)

local DismissBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e", PopupFrame)
DismissBtn.Size = UDim2.new(0, 24, 0, 24)
DismissBtn.Position = UDim2.new(1, -30, 0, 8)
DismissBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
DismissBtn.Text = "\xd7"
DismissBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DismissBtn.Font = Enum.Font.GothamBold
DismissBtn.TextSize = 12
DismissBtn.ZIndex = 11
DismissBtn.BorderSizePixel = 0
Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", DismissBtn).CornerRadius = UDim.new(0, 4)

JoinBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then
            setclipboard(DISCORD_LINK)
        end
        if syn and syn.request then
            syn.request({ Url = "\x68\x74\x74\x70\x3a\x2f\x2f\x31\x32\x37\x2e\x30\x2e\x30\x2e\x31\x3a\x36\x34\x36\x33\x2f\x72\x70\x63\x3f\x76\x3d\x31", Method = "\x50\x4f\x53\x54", Headers = {["\x43\x6f\x6e\x74\x65\x6e\x74\x2d\x54\x79\x70\x65"] = "\x61\x70\x70\x6c\x69\x63\x61\x74\x69\x6f\x6e\x2f\x6a\x73\x6f\x6e", ["\x4f\x72\x69\x67\x69\x6e"] = "\x68\x74\x74\x70\x73\x3a\x2f\x2f\x64\x69\x73\x63\x6f\x72\x64\x2e\x63\x6f\x6d"}, Body = HttpService:JSONEncode({cmd = "\x49\x4e\x56\x49\x54\x45\x5f\x42\x52\x4f\x57\x53\x45\x52", args = {code = "\x59\x67\x59\x67\x50\x5a\x48\x75\x48\x4e"}, nonce = HttpService:GenerateGUID(false)}) })
        end
    end)
    JoinBtn.Text = "Link Copied / Opened!"
    task.delay(1.5, function()
        PromptGui:Destroy()
    end)
end)

DismissBtn.MouseButton1Click:Connect(function()
    PromptGui:Destroy()
end)

local UIModule = {}
UIModule.CurrentCategory = "\x41\x4c\x4c"
UIModule.SearchQuery = ""
UIModule.QualityFilter = "\x41\x4c\x4c"

function UIModule.BuildInterface()
    if CoreGui:FindFirstChild("\x4b\x6c\x65\x76\x6f\x72\x78\x53\x65\x6e\x74\x69\x6e\x65\x6c") then
        CoreGui.KlevorxSentinel:Destroy()
    end

    local ScreenGui = Instance.new("\x53\x63\x72\x65\x65\x6e\x47\x75\x69")
    ScreenGui.Name = "\x4b\x6c\x65\x76\x6f\x72\x78\x53\x65\x6e\x74\x69\x6e\x65\x6c"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    ScreenGui.DisplayOrder = 100
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = CoreGui

    local MainFrame = Instance.new("\x46\x72\x61\x6d\x65")
    MainFrame.Size = UDim2.new(0, 900, 0, 620)
    MainFrame.Position = UDim2.new(0.5, -450, 0.5, -310)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", MainFrame).CornerRadius = UDim.new(0, 6)

    local _0x1a3, _0x1b4, _0x1c5
    MainFrame.InputBegan:Connect(function(_0x1d6)
        if _0x1d6.UserInputType == Enum.UserInputType.MouseButton1 or _0x1d6.UserInputType == Enum.UserInputType.Touch then
            _0x1a3 = true
            _0x1b4 = _0x1d6.Position
            _0x1c5 = MainFrame.Position
        end
    end)

    UserInputService.InputEnded:Connect(function(_0x1d6)
        if _0x1d6.UserInputType == Enum.UserInputType.MouseButton1 or _0x1d6.UserInputType == Enum.UserInputType.Touch then
            _0x1a3 = false
        end
    end)

    UserInputService.InputChanged:Connect(function(_0x1d6)
        if _0x1a3 and (_0x1d6.UserInputType == Enum.UserInputType.MouseMovement or _0x1d6.UserInputType == Enum.UserInputType.Touch) then
            local _0x1e7 = _0x1d6.Position - _0x1b4
            MainFrame.Position = UDim2.new(_0x1c5.X.Scale, _0x1c5.X.Offset + _0x1e7.X, _0x1c5.Y.Scale, _0x1c5.Y.Offset + _0x1e7.Y)
        end
    end)

    local TopBar = Instance.new("\x46\x72\x61\x6d\x65")
    TopBar.Size = UDim2.new(1, 0, 0, 36)
    TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", TopBar).CornerRadius = UDim.new(0, 6)

    local Title = Instance.new("\x54\x65\x78\x74\x4c\x61\x62\x65\x6c")
    Title.Size = UDim2.new(0, 230, 1, 0)
    Title.Position = UDim2.new(0, 14, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "\x4b\x6c\x65\x76\x6f\x72\x78\x20\x2f\x2f\x20\x53\x65\x6e\x74\x69\x6e\x65\x6c"
    Title.TextColor3 = Color3.fromRGB(220, 220, 230)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 11
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar

    local CloseBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    CloseBtn.Size = UDim2.new(0, 28, 0, 24)
    CloseBtn.Position = UDim2.new(1, -32, 0, 6)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    CloseBtn.Text = "\xd7"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 13
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", CloseBtn).CornerRadius = UDim.new(0, 4)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local MinBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    MinBtn.Size = UDim2.new(0, 28, 0, 24)
    MinBtn.Position = UDim2.new(1, -64, 0, 6)
    MinBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    MinBtn.Text = "\u2014"
    MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 12
    MinBtn.BorderSizePixel = 0
    MinBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", MinBtn).CornerRadius = UDim.new(0, 4)

    local DiscordBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    DiscordBtn.Size = UDim2.new(0, 75, 0, 24)
    DiscordBtn.Position = UDim2.new(1, -145, 0, 6)
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    DiscordBtn.Text = "\x44\x69\x73\x63\x6f\x72\x64"
    DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DiscordBtn.Font = Enum.Font.GothamBold
    DiscordBtn.TextSize = 10
    DiscordBtn.BorderSizePixel = 0
    DiscordBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", DiscordBtn).CornerRadius = UDim.new(0, 4)

    DiscordBtn.MouseButton1Click:Connect(function()
        pcall(function()
            if setclipboard then
                setclipboard(DISCORD_LINK)
            end
        end)
        DiscordBtn.Text = "\x43\x6f\x70\x69\x65\x64\x21"
        task.delay(1.5, function()
            if DiscordBtn and DiscordBtn.Parent then
                DiscordBtn.Text = "\x44\x69\x73\x63\x6f\x72\x64"
            end
        end)
    end)

    local AdminMenuBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    AdminMenuBtn.Size = UDim2.new(0, 80, 0, 24)
    AdminMenuBtn.Position = UDim2.new(1, -232, 0, 6)
    AdminMenuBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    AdminMenuBtn.Text = "\x43\x6f\x6d\x6d\x61\x6e\x64\x73"
    AdminMenuBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
    AdminMenuBtn.Font = Enum.Font.GothamMedium
    AdminMenuBtn.TextSize = 10
    AdminMenuBtn.BorderSizePixel = 0
    AdminMenuBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", AdminMenuBtn).CornerRadius = UDim.new(0, 4)

    local ExportBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    ExportBtn.Size = UDim2.new(0, 50, 0, 24)
    ExportBtn.Position = UDim2.new(1, -289, 0, 6)
    ExportBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    ExportBtn.Text = "\x45\x78\x70\x6f\x72\x74"
    ExportBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
    ExportBtn.Font = Enum.Font.GothamMedium
    ExportBtn.TextSize = 10
    ExportBtn.BorderSizePixel = 0
    ExportBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", ExportBtn).CornerRadius = UDim.new(0, 4)

    local ScanAllBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    ScanAllBtn.Size = UDim2.new(0, 60, 0, 24)
    ScanAllBtn.Position = UDim2.new(1, -356, 0, 6)
    ScanAllBtn.BackgroundColor3 = Color3.fromRGB(140, 40, 180)
    ScanAllBtn.Text = "\x53\x63\x61\x6e\x20\x41\x6c\x6c"
    ScanAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScanAllBtn.Font = Enum.Font.GothamMedium
    ScanAllBtn.TextSize = 10
    ScanAllBtn.BorderSizePixel = 0
    ScanAllBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", ScanAllBtn).CornerRadius = UDim.new(0, 4)

    local ScanBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    ScanBtn.Size = UDim2.new(0, 60, 0, 24)
    ScanBtn.Position = UDim2.new(1, -423, 0, 6)
    ScanBtn.BackgroundColor3 = Color3.fromRGB(20, 130, 90)
    ScanBtn.Text = "\x52\x65\x73\x63\x61\x6e"
    ScanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScanBtn.Font = Enum.Font.GothamMedium
    ScanBtn.TextSize = 10
    ScanBtn.BorderSizePixel = 0
    ScanBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", ScanBtn).CornerRadius = UDim.new(0, 4)

    local QualityFilterBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    QualityFilterBtn.Size = UDim2.new(0, 80, 0, 24)
    QualityFilterBtn.Position = UDim2.new(1, -510, 0, 6)
    QualityFilterBtn.BackgroundColor3 = Color3.fromRGB(50, 80, 140)
    QualityFilterBtn.Text = "\x46\x69\x6c\x74\x65\x72\x3a\x20\x41\x4c\x4c"
    QualityFilterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    QualityFilterBtn.Font = Enum.Font.GothamBold
    QualityFilterBtn.TextSize = 9
    QualityFilterBtn.BorderSizePixel = 0
    QualityFilterBtn.Parent = TopBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", QualityFilterBtn).CornerRadius = UDim.new(0, 4)

    QualityFilterBtn.MouseButton1Click:Connect(function()
        if UIModule.QualityFilter == "\x41\x4c\x4c" then
            UIModule.QualityFilter = "\x47\x4f\x4f\x44"
            QualityFilterBtn.Text = "\x46\x69\x6c\x74\x65\x72\x3a\x20\x47\x4f\x4f\x44"
            QualityFilterBtn.BackgroundColor3 = Color3.fromRGB(30, 150, 70)
        elseif UIModule.QualityFilter == "\x47\x4f\x4f\x44" then
            UIModule.QualityFilter = "\x55\x53\x45\x4c\x45\x53\x53"
            QualityFilterBtn.Text = "\x46\x69\x6c\x74\x65\x72\x3a\x20\x55\x53\x45\x4c\x45\x53\x53"
            QualityFilterBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
        else
            UIModule.QualityFilter = "\x41\x4c\x4c"
            QualityFilterBtn.Text = "\x46\x69\x6c\x74\x65\x72\x3a\x20\x41\x4c\x4c"
            QualityFilterBtn.BackgroundColor3 = Color3.fromRGB(50, 80, 140)
        end
        UIModule.RefreshFilters()
    end)

    local FilterBar = Instance.new("\x46\x72\x61\x6d\x65")
    FilterBar.Size = UDim2.new(1, -20, 0, 32)
    FilterBar.Position = UDim2.new(0, 10, 0, 44)
    FilterBar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
    FilterBar.BorderSizePixel = 0
    FilterBar.Parent = MainFrame
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", FilterBar).CornerRadius = UDim.new(0, 5)

    for _0x1f8, _0x209 in ipairs(ConfigModule.Categories) do
        local catBtn = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
        catBtn.Size = UDim2.new(0, 65, 0, 22)
        catBtn.Position = UDim2.new(0, 5 + ((_0x1f8 - 1) * 69), 0, 5)
        catBtn.BackgroundColor3 = (_0x209 == "\x41\x4c\x4c") and Color3.fromRGB(20, 130, 90) or Color3.fromRGB(25, 25, 36)
        catBtn.Text = _0x209
        catBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
        catBtn.Font = Enum.Font.GothamMedium
        catBtn.TextSize = 8
        catBtn.BorderSizePixel = 0
        catBtn.Parent = FilterBar
        Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", catBtn).CornerRadius = UDim.new(0, 4)

        catBtn.MouseButton1Click:Connect(function()
            UIModule.CurrentCategory = _0x209
            for _, _0x21a in ipairs(FilterBar:GetChildren()) do
                if _0x21a:IsA("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e") then _0x21a.BackgroundColor3 = Color3.fromRGB(25, 25, 36) end
            end
            catBtn.BackgroundColor3 = Color3.fromRGB(20, 130, 90)
            UIModule.RefreshFilters()
        end)
    end

    local SearchBox = Instance.new("\x54\x65\x78\x74\x42\x6f\x78")
    SearchBox.Size = UDim2.new(0, 170, 0, 22)
    SearchBox.Position = UDim2.new(1, -175, 0, 5)
    SearchBox.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    SearchBox.TextColor3 = Color3.fromRGB(220, 220, 230)
    SearchBox.PlaceholderText = "\x53\x65\x61\x72\x63\x68\x20\x6c\x6f\x67\x73\x2e\x2e\x2e"
    SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
    SearchBox.Font = Enum.Font.Code
    SearchBox.TextSize = 9
    SearchBox.Text = ""
    SearchBox.BorderSizePixel = 0
    SearchBox.Parent = FilterBar
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", SearchBox).CornerRadius = UDim.new(0, 4)

    SearchBox:GetPropertyChangedSignal("\x54\x65\x78\x74"):Connect(function()
        UIModule.SearchQuery = SearchBox.Text:lower()
        UIModule.RefreshFilters()
    end)

    local LeftPanel = Instance.new("\x53\x63\x72\x6f\x6c\x6c\x69\x6e\x67\x46\x72\x61\x6d\x65")
    LeftPanel.Size = UDim2.new(0.53, -14, 1, -112)
    LeftPanel.Position = UDim2.new(0, 10, 0, 84)
    LeftPanel.BackgroundColor3 = Color3.fromRGB(8, 8, 11)
    LeftPanel.BorderSizePixel = 1
    LeftPanel.BorderColor3 = Color3.fromRGB(30, 30, 42)
    LeftPanel.ScrollBarThickness = 4
    LeftPanel.Parent = MainFrame
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", LeftPanel).CornerRadius = UDim.new(0, 5)

    local LeftLayout = Instance.new("\x55\x49\x4c\x69\x73\x74\x4c\x61\x79\x6f\x75\x74")
    LeftLayout.Padding = UDim.new(0, 4)
    LeftLayout.Parent = LeftPanel
    LeftLayout:GetPropertyChangedSignal("\x41\x62\x73\x6f\x6c\x75\x74\x65\x43\x6f\x6e\x74\x65\x6e\x74\x53\x69\x7a\x65"):Connect(function()
        LeftPanel.CanvasSize = UDim2.new(0, 0, 0, LeftLayout.AbsoluteContentSize.Y + 10)
    end)

    local RightPanel = Instance.new("\x53\x63\x72\x6f\x6c\x6c\x69\x6e\x67\x46\x72\x61\x6d\x65")
    RightPanel.Size = UDim2.new(0.47, -14, 1, -112)
    RightPanel.Position = UDim2.new(0.53, 4, 0, 84)
    RightPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    RightPanel.BorderSizePixel = 1
    RightPanel.BorderColor3 = Color3.fromRGB(30, 30, 42)
    RightPanel.ScrollBarThickness = 4
    RightPanel.Parent = MainFrame
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", RightPanel).CornerRadius = UDim.new(0, 5)

    local RightLayout = Instance.new("\x55\x49\x4c\x69\x73\x74\x4c\x61\x79\x6f\x75\x74")
    RightLayout.Padding = UDim.new(0, 6)
    RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    RightLayout.Parent = RightPanel
    RightLayout:GetPropertyChangedSignal("\x41\x62\x73\x6f\x6c\x75\x74\x65\x43\x6f\x6e\x74\x65\x6e\x74\x53\x69\x7a\x65"):Connect(function()
        RightPanel.CanvasSize = UDim2.new(0, 0, 0, RightLayout.AbsoluteContentSize.Y + 15)
    end)

    local StatsLabel = Instance.new("\x54\x65\x78\x74\x4c\x61\x62\x65\x6c")
    StatsLabel.Size = UDim2.new(1, -20, 0, 18)
    StatsLabel.Position = UDim2.new(0, 10, 1, -20)
    StatsLabel.BackgroundTransparency = 1
    StatsLabel.TextColor3 = Color3.fromRGB(120, 120, 140)
    StatsLabel.Font = Enum.Font.Code
    StatsLabel.TextSize = 9
    StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatsLabel.Text = "\x54\x61\x72\x67\x65\x74\x73\x3a\x20\x30\x20\x7c\x20\x4c\x6f\x67\x73\x3a\x20\x30\x20\x7c\x20\x53\x74\x61\x74\x75\x73\x3a\x20\x49\x64\x6c\x65"
    StatsLabel.Parent = MainFrame

    local InfoBox = Instance.new("\x54\x65\x78\x74\x4c\x61\x62\x65\x6c")
    InfoBox.Size = UDim2.new(1, -16, 0, 100)
    InfoBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    InfoBox.TextColor3 = Color3.fromRGB(200, 200, 215)
    InfoBox.Text = "\x53\x65\x6c\x65\x63\x74\x20\x61\x6e\x20\x65\x6e\x64\x70\x6f\x69\x6e\x74\x20\x66\x72\x6f\x6d\x20\x74\x68\x65\x20\x6c\x65\x66\x74\x20\x66\x65\x65\x64\x20\x74\x6f\x20\x61\x6e\x61\x6c\x79\x7a\x65\x20\x74\x61\x72\x67\x65\x74\x73\x20\x61\x6e\x64\x20\x65\x78\x65\x63\x75\x74\x65\x20\x73\x61\x66\x65\x74\x79\x20\x61\x73\x73\x65\x73\x73\x6d\x65\x6e\x74\x73\x2e"
    InfoBox.Font = Enum.Font.Code
    InfoBox.TextSize = 10
    InfoBox.TextXAlignment = Enum.TextXAlignment.Left
    InfoBox.TextYAlignment = Enum.TextYAlignment.Top
    InfoBox.TextWrapped = true
    InfoBox.BorderSizePixel = 0
    InfoBox.Parent = RightPanel
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", InfoBox).CornerRadius = UDim.new(0, 5)

    local ArgInput = Instance.new("\x54\x65\x78\x74\x42\x6f\x78")
    ArgInput.Size = UDim2.new(1, -16, 0, 26)
    ArgInput.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    ArgInput.TextColor3 = Color3.fromRGB(220, 220, 230)
    ArgInput.PlaceholderText = "\x50\x61\x79\x6c\x6f\x61\x64\x20\x28\x44\x65\x66\x61\x75\x6c\x74\x3a\x20\x56\x75\x6c\x6e\x54\x65\x73\x74\x50\x72\x6f\x62\x65\x29"
    ArgInput.PlaceholderColor3 = Color3.fromRGB(90, 90, 110)
    ArgInput.Font = Enum.Font.Code
    ArgInput.TextSize = 10
    ArgInput.Text = ""
    ArgInput.BorderSizePixel = 0
    ArgInput.Parent = RightPanel
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", ArgInput).CornerRadius = UDim.new(0, 5)

    local function _0x22b(_0x23c, _0x24d)
        local _0x25e = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
        _0x25e.Size = UDim2.new(1, -16, 0, 26)
        _0x25e.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        _0x25e.Text = _0x23c
        _0x25e.TextColor3 = Color3.fromRGB(220, 220, 230)
        _0x25e.Font = Enum.Font.GothamMedium
        _0x25e.TextSize = 10
        _0x25e.BorderSizePixel = 0
        _0x25e.Parent = RightPanel

        local _0x26f = Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72")
        _0x26f.CornerRadius = UDim.new(0, 5)
        _0x26f.Parent = _0x25e

        local _0x270 = Instance.new("\x55\x49\x53\x74\x72\x6f\x6b\x65")
        _0x270.Color = _0x24d or Color3.fromRGB(45, 45, 60)
        _0x270.Thickness = 1
        _0x270.Transparency = 0.4
        _0x270.Parent = _0x25e

        return _0x25e
    end

    local TestFireBtn = _0x22b("\x45\x78\x65\x63\x75\x74\x65\x20\x52\x65\x6d\x6f\x74\x65\x20\x43\x61\x6c\x6c", Color3.fromRGB(200, 110, 40))
    local StressBtn = _0x22b("\x52\x75\x6e\x20\x53\x74\x72\x65\x73\x73\x20\x54\x65\x73\x74\x20\x28\x35\x30\x78\x29", Color3.fromRGB(200, 50, 50))
    local MultiFuzzBtn = _0x22b("\x4d\x75\x6c\x74\x69\x2d\x54\x79\x70\x65\x20\x50\x61\x72\x61\x6d\x65\x74\x65\x72\x20\x46\x75\x7a\x7a\x65\x72", Color3.fromRGB(130, 60, 180))
    local AuditGamepassBtn = _0x22b("\x41\x75\x64\x69\x74\x20\x43\x6c\x69\x65\x6e\x74\x20\x56\x61\x6c\x69\x64\x61\x74\x69\x6f\x6e", Color3.fromRGB(40, 130, 200))
    local SpyToggleBtn = _0x22b("\x54\x6f\x67\x67\x6c\x65\x20\x54\x72\x61\x66\x66\x69\x63\x20\x53\x70\x79\x20\x49\x6e\x74\x65\x72\x63\x65\x70\x74\x6f\x72", Color3.fromRGB(50, 160, 90))
    local DecompileBtn = _0x22b("\x44\x65\x63\x6f\x6d\x70\x69\x6c\x65\x20\x53\x6f\x75\x72\x63\x65\x20\x53\x63\x72\x69\x70\x74", Color3.fromRGB(90, 70, 180))
    local CopySnippetBtn = _0x22b("\x43\x6f\x70\x79\x20\x45\x78\x70\x6c\x6f\x69\x74\x20\x53\x6e\x69\x70\x70\x65\x74", Color3.fromRGB(40, 150, 150))
    local ClearFeedBtn = _0x22b("\x43\x6c\x65\x61\x72\x20\x4c\x6f\x67\x20\x46\x65\x65\x64", Color3.fromRGB(80, 80, 95))

    local _0x281 = false
    MinBtn.MouseButton1Click:Connect(function()
        _0x281 = not _0x281
        LeftPanel.Visible = not _0x281
        RightPanel.Visible = not _0x281
        FilterBar.Visible = not _0x281
        StatsLabel.Visible = not _0x281
        MainFrame.Size = _0x281 and UDim2.new(0, 900, 0, 36) or UDim2.new(0, 900, 0, 620)
        MinBtn.Text = _0x281 and "\x2b" or "\u2014"
    end)

    local AdminGui = Instance.new("\x53\x63\x72\x65\x65\x6e\x47\x75\x69")
    AdminGui.Name = "\x4b\x6c\x65\x76\x6f\x72\x78\x53\x65\x6e\x74\x69\x6e\x65\x6c\x41\x64\x6d\x69\x6e"
    AdminGui.ResetOnSpawn = false
    AdminGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    AdminGui.DisplayOrder = 101
    AdminGui.IgnoreGuiInset = true
    AdminGui.Enabled = false
    AdminGui.Parent = CoreGui

    local AdminFrame = Instance.new("\x46\x72\x61\x6d\x65", AdminGui)
    AdminFrame.Size = UDim2.new(0, 440, 0, 340)
    AdminFrame.Position = UDim2.new(0.5, -220, 0.5, -170)
    AdminFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    AdminFrame.BorderSizePixel = 0
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", AdminFrame).CornerRadius = UDim.new(0, 6)
    local AdminStroke = Instance.new("\x55\x49\x53\x74\x72\x6f\x6b\x65", AdminFrame)
    AdminStroke.Color = Color3.fromRGB(45, 45, 60)
    AdminStroke.Thickness = 1

    local _0x292, _0x2a3, _0x2b4
    AdminFrame.InputBegan:Connect(function(_0x1d6)
        if _0x1d6.UserInputType == Enum.UserInputType.MouseButton1 or _0x1d6.UserInputType == Enum.UserInputType.Touch then
            _0x292 = true
            _0x2a3 = _0x1d6.Position
            _0x2b4 = AdminFrame.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(_0x1d6)
        if _0x1d6.UserInputType == Enum.UserInputType.MouseButton1 or _0x1d6.UserInputType == Enum.UserInputType.Touch then
            _0x292 = false
        end
    end)
    UserInputService.InputChanged:Connect(function(_0x1d6)
        if _0x292 and (_0x1d6.UserInputType == Enum.UserInputType.MouseMovement or _0x1d6.UserInputType == Enum.UserInputType.Touch) then
            local _0x1e7 = _0x1d6.Position - _0x2a3
            AdminFrame.Position = UDim2.new(_0x2b4.X.Scale, _0x2b4.X.Offset + _0x1e7.X, _0x2b4.Y.Scale, _0x2b4.Y.Offset + _0x1e7.Y)
        end
    end)

    local AdminTop = Instance.new("\x46\x72\x61\x6d\x65", AdminFrame)
    AdminTop.Size = UDim2.new(1, 0, 0, 32)
    AdminTop.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    AdminTop.BorderSizePixel = 0
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", AdminTop).CornerRadius = UDim.new(0, 6)

    local AdminTitle = Instance.new("\x54\x65\x78\x74\x4c\x61\x62\x65\x6c", AdminTop)
    AdminTitle.Size = UDim2.new(1, -40, 1, 0)
    AdminTitle.Position = UDim2.new(0, 12, 0, 0)
    AdminTitle.BackgroundTransparency = 1
    AdminTitle.Text = "\x43\x6f\x6d\x6d\x61\x6e\x64\x20\x43\x6f\x6e\x73\x6f\x6c\x65"
    AdminTitle.TextColor3 = Color3.fromRGB(220, 220, 230)
    AdminTitle.Font = Enum.Font.GothamBold
    AdminTitle.TextSize = 11
    AdminTitle.TextXAlignment = Enum.TextXAlignment.Left

    local AdminClose = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e", AdminTop)
    AdminClose.Size = UDim2.new(0, 24, 0, 22)
    AdminClose.Position = UDim2.new(1, -28, 0, 5)
    AdminClose.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    AdminClose.Text = "\xd7"
    AdminClose.TextColor3 = Color3.fromRGB(255, 255, 255)
    AdminClose.Font = Enum.Font.GothamBold
    AdminClose.TextSize = 12
    AdminClose.BorderSizePixel = 0
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", AdminClose).CornerRadius = UDim.new(0, 4)
    AdminClose.MouseButton1Click:Connect(function() AdminGui.Enabled = false end)

    local CmdInput = Instance.new("\x54\x65\x78\x74\x42\x6f\x78", AdminFrame)
    CmdInput.Size = UDim2.new(1, -20, 0, 32)
    CmdInput.Position = UDim2.new(0, 10, 0, 42)
    CmdInput.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    CmdInput.TextColor3 = Color3.fromRGB(220, 220, 230)
    CmdInput.PlaceholderText = "\x45\x6e\x74\x65\x72\x20\x63\x6f\x6d\x6d\x61\x6e\x64\x2e\x2e\x2e\x20\x28\x65\x2e\x67\x2e\x20\x73\x70\x65\x65\x64\x20\x31\x30\x30\x2c\x20\x66\x6c\x79\x2c\x20\x74\x70\x29"
    CmdInput.PlaceholderColor3 = Color3.fromRGB(90, 90, 110)
    CmdInput.Font = Enum.Font.Code
    CmdInput.TextSize = 10
    CmdInput.Text = ""
    CmdInput.BorderSizePixel = 0
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", CmdInput).CornerRadius = UDim.new(0, 4)

    local CmdOutput = Instance.new("\x54\x65\x78\x74\x4c\x61\x62\x65\x6c", AdminFrame)
    CmdOutput.Size = UDim2.new(1, -20, 0, 238)
    CmdOutput.Position = UDim2.new(0, 10, 0, 84)
    CmdOutput.BackgroundColor3 = Color3.fromRGB(8, 8, 11)
    CmdOutput.TextColor3 = Color3.fromRGB(150, 220, 150)
    CmdOutput.Text = "=== SYSTEM CONSOLE READY ===\n\nSupported Commands:\n- speed [value] : Modify walk speed\n- jp [value] : Modify jump power\n- fly : Enable fluid camera flight\n- unfly : Disable flight mode\n- noclip : Disable part collision\n- clip : Restore standard physics\n- tp [username] : Teleport to target user\n- gravity [value] : Adjust world gravity\n- respawn : Trigger character respawn\n- clear : Clear console logs"
    CmdOutput.Font = Enum.Font.Code
    CmdOutput.TextSize = 10
    CmdOutput.TextXAlignment = Enum.TextXAlignment.Left
    CmdOutput.TextYAlignment = Enum.TextYAlignment.Top
    CmdOutput.TextWrapped = true
    CmdOutput.BorderSizePixel = 0
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", CmdOutput).CornerRadius = UDim.new(0, 4)

    AdminMenuBtn.MouseButton1Click:Connect(function()
        AdminGui.Enabled = not AdminGui.Enabled
    end)

    local _0x2c5 = false
    local _0x2d6 = 50
    local _0x2e7 = nil

    CmdInput.FocusLost:Connect(function(_0x2f8)
        if not _0x2f8 then return end
        local _0x309 = CmdInput.Text
        CmdInput.Text = ""
        local _0x31a = {}
        for _0x32b in _0x309:gmatch("\x25\x53\x2b") do
            table.insert(_0x31a, _0x32b)
        end
        local _0x33c = _0x31a[1] and _0x31a[1]:lower() or ""
        local _0x34d = _0x31a[2] and tonumber(_0x31a[2]) or _0x31a[2]

        local _0x35e = LocalPlayer.Character
        local _0x36f = _0x35e and _0x35e:FindFirstChildOfClass("\x48\x75\x6d\x61\x6e\x6f\x69\x64")
        local _0x370 = _0x35e and _0x35e:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74")

        if _0x33c == "\x73\x70\x65\x65\x64" and _0x36f and tonumber(_0x34d) then
            _0x36f.WalkSpeed = tonumber(_0x34d)
            CmdOutput.Text = ">> WalkSpeed updated: " .. tostring(_0x34d)
        elseif (_0x33c == "\x6a\x70" or _0x33c == "\x6a\x75\x6d\x70\x70\x6f\x77\x65\x72") and _0x36f and tonumber(_0x34d) then
            _0x36f.JumpPower = tonumber(_0x34d)
            CmdOutput.Text = ">> JumpPower updated: " .. tostring(_0x34d)
        elseif _0x33c == "\x67\x72\x61\x76\x69\x74\x79" and tonumber(_0x34d) then
            Workspace.Gravity = tonumber(_0x34d)
            CmdOutput.Text = ">> Gravity updated: " .. tostring(_0x34d)
        elseif _0x33c == "\x72\x65\x73\x70\x61\x77\x6e" then
            if _0x36f then _0x36f.Health = 0 end
            CmdOutput.Text = ">> Character reset triggered."
        elseif _0x33c == "\x6e\x6f\x63\x6c\x69\x70" then
            RunService:BindToRenderStep("\x4b\x6c\x65\x76\x6f\x72\x78\x4e\x6f\x63\x6c\x69\x70", 1, function()
                if LocalPlayer.Character then
                    for _, _0x381 in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if _0x381:IsA("\x42\x61\x73\x65\x50\x61\x72\x74") then _0x381.CanCollide = false end
                    end
                end
            end)
            CmdOutput.Text = ">> Collision disabled (Noclip active)."
        elseif _0x33c == "\x63\x6c\x69\x70" then
            pcall(function() RunService:UnbindFromRenderStep("\x4b\x6c\x65\x76\x6f\x72\x78\x4e\x6f\x63\x6c\x69\x70") end)
            CmdOutput.Text = ">> Standard collision physics restored."
        elseif _0x33c == "\x66\x6c\x79" then
            if not _0x2c5 and _0x370 then
                _0x2c5 = true
                local _0x392 = Workspace.CurrentCamera
                _0x2e7 = RunService.RenderStepped:Connect(function()
                    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74") then return end
                    local _0x3a3 = LocalPlayer.Character.HumanoidRootPart
                    local _0x3b4 = Vector3.new()
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then _0x3b4 = _0x3b4 + _0x392.CoordinateFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then _0x3b4 = _0x3b4 - _0x392.CoordinateFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then _0x3b4 = _0x3b4 - _0x392.CoordinateFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then _0x3b4 = _0x3b4 + _0x392.CoordinateFrame.RightVector end
                    _0x3a3.Velocity = _0x3b4 * _0x2d6
                end)
                CmdOutput.Text = ">> Flight protocol initiated (WASD controls)."
            else
                CmdOutput.Text = ">> Flight is already enabled."
            end
        elseif _0x33c == "\x75\x6e\x66\x6c\x79" then
            if _0x2c5 then
                _0x2c5 = false
                if _0x2e7 then _0x2e7:Disconnect() end
                CmdOutput.Text = ">> Flight protocol terminated."
            end
        elseif _0x33c == "\x74\x70" and _0x34d then
            local _0x3c5 = nil
            for _, _0x3d6 in ipairs(Players:GetPlayers()) do
                if _0x3d6.Name:lower():find(tostring(_0x34d):lower()) or _0x3d6.DisplayName:lower():find(tostring(_0x34d):lower()) then
                    _0x3c5 = _0x3d6
                    break
                end
            end
            if _0x3c5 and _0x3c5.Character and _0x3c5.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74") and _0x370 then
                _0x370.CFrame = _0x3c5.Character.HumanoidRootPart.CFrame
                CmdOutput.Text = ">> Teleported successfully to " .. _0x3c5.Name
            else
                CmdOutput.Text = ">> Error: Target player not found."
            end
        elseif _0x33c == "\x63\x6c\x65\x61\x72" then
            CmdOutput.Text = "=== SYSTEM CONSOLE READY ==="
        else
            CmdOutput.Text = ">> Error: Invalid command or parameters: " .. tostring(_0x33c)
        end
    end)

    UIModule.LeftPanel = LeftPanel
    UIModule.InfoBox = InfoBox
    UIModule.ArgInput = ArgInput
    UIModule.StatsLabel = StatsLabel
    UIModule.ScanBtn = ScanBtn
    UIModule.ScanAllBtn = ScanAllBtn
    UIModule.ExportBtn = ExportBtn
    UIModule.TestFireBtn = TestFireBtn
    UIModule.StressBtn = StressBtn
    UIModule.MultiFuzzBtn = MultiFuzzBtn
    UIModule.AuditGamepassBtn = AuditGamepassBtn
    UIModule.SpyToggleBtn = SpyToggleBtn
    UIModule.DecompileBtn = DecompileBtn
    UIModule.CopySnippetBtn = CopySnippetBtn
    UIModule.ClearFeedBtn = ClearFeedBtn
end

function UIModule.RefreshFilters()
    for _, _0x3e7 in ipairs(CoreModule.LogNodes) do
        local _0x3f8 = (UIModule.CurrentCategory == "\x41\x4c\x4c" or _0x3e7.category == UIModule.CurrentCategory)
        local _0x409 = (UIModule.SearchQuery == "" or _0x3e7.text:lower():find(UIModule.SearchQuery))
        local _0x41a = true
        if UIModule.QualityFilter == "\x47\x4f\x4f\x44" then
            _0x41a = (_0x3e7.quality == "\x47\x4f\x4f\x44")
        elseif UIModule.QualityFilter == "\x55\x53\x45\x4c\x45\x53\x53" then
            _0x41a = (_0x3e7.quality == "\x55\x53\x45\x4c\x45\x53\x53")
        end
        _0x3e7.instance.Visible = (_0x3f8 and _0x409 and _0x41a)
    end
end

function UIModule.AppendLog(_0x42b, _0x43c, _0x44d, _0x45e, _0x46f)
    local _0x470 = os.date("\x25\x48\x3a\x25\x4d\x3a\x25\x53")
    local _0x481 = string.format("\x5b\x25\x73\x5d\x20\x25\x73", _0x470, _0x42b)
    local _0x492 = _0x46f or "\x47\x4f\x4f\x44"
    
    local _0x4a3 = Instance.new("\x54\x65\x78\x74\x42\x75\x74\x74\x6f\x6e")
    _0x4a3.Size = UDim2.new(1, -6, 0, 24)
    _0x4a3.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    _0x4a3.BackgroundTransparency = 0.6
    _0x4a3.Text = "\x20\x20" .. _0x481
    _0x4a3.TextColor3 = _0x43c or Color3.fromRGB(200, 200, 215)
    _0x4a3.Font = Enum.Font.Code
    _0x4a3.TextSize = 9
    _0x4a3.TextXAlignment = Enum.TextXAlignment.Left
    _0x4a3.AutoButtonColor = true
    _0x4a3.Parent = UIModule.LeftPanel
    Instance.new("\x55\x49\x43\x6f\x72\x6e\x65\x72", _0x4a3).CornerRadius = UDim.new(0, 4)

    if _0x44d then
        _0x4a3.MouseButton1Click:Connect(function()
            CoreModule.ActiveTarget = _0x44d
            UIModule.InfoBox.Text = string.format("\x54\x61\x72\x67\x65\x74\x20\x4e\x61\x6d\x65\x3a\x20\x25\x73\n\x43\x6c\x61\x73\x73\x20\x54\x79\x70\x65\x3a\x20\x25\x73\n\x46\x75\x6c\x6c\x20\x50\x61\x74\x68\x3a\x20\x25\x73", 
                _0x44d.Name, _0x44d.ClassName, _0x44d:GetFullName())
        end)
    end

    local _0x4b4 = {instance = _0x4a3, category = _0x45e or "\x41\x4c\x4c", text = _0x481, quality = _0x492}
    table.insert(CoreModule.LogNodes, _0x4b4)
    table.insert(CoreModule.Logs, {text = _0x481, instance = _0x44d, category = _0x45e, quality = _0x492})

    UIModule.RefreshFilters()
    UIModule.LeftPanel.CanvasPosition = Vector2.new(0, UIModule.LeftPanel.AbsoluteCanvasSize.Y)
end

UIModule.BuildInterface()

UIModule.ScanBtn.MouseButton1Click:Connect(function()
    if CoreModule.ScanningActive then return end
    CoreModule.ScanningActive = true
    UIModule.ScanBtn.Text = "\x53\x63\x61\x6e\x6e\x69\x6e\x67\x2e\x2e\x2e"
    CoreModule.ObfuscatedCount = 0

    for _, _0x3e7 in ipairs(CoreModule.LogNodes) do
        if _0x3e7.instance and _0x3e7.instance.Parent then _0x3e7.instance:Destroy() end
    end
    CoreModule.LogNodes = {}
    CoreModule.Logs = {}
    CoreModule.ActiveTarget = nil
    UIModule.InfoBox.Text = "\x53\x65\x6c\x65\x63\x74\x20\x61\x6e\x20\x65\x6e\x64\x70\x6f\x69\x6e\x74\x20\x66\x72\x6f\x6d\x20\x74\x68\x65\x20\x6c\x65\x66\x74\x20\x66\x65\x65\x64\x20\x74\x6f\x20\x61\x6e\x61\x6c\x79\x7a\x65\x20\x74\x61\x72\x67\x65\x74\x73\x2e"

    UIModule.AppendLog("[SENTINEL] Initializing security heuristic scan across core containers...", Color3.fromRGB(255, 180, 50), nil, "\x41\x4c\x4c", "\x47\x4f\x4f\x44")

    task.spawn(function()
        local _0x4c5 = 0
        for _, _0x4d6 in ipairs({ReplicatedStorage, ReplicatedFirst, Workspace}) do
            local _0x4e7, _0x4f8 = pcall(function() return _0x4d6:GetDescendants() end)
            if _0x4e7 and _0x4f8 then
                for _, _0x509 in ipairs(_0x4f8) do
                    if _0x509:IsA("\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") or _0x509:IsA("\x52\x65\x6d\x6f\x74\x65\x46\x75\x6e\x63\x74\x69\x6f\x6e") or _0x509:IsA("\x55\x6e\x72\x65\x6c\x69\x61\x62\x6c\x65\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") then
                        _0x4c5 = _0x4c5 + 1
                        local _0x51a, _0x52b, _0x53c, _0x54d = CoreModule.AnalyzeObject(_0x509)
                        local _0x55e = _0x51a and string.format("[%s] ", _0x52b) or string.format("\x5b\x25\x73\x5d\x20", _0x509.ClassName)
                        UIModule.AppendLog(_0x55e .. _0x509:GetFullName(), _0x53c, _0x509, _0x52b, _0x54d)
                        task.wait(0.002)
                    end
                end
            end
        end
        UIModule.AppendLog("[COMPLETE] Audit sweep concluded. Found " .. _0x4c5 + CoreModule.ObfuscatedCount .." targets.", Color3.fromRGB(50, 220, 130), nil, "\x41\x4c\x4c", "\x47\x4f\x4f\x44")
        UIModule.ScanBtn.Text = "\x52\x65\x73\x63\x61\x6e"
        CoreModule.ScanningActive = false
    end)
end)

UIModule.ScanAllBtn.MouseButton1Click:Connect(function()
    if CoreModule.ScanningActive then return end
    CoreModule.ScanningActive = true
    UIModule.ScanAllBtn.Text = "\x53\x63\x61\x6e\x6e\x69\x6e\x67\x2e\x2e\x2e"
    CoreModule.ObfuscatedCount = 0

    for _, _0x3e7 in ipairs(CoreModule.LogNodes) do
        if _0x3e7.instance and _0x3e7.instance.Parent then _0x3e7.instance:Destroy() end
    end
    CoreModule.LogNodes = {}
    CoreModule.Logs = {}
    CoreModule.ActiveTarget = nil
    UIModule.InfoBox.Text = "\x43\x6f\x6d\x70\x72\x65\x68\x65\x6e\x73\x69\x76\x65\x20\x64\x65\x65\x70\x20\x73\x63\x61\x6e\x20\x72\x75\x6e\x6e\x69\x6e\x67\x20\x61\x63\x72\x6f\x73\x73\x20\x61\x6c\x6c\x20\x67\x61\x6d\x65\x20\x73\x65\x72\x76\x69\x63\x65\x73\x2e\x2e\x2e"

    UIModule.AppendLog("[DEEP SCAN ALL] Initiating universal container and service sweep...", Color3.fromRGB(200, 100, 255), nil, "\x41\x4c\x4c", "\x47\x4f\x4f\x44")

    task.spawn(function()
        local _0x56f = 0
        local _0x570 = {
            ReplicatedStorage, 
            ReplicatedFirst, 
            Workspace, 
            Lighting, 
            SoundService, 
            StarterGui, 
            StarterPlayer,
            CoreGui
        }

        for _, _0x4d6 in ipairs(_0x570) do
            local _0x4e7, _0x4f8 = pcall(function() return _0x4d6:GetDescendants() end)
            if _0x4e7 and _0x4f8 then
                for _, _0x509 in ipairs(_0x4f8) do
                    local _0x581 = _0x509:IsA("\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") or _0x509:IsA("\x52\x65\x6d\x6f\x74\x65\x46\x75\x6e\x63\x74\x69\x6f\x6e") or _0x509:IsA("\x55\x6e\x72\x65\x6c\x69\x61\x62\x6c\x65\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") or _0x509:IsA("\x42\x69\x6e\x64\x61\x62\x6c\x65\x45\x76\x65\x6e\x74") or _0x509:IsA("\x42\x69\x6e\x64\x61\x62\x6c\x65\x46\x75\x6e\x63\x74\x69\x6f\x6e") or _0x509:IsA("\x4d\x6f\x64\x75\x6c\x65\x53\x63\x72\x69\x70\x74") or _0x509:IsA("\x4c\x6f\x63\x61\x6c\x53\x63\x72\x69\x70\x74")
                    
                    if _0x581 then
                        _0x56f = _0x56f + 1
                        local _0x51a, _0x52b, _0x53c, _0x54d = CoreModule.AnalyzeObject(_0x509)
                        
                        if not _0x51a and (_0x509:IsA("\x4d\x6f\x64\x75\x6c\x65\x53\x63\x72\x69\x70\x74") or _0x509:IsA("\x4c\x6f\x63\x61\x6c\x53\x63\x72\x69\x70\x74")) then
                            _0x52b = "\x4d\x41\x4c\x49\x43\x49\x4f\x55\x53"
                            _0x53c = Color3.fromRGB(180, 100, 255)
                            _0x54d = "\x47\x4f\x4f\x44"
                        end

                        local _0x55e = _0x51a and string.format("[%s] ", _0x52b) or string.format("\x5b\x25\x73\x5d\x20", _0x509.ClassName)
                        UIModule.AppendLog(_0x55e .. _0x509:GetFullName(), _0x53c, _0x509, _0x52b ~= "\x41\x4c\x4c" and _0x52b or "\x4d\x41\x4c\x49\x43\x49\x4f\x55\x53", _0x54d)
                        task.wait(0.001)
                    end
                end
            end
        end

        UIModule.AppendLog(string.format("[DEEP SCAN COMPLETE] Swept all services. Total index points evaluated: %d", _0x56f), Color3.fromRGB(50, 255, 150), nil, "\x41\x4c\x4c", "\x47\x4f\x4f\x44")
        UIModule.ScanAllBtn.Text = "\x53\x63\x61\x6e\x20\x41\x6c\x6c"
        CoreModule.ScanningActive = false
    end)
end)

UIModule.ExportBtn.MouseButton1Click:Connect(function()
    local _0x4e7, _0x5f2 = CoreModule.ExportToJson()
    if _0x4e7 then
        UIModule.InfoBox.Text = "Log export successful: " .. _0x5f2
    else
        UIModule.InfoBox.Text = "Export error: " .. _0x5f2
    end
end)

HooksModule.Initialize(UIModule.AppendLog)
UIModule.SpyToggleBtn.MouseButton1Click:Connect(function()
    HooksModule.SpyActive = not HooksModule.SpyActive
    if HooksModule.SpyActive then
        UIModule.SpyToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 110, 60)
        UIModule.InfoBox.Text = "Network Traffic Interceptor active."
    else
        UIModule.SpyToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        UIModule.InfoBox.Text = "Network Traffic Interceptor disabled."
    end
end)

UIModule.TestFireBtn.MouseButton1Click:Connect(function()
    if not CoreModule.ActiveTarget then UIModule.InfoBox.Text = "Error: No target endpoint selected." return end
    local _0x603 = UIModule.ArgInput.Text ~= "" and UIModule.ArgInput.Text or "\x56\x75\x6c\x6e\x54\x65\x73\x74\x50\x72\x6f\x62\x65"
    local _0x4e7, _0x614 = pcall(function()
        if CoreModule.ActiveTarget:IsA("\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") or CoreModule.ActiveTarget:IsA("\x55\x6e\x72\x65\x6c\x69\x61\x62\x6c\x65\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") then
            CoreModule.ActiveTarget:FireServer(_0x603)
        elseif CoreModule.ActiveTarget:IsA("\x52\x65\x6d\x6f\x74\x65\x46\x75\x6e\x63\x74\x69\x6f\x6e") then
            CoreModule.ActiveTarget:InvokeServer(_0x603)
        end
    end)
    UIModule.InfoBox.Text = _0x4e7 and "Remote successfully executed." or "Execution Error: " .. tostring(_0x614)
end)

UIModule.StressBtn.MouseButton1Click:Connect(function()
    if not CoreModule.ActiveTarget then UIModule.InfoBox.Text = "Error: No target endpoint selected." return end
    UIModule.InfoBox.Text = "Executing request stress test (50x threads)..."
    task.spawn(function()
        for _0x1f8 = 1, 50 do
            pcall(function()
                if CoreModule.ActiveTarget:IsA("\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") or CoreModule.ActiveTarget:IsA("\x55\x6e\x72\x65\x6c\x69\x61\x62\x6c\x65\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") then
                    CoreModule.ActiveTarget:FireServer("\x53\x74\x72\x65\x73\x73\x54\x65\x73\x74\x5f" .. _0x1f8)
                elseif CoreModule.ActiveTarget:IsA("\x52\x65\x6d\x6f\x74\x65\x46\x75\x6e\x63\x74\x69\x6f\x6e") then
                    CoreModule.ActiveTarget:InvokeServer("\x53\x74\x72\x65\x73\x73\x54\x65\x73\x74\x5f" .. _0x1f8)
                end
            end)
            task.wait(0.01)
        end
        UIModule.InfoBox.Text = "Stress test execution completed."
    end)
end)

UIModule.MultiFuzzBtn.MouseButton1Click:Connect(function()
    if not CoreModule.ActiveTarget then UIModule.InfoBox.Text = "Error: No target endpoint selected." return end
    UIModule.InfoBox.Text = "Executing multi-type parameter fuzzer..."
    task.spawn(function()
        local _0x625 = {"\x45\x78\x70\x6c\x6f\x69\x74\x50\x61\x79\x6c\x6f\x61\x64", {1, 2, 3}, true, 1333337, nil, workspace}
        for _, _0x636 in ipairs(_0x625) do
            pcall(function()
                if CoreModule.ActiveTarget:IsA("\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") or CoreModule.ActiveTarget:IsA("\x55\x6e\x72\x65\x6c\x69\x61\x62\x6c\x65\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") then
                    CoreModule.ActiveTarget:FireServer(_0x636)
                elseif CoreModule.ActiveTarget:IsA("\x52\x65\x6d\x6f\x74\x65\x46\x75\x6e\x63\x74\x69\x6f\x6e") then
                    CoreModule.ActiveTarget:InvokeServer(_0x636)
                end
            end)
            task.wait(0.02)
        end
        UIModule.InfoBox.Text = "Fuzzing sequence completed."
    end)
end)

UIModule.AuditGamepassBtn.MouseButton1Click:Connect(function()
    UIModule.InfoBox.Text = "Scanning for client-sided validation flaws..."
    task.spawn(function()
        local _0x647 = 0
        for _, _0x4d6 in ipairs({ReplicatedStorage, ReplicatedFirst, Workspace}) do
            for _, _0x509 in ipairs(_0x4d6:GetDescendants()) do
                local _0xd6 = _0x509.Name:lower()
                if _0xd6:find("\x67\x61\x6d\x65\x70\x61\x73\x73") or _0xd6:find("\x70\x61\x73\x73") or _0xd6:find("\x76\x69\x70") or _0xd6:find("\x70\x72\x6f\x6d\x70\x74") then
                    _0x647 = _0x647 + 1
                    UIModule.AppendLog("[CLIENT CHECK]: " .. _0x509:GetFullName(), Color3.fromRGB(255, 90, 150), _0x509, "\x47\x41\x4d\x45\x50\x41\x53\x53", "\x47\x4f\x4f\x44")
                end
            end
        end
        UIModule.InfoBox.Text = string.format("Audit complete: Found %d potential validation vectors.", _0x647)
    end)
end)

UIModule.DecompileBtn.MouseButton1Click:Connect(function()
    if not CoreModule.ActiveTarget then UIModule.InfoBox.Text = "Error: No target endpoint selected." return end
    if decompile then
        local _0x4e7, _0x658 = pcall(function() return decompile(CoreModule.ActiveTarget) end)
        UIModule.InfoBox.Text = _0x4e7 and ("Decompiled Source Preview:\n" .. tostring(_0x658):sub(1, 180) .. "...") or "Decompilation failed."
    else
        UIModule.InfoBox.Text = "decompile() environment not supported."
    end
end)

UIModule.CopySnippetBtn.MouseButton1Click:Connect(function()
    if not CoreModule.ActiveTarget then UIModule.InfoBox.Text = "Error: No target endpoint selected." return end
    local _0x669 = string.format("local remote = %s\nremote:%s(\"Payload\")", CoreModule.ActiveTarget:GetFullName(), CoreModule.ActiveTarget:IsA("\x52\x65\x6d\x6f\x74\x65\x45\x76\x65\x6e\x74") and "\x46\x69\x72\x65\x53\x65\x72\x76\x65\x72" or "\x49\x6e\x76\x6f\x6b\x65\x53\x65\x72\x76\x65\x72")
    pcall(function() if setclipboard then setclipboard(_0x669) end end)
    UIModule.InfoBox.Text = "Snippet copied to clipboard:\n\n" .. _0x669
end)

UIModule.ClearFeedBtn.MouseButton1Click:Connect(function()
    for _, _0x3e7 in ipairs(CoreModule.LogNodes) do
        if _0x3e7.instance and _0x3e7.instance.Parent then _0x3e7.instance:Destroy() end
    end
    CoreModule.LogNodes = {}
    CoreModule.Logs = {}
    CoreModule.ObfuscatedCount = 0
    UIModule.InfoBox.Text = "Log feed successfully cleared."
end)

RunService.RenderStepped:Connect(function()
    local _0x67a = CoreModule.ScanningActive and "\x53\x63\x61\x6e\x6e\x69\x6e\x67" or (HooksModule.SpyActive and "\x4d\x6f\x6e\x69\x74\x6f\x72\x69\x6e\x67" or "\x49\x64\x6c\x65")
    UIModule.StatsLabel.Text = string.format("Targets: %d | Logs: %d | Obfuscated: %d | Status: %s", 
        #CoreModule.LogNodes, #CoreModule.Logs, CoreModule.ObfuscatedCount, _0x67a)
end)