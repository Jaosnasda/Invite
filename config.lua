--[[ 

    ==== Job Invite - Jaosnasda#2222 ====

    Invite players to your job with a simple command!
    Players can accept the invite with a simple command!
    Fast and easy to use! Simply add the jobs you want to the config and you are ready to go!
    
    Coder: Jaosnasda#2222

    ==== Job Invite - Jaosnasda#2222 ==== 

]]


Config = {}

Config.Jobs = {

    ["vagos"] = true,
    ["ambulance"] = true,

}

Config.Webhook = 'https://discord.com/api/webhooks/1081762357082071191/Z1g9nWPgtgXtZJtQOUEXC3A5sK9sALGivuL30YvZXHQ2r4CNsBmwQq0InySc-TrhgPy6'

Config.Grades = { -- add which grade is allowed to use invite command
    [12] = true,
    [11] = true,
    [10] = true,
    [9] = false,
    [8] = false,
    [7] = false,
    [6] = false,
    [5] = false,
    [4] = false,
    [3] = false,
    [2] = false,
    [1] = false,
    [0] = false,
}

Config.unemployedJob = "unemployed"


-- Use this function for notifications - you can edit it to your liking
notify = function(source, message)
    TriggerClientEvent('esx:showNotification', source, message)
end