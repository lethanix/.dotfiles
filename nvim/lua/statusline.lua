local gl = require("galaxyline")
local condition = require('galaxyline.condition')
local sec = gl.section
gl.short_line_list = {"minimap", "NvimTree", "-MINIMAP-"}
local lspclient = require('galaxyline.provider_lsp')

local nerd_icon = require("statusline-colors.nerd-icon")

-- Load the files required for each colorscheme
local colors = require("statusline-colors.gruvbox")
if vim.o.background == "dark" then
    mode_color = require("statusline-colors.gruvbox-mode-dark")
    bar_bg = colors.dark0_hard
elseif vim.o.background == "light" then
    mode_color = require("statusline-colors.gruvbox-mode-light")
    bar_bg = colors.light1
end
local file_fg = colors.light1
local file_bg = colors.bright_green
local file_bg2 = colors.faded_blue

-- **************************************
-- Left side
-- **************************************
sec.left[1] = {
    leftRounded = {
        provider = function()
            -- auto change color according the vim mode
            vim.api.nvim_command('hi GalaxyleftRounded guifg='..mode_color[vim.fn.mode()])
            return ""
        end,
        --highlight = {colors.gray, bar_bg }
    }
}

sec.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[mode])
            if nerd_icon[mode] == nil then
                return ''..nerd_icon['n']
            end
            return ''..nerd_icon[mode]
        end,
        highlight = { bar_bg, colors.gray },
        separator = " ",
        separator_highlight = { file_bg2, file_bg2 }
    }
}

sec.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {
    	    require("galaxyline.provider_fileinfo").get_file_icon_color, 
    	    file_bg2
    	},
        separator = "",
        separator_highlight = { file_bg2, file_bg2 }
    }
}

sec.left[4] = {
    FileName = {
        provider = {"FileName"},
        condition = buffer_not_empty,
        highlight = {
            file_fg,
            file_bg2
        }
    }
}

sec.left[5] = {
    teech = {
        provider = function()
            return ""
        end,
        separator = " ",
        highlight = {
            file_bg2, bar_bg },
        separator_highlight = { bar_bg, bar_bg }
    }
}

sec.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = condition.hide_in_width,
        icon = "   ",
        highlight = {colors.bright_green, bar_bg}
    }
}

sec.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = condition.hide_in_width,
        icon = " ",
        highlight = {colors.bright_orange, bar_bg}
    }
}

sec.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = condition.hide_in_width,
        icon = " ",
        highlight = {colors.bright_red, bar_bg}
    }
}

sec.left[9] = {
    LeftEnd = {
        provider = function()
            return ""
        end,
        separator = " ",
        separator_highlight = { bar_bg, bar_bg },
        highlight = { colors.neutral_purple, bar_bg }
    }
}

sec.left[10] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.bright_red, bar_bg}
    }
}

sec.left[11] = {
    Space = {
        provider = function()
            return " "
        end,
        highlight = {bar_bg, bar_bg}
    }
}

sec.left[12] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.bright_aqua, bar_bg}
    }
}

-- lsp
sec.left[13] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function ()
            local tbl = {['dashboard'] = true,['']=true}
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        icon = '  ',
        highlight = {colors.bright_aqua, bar_bg}
  }
}

-- **************************************
-- Right side
-- **************************************
sec.right[1] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.bright_green, bar_bg}
    }
}

sec.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.bright_green, bar_bg}
    }
}

sec.right[3] = {
    right_LeftRounded = {
        provider = function()
            -- auto change color according the vim mode
            vim.api.nvim_command('hi Galaxyright_LeftRounded guifg='..mode_color[vim.fn.mode()])
            return ""
        end,
        separator = " ",
        separator_highlight = {bar_bg, bar_bg},
        highlight = {colors.bright_red, bar_bg}
    }
}

sec.right[4] = {
    SiMode = {
        provider = function()
            local alias = {
                n = "NORMAL",
                i = "INSERT",
                c = "COMMAND",
                V = "VISUAL",
                [""] = "VISUAL",
                v = "VISUAL",
                R = "REPLACE"
            }
            -- auto change color according the vim mode
            vim.api.nvim_command('hi GalaxySiMode guibg='..mode_color[vim.fn.mode()])
            return " "
            --return alias[vim.fn.mode()]
        end,
        highlight = {bar_bg, colors.bright_red}
    }
}


sec.right[5] = {
    rightRounded = {
        provider = function()
            -- auto change color according the vim mode
            vim.api.nvim_command('hi GalaxyrightRounded guifg='..mode_color[vim.fn.mode()])
            return ""
        end,
        separator = "",
        separator_highlight = {bar_bg, bar_bg},
        highlight = {colors.bright_red, bar_bg}

        --highlight = { colors.neutral_purple, bar_bg }
    }
}
-- **************************************
-- Short Left side
-- **************************************

sec.short_line_left[1] = {
    BufferTypeLeft = {
        provider = function()
            return ""
        end,
        highlight = {colors.bright_aqua, bar_bg}
    }
}

sec.short_line_left[2] = {
    BufferTypeMiddle = {
        provider = function()
            --return "  "
            return ""
        end,
        highlight = { bar_bg, colors.bright_aqua }, 
    }
}

sec.short_line_left[3] = {
    BufferType = {
        provider = function()
            return ""
        end,
        highlight = {
            colors.bright_aqua,
            bar_bg
        }
    }
} 

