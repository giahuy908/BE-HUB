--// Anti Fling + No Collision + Notification by ChatGPT
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Hiển thị thông báo
StarterGui:SetCore("SendNotification", {
    Title = "Antifling:";
    Text = "ON ✅ (by be hub)";
    Duration = 5;
})

-- Hàm tắt va chạm
local function NoCollision()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and LocalPlayer.Character then
            for _, part1 in pairs(LocalPlayer.Character:GetDescendants()) do
                if part1:IsA("BasePart") then
                    for _, part2 in pairs(player.Character:GetDescendants()) do
                        if part2:IsA("BasePart") then
                            part1.CanCollide = false
                            part2.CanCollide = false
                        end
                    end
                end
            end
        end
    end
end

-- Hàm chống fling
local function AntiFling()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    root.Velocity = Vector3.zero
                    root.RotVelocity = Vector3.zero
                    root:SetNetworkOwner(nil)
                end
            end
        end
    end
end

-- Luôn chạy kể cả khi AFK
RunService.Heartbeat:Connect(function()
    pcall(AntiFling)
    pcall(NoCollision)
end)

-- Khi người chơi mới vào
Players.PlayerAdded:Connect(function()
    task.wait(2)
    pcall(AntiFling)
    pcall(NoCollision)
end)

-- Tự bảo vệ bản thân (nếu bị fling mạnh)
task.spawn(function()
    while task.wait(1) do
        local char = LocalPlayer.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root and root.Velocity.Magnitude > 150 then
                root.Velocity = Vector3.zero
            end
        end
    end
end)
