--// 🌌 BE HUB - Realistic Shader v6 by Legiahuy
--// Shader thật, có thông báo Roblox, lag nhẹ khi tải, cực mượt khi hoàn thành

local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local Player = game.Players.LocalPlayer

-- 🧹 Xóa shader cũ
for _, v in pairs(Lighting:GetChildren()) do
	if v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect")
	or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect")
	or v:IsA("BlurEffect") or v:IsA("Sky") then
		v:Destroy()
	end
end

-- 🔔 Thông báo Roblox (bắt đầu tải)
StarterGui:SetCore("SendNotification", {
	Title = "🌌 BE HUB SHADER";
	Text = "Đang tải shader... (vui lòng chờ)";
	Duration = 4;
})

-- 💻 Hiệu ứng lag nhẹ 4 giây
local start = os.clock()
while os.clock() - start < 4 do
	for _ = 1, 6e5 do end -- tạo cảm giác “nặng tạm thời”
end

-- 🌫️ Atmosphere (sương mù + ánh sáng môi trường)
local atmosphere = Instance.new("Atmosphere")
atmosphere.Density = 0.35
atmosphere.Offset = 0.25
atmosphere.Color = Color3.fromRGB(190, 200, 210)
atmosphere.Decay = Color3.fromRGB(85, 95, 120)
atmosphere.Glare = 0.35
atmosphere.Haze = 1
atmosphere.Parent = Lighting

-- ☀️ Thiết lập ánh sáng chung
Lighting.Brightness = 3
Lighting.GlobalShadows = true
Lighting.EnvironmentDiffuseScale = 0.85
Lighting.EnvironmentSpecularScale = 1
Lighting.ClockTime = 16.8
Lighting.OutdoorAmbient = Color3.fromRGB(125, 130, 140)
Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
Lighting.ColorShift_Bottom = Color3.fromRGB(255, 230, 200)
Lighting.GeographicLatitude = 45

-- ✨ Hiệu ứng Bloom
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.45
bloom.Size = 24
bloom.Threshold = 0.949
bloom.Parent = Lighting

-- 🌞 SunRays (ánh sáng mặt trời)
local sunrays = Instance.new("SunRaysEffect")
sunrays.Intensity = 0.12
sunrays.Spread = 0.8
sunrays.Parent = Lighting

-- 🎨 Hiệu chỉnh màu tổng thể
local color = Instance.new("ColorCorrectionEffect")
color.Contrast = 0.18
color.Brightness = 0.03
color.Saturation = 0.35
color.TintColor = Color3.fromRGB(245, 240, 255)
color.Parent = Lighting

-- 🎥 Hiệu ứng chiều sâu (xa mờ, gần rõ)
local depth = Instance.new("DepthOfFieldEffect")
depth.FarIntensity = 0.35
depth.FocusDistance = 25
depth.InFocusRadius = 30
depth.NearIntensity = 0.4
depth.Parent = Lighting

-- 🌌 Skybox (bầu trời kiểu RTX 2017)
local sky = Instance.new("Sky")
sky.SkyboxBk = "http://www.roblox.com/asset/?id=245710263"
sky.SkyboxDn = "http://www.roblox.com/asset/?id=245710630"
sky.SkyboxFt = "http://www.roblox.com/asset/?id=245710380"
sky.SkyboxLf = "http://www.roblox.com/asset/?id=245710319"
sky.SkyboxRt = "http://www.roblox.com/asset/?id=245710230"
sky.SkyboxUp = "http://www.roblox.com/asset/?id=245710496"
sky.StarCount = 3000
sky.Parent = Lighting

-- 🌊 Nước chân thật
local terrain = workspace:FindFirstChildOfClass("Terrain")
if terrain then
	terrain.WaterTransparency = 0.05
	terrain.WaterReflectance = 0.25
	terrain.WaterColor = Color3.fromRGB(40, 120, 255)
	terrain.WaterWaveSize = 0.12
	terrain.WaterWaveSpeed = 18
end

-- 🔥 Cải tiến hiệu ứng lửa trong map
for _, obj in pairs(workspace:GetDescendants()) do
	if obj:IsA("Fire") then
		obj.Heat = 25
		obj.Size = 10
	end
end

-- 🔔 Thông báo hoàn tất
StarterGui:SetCore("SendNotification", {
	Title = "✅ BE HUB SHADER";
	Text = "Shader đã kích hoạt thành công! Cảnh đẹp hơn, ánh sáng thật hơn ✨";
	Duration = 6;
})
