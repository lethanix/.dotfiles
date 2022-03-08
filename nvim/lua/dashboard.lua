local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
--dashboard.section.header.val = {
--    "                                                     ",
--    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--    "                                                     ",
--}

dashboard.section.header.val = {
	[[                     ,;                                 L.                            ]],
	[[            i      f#i          .    .                  EW:        ,ft t              ]],
	[[           LE    .E#t  GEEEEEEELDi   Dt              .. E##;       t#E Ej             ]],
	[[          L#E   i#W,   ,;;L#K;;.E#i  E#i            ;W, E###t      t#E E#, :KW,      L]],
	[[         G#W.  L#D.       t#E   E#t  E#t           j##, E#fE#f     t#E E#t  ,#W:   ,KG]],
	[[        D#K. :K#Wfff;     t#E   E#t  E#t          G###, E#t D#G    t#E E#t   ;#W. jWi ]],
	[[       E#K.  i##WLLLLt    t#E   E########f.     :E####, E#t  f#E.  t#E E#t    i#KED.  ]],
	[[     .E#E.    .E#L        t#E   E#j..K#j...    ;W#DG##, E#t   t#K: t#E E#t     L#W.   ]],
	[[    .K#E        f#E:      t#E   E#t  E#t      j###DW##, E#t    ;#W,t#E E#t   .GKj#K.  ]],
	[[   .K#D          ,WW;     t#E   E#t  E#t     G##i,,G##, E#t     :K#D#E E#t  iWf  i#K. ]],
	[[  .W#G            .D#;    t#E   f#t  f#t   :K#K:   L##, E#t      .E##E E#t LK:    t#E ]],
	[[ :W##########Wt     tt     fE    ii   ii  ;##D.    L##, ..         G#E E#t i       tDj]],
	[[ :,,,,,,,,,,,,,.            :             ,,,      .,,              fE ,;.            ]],
	[[                                                                     ,                ]],
}
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd $HOME/Documents | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

vim.cmd([[
    autocmd FileType alpha IndentBlanklineDisable
]])
