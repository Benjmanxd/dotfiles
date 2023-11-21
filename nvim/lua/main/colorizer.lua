local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

local config = {
	"*",
}

colorizer.setup(config)
