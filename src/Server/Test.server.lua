local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Module = require(ReplicatedStorage.lib)

Players.PlayerAdded:Connect(function(Player: Player)
	Player.CharacterAdded:Connect(function(Character: Model)
		local Humanoid: Humanoid = Character:WaitForChild("Humanoid")

		Module:RagdollOnDeath(Character)
	end)
end)