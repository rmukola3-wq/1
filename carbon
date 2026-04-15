--// Variables
local L_1_ = game.ReplicatedStorage:WaitForChild('CarbonResource')
local L_2_ = L_1_:WaitForChild('Events')
local L_3_ = L_1_:WaitForChild('FX')
local L_4_ = L_1_:WaitForChild('Models')
local L_5_ = L_4_:WaitForChild('Client')
local L_6_ = L_4_:WaitForChild('Server')
local L_7_ = L_1_:WaitForChild('HUD')
local L_8_ = L_1_:WaitForChild('Global')
local L_9_ = L_1_:WaitForChild('Modules')
local L_10_ = game.ReplicatedStorage:FindFirstChild('[WB] Leaderstat Network') or nil
local L_11_ = script:FindFirstChild('DataStorage') or Instance.new('Folder')
L_11_.Name = 'DataStorage'
L_11_.Parent = script

--// Data Tables
local L_12_ = 
{
	globalConfig = require(L_8_:WaitForChild('GlobalConfig'));
	ragdollModule = require(L_9_:WaitForChild('Ragdoll'));
	setupModule = require(L_9_:WaitForChild('SetupModule'));
	utilitiesModule = require(L_9_:WaitForChild('Utilities'));
}

local L_13_ = 
{
	equipEvent = L_2_:WaitForChild('Equip');
	updateCharEvent = L_2_:WaitForChild('UpdateChar');
	halfStepEvent = L_2_:WaitForChild('HalfStep');
	damageEvent = L_2_:WaitForChild('DamageEvent');
	whizEvent = L_2_:WaitForChild('WhizEvent');
	hitEvent = L_2_:WaitForChild('HitEvent');
	flybyEvent = L_2_:WaitForChild('flybyEvent');
	serverFXEvent = L_2_:WaitForChild('ServerFXEvent');
	storeDataEvent = L_2_:WaitForChild('StoreData');
	createOwnerEvent = L_2_:WaitForChild('CreateOwner');
	manipEvent = L_2_:WaitForChild('ManipEvent');
	resupplyEvent = L_2_:WaitForChild('ResupplyEvent');
	medEvent = L_2_:WaitForChild('MedEvent');
}

local L_14_ = {
	
	"1565831468";
	"1565832329";
	
}

local L_15_ = {
	
	"1565831129";
	"1565830611";
	
}

local L_16_ = {
	
	"1565825075";
	"1565824613";
	
}

local L_17_ = {
	
	"1565821941";
	"1565821634";
	
}

local L_18_ = {
	
	"1565756818";
	"1565756607";
	
}

local L_19_ = {
	
	"1565717027";
	"1565716705";
	
}

local L_20_ = {
	
	2389761679;
	1565675605;
	
}

local L_21_ = {
	
	627558532;
	627558676;
	627558611;
	
}

local L_22_ = {
	
	363818359;
	363818293;
	363818244;
	363818187;
	363818111;
	
}

--// Init
local L_23_ = workspace:FindFirstChild('BulletModel') or Instance.new('Folder')
L_23_.Parent = workspace
L_23_.Name = 'BulletModel'

--// Functions
function HolsterModel(L_24_arg1, L_25_arg2, L_26_arg3, L_27_arg4)
	if L_24_arg1.Character:FindFirstChild('Humanoid') and L_24_arg1.Character.Humanoid.Health > 0 then
		local L_28_ = L_25_arg2[L_26_arg3]:clone()
		L_28_.Name = 'Holst' .. L_26_arg3
		L_28_.Parent = L_24_arg1.Character
		local L_29_ = require(L_27_arg4)
		
		for L_31_forvar1, L_32_forvar2 in pairs(L_28_:GetDescendants()) do
			if L_32_forvar2:IsA('BasePart') and L_32_forvar2.Name ~= 'Grip' then
				L_12_.utilitiesModule.Weld(L_32_forvar2, L_28_.Grip)
			end
		end
		
		local L_30_ = Instance.new('Motor6D')
		L_30_.Name = 'GripW'
		L_30_.Parent = L_28_.Grip
		L_30_.Part0 = L_28_.Grip
		L_30_.Part1 = L_24_arg1.Character[L_29_.HolsterTo]
		L_30_.C1 = L_29_.HolsterPos
		
		for L_33_forvar1, L_34_forvar2 in pairs(L_28_:GetDescendants()) do
			if L_34_forvar2:IsA('BasePart') then
				L_34_forvar2.CanCollide = false
				L_34_forvar2.Anchored = false
			end
		end
	end	
