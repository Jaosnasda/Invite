invite = {}


RegisterCommand('invite', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerJob = xPlayer.job.name
    local playerJobGrade = xPlayer.job.grade
    local target = ESX.GetPlayerFromId(args[1])
    local targetName = GetPlayerName(args[1])

    if Config.Jobs[playerJob] and Config.Grades[playerJobGrade] then
        if tonumber(args[1]) ~= source and args[1] ~= nil and args[1] ~= "" and tonumber(args[1]) then
            if target.getJob().name == Config.unemployedJob then
                notify(args[1] , "Du Wurdest Von " .. xPlayer.name .. " In die Fraktion " .. xPlayer.job.label .. " Eingeladen ! (/acp)")
                notify(source, "Du hast den Spieler " .. targetName .. " In die Fraktion " .. xPlayer.job.label .. " Eingeladen!")
                invite[args[1]] = {xPlayer.job.name, xPlayer.identifier}
            else
                notify(source, "Der Spieler " .. target.name .. " Ist Bereits in einer Fraktion!")
            end
        else
            notify(source, "Diese ID Gibt es Nicht!")
        end
    else
        notify(source, "Du hast keine Rechte!")
    end
end, false)


RegisterCommand('acp', function(source, args, rawCommand)
    if source and tonumber(source) ~= nil and tonumber(source) > 0 then
        local sender = ESX.GetPlayerFromId(source)
        if source then
            local data = invite[tostring(source)]
            
            if data then
                local job = data[1]
                local grade = 1
                local identifier = data[2]
                local inviter = ESX.GetPlayerFromIdentifier(identifier)

                sender.setJob(job, grade)
                invite[tostring(source)] = nil
                notify(source, "Du Bist der Fraktion " .. job .. " Beigetreten!")
                notify(inviter.source, "Das Mitglied " .. sender.name .. " Ist der Fraktion Beigetreten!")
            else
                notify(source, "Du Hast kein Invite Bekommen!")
            end
        end
    end
end, false)

SetConvar("👥-Job Invite", "Made By Jaosnasda#2222")



SendToDiscord = function(color, name, message)

    SendToDiscord(16711680, "Job Invite", "Der Spieler ".. GetPlayerName(source) .." Hat ".. GetPlayerName(args[1]) .." in Ihn in die Fraktion ".. xPlayer.job.label .." Eingeladen!")

    embed = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "© 2023 - " .. os.date("%Y") .. " | " .. "made by:  Jaosnasda#2222",
            },
        }
    }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "Job Invite", embeds = embed}), { ['Content-Type'] = 'application/json' })
end


--[[ 

    ==== Embed Color - Jaosnasda#2222 ====



    Red > 16711680
    Green > 65280
    Blue > 255
    Yellow > 16776960
    Purple > 16711935
    Orange > 16744192
    White > 16777215
    

    Coder: Jaosnasda#2222

    Discord message me if you have any questions or need help.


    ==== Embed Color - Jaosnasda#2222 ====

    ==== Job Invite - Jaosnasda#2222 ====

    Invite players to your job with a simple command!
    Players can accept the invite with a simple command!
    Fast and easy to use! Simply add the jobs you want to the config and you are ready to go!
    
    Coder: Jaosnasda#2222

    ==== Job Invite - Jaosnasda#2222 ==== 

]]