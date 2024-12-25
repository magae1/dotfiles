local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local mail = sbar.add("item", "widgets.mail", {
	position = "right",
	icon = {
		string = "󰇮",
		font = {
			style = settings.font.style_map["Regular"],
			size = 18.0
    		},
	},
	label = { font = { family = settings.font.numbers } },
	update_freq = 30,
	popup = { align = "center" },
})

local function check_unread_mail()
  local handle = io.popen([[
    osascript -e '
      try
        tell application "Mail"
          set unreadCount to 0
          repeat with eachAccount in accounts
            try
              set inboxMailbox to mailbox "INBOX" of eachAccount
              set unreadCount to unreadCount + (count of (messages of inboxMailbox whose read status is false))
            end try
          end repeat
          return unreadCount
        end tell

      on error
        return 0
      end try
    '
  ]])
  
  if handle then
    local result = handle:read("*a")  -- AppleScript 실행 결과 읽기
    handle:close()  -- 핸들 닫기
    result = result:gsub("%s+", "")  -- 결과에서 공백과 줄바꿈 제거
    return tonumber(result) or 0  -- 숫자로 변환하거나 0 반환
  end
  return 0  -- 핸들이 유효하지 않을 경우 0 반환
end

-- 업데이트 이벤트 처리
mail:subscribe("routine", function(env)
  local unread_count = check_unread_mail()  -- 미읽은 메일 수 체크
  
  if unread_count > 0 then
    mail:set({
      icon = { color = colors.red },  -- 아이콘 색상 변경
      label = { 
        string = tostring(unread_count),  -- 미읽은 메일 수 문자열로 변환
        drawing = true  -- 레이블 그리기
      }
    })
  else
    -- 미읽은 메일이 없는 경우
    mail:set({
      icon = { color = colors.green },  -- 기본 아이콘 색상
      label = { 
        string = "",  -- 레이블 비움
        drawing = false  -- 레이블 그리지 않음
      }
    })
  end
end)

mail:subscribe("mouse.clicked", function(env)
  sbar.exec("open -a 'Mail'")  -- 클릭 시 Mail 앱 열기
end)

sbar.add("bracket", "widgets.mail.bracket", { mail.name }, {
	background = { color = colors.bg1 }
})

sbar.add("item", "widgets.mail.padding", {
	position = "right",
	width = settings.group_paddings
})