end;

--// Event Connections
L_13_.equipEvent.OnServerEvent:connect(function(L_35_arg1, L_36_arg2, L_37_arg3, L_38_arg4)
	if L_36_arg2 then
		if L_35_arg1.Character:FindFirstChild('Holst' .. L_37_arg3) then
			L_35_arg1.Character:FindFirstChild('Holst' .. L_37_arg3):Destroy()
		end
		
		local L_39_ = L_6_[L_37_arg3]:clone()
		L_39_.Name = 'S' .. L_37_arg3
		local L_40_ = require(L_35_arg1.Character[L_37_arg3].ConfigMods.SConfig)
		
		local L_41_ = Instance.new('Part')
		L_41_.Name = 'BasePart'
		L_41_.Parent = L_35_arg1.Character
		L_41_.Anchored = true
		L_41_.CanCollide = false
		L_41_.Transparency = 1
		L_41_.Size = Vector3.new(0.1, 0.1, 0.1)
		
		local L_42_ = Instance.new('Motor6D')
		L_42_.Parent = L_41_
		L_42_.Name = 'BasePartW'
		L_42_.Part0 = L_41_
		L_42_.Part1 = L_35_arg1.Character:WaitForChild('Head')
		L_41_.Anchored = false
		L_42_.C1 = CFrame.new()
		L_42_.C0 = CFrame.new()
		
		local L_43_ = Instance.new("Motor6D")
		L_43_.Name = "RAW"
		L_43_.Part0 = L_41_
		L_43_.Part1 = L_35_arg1.Character['Right Arm']
		L_43_.Parent = L_41_
		L_43_.C1 = L_40_.RightArmPos
		L_35_arg1.Character.Torso:WaitForChild("Right Shoulder").Part1 = nil
			
		local L_44_ = Instance.new("Motor6D")
		L_44_.Name = "LAW"
		L_44_.Part0 = L_41_
		L_44_.Part1 = L_35_arg1.Character['Left Arm']
		L_44_.Parent = L_41_
		L_44_.C1 = L_40_.LeftArmPos
		L_35_arg1.Character.Torso:WaitForChild("Left Shoulder").Part1 = nil
		
		L_39_.Parent = L_35_arg1.Character		
		
		for L_46_forvar1, L_47_forvar2 in pairs(L_39_:GetDescendants()) do
			if L_47_forvar2 and L_47_forvar2:IsA('BasePart') and L_47_forvar2.Name ~= 'Grip' then
				L_12_.utilitiesModule.Weld(L_47_forvar2, L_39_.Grip)
			end
		end	
		
		local L_45_ = Instance.new('Motor6D')
		L_45_.Name = 'GripW'
		L_45_.Parent = L_39_.Grip
		L_45_.Part0 = L_39_.Grip
		L_45_.Part1 = L_35_arg1.Character['Right Arm']
		L_45_.C1 = L_40_.GunPos
		
		for L_48_forvar1, L_49_forvar2 in pairs(L_39_:GetDescendants()) do
			if L_49_forvar2 and L_49_forvar2:IsA('BasePart') then
				L_49_forvar2.Anchored = false
				L_49_forvar2.CanCollide = false
			end
		end
		
		if L_35_arg1.Character and L_35_arg1.Character:FindFirstChild('CarbonValues') then
			L_35_arg1.Character.CarbonValues.Equipped.Value = true
		end
		
		if L_35_arg1.Character and L_35_arg1.Character:FindFirstChild('CarbonValues') then
			L_35_arg1.Character.CarbonValues.SModel.Value = L_39_
		end
	else
		if L_35_arg1.Character and L_35_arg1.Character:FindFirstChild('S' .. L_37_arg3) then
			L_35_arg1.Character['S' .. L_37_arg3]:Destroy()
			L_35_arg1.Character.BasePart:Destroy()
		end
		L_35_arg1.Character.Torso:WaitForChild("Right Shoulder").Part1 = L_35_arg1.Character['Right Arm']
		L_35_arg1.Character.Torso:WaitForChild("Left Shoulder").Part1 = L_35_arg1.Character['Left Arm']
		
		for L_50_forvar1, L_51_forvar2 in pairs(L_35_arg1.Character:GetChildren()) do
			if L_51_forvar2 then
				for L_52_forvar1, L_53_forvar2 in pairs(L_5_:GetChildren()) do
					if L_51_forvar2.Name == 'S' .. L_53_forvar2.Name then
						L_51_forvar2:Destroy()
					end
				end
			end
		end
		
		if require(L_38_arg4).HolsteringEnabled then
			if require(L_38_arg4).HolsterClient then
				HolsterModel(L_35_arg1, L_5_, L_37_arg3, L_38_arg4)
			else
				HolsterModel(L_35_arg1, L_6_, L_37_arg3, L_38_arg4)
			end
		end	
		
		if L_35_arg1.Character and L_35_arg1.Character:FindFirstChild('CarbonValues') then
			L_35_arg1.Character.CarbonValues.Equipped.Value = false
			L_35_arg1.Character.CarbonValues.SModel.Value = nil
			L_35_arg1.Character.CarbonValues.LaserActive.Value = false
		end
	end;
end)

