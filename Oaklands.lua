local WindUI = loadstring(game:HttpGet("https://github.com/wsomoqaz/CX/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Oaklands 脚本 - 科幻风格",
    Icon = "rocket", -- 科幻感图标
    Author = "作者: KaErcai",
    Folder = "MySuperHub",

    Size = UDim2.fromOffset(600, 480),
    Transparent = true,
    Theme = "TokyoNight", -- 紫蓝科幻风
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.25, -- 稍微透明，科幻效果

    -- 🔹 科幻背景（贴图）
    Background = "rbxassetid://10937212652", -- 这里用了一个科幻背景图（你可以换成喜欢的 rbxassetid）

    -- 也可以用视频（科幻动态效果）
    -- Background = "video:https://your-sci-fi-background.webm",

    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("用户按钮被点击")
        end,
    },

    KeySystem = {
        Key = { "1234", "5678" },
        Note = "请输入密钥进入科幻世界",
        Thumbnail = {
            Image = "rbxassetid://10937212652",
            Title = "Oaklands 脚本 - 科幻风格",
        },
        URL = "https://example.com/getkey",
        SaveKey = false,
    },
})


local Tab = Window:Tab({
    Title = "人物功能",
    Icon = "user-round-cog",
    Locked = false,
})

-- 无限跳跃功能
local UserInputService = game:GetService("UserInputService")
local InfiniteJumpEnabled = false

-- UI 开关按钮（中文）
local Toggle = Tab:Toggle({
    Title = "无限跳跃", -- 按钮标题
    Desc = "开启后可以在空中无限次跳跃", -- 描述
    Icon = "arrow-up-from-line", -- 图标（可以换成其他）
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        InfiniteJumpEnabled = state
        if state then
            print("无限跳跃已开启")
        else
            print("无限跳跃已关闭")
        end
    end
})

-- 监听空格键实现无限跳
UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local player = game.Players.LocalPlayer
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local Tab = Window:Tab({
    Title = "水果",
    Icon = "apple",
    Locked = false,
})


local Dropdown = Tab:Dropdown({
    Title = "分类选择（多选）", -- 下拉菜单标题
    Values = { "类别 A", "类别 B", "类别 C" }, -- 选项列表
    Value = { "类别 A" }, -- 默认选中的选项
    Multi = true, -- 是否支持多选
    AllowNone = true, -- 是否允许不选择任何项
    Callback = function(option) 
        print("已选择的分类: " .. game:GetService("HttpService"):JSONEncode(option)) 
    end
})