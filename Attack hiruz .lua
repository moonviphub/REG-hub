-- Blox Fruits Attack Aura OP
-- Range 55 + Spam Attack

_G.Aura = true
_G.Distance = 55

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer

spawn(function()
    while _G.Aura do
        task.wait()

        pcall(function()

            local char = player.Character
            if not char then return end

            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            for _,mob in pairs(workspace.Enemies:GetChildren()) do

                if mob:FindFirstChild("Humanoid")
                and mob:FindFirstChild("HumanoidRootPart")
                and mob.Humanoid.Health > 0 then

                    local distance =
                        (hrp.Position - mob.HumanoidRootPart.Position).Magnitude

                    if distance <= _G.Distance then

                        -- Quay mặt mob
                        hrp.CFrame = CFrame.new(
                            hrp.Position,
                            mob.HumanoidRootPart.Position
                        )

                        -- Spam attack siêu nhanh
                        for i = 1,5 do
                            VirtualUser:Button1Down(Vector2.new(0,0))
                            VirtualUser:Button1Up(Vector2.new(0,0))
                        end

                    end
                end
            end

        end)
    end
end)

print("Aura 55 Enabled")
