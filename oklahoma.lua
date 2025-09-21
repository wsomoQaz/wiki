-- Roblox 外部汉化框架
-- 自用翻译脚本

-- 翻译字典（自己填充）
local Translate = {
    ["Cash"] = "现金",
    ["Data Size"] = "数据大小",
    ["Slot"] = "存档",
    ["PLAY"] = "开始",
    ["Select a Slot"] = "选择存档",
    ["GO BACK"] = "返回"
    ["SINGLE PLAYER"]="单人游戏"
    ["SAVE DETAILS"]="保存详细信息"
    ["TESTING"]="测试服务器"
}

local function TranslateUI(obj)
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        local text = obj.Text
        if Translate[text] then
            obj.Text = Translate[text]
        end
    end
    for _, child in pairs(obj:GetChildren()) do
        TranslateUI(child)
    end
end


local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

TranslateUI(PlayerGui)


PlayerGui.DescendantAdded:Connect(function(obj)
    task.wait(0.1) 
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        local text = obj.Text
        if Translate[text] then
            obj.Text = Translate[text]
        end
    end
end)


task.spawn(function()
    while task.wait(2) do
        TranslateUI(PlayerGui)
    end
end)