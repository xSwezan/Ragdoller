export type Config = {
	Name: string;
	Properties: {[string]: any}?;
}

local Properties = {
	Ankle = {
		LimitsEnabled = true;
		TwistLimitsEnabled = true;
		UpperAngle = 30;
		TwistUpperAngle = 30;
		TwistLowerAngle = -45;
	};
	Knee = {
		LimitsEnabled = true;
		UpperAngle = 0;
		LowerAngle = -140;
	};
	Hip = {
		LimitsEnabled = true;
		TwistLimitsEnabled = true;
		UpperAngle = 50;
		TwistUpperAngle = -45;
		TwistLowerAngle = 100;
	};
	Waist = {
		LimitsEnabled = true;
		TwistLimitsEnabled = true;
		UpperAngle = 30;
		TwistUpperAngle = 25;
		TwistLowerAngle = -55;
	};
	Shoulder = {
		LimitsEnabled = true;
		TwistLimitsEnabled = true;
		UpperAngle = 45;
		TwistUpperAngle = 150;
		TwistLowerAngle = -90;
	};
	Elbow = {
		LimitsEnabled = true;
		UpperAngle = 135;
		LowerAngle = 0;
	};
	Wrist = {
		LimitsEnabled = true;
		TwistLimitsEnabled = true;
		UpperAngle = 30;
		TwistUpperAngle = 45;
		TwistLowerAngle = -45;
	};
	Neck = {
		LimitsEnabled = true;
		TwistLimitsEnabled = true;
		MaxFrictionTorque = 4;
		UpperAngle = 60;
		TwistUpperAngle = 60;
		TwistLowerAngle = -75;
	};
}

return {
	LeftAnkle = {
		Name = "HingeConstraint";
		Properties = Properties.Ankle;
	};
	RightAnkle = {
		Name = "HingeConstraint";
		Properties = Properties.Ankle;
	};
	
	LeftKnee = {
		Name = "HingeConstraint";
		Properties = Properties.Knee;
	};
	RightKnee = {
		Name = "HingeConstraint";
		Properties = Properties.Knee;
	};
	
	LeftHip = {
		Name = "BallSocketConstraint";
		Properties = Properties.Hip;
	};
	RightHip = {
		Name = "BallSocketConstraint";
		Properties = Properties.Hip;
	};

	Waist = {
		Name = "BallSocketConstraint";
		Properties = Properties.Waist;
	};

	LeftShoulder = {
		Name = "BallSocketConstraint";
		Properties = Properties.Shoulder;
	};
	RightShoulder = {
		Name = "BallSocketConstraint";
		Properties = Properties.Shoulder;
	};

	LeftElbow = {
		Name = "BallSocketConstraint";
		Properties = Properties.Elbow;
	};
	RightElbow = {
		Name = "BallSocketConstraint";
		Properties = Properties.Elbow;
	};
	
	LeftWrist = {
		Name = "HingeConstraint";
		Properties = Properties.Wrist;
	};
	RightWrist = {
		Name = "HingeConstraint";
		Properties = Properties.Wrist;
	};
	
	Neck = {Name = "BallSocketConstraint"};
}