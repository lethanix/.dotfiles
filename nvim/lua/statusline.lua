local gl = require("galaxyline")
local condition = require('galaxyline.condition')
local sec = gl.section
gl.short_line_list = {"minimap", "NvimTree", "-MINIMAP-"}

local nerd_icon = require("statusline-colors.nerd-icon")

-- **************************************
-- Colorscheme
-- **************************************
-- Load the files required for each colorscheme
-- Gruvbox is the default
local colors
local mode_color, bar_bg
local file_fg, file_bg_2

local colors_name = vim.g.colors_name
if colors_name == "material" then
    --colors = require("statusline-colors.material")
    --mode_color = require("statusline-colors.material-deep-ocean")
    --bar_bg = colors.bg

    --file_fg = colors.bg
    --file_bg_2 = colors.darkcyan
    colors = require("statusline-colors.black-amethyst")
    mode_color = require("statusline-colors.black-amethyst-mode")
    --mode_color = require("statusline-colors.material-deep-ocean")
    bar_bg = colors.black2

    file_fg = colors.black1
    file_bg_2 = colors.purple

else
    colors = require("statusline-colors.gruvbox")

    if vim.o.background == "dark" then
        mode_color = require("statusline-colors.gruvbox-mode-dark")
        bar_bg = colors.dark0_hard
    elseif vim.o.background == "light" then
        mode_color = require("statusline-colors.gruvbox-mode-light")
        bar_bg = colors.light1
    end

    file_fg = colors.light1
    file_bg_2 = colors.faded_blue

end


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
        separator_highlight = { file_bg_2, file_bg_2 }
    }
}

sec.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {
    	    require("galaxyline.providers.fileinfo").get_file_icon_color,
    	    file_bg_2
    	},
        separator = "",
        separator_highlight = { file_bg_2, file_bg_2, "bold" }
    }
}

sec.left[4] = {
    FileName = {
        provider = {"FileName"},
        condition = buffer_not_empty,
        highlight = {
            file_fg,
            file_bg_2
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
            file_bg_2, bar_bg },
        separator_highlight = { bar_bg, bar_bg }
    }
}

sec.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = condition.hide_in_width,
        icon = "   ",
        --highlight = {colors.green, bar_bg}
        highlight = {colors.green, bar_bg}
    }
}

sec.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = condition.hide_in_width,
        icon = " ",
        highlight = {colors.orange, bar_bg}
    }
}

sec.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = condition.hide_in_width,
        icon = " ",
        highlight = {colors.red, bar_bg}
    }
}

sec.left[9] = {
    LeftEnd = {
        provider = function()
            return ""
        end,
        separator = " ",
        separator_highlight = { bar_bg, bar_bg },
        highlight = { colors.purple, bar_bg }
    }
}

sec.left[10] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, bar_bg}
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
        highlight = {colors.cyan, bar_bg}
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
        highlight = {colors.cyan, bar_bg}
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
        condition = require("galaxyline.providers.vcs").check_git_workspace,
        highlight = {colors.green, bar_bg}
    }
}

sec.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.providers.vcs").check_git_workspace,
        highlight = {colors.green, bar_bg}
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
        highlight = {colors.red, bar_bg}
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
        highlight = {bar_bg, colors.red}
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
        highlight = {colors.red, bar_bg}

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
        highlight = {colors.cyan, bar_bg}
    }
}

sec.short_line_left[2] = {
    BufferTypeMiddle = {
        provider = function()
            --return "  "
            return ""
        end,
        highlight = { bar_bg, colors.cyan }, 
    }
}

sec.short_line_left[3] = {
    BufferType = {
        provider = function()
            return ""
        end,
        highlight = {
            colors.cyan,
            bar_bg
        }
    }
} 

