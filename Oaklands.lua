local WindUI = loadstring(game:HttpGet("https://github.com/wsomoqaz/CX/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Oaklands脚本", -- 标题
    Icon = "door-open", -- 图标（使用"door-open"图标）
    Author = "作者: KaErcai", -- 作者
    Folder = "MySuperHub", -- 文件夹（保持原英文，为路径/文件名）
    
    -- ↓ 以下内容均为可选项，可删除
    Size = UDim2.fromOffset(570, 450), -- 尺寸（宽580，高460，基于偏移量）
    Transparent = true, -- 透明（启用）
    Theme = "Dark", -- 主题（深色模式）
    Resizable = true, -- 可调整大小（启用）
    SideBarWidth = 200, -- 侧边栏宽度（200单位）
    BackgroundImageTransparency = 0.42, -- 背景图透明度（0.42）
    HideSearchBar = true, -- 隐藏搜索栏（启用）
    ScrollBarEnabled = false, -- 滚动条（禁用）
    
    -- ↓ 可选项，可删除
    --[[ 可将背景设置为"rbxassetid://"（资源ID）或视频
        若使用资源ID：
            Background = "rbxassetid://", -- 此处填写rbxassetid（Roblox资源ID）
        若使用视频：
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- 格式为"video:视频原始链接.webm"
    --]]
    
    -- ↓ 可选项，可删除
    User = { -- 用户相关设置
        Enabled = true, -- 启用用户功能
        Anonymous = true, -- 匿名模式（启用）
        Callback = function() -- 回调函数（点击时触发）
            print("clicked") -- 打印"clicked"（控制台输出）
        end,
    },
    
    -- !  ↓  若不需要密钥系统，删除以下所有内容
    -- !  ↓  if you DON'T need the key system
    KeySystem = { -- 密钥系统设置
        -- ↓ 可选项，可删除
        Key = { "1234", "5678" }, -- 有效密钥列表（示例密钥："1234"、"5678"）
        
        Note = "示例密钥系统。", -- 说明文字（提示信息）
        
        -- ↓ 可选项，可删除
        Thumbnail = { -- 缩略图设置
            Image = "rbxassetid://", -- 缩略图图片（填写rbxassetid）
            Title = "Oaklands脚本", -- 缩略图标题
        },
        
        -- ↓ 可选项，可删除
        URL = "获取密钥的链接（Discord、Linkvertise、Pastebin等平台）", -- 密钥获取链接
        
        -- ↓ 可选项，可删除
        SaveKey = false, -- 自动保存并加载密钥（禁用）
        
        -- ↓ 可选项，可删除
        -- API = {} ← 服务相关，详情见下方说明 ↓
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


