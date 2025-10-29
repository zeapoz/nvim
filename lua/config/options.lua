local g = vim.g
local o = vim.opt

-- Wrap.
o.showbreak = "󱞩 "

-- Track mouse movements.
o.mousemoveevent = true

o.fillchars = { eob = " " } -- Disable end of buffers tildes (~).
o.listchars = {
  precedes = "«",
  trail = "·",
}

-- Neovide settings.
if g.neovide then
  o.guifont = "Maple Mono:h9"

  g.neovide_padding_top = 20
  g.neovide_padding_bottom = 20
  g.neovide_padding_left = 20
  g.neovide_padding_right = 20

  g.neovide_normal_opacity = 0.5
  g.neovide_hide_mouse_when_typing = true
  g.neovide_scroll_animation_length = 0.1
end
