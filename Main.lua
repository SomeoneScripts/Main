local URL = "https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/Games/"
local Ids = {
	["994732206"] = URL.."BloxFruits/BloxFruits.lua",
}

if Ids[tostring(game.GameId)] then
	loadstring(game:HttpGet(Ids[tostring(game.GameId)]))()
end
