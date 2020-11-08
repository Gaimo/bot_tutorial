local discordia = require('discordia')
local client = discordia.Client()
 
local prefix = "!"
 
client:on('ready', function()
    print('Logged in as '.. client.user.username)
end)
 
client:on('messageCreate', function(message)
    if string.lower(message.content) == prefix..'ping' then
        message.channel:send('Pong!')
    end
end)
 
client:run('Bot '..io.open("./token.txt"):read())