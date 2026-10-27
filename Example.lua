local Repo = "https://raw.githubusercontent.com/Law-XW/S7s77sd76d6d6f6dd66d6d/refs/heads/main/"

local Library = loadstring(game:HttpGet(Repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(Repo .. "ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(Repo .. "SaveManager.lua"))()

local Toggles = Library.Toggles
local Options = Library.Options

local Window = Library:CreateWindow({
    Title = "Example",
    Footer = "Example",
    NotifySide = "Right",
    ShowCustomCursor = true,
    CornerRadius = 1,
})

local ExampleTab = Window:AddTab("Example", "box")

local ExampleSubOne = ExampleTab:AddSubTab("Example 1", "box")
local ExampleSubTwo = ExampleTab:AddSubTab("Example 2", "image")

local ExampleGroup = ExampleSubOne:AddLeftGroupbox("Example", "box")

ExampleGroup:AddLabel("Example Label")
ExampleGroup:AddLabel({ Text = "Example label with wrapped text that spans multiple lines", DoesWrap = true })
ExampleGroup:AddDivider()
ExampleGroup:AddDivider("Example")

local ExampleButton = ExampleGroup:AddButton({
    Text = "Example Button",
    Func = function()
        Library:Notify({ Title = "Example", Description = "Example Button", Time = 3 })
    end,
})
ExampleButton:AddButton({
    Text = "Example Sub Button",
    Func = function()
        Library:Notify({ Title = "Example", Description = "Example Sub Button", Time = 3 })
    end,
})

ExampleGroup:AddButton({
    Text = "Example Double Click",
    DoubleClick = true,
    Func = function()
        Library:Notify({ Title = "Example", Description = "Example Double Click", Time = 3 })
    end,
})

ExampleGroup:AddCheckbox("ExampleCheckbox", {
    Text = "Example Checkbox",
    Default = false,
    Callback = function(Value)
        print("Example Checkbox", Value)
    end,
})

local ExampleToggle = ExampleGroup:AddToggle("ExampleToggle", {
    Text = "Example Toggle",
    Default = false,
    Callback = function(Value)
        print("Example Toggle", Value)
    end,
})
ExampleToggle:AddColorPicker("ExampleToggleColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Example Toggle Color",
})

ExampleGroup:AddLabel("Example Color"):AddColorPicker("ExampleColorPicker", {
    Default = Color3.fromRGB(255, 80, 180),
    Title = "Example Color",
    Callback = function(Value)
        print("Example Color", Value)
    end,
})

ExampleGroup:AddSlider("ExampleSlider", {
    Text = "Example Slider",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = "%",
    Callback = function(Value)
        print("Example Slider", Value)
    end,
})

ExampleGroup:AddInput("ExampleInput", {
    Text = "Example Input",
    Default = "Example",
    Placeholder = "Example",
    Finished = false,
    Callback = function(Value)
        print("Example Input", Value)
    end,
})

ExampleGroup:AddDropdown("ExampleDropdown", {
    Text = "Example Dropdown",
    Values = { "Example 1", "Example 2", "Example 3" },
    Default = 1,
    Multi = false,
    Callback = function(Value)
        print("Example Dropdown", Value)
    end,
})

ExampleGroup:AddDropdown("ExampleMultiDropdown", {
    Text = "Example Multi Dropdown",
    Values = { "Example 1", "Example 2", "Example 3" },
    Multi = true,
    Callback = function(Value)
        print("Example Multi Dropdown", Value)
    end,
})

ExampleGroup:AddDropdown("ExamplePlayerDropdown", {
    Text = "Example Player Dropdown",
    SpecialType = "Player",
    ExcludeLocalPlayer = true,
    Callback = function(Value)
        print("Example Player Dropdown", Value)
    end,
})

local ExampleDepbox = ExampleGroup:AddDependencyBox()
ExampleDepbox:AddLabel("Example Dependency Label")
ExampleDepbox:AddSlider("ExampleDependencySlider", {
    Text = "Example Dependency Slider",
    Default = 5,
    Min = 0,
    Max = 10,
    Rounding = 0,
})
ExampleDepbox:SetupDependencies({
    { Toggles.ExampleToggle, true },
})

local ExampleRightGroup = ExampleSubTwo:AddLeftGroupbox("Example Media", "image")

ExampleRightGroup:AddImage("ExampleImage", {
    Image = "rbxassetid://93909275221626",
    Height = 100,
})

local ExamplePart = Instance.new("Part")
ExamplePart.Size = Vector3.new(2, 2, 2)
ExamplePart.Color = Color3.fromRGB(255, 80, 180)
ExamplePart.Material = Enum.Material.SmoothPlastic

ExampleRightGroup:AddViewport("ExampleViewport", {
    Object = ExamplePart,
    Clone = true,
    Interactive = true,
    AutoFocus = true,
    Height = 120,
})

local ExamplePassthrough = Instance.new("TextButton")
ExamplePassthrough.Size = UDim2.fromScale(1, 1)
ExamplePassthrough.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ExamplePassthrough.TextColor3 = Color3.fromRGB(255, 255, 255)
ExamplePassthrough.Text = "Example Passthrough"
ExamplePassthrough.MouseButton1Click:Connect(function()
    Library:Notify({ Title = "Example", Description = "Example Passthrough", Time = 3 })
end)

ExampleRightGroup:AddUIPassthrough("ExamplePassthrough", {
    Instance = ExamplePassthrough,
    Height = 30,
})

local ExampleTabbox = ExampleSubOne:AddRightTabbox("Example Tabbox")

local ExampleTabOne = ExampleTabbox:AddTab("Example 1")
ExampleTabOne:AddLabel("Example Tab 1")
ExampleTabOne:AddToggle("ExampleTabToggle", {
    Text = "Example Tab Toggle",
    Default = false,
})

local ExampleTabTwo = ExampleTabbox:AddTab("Example 2")
ExampleTabTwo:AddLabel("Example Tab 2")
ExampleTabTwo:AddSlider("ExampleTabSlider", {
    Text = "Example Tab Slider",
    Default = 25,
    Min = 0,
    Max = 50,
    Rounding = 0,
})

Library:AddESPManager(Window, {
    Name = "Esp",
    Icon = "scan-eye",
    Settings = {
        Enabled = { Value = false, Visible = true },
        Box = { Value = false, Visible = true },
        Glow = { Value = false, Visible = true },
        HealthBar = { Value = false, Visible = true },
        HealthText = { Value = false, Visible = true },
        Name = { Value = false, Visible = true },
        DisplayName = { Value = false, Visible = true },
        Avatar = { Value = false, Visible = true },
        Weapon = { Value = false, Visible = true },
        Backpack = { Value = false, Visible = true },
        Distance = { Value = false, Visible = true },
    },
})

local UiSettingsTab = Window:AddTab("UiSettings", "settings")

local MenuGroup = UiSettingsTab:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("UiCustomCursor", {
    Text = "Custom Cursor",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})

MenuGroup:AddDropdown("UiNotificationSide", {
    Text = "Notification Side",
    Values = { "Left", "Right" },
    Default = "Right",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})

MenuGroup:AddDropdown("UiDPIScale", {
    Text = "DPI Scale",
    Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Callback = function(Value)
        Library:SetDPIScale(tonumber((Value:gsub("%%", ""))))
    end,
})

MenuGroup:AddSlider("UiCornerRadius", {
    Text = "Corner Radius",
    Default = 1,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Callback = function(Value)
        Window:SetCornerRadius(Value)
    end,
})

MenuGroup:AddDivider()

MenuGroup:AddButton({
    Text = "Unload",
    Func = function()
        Library:Unload()
    end,
})

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

ThemeManager:SetDefaultTheme({
    FontColor = "e6f0ff",
    MainColor = "0a121e",
    AccentColor = "1890ff",
    BackgroundColor = "000000",
    OutlineColor = "16283f",
    FontFace = "Code",
})

SaveManager:IgnoreThemeSettings()

ThemeManager:SetFolder("Example")
SaveManager:SetFolder("Example/Esp")

SaveManager:BuildConfigSection(UiSettingsTab)
ThemeManager:ApplyToTab(UiSettingsTab)

SaveManager:LoadAutoloadConfig()
