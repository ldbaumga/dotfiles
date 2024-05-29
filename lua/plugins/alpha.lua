local image1 = {
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
}

local val = {
	[[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
	[[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
	[[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
	[[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
	[[██   ████ ███████  ██████    ████   ██ ██      ██]],
}

return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = image1

			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰈞  > Find file", ":cd $HOME | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  > Settings", ":e ~/.config/nvim<CR>"),
				dashboard.button("q", "󰩈  > Quit NVIM", ":qa<CR>"),
			}

			alpha.setup(dashboard.opts)
		end,
	},
}
--[[
return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local col = function(strlist, opts)
            -- strlist is a TABLE of TABLES, representing columns of text
            -- opts is a text display option

            -- column spacing
            local padding = 12
            -- fill lines up to the maximim length with 'fillchar'
            local fillchar = " "
            -- columns padding char (for testing)
            local padchar = " "

            -- define maximum string length in a table
            local maxlen = function(str)
                local max = 0
                for i in pairs(str) do
                    if #str[i] > max then
                        max = #str[i]
                    end
                end
                return max
            end

            -- add as much right-padding to align the text block
            local pad = function(str, max)
                local strlist = {}
                for i in pairs(str) do
                    if #str[i] < max then
                        local newstr = str[i] .. string.rep(fillchar, max - #str[i])
                        table.insert(strlist, newstr)
                    else
                        table.insert(strlist, str[i])
                    end
                end
                return strlist
            end

            -- this is a table for text strings
            local values = {}
            -- process all the lines
            for i = 1, maxlen(strlist) do
                local str = ""
                -- process all the columns but last, because we dont wand extra padding
                -- after last column
                for column = 1, #strlist - 1 do
                    local maxstr = maxlen(strlist[column])
                    local padded = pad(strlist[column], maxstr)
                    if strlist[column][i] == nil then
                        str = str .. string.rep(fillchar, maxstr) .. string.rep(padchar, padding)
                    else
                        str = str .. padded[i] .. string.rep(padchar, padding)
                    end
                end

                -- lets process the last column, no extra padding
                do
                    local maxstr = maxlen(strlist[#strlist])
                    local padded = pad(strlist[#strlist], maxstr)
                    if strlist[#strlist][i] == nil then
                        str = str .. string.rep(fillchar, maxlen(strlist[#strlist]))
                    else
                        str = str .. padded[i]
                    end
                end

                -- insert result into output table
                table.insert(values, { type = "text", val = str, opts = opts })
            end

            return values
        end

        local my_unimpaired = {
            "[l ]l    prev/next location list",
        }

        local vim_signature = {
            "m<BS>                remove all markers",
        }

        local my_alts = {
            "ALT-D          Toggle show hidden",
        }

        local fzf_vim = {
            "CTRL-F SHIFT-M      Keyboard mappings",
        }

        local fkeys = {
            "F12               Close current buffer (no window close)",
        }

        local bookmarks = {
            "bkk bjj    move bookmark up (down)",
        }

        local others = {
            "[p ]p [k ]k    ???",
        }

        local shortcuts = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰈞  > Find file", ":cd $HOME | Telescope find_files<CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button("q", "󰩈  > Quit NVIM", ":qa<CR>"),
        }

        local head = {
            type = "text",
            val = image1,
            opts = {
                position = "center",
                hl = "Type",
            },
        }

        local foot = {
            type = "text",
            val = "footer",
            opts = {
                position = "center",
                hl = "Number",
            },
        }

        local block1 = {
            type = "group",
            val = col(
                { shortcuts },
                { position = "center", hl = { { "Comment", 0, -1 }, { "Title", 92, 97 }, { "Title", 137, 154 } } }
            ),
            opts = {
                spacing = 0,
            },
        }

        local block2 = {
            type = "group",
            val = col(
                { fzf_vim, fkeys },
                { position = "center", hl = { { "Comment", 0, -1 }, { "Title", 94, 108 }, { "Title", 166, 180 } } }
            ),
            opts = {
                spacing = 0,
            },
        }

        local block3 = {
            type = "group",
            val = col({ my_alts, bookmarks, others }, {
                position = "center",
                hl = { { "Comment", 0, -1 }, { "Title", 89, 100 }, { "Title", 152, 159 }, { "Title", 198, 209 } },
            }),
            opts = {
                spacing = 0,
            },
        }

        local opts = {
            layout = {
                { type = "padding", val = 2 },
                head,
                { type = "padding", val = 2 },
                block1,
                { type = "padding", val = 2 },
                block2,
                { type = "padding", val = 2 },
                block3,
            },
            opts = {
                noautocmd = true,
                margin = 5,
            },
        }

        alpha.setup(opts)
	    alpha.setup(dashboard.opts)
    end,
}
--]]
