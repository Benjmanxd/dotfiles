local status_ok, template = pcall(require, "template")
if not status_ok then
  return
end

local config = {
  temp_dir = "~/.config/nvim/lua/main/templates",
  author = "Benjamin Choi",
  email = "benjaminchoi00@gmail.com",
}

template.setup(config)
