local status_ok, rest = pcall(require, "rest-nvim")
if not status_ok then
  return
end

local config = {}

rest.setup(config)
