	Translations = {
	    Languages = {
	        "Portuguese",
	        "Thai",
	        "Vietnamese"
	    },
		Flags = {
			["Portuguese"] = "5826570404",
	        ["Thai"] = "105309709443809",
	        ["Vietnamese"] = "9041883110",
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

