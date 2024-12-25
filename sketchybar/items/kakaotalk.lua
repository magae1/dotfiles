local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local kakaotalk = sbar.add("item", "widgets.kakaotalk", {
        position = "right",
        icon = {
                string = "🗨",
                font = {
                        style = settings.font.style_map["Regular"],
                        size = 18.0,
                }
        },
        label = { font = { family = settings.font.numbers } },
        update_freq = 10,
        popup = { align = "center" },
})

kakaotalk:subscribe({ "routine", "workspace_change" }, function()
        sbar.exec('lsappinfo info -only StatusLabel "KakaoTalk"', function(status_info)
                local icon = "🗨"
                local label = ""
                local icon_color = colors.green

                -- Extract label using pattern matching
                local label_match = status_info:match('"label"="([^"]*)"')

                if label_match then
                        label = label_match

                        -- Determine icon color based on KakaoTalk status
                        if label == "" then
                                icon_color = colors.green -- No notifications
                        elseif label == "•" then
                                icon_color = colors.yellow -- Unread messages
                        elseif label:match("^%d+$") then
                                icon_color = colors.red -- Specific number of notifications
                        else
                                -- Unexpected status, don't update
                                return
                        end
                else
                        -- No valid status found
                        return
                end

                kakaotalk:set({
                        icon = {
                                string = icon,
                                color = icon_color,
                        },
                        label = {
                                string = label,
                        },
                })
        end)
end)

kakaotalk:subscribe("mouse.clicked", function(env)
        sbar.exec("open -a KakaoTalk")
end)

sbar.add("bracket", "widgets.kakaotalk.bracket", { kakaotalk.name }, {
        background = {
                color = colors.bg1,
        },
})

sbar.add("item", "widgets.kakaotalk.padding", {
        position = "right",
        width = settings.group_paddings,
})
