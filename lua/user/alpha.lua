local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                                                                   ]],
  [[      ████ ██████           █████      ██                    ]],
  [[     ███████████             █████                            ]],
  [[     █████████ ███████████████████ ███   ███████████  ]],
  [[    █████████  ███    █████████████ █████ ██████████████  ]],
  [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
  [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
  [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  dashboard.button("0", "[0] " .. vim.fn.getcwd(), ":e " .. vim.fn.getcwd() .. "<CR>")
}


dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.section.footer.val = function ()
  local date_gen = io.popen('echo "$(date +%d)/$(date +%m)/$(date +%y)($(date +%a))$(date +%X)" | tr -d "\n"')

  if not date_gen then
    return
  end

  local date = date_gen:read("*a")
  date_gen:close()
  return date
end

--[[ dashboard.opts.opts.noautocmd = true ]]
vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.config)
vim.cmd("Alpha")
