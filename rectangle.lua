--! file: rectangle.lua
Object = require "classic"

-- Pass Object as first argument.
SpeechBox = Object.extend(Object)

-- 
function SpeechBox.new(self,font,midx,midy,interval_each)
    self.midx = midx
    self.midy = midy
    self.size = 20

    self.interval_each = interval_each
    self.timer = 0
    self.displayLen = 0
    self.maxLen = 0
    self.fullText = ""
    self.displayText = ""

    self.font = font
    
end

function SpeechBox.update(self, dt)
    self.timer = self.timer + dt
    if self.timer >= self.interval_each and 
    self.displayLen < self.maxLen then
        self.displayLen = self.displayLen + 1
        self.displayText = string.sub(self.fullText, 1, self.displayLen)
        self.timer = 0
    end
end

function SpeechBox.set(self, text)
    self.fullText = text
    self.textHeight = self.font:getHeight()
end

function SpeechBox.draw(self)
    self.textWidth = self.font:getWidth(self.displayText) 
    local startx = midx - (self.textWidth / 2)
    local starty = midy - (self.textHeight / 2)
    love.graphics.print(self.displayText, startx, starty)
end