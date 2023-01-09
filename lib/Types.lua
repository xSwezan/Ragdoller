local Types = {}

export type Ragdoller = {
	Ragdoll: (Character: Model) -> () -> nil;
	StopRagdoll: (Character: Model) -> nil;

	RagdollOnDeath: (Character: Model) -> RBXScriptConnection;
}

return Types