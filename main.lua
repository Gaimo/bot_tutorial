local discordia = require('discordia')
local client = discordia.Client()
 
local prefix = "!"
local answers = {

    -- Comando = {"Resposta", "Resposta2"},

    ping = {"pong", "pong!", "pong?"},
    ["comando composto"] = {"um", "dois"},
    marco = {"polo"},
    test = {"1","2","3","4","5"}




}

client:on('ready', function()
    print('Logged in as '.. client.user.username)
end)
 
client:on('messageCreate', function(message)


    -- ping

    for command, answer in pairs(answers) do

        if string.lower(message.content) == prefix..command then
            message.channel:send(answers[command][math.random(#answers[command])])
            break
        end

    end

    --

    
    




end)
 
client:run('Bot '..io.open("./token.txt"):read())