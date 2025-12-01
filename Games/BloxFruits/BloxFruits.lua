local Players = game:GetService("Players")
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

function New(t, p)
    local o = Instance.new(t)
    for i,v in pairs(p) do
        o[i] = v
    end
    return o
end

local Gui = New("ScreenGui", {
    Parent = CoreGui,
    IgnoreGuiInset = true
})

local MainFrame = New("Frame", {
    Parent = Gui,
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    Position = UDim2.fromScale(0, 0),
    Size = UDim2.fromScale(1, 1)
})

local Title1 = New("TextLabel", {
    Parent = MainFrame,
    BorderSizePixel = 0,
    Position = UDim2.fromOffset(350, 100),
    Font = "FredokaOne",
    Text = "Hello, "..Players.LocalPlayer.DisplayName.."!",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextSize = 24,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1,
    Size = UDim2.fromOffset(600, 40)
})

local Title2 = New("TextLabel", {
    Parent = MainFrame,
    BorderSizePixel = 0,
    Position = UDim2.fromOffset(90, 250),
    Font = "FredokaOne",
    Text = "You Are Seeing This For This Reason: The Script Is Temporarily Unavailable. Join The Discord Server For More Information (The Link Is In Your Clipboard).",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1,
    Size = UDim2.fromOffset(800, 100),
    TextWrapped = true
})

setclipboard("https://discord.gg/2HUvKP63Jw")
