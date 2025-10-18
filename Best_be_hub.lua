--// 🌌 BE HUB Cosmic UI v4.1 by Legiahuy
-- Giao diện mượt, kéo/lướt được, có thông báo BE HUB, thêm EPS Player & X-Ray

if game:GetService("CoreGui"):FindFirstChild("BE_HUB_UI") then
	game:GetService("CoreGui"):FindFirstChild("BE_HUB_UI"):Destroy()
end

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- 🌠 Thông báo BE HUB khi bật
local notifGui = Instance.new("ScreenGui", PlayerGui)
notifGui.Name = "BE_HUB_Notify"
notifGui.ResetOnSpawn = false

local notif = Instance.new("Frame", notifGui)
notif.Size = UDim2.new(0, 260, 0, 80)
notif.Position = UDim2.new(0.5, -130, -0.2, 0)
notif.AnchorPoint = Vector2.new(0, 0)
notif.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
notif.BackgroundTransparency = 0.1
notif.Visible = true
Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 12)

local grad = Instance.new("UIGradient", notif)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 100, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
}
task.spawn(function()
	while task.wait(0.03) do
		grad.Rotation += 1
	end
end)

local label = Instance.new("TextLabel", notif)
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "🌌 BE HUB LOADED 🌌"
label.Font = Enum.Font.FredokaOne
label.TextSize = 22
label.TextColor3 = Color3.new(1, 1, 1)

TweenService:Create(notif, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
	Position = UDim2.new(0.5, -130, 0.1, 0)
}):Play()
task.wait(2.5)
TweenService:Create(notif, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
	Position = UDim2.new(0.5, -130, -0.2, 0)
}):Play()
task.wait(0.7)
notifGui:Destroy()

-- 🌌 GUI chính
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "BE_HUB_UI"
gui.ResetOnSpawn = false

-- Nút bật/tắt
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 55, 0, 55)
toggle.Position = UDim2.new(0.03, 0, 0.55, 0)
toggle.Text = "🌌"
toggle.Font = Enum.Font.FredokaOne
toggle.TextSize = 26
toggle.TextColor3 = Color3.fromRGB(255,255,255)
toggle.BackgroundColor3 = Color3.fromRGB(30, 0, 70)
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)

local g = Instance.new("UIGradient", toggle)
g.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,100,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,255,255))
}
task.spawn(function()
	while task.wait(0.03) do
		g.Rotation += 1
	end
end)

-- Frame chính
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 0, 0, 0)
main.Position = UDim2.new(0.2, 0, 0.35, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 0, 50)
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
local border = Instance.new("UIStroke", main)
border.Color = Color3.fromRGB(180, 100, 255)
border.Thickness = 2

-- Tiêu đề
local title = Instance.new("TextLabel", main)
title.Text = "✨ BE HUB ✨"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Font = Enum.Font.FredokaOne
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Cuộn
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 310)
scroll.ScrollBarThickness = 5
scroll.BackgroundTransparency = 1

-- Hiệu ứng hover
local function hover(btn)
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 0, 180)}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 0, 140)}):Play()
	end)
end

-- Hàm tạo nút
local function makeButton(text, link, y)
	local b = Instance.new("TextButton", scroll)
	b.Size = UDim2.new(0.9, 0, 0, 40)
	b.Position = UDim2.new(0.05, 0, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(70, 0, 140)
	b.TextColor3 = Color3.new(1,1,1)
	b.TextSize = 18
	b.Font = Enum.Font.GothamBold
	b.Text = text
	Instance.new("UICorner", b)
	b.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(link))()
	end)
	hover(b)
end

-- 🧩 Các chức năng
makeButton("👁️ EPS Player", "https://raw.githubusercontent.com/giahuy908/BE-HUB/refs/heads/main/EPS", 10)
makeButton("🛡️ Anti Fling", "https://raw.githubusercontent.com/giahuy908/BE-HUB/refs/heads/main/Antifling.lua", 60)
makeButton("💡 Full Bright", "https://raw.githubusercontent.com/giahuy908/BE-HUB/refs/heads/main/fullbright.txt", 110)
makeButton("💃 Animation Pack", "https://raw.githubusercontent.com/giahuy908/BE-HUB/refs/heads/main/BE%20HUB%20FE%20ANIMATION.lua", 160)
makeButton("🔍 X-Ray Vision", "https://raw.githubusercontent.com/giahuy908/BE-HUB/refs/heads/main/X-ray.lua", 210)

-- 🌠 Hiệu ứng mở/đóng
local opened = false
toggle.MouseButton1Click:Connect(function()
	if opened then
		opened = false
		TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		task.wait(0.3)
		main.Visible = false
	else
		opened = true
		main.Visible = true
		TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
			Size = UDim2.new(0, 280, 0, 310)
		}):Play()
	end
end)
