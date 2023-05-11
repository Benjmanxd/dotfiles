local status_ok, glow = pcall(require, "glow")
if not status_ok then
    return
end

local config = {}

glow.setup(config)
