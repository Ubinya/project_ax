--! file: rectangle.lua
Object = require "classic"
local utf8 = require "utf8_simple"

-- Pass Object as first argument.
SpeechBox = Object.extend(Object)


-- 
function SpeechBox:new(font,midx,midy,interval_each)
    self.midx = midx
    self.midy = midy
    self.size = 20

    self.interval_each = interval_each
    self.timer = 0
    self.displayLen = 0
    self.maxLen = 0
    self.fullText = ""
    self.displayText = ""

    self.charWidth = font:getWidth("字")
    self.charHeight = font:getHeight()

    -- status: 1-ready_to_show, 0-hide
    self.status = 1
end

function SpeechBox:update(dt)
    self.timer = self.timer + dt
    if self.timer >= self.interval_each and 
    self.displayLen < self.maxLen then
        self.displayLen = self.displayLen + 1
        self.displayText = utf8.sub(self.fullText, 1, self.displayLen)
        self.timer = 0
    end
end

function SpeechBox:set(text)
    self.fullText = text
    self.maxLen = utf8.len(text)
    self.displayLen = 0
    self.displayText = ""
    self.timer = 0
end

function SpeechBox:draw()
    local textWidth = self.charWidth * utf8.len(self.displayText)
    local startx = self.midx - (textWidth / 2)
    local starty = self.midy - (self.charHeight / 2)
    --self.displayText = "字"
    love.graphics.print(self.displayText, startx, starty)
end
