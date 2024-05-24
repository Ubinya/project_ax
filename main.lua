
Object = require "classic"
require "dialog"

local sentences = {
    "你好，世界！这是一个来自网路的问候哦",
    "很高兴认识你",
    "有没有一点adv的感觉",
    "哎嘿~"
}

local currentSentence = 1

--! file: main.lua
function love.load()
    zhFont = love.graphics.newFont("SmileySans-Oblique.ttf",24)
    love.graphics.setFont(zhFont)
    b = SpeechBox(zhFont,200,200,0.1) -- 
    b:set(sentences[currentSentence])
end

function love.update(dt)
    b:update(dt)
end

function love.draw()
    
    b:draw()

    love.graphics.print("不是很懂",100,100)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- left mouse button
        currentSentence = currentSentence + 1
        if currentSentence > #sentences then
            currentSentence = 1
        end
        b:set(sentences[currentSentence])
    end
end