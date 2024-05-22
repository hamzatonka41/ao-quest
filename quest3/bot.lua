-- Global variables for energy regeneration
EnergyRegenRate = 1  -- Enerji yenileme oranı (her turda)
EnergyRegenCooldown = 5  -- Enerji yenileme bekleme süresi (tur)

-- Function to regenerate player's energy
function regenerateEnergy(player)
  if player.energy < 10 and LatestGameState.GameTick % EnergyRegenCooldown == 0 then
    player.energy = player.energy + EnergyRegenRate
    print(colors.green .. "Enerji yenileniyor. Mevcut enerji: " .. tostring(player.energy) .. colors.reset)
  end
end

-- Updated decideNextAction function with energy regeneration
function decideNextAction()
  local player = LatestGameState.Players[ao.id]
  -- Call regenerateEnergy at the start of each action decision
  regenerateEnergy(player)

  -- Existing logic for deciding the next action
  -- ...

  InAction = false -- Reset the "InAction" flag
end

-- Handlers remain unchanged, but you can add new ones to handle the energy regeneration feature.
