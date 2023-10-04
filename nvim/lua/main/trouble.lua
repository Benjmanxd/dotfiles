local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

local config = {}

trouble.setup(config)