L_13_.updateCharEvent.OnServerEvent:connect(function(L_54_arg1, L_55_arg2, L_56_arg3, L_57_arg4, L_58_arg5)
	if L_54_arg1:IsA('Player') and L_54_arg1.Character then
		local L_59_
		for L_60_forvar1, L_61_forvar2 in pairs(L_54_arg1.Character:GetDescendants()) do
			if L_61_forvar2 and L_61_forvar2.Name == 'SConfig' then
				L_59_ = L_61_forvar2
				--{newConfig.RightAimPos;newConfig.LeftAimPos;newConfig.NeckAimPos;})
			end
		end;
	
		if L_55_arg2 == 'Stance' then
			if L_57_arg4 == 0 then
				if L_54_arg1.Character:FindFirstChild('CarbonValues') then
					L_54_arg1.Character.CarbonValues:WaitForChild('neckCF').Value = CFrame.new()
				end;
			elseif L_57_arg4 == 1 then
				if L_54_arg1.Character:FindFirstChild('CarbonValues') then
					L_54_arg1.Character.CarbonValues:WaitForChild('neckCF').Value = CFrame.new()
				end;
			elseif L_57_arg4 == 2 then
				if L_54_arg1.Character:FindFirstChild('CarbonValues') then
					L_54_arg1.Character.CarbonValues:WaitForChild('neckCF').Value = CFrame.new(0, -0.5, 0.7) * CFrame.Angles(math.rad(90), 0, 0)
				end;
			end
		end;
		
		if L_59_ then
			L_13_.updateCharEvent:FireAllClients(L_54_arg1, L_55_arg2, L_56_arg3, L_59_, L_57_arg4, L_58_arg5)
		else
			L_13_.updateCharEvent:FireAllClients(L_54_arg1, L_55_arg2, L_56_arg3, nil, L_57_arg4, L_58_arg5)
		end;
	end;
end);

L_13_.halfStepEvent.OnServerEvent:connect(function(L_62_arg1, L_63_arg2, L_64_arg3)
	if L_62_arg1 and L_62_arg1.Character and L_62_arg1.Character.CarbonValues:FindFirstChild('yRot') then
		if L_64_arg3 then
			L_62_arg1.Character.CarbonValues:WaitForChild('yRot').Value = CFrame.Angles(L_63_arg2, 0, 0)
		else
			L_62_arg1.Character.CarbonValues:WaitForChild('yRot').Value = CFrame.Angles(0, 0, 0)
		end;
	end
end)

L_13_.damageEvent.OnServerEvent:connect(function(L_65_arg1, L_66_arg2, L_67_arg3)
	if L_65_arg1.Character and L_65_arg1.Character.Humanoid and L_65_arg1.Character.Humanoid.Health > 0 then
		L_66_arg2:TakeDamage(L_67_arg3)
		
		local L_68_ = L_65_arg1.Character:WaitForChild('CarbonValues'):WaitForChild('LastHum').Value
	
		if L_66_arg2.Health <= 0 and L_66_arg2 ~= L_68_ then
			if L_10_ and L_10_:FindFirstChild(L_65_arg1.Name) then
				local L_69_ = L_10_[L_65_arg1.Name]
				L_69_.Value = not L_69_.Value
			end
	
			L_65_arg1.Character:WaitForChild('CarbonValues'):WaitForChild('LastHum').Value = L_66_arg2
		end;
	end
end)

L_13_.whizEvent.OnServerEvent:connect(function(L_70_arg1, L_71_arg2, L_72_arg3, L_73_arg4, L_74_arg5, L_75_arg6, L_76_arg7, L_77_arg8)
	L_13_.whizEvent:FireAllClients(L_70_arg1, L_71_arg2, L_72_arg3, L_73_arg4, L_74_arg5, L_75_arg6, L_76_arg7, L_77_arg8)
end)

L_13_.hitEvent.OnServerEvent:connect(function(L_78_arg1, L_79_arg2, L_80_arg3, L_81_arg4, L_82_arg5, L_83_arg6, L_84_arg7)
	if L_23_ and L_84_arg7.Name ~= 'EShield' then
		local L_85_ = Instance.new("Part", L_23_)
		L_85_.FormFactor = "Custom"
		L_85_.TopSurface = 0
		L_85_.BottomSurface = 0
		L_85_.Transparency = 1
		L_85_.CanCollide = false
		L_85_.Size = Vector3.new(0.5, 0, 0.5)
		L_85_.CFrame = CFrame.new(L_79_arg2) * CFrame.fromAxisAngle(L_80_arg3.magnitude == 0 and Vector3.new(1) or L_80_arg3.unit, L_81_arg4)
		L_85_.BrickColor = BrickColor.new("Really black")
		L_85_.Material = "SmoothPlastic"
		
		local L_86_ = Instance.new('WeldConstraint')
		L_86_.Parent = L_85_
		L_86_.Part0 = L_85_
		L_86_.Part1 = L_84_arg7
	
		local L_87_ = Instance.new("Decal", L_85_)
		L_87_.Texture = "rbxassetid://64291977"
		L_87_.Face = "Top"
		game.Debris:AddItem(L_87_, 3)
		
		local L_88_ = Instance.new("PointLight", L_85_)
		L_88_.Color = Color3.new(0, 0, 0)
		L_88_.Range = 0
		L_88_.Shadows = true
		
		for L_91_forvar1, L_92_forvar2 in pairs(game.Players:GetChildren()) do
			if L_92_forvar2:IsA('Player') and L_92_forvar2.Character and L_92_forvar2.Character.HumanoidRootPart and (L_92_forvar2.Character.HumanoidRootPart.Position - L_79_arg2).magnitude <= 30 then
				local L_93_ = Instance.new("Sound")
				L_93_.Name = "Crack"	
				
				if L_84_arg7.Material == Enum.Material.Grass or L_84_arg7.Material == Enum.Material.Ice or L_84_arg7.Material == Enum.Material.Fabric or L_84_arg7.Material == Enum.Material.Pebble then
					L_93_.SoundId = "rbxassetid://" .. L_14_[math.random(1, #L_14_)]
				end
				
				if L_84_arg7.Material == Enum.Material.Sand then
					L_93_.SoundId = "rbxassetid://" .. L_15_[math.random(1, #L_15_)]
				end
				
				if L_84_arg7.Material == Enum.Material.Glass then
					if L_12_.globalConfig.CanBreakGlass then
						L_93_.SoundId = "rbxassetid://" .. L_21_[math.random(1, #L_21_)]
						delay(L_93_.TimeLength, function()
							if L_84_arg7 then
								L_84_arg7:Destroy()
							end
						end)
					else
						L_93_.SoundId = "rbxassetid://" .. L_16_[math.random(1, #L_16_)]
					end
				end
				
				if L_84_arg7.Material == Enum.Material.Neon then
					L_93_.SoundId = "rbxassetid://" .. L_16_[math.random(1, #L_16_)]
				end
				
				if L_84_arg7.Material == Enum.Material.Wood or L_84_arg7.Material == Enum.Material.WoodPlanks then
					L_93_.SoundId = "rbxassetid://" .. L_17_[math.random(1, #L_17_)]
				end
				
				if L_84_arg7.Material == Enum.Material.Metal or L_84_arg7.Material == Enum.Material.CorrodedMetal or L_84_arg7.Material == Enum.Material.DiamondPlate then
					L_93_.SoundId = "rbxassetid://" .. L_18_[math.random(1, #L_18_)]
				end
				
				if L_84_arg7.Material == Enum.Material.Water then
					L_93_.SoundId = "rbxassetid://" .. L_19_[math.random(1, #L_19_)]
				end
				
				if L_84_arg7.Material == Enum.Material.Concrete or L_84_arg7.Material == Enum.Material.Plastic or L_84_arg7.Material == Enum.Material.SmoothPlastic or L_84_arg7.Material == Enum.Material.Slate or L_84_arg7.Material == Enum.Material.Foil or L_84_arg7.Material == Enum.Material.Brick or L_84_arg7.Material == Enum.Material.Granite or L_84_arg7.Material == Enum.Material.Marble or L_84_arg7.Material == Enum.Material.Cobblestone then
					L_93_.SoundId = "rbxassetid://" .. L_20_[math.random(1, #L_20_)]
				end	
				
				L_93_.EmitterSize = 10
				L_93_.MaxDistance = 30
				L_93_.Parent = L_92_forvar2.PlayerGui
				L_93_:play()
			end
			
			if L_84_arg7.Material == Enum.Material.Glass and L_12_.globalConfig.CanBreakGlass then
				delay(0.1, function()
					if L_84_arg7 then
						L_84_arg7:Destroy()
					end
				end)
			end;
		end;
		
		local L_89_
		local L_90_
			
		if L_83_arg6 == "Part" then
			for L_94_forvar1, L_95_forvar2 in pairs(L_3_:GetChildren()) do
				if L_95_forvar2 and L_95_forvar2.Name:sub(1, 4) == 'IMCT' then
					local L_96_ = L_95_forvar2:clone()
					L_96_.Parent = L_85_
					L_96_.EmissionDirection = "Top"
					L_96_.Enabled = true
			
					game.Debris:AddItem(L_96_, 1.75)
					
					delay(0.1, function()
						L_96_.Enabled = false
					end)
				end
			end
		elseif L_83_arg6 == "Human" then		
			L_89_ = L_3_:WaitForChild("Blood"):clone()
			L_89_.Parent = L_85_
			L_89_.EmissionDirection = "Top"
			L_89_.Enabled = true
			
			game.Debris:AddItem(L_89_, 1.75)
			
			delay(0.1, function()
				L_89_.Enabled = false
			end)
		end
		game:GetService('Debris'):AddItem(L_85_, 3)
	end
end);

L_13_.flybyEvent.OnServerEvent:connect(function(L_97_arg1, L_98_arg2)
	local L_99_ = Instance.new('Sound')
	L_99_.Parent = L_98_arg2.PlayerGui
	L_99_.SoundId = "rbxassetid://" .. L_22_[math.random(1, #L_22_)]
	L_99_:Play()
	game.Debris:AddItem(L_99_, L_99_.TimeLength)
end)

L_13_.serverFXEvent.OnServerEvent:connect(function(L_100_arg1, L_101_arg2)
	for L_102_forvar1, L_103_forvar2 in pairs(game.Players:GetChildren()) do
		if L_103_forvar2:IsA('Player') then
			L_13_.serverFXEvent:FireClient(L_103_forvar2, L_101_arg2, L_100_arg1)
		end
	end
end);

function L_13_.storeDataEvent.OnServerInvoke(L_104_arg1, L_105_arg2, L_106_arg3, L_107_arg4, L_108_arg5, L_109_arg6, L_110_arg7, L_111_arg8, L_112_arg9, L_113_arg10, L_114_arg11)
	if L_105_arg2 == 'Retrieve' then
		local L_115_
			
		if L_11_:FindFirstChild(L_104_arg1.Name) and L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3) then
			return true, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).Ammo.Value, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).StoredAmmo.Value, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).ExplosiveAmmo.Value, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).Firemode.Value, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).AimedSens.Value, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).UnaimedSens.Value, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).CanShoot.Value, L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).RoundChambered.Value
		else
			if not L_11_:FindFirstChild(L_104_arg1.Name) then
				L_115_ = Instance.new('Folder')
				L_115_.Name = L_104_arg1.Name
				L_115_.Parent = L_11_
			elseif L_11_:FindFirstChild(L_104_arg1.Name) then
				L_115_ = L_11_:FindFirstChild(L_104_arg1.Name)
			end
			
			local L_116_ = Instance.new('Folder')
			L_116_.Name = L_106_arg3
			L_116_.Parent = L_115_
			local L_117_ = Instance.new('NumberValue', L_116_)
			L_117_.Name = 'Ammo'
			L_117_.Value = L_107_arg4
			local L_118_ = Instance.new('NumberValue', L_116_)
			L_118_.Name = 'StoredAmmo'
			L_118_.Value = L_108_arg5
			local L_119_ = Instance.new('NumberValue', L_116_)
			L_119_.Name = 'ExplosiveAmmo'	
			L_119_.Value = L_109_arg6
			local L_120_ = Instance.new('NumberValue', L_116_)
			L_120_.Name = 'Firemode'	
			L_120_.Value = L_110_arg7
			local L_121_ = Instance.new('NumberValue', L_116_)
			L_121_.Name = 'AimedSens'	
			L_121_.Value = L_111_arg8
			local L_122_ = Instance.new('NumberValue', L_116_)
			L_122_.Name = 'UnaimedSens'	
			L_122_.Value = L_112_arg9
			local L_123_ = Instance.new('BoolValue', L_116_)
			L_123_.Name = 'CanShoot'	
			L_123_.Value = L_113_arg10
			local L_124_ = Instance.new('BoolValue', L_116_)
			L_124_.Name = 'RoundChambered'	
			L_124_.Value = L_124_
			return false
		end
	elseif L_105_arg2 == 'Store' then
		if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3) then
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).Ammo then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).Ammo.Value = L_107_arg4
			end
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).StoredAmmo then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).StoredAmmo.Value = L_108_arg5
			end
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).ExplosiveAmmo then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).ExplosiveAmmo.Value = L_109_arg6
			end
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).Firemode then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).Firemode.Value = L_110_arg7
			end
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).AimedSens then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).AimedSens.Value = L_111_arg8
			end
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).UnaimedSens then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).UnaimedSens.Value = L_112_arg9
			end
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).CanShoot then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).CanShoot.Value = L_113_arg10
			end
			if L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).RoundChambered then
				L_11_:FindFirstChild(L_104_arg1.Name):FindFirstChild(L_106_arg3).RoundChambered.Value = L_114_arg11
			end
		end
		
	elseif L_105_arg2 == 'Erase' then
		for L_125_forvar1, L_126_forvar2 in pairs(L_11_:GetChildren()) do
			if L_126_forvar2.Name == L_104_arg1.Name then
				L_126_forvar2:Destroy()
			end;
		end
	end
end;

L_13_.createOwnerEvent.OnServerEvent:connect(function(L_127_arg1, L_128_arg2)
	local L_129_ = Instance.new("ObjectValue")
	L_129_.Name = "creator"
	L_129_.Value = L_127_arg1
	L_129_.Parent = L_128_arg2
	game.Debris:AddItem(L_129_, 0.1)
end)

L_13_.manipEvent.OnServerEvent:connect(function(L_130_arg1, L_131_arg2, L_132_arg3)
	if L_132_arg3 == 'Laser' then
		if L_130_arg1.Character:FindFirstChild('CarbonValues') then
			L_130_arg1.Character.CarbonValues.LaserActive.Value = L_131_arg2
		end
	elseif L_132_arg3 == 'FlashLight' then
		local L_133_ = L_130_arg1.Character.CarbonValues.SModel.Value
		L_13_.manipEvent:FireAllClients(L_130_arg1, L_133_, L_131_arg2, L_132_arg3)
	end;
end)

L_13_.medEvent.OnServerEvent:connect(function(L_134_arg1, L_135_arg2)
	if L_135_arg2 then
		L_134_arg1.Character:WaitForChild('Humanoid').Health = L_134_arg1.Character:WaitForChild('Humanoid').MaxHealth
	end
end);

--// Other Connections
if workspace:FindFirstChild('CEResupply_Folder') then
	for L_136_forvar1, L_137_forvar2 in pairs(workspace.CEResupply_Folder:GetDescendants()) do
		if L_137_forvar2 and L_137_forvar2.Name == 'Detector' then
			L_137_forvar2.MouseClick:connect(function(L_138_arg1)
				L_13_.resupplyEvent:FireClient(L_138_arg1)
			end)
		end
	end
end;
