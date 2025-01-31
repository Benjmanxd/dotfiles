return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
		local dashboard = require("alpha.themes.startify")
		dashboard.section.header.val = {
			[[     ___        ___        ___        ___        ___        ___        ___        ___        ___     ]],
			[[    /  /\      /  /\      /__/\      /  /\      /__/\      /  /\      /__/\      /__/|      /  /\    ]],
			[[   /  /::\    /  /:/_     \  \:\    /  /:/     |  |::\    /  /::\     \  \:\    |  |:|     /  /::\   ]],
			[[  /  /:/\:\  /  /:/ /\     \  \:\  /  /::\     |  |:|:\  /  /:/\:\     \  \:\   |  |:|    /  /:__:\  ]],
			[[ /  /:/~/::\/  /:/ /:/ _____\__\: /  /:/\:\  __|__|:|\: /  /:/~/:: _____\__\:\__|__|:|   /  /:/  \:\ ]],
			[[/__/:/ /:/\/__/:/ /:/ /__/:::::::/__/:/\ \:\/__/::::| \/__/:/ /:/\/__/::::::::__/::::\__/__/:/    |:\]],
			[[\  \:\/:/~/\  \:\/:/ /\  \:\~~\~~\__\/  \ \:\  \:\~~\__\  \:\/:/__\  \:\~~\~~/ ~\~~\::::\  \:\    |:/]],
			[[ \  \::/ /:/\  \::/ /:/\  \:\  ~~      /  /:/\  \:\     \  \::/    \  \:\  ~~~   |~~|:|~ \  \:\  /:/ ]],
			[[  \  \:\/:/  \  \:\/:/  \  \:\        /  /:/  \  \:\     \  \:\     \  \:\       |  |:|   \  \:\/:/  ]],
			[[   \  \::/    \  \::/    \  \:\      /__/:/    \  \:\     \  \:\     \  \:\      |  |:|    \  \::/   ]],
			[[    \__\/      \__\/      \__\/      \__\/      \__\/      \__\/      \__\/      |__|/      \__\/    ]],
		}
		dashboard.section.header.opts = {
			position = "center",
			hl = "AlphaHeader",
		}
    return dashboard.config
  end,
}
