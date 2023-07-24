-- Functions :P

local function teleportPlayerAboveCheckpoint(checkpointName, teleportHeight)
    local checkpoint = game:GetService("Workspace").Obby_Geometry.Obby_Checkpoints[checkpointName]
    if not checkpoint then
        return
    end

    local character = game.Players.LocalPlayer.Character
    if not character then
        return
    end

    local mainPart = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart
    if not mainPart then
        return
    end

    local checkpointMain = checkpoint:FindFirstChild("CheckpointMain")
    if not checkpointMain then
        return
    end

    local checkpointPosition = checkpointMain.Position
    local teleportPosition = Vector3.new(checkpointPosition.X, checkpointPosition.Y + teleportHeight, checkpointPosition.Z)
    mainPart.CFrame = CFrame.new(teleportPosition)
end

local teleportHeight = 2

local function BeatPhase1()
for i = game.Players.LocalPlayer.leaderstats.Stage.Value, 50 do
    teleportPlayerAboveCheckpoint("Checkpoint_" .. i, teleportHeight)
    wait(1)
end
end

local function BeatPhase2()
for i = game.Players.LocalPlayer.leaderstats.Stage.Value, 100 do
    teleportPlayerAboveCheckpoint("Checkpoint_"..i,teleportHeight)
    wait(1)
end
end

local function TPtoCheck(check)
    teleportPlayerAboveCheckpoint(check)
end

-- The actual gui

local OL = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OL:MakeWindow({Name = "¿A Stereotypical Obby?", HidePremium = false, SaveConfig = true, IntroText = "A Stereotypical Obby :)"})

local Tab = Window:MakeTab({ 
    Name = "Main", 	
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false 
})


Tab:AddLabel("You may have to use the buttons once or twice")

Tab:AddButton({
    Name = "Beat Phase1 (0-50)",
    Callback = function()
        BeatPhase1()
    end
})


Tab:AddButton({
    Name = "Beat Phase2 (50-End)",
    Callback = function()
        BeatPhase2()
    end
})

Tab:AddTextbox({
	Name = "TP to a checkpoint",
	Default = 0,
	TextDisappear = false,
	Callback = function(Value)
		TPtoCheck("Checkpoint_"..Value)
	end	  
})
