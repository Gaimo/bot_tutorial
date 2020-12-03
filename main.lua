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

    local content = message.content
    local cmd = discordia.extensions.string.split(content, " ")

    if cmd[1] == prefix.."avatar" then
        local user = client:getUser(cmd[2])

        if user ~= nil then
            message:reply {
                embed = {
                    title = "UM TITULO",
                    description = "**Clique [aqui]("..user:getAvatarURL().."?size=512"..") para baixar.**",
                    image = {
                        url = user:getAvatarURL().."?size=512"--Envia o avatar do usuario com o size 512
                    },
                    color = 11772249,

        
                }
            } 

        else
            message:reply("Digite um ID válido.")
        end
    end

    for command, answer in pairs(answers) do

        if string.lower(content) == prefix..command then
            message.channel:send(answers[command][math.random(#answers[command])])
            break
        end

    end
    

end)
 
client:run('Bot '..io.open("./token.txt"):read())