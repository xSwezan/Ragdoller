local Types = require(script.Types)
local JointConfig = require(script.JointConfig)

local Ragdoller: Types.Ragdoller = {}

function Ragdoller:Ragdoll(Character: Model): () -> nil
	if not (Character) then return end

	local Humanoid: Humanoid = Character:WaitForChild("Humanoid")
	Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)

	for _, M6D: Motor6D in Character:GetDescendants() do
		if not (M6D:IsA("Motor6D")) then continue end

		local Part: BasePart = M6D.Parent
		local JointName: string = M6D.Name

		local A0: Attachment = Part:FindFirstChild(JointName.."Attacment") or Part:FindFirstChild(JointName.."RigAttachment")
		if not (A0) then continue end

		local A1: Attachment = M6D.Part0:FindFirstChild(JointName.."Attachment") or M6D.Part0:FindFirstChild(JointName.."RigAttachment")
		if not (A1) then continue end

		local Config: JointConfig.Config = JointConfig[M6D.Name]
		if not (Config) then continue end

		local Constraint: BallSocketConstraint = Part:FindFirstChild("Ragdoller") or Instance.new(Config.Name)
		Constraint.Name = "RagdollerConstraint"
		Constraint.Attachment0 = A0
		Constraint.Attachment1 = A1

		for Name: string, Value: any in Config.Properties or {} do
			pcall(function()
				Constraint[Name] = Value
			end)
		end

		Constraint.Parent = Part

		M6D.Enabled = false
	end

	return function()
		self:StopRagdoll(Character)
	end
end

function Ragdoller:StopRagdoll(Character: Model)
	if not (Character) then return end

	local Humanoid: Humanoid = Character:WaitForChild("Humanoid")

	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)

	for _, M6D: Motor6D in Character:GetDescendants() do
		if not (M6D:IsA("Motor6D")) then continue end

		local Part: BasePart = M6D.Parent

		local Constraint: BallSocketConstraint = Part:FindFirstChild("RagdollerConstraint")
		if not (Constraint) then continue end

		Constraint.Enabled = false
		M6D.Enabled = true
	end
end

function Ragdoller:RagdollOnDeath(Character: Model): RBXScriptConnection
	local Humanoid: Humanoid = Character:WaitForChild("Humanoid")

	Humanoid.BreakJointsOnDeath = false
	return Humanoid.Died:Connect(function()
		self:Ragdoll(Character)
	end)
end

return Ragdoller