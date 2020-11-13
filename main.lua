local discordia = require('discordia')
local client = discordia.Client()
 
local prefix = "!"
local answers = {

    -- Comando = "Resposta"

    ping = "pong",
    marco = "polo",
    comando = "resposta",
    nome = "Joao",


    ["comando algo"] = "test",




}

client:on('ready', function()
    print('Logged in as '.. client.user.username)
end)
 
client:on('messageCreate', function(message)


    -- ping

    for command, answer in pairs(answers) do

        if string.lower(message.content) == prefix..command then
            message.channel:send(answer)
            break
        end

    end

    --

    
    




end)
 
client:run('Bot '..io.open("./token.txt"):read())