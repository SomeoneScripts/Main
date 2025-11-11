Ids = {
	["7326934954"] = "https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/Games/99%20Nights%20In%20The%20Forest/99NightsInTheForest.lua",
	["994732206"] = "https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/Games/Blox%20Fruits/BloxFruitsDefault.lua",
}
if Ids[tostring(game.GameId)] then
loadstring(game:HttpGet(Ids[tostring(game.GameId)]))()
end