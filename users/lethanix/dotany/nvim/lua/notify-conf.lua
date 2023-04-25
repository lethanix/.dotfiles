local nvim_notify = require("notify")
nvim_notify.setup({
    -- Animation style
    --stages = "fade_in_slide_out",
    stages = "fade",
    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Default timeout for notifications
    timeout = 1000,
    background_colour = "#2E3440",
    
    -- Max number of columns for messages
    max_width = 80,
    -- Max number of lines for a message
    max_height = nil,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
    background_colour = "Normal",

    -- Minimum width for notification windows
    minimum_width = 45,

    -- Icons for the different levels
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
})

vim.notify = nvim_notify
