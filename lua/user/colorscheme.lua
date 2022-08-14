local colorscheme = "onedarker"
local status_ok, color = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
