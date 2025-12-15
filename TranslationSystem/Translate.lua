	Translations = {
	    Languages = {
	        "Portuguese",
	        "Thai",
	        "Vietnamese"
	    },
	}
	
	for _, Lang in ipairs(Translations.Languages) do
	    local ok, data = pcall(function()
	        local url = "https://raw.githubusercontent.com/SomeoneScripts/Main/refs/heads/main/TranslationSystem/Languages/"..Lang..".lua"
	        return loadstring(game:HttpGet(url))()
	    end)
	
	    if ok and data then
	        Translations[Lang] = data
	    end

	end

