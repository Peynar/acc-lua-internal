--[[
  Pauses AC in background.
]]

if not Config:get('MISCELLANEOUS', 'PAUSE_IN_BACKGROUND', false) then
  return
end

local paused = ac.load('$SmallTweaks.Paused') == 1
Register('core', function ()
  if paused and Sim.isWindowForeground then
    paused = false
    ac.tryToPause(false)
  elseif not Sim.isWindowForeground and not Sim.isPaused then
    ac.tryToPause(true)
    paused = true
  end
end)

ac.onRelease(function ()
  if paused then
    ac.store('$SmallTweaks.Paused', 1)
  end
end)