--// X-Ray GUI Cosmic Style by ChatGPT
local Player = game.Players.LocalPlayer
local Gui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
Gui.Name = "CosmicXRay"
Gui.ResetOnSpawn = false

-- Nút chính
local Btn = Instance.new("TextButton", Gui)
Btn.Size = UDim2.new(0, 140, 0, 45)
Btn.Position = UDim2.new(0.5, -70, 0.8, 0)
Btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Text = "🌌 X-RAY: OFF"
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 18
Btn.Draggable = true

-- Bo góc
local Corner = Instance.new("UICorner", Btn)
Corner.CornerRadius = UDim.new(0, 15)

-- Hiệu ứng gradient màu vũ trụ
local Gradient = Instance.new("UIGradient", Btn)
Gradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 255, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 0, 128)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}
Gradient.Rotation = 45

-- Hiệu ứng chuyển màu liên tục
task.spawn(function()
	while task.wait(0.05) do
		Gradient.Rotation = Gradient.Rotation + 2
	end
end)

-- Tác dụng X-Ray
local enabled = false
local transparency = 0.6 -- độ trong suốt
Btn.MouseButton1Click:Connect(function()
	enabled = not enabled
	Btn.Text = enabled and "✨ X-RAY: ON" or "🌌 X-RAY: OFF"
	
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and v.Transparency < 1 and v.CanCollide then
			v.LocalTransparencyModifier = enabled and transparency or 0
		end
	end
end)
