local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local getgenv = getgenv or function() return _G end
local gethui = gethui or function() return CoreGui:FindFirstChild("RobloxGui") or CoreGui end
local getconnections = getconnections or function() return {} end
local consoleprint = consoleprint or function(...) print(...) end
local isrbxactive = isrbxactive or function() return UserInputService:GetFocusedTextBox() ~= nil end
local isgameactive = isgameactive or function() return RunService:IsRunning() end
local assert = assert or function(Value, Erro) if not Value then error(Erro) end end
local getcustomasset = getcustomasset or getsynasset or function(Value) print("Your Executor Does Not Support This Function.", Value) end
local IsMobile = false

local Astral = {
	Name = "Astral Library",
	Version = "1.0",
	File = "Astral Library/Library Settings.lua",
	Icons = {
		["accessibility"] = "rbxassetid://10709751939",
		["activity"] = "rbxassetid://10709752035",
		["airvent"] = "rbxassetid://10709752131",
		["airplay"] = "rbxassetid://10709752254",
		["alarmcheck"] = "rbxassetid://10709752405",
		["alarmclock"] = "rbxassetid://10709752630",
		["alarmclockoff"] = "rbxassetid://10709752508",
		["alarmminus"] = "rbxassetid://10709752732",
		["alarmplus"] = "rbxassetid://10709752825",
		["album"] = "rbxassetid://10709752906",
		["alertcircle"] = "rbxassetid://10709752996",
		["alertoctagon"] = "rbxassetid://10709753064",
		["alerttriangle"] = "rbxassetid://10709753149",
		["aligncenter"] = "rbxassetid://10709753570",
		["aligncenterhorizontal"] = "rbxassetid://10709753272",
		["aligncentervertical"] = "rbxassetid://10709753421",
		["alignendhorizontal"] = "rbxassetid://10709753692",
		["alignendvertical"] = "rbxassetid://10709753808",
		["alignhorizontaldistributecenter"] = "rbxassetid://10747779791",
		["alignhorizontaldistributeend"] = "rbxassetid://10747784534",
		["alignhorizontaldistributestart"] = "rbxassetid://10709754118",
		["alignhorizontaljustifycenter"] = "rbxassetid://10709754204",
		["alignhorizontaljustifyend"] = "rbxassetid://10709754317",
		["alignhorizontaljustifystart"] = "rbxassetid://10709754436",
		["alignhorizontalspacearound"] = "rbxassetid://10709754590",
		["alignhorizontalspacebetween"] = "rbxassetid://10709754749",
		["alignjustify"] = "rbxassetid://10709759610",
		["alignleft"] = "rbxassetid://10709759764",
		["alignright"] = "rbxassetid://10709759895",
		["alignstarthorizontal"] = "rbxassetid://10709760051",
		["alignstartvertical"] = "rbxassetid://10709760244",
		["alignverticaldistributecenter"] = "rbxassetid://10709760351",
		["alignverticaldistributeend"] = "rbxassetid://10709760434",
		["alignverticaldistributestart"] = "rbxassetid://10709760612",
		["alignverticaljustifycenter"] = "rbxassetid://10709760814",
		["alignverticaljustifyend"] = "rbxassetid://10709761003",
		["alignverticaljustifystart"] = "rbxassetid://10709761176",
		["alignverticalspacearound"] = "rbxassetid://10709761324",
		["alignverticalspacebetween"] = "rbxassetid://10709761434",
		["anchor"] = "rbxassetid://10709761530",
		["angry"] = "rbxassetid://10709761629",
		["annoyed"] = "rbxassetid://10709761722",
		["aperture"] = "rbxassetid://10709761813",
		["apple"] = "rbxassetid://10709761889",
		["archive"] = "rbxassetid://10709762233",
		["archiverestore"] = "rbxassetid://10709762058",
		["armchair"] = "rbxassetid://10709762327",
		["arrowbigdown"] = "rbxassetid://10747796644",
		["arrowbigleft"] = "rbxassetid://10709762574",
		["arrowbigright"] = "rbxassetid://10709762727",
		["arrowbigup"] = "rbxassetid://10709762879",
		["arrowdown"] = "rbxassetid://10709767827",
		["arrowdowncircle"] = "rbxassetid://10709763034",
		["arrowdownleft"] = "rbxassetid://10709767656",
		["arrowdownright"] = "rbxassetid://10709767750",
		["arrowleft"] = "rbxassetid://10709768114",
		["arrowleftcircle"] = "rbxassetid://10709767936",
		["arrowleftright"] = "rbxassetid://10709768019",
		["arrowright"] = "rbxassetid://10709768347",
		["arrowrightcircle"] = "rbxassetid://10709768226",
		["arrowup"] = "rbxassetid://10709768939",
		["arrowupcircle"] = "rbxassetid://10709768432",
		["arrowupdown"] = "rbxassetid://10709768538",
		["arrowupleft"] = "rbxassetid://10709768661",
		["arrowupright"] = "rbxassetid://10709768787",
		["asterisk"] = "rbxassetid://10709769095",
		["atsign"] = "rbxassetid://10709769286",
		["award"] = "rbxassetid://10709769406",
		["axe"] = "rbxassetid://10709769508",
		["axis3d"] = "rbxassetid://10709769598",
		["baby"] = "rbxassetid://10709769732",
		["backpack"] = "rbxassetid://10709769841",
		["baggageclaim"] = "rbxassetid://10709769935",
		["banana"] = "rbxassetid://10709770005",
		["banknote"] = "rbxassetid://10709770178",
		["barchart"] = "rbxassetid://10709773755",
		["barchart2"] = "rbxassetid://10709770317",
		["barchart3"] = "rbxassetid://10709770431",
		["barchart4"] = "rbxassetid://10709770560",
		["barcharthorizontal"] = "rbxassetid://10709773669",
		["barcode"] = "rbxassetid://10747360675",
		["baseline"] = "rbxassetid://10709773863",
		["bath"] = "rbxassetid://10709773963",
		["battery"] = "rbxassetid://10709774640",
		["batterycharging"] = "rbxassetid://10709774068",
		["batteryfull"] = "rbxassetid://10709774206",
		["batterylow"] = "rbxassetid://10709774370",
		["batterymedium"] = "rbxassetid://10709774513",
		["beaker"] = "rbxassetid://10709774756",
		["bed"] = "rbxassetid://10709775036",
		["beddouble"] = "rbxassetid://10709774864",
		["bedsingle"] = "rbxassetid://10709774968",
		["beer"] = "rbxassetid://10709775167",
		["bell"] = "rbxassetid://10709775704",
		["bellminus"] = "rbxassetid://10709775241",
		["belloff"] = "rbxassetid://10709775320",
		["bellplus"] = "rbxassetid://10709775448",
		["bellring"] = "rbxassetid://10709775560",
		["bike"] = "rbxassetid://10709775894",
		["binary"] = "rbxassetid://10709776050",
		["bitcoin"] = "rbxassetid://10709776126",
		["bluetooth"] = "rbxassetid://10709776655",
		["bluetoothconnected"] = "rbxassetid://10709776240",
		["bluetoothoff"] = "rbxassetid://10709776344",
		["bluetoothsearching"] = "rbxassetid://10709776501",
		["bold"] = "rbxassetid://10747813908",
		["bomb"] = "rbxassetid://10709781460",
		["bone"] = "rbxassetid://10709781605",
		["book"] = "rbxassetid://10709781824",
		["bookopen"] = "rbxassetid://10709781717",
		["bookmark"] = "rbxassetid://10709782154",
		["bookmarkminus"] = "rbxassetid://10709781919",
		["bookmarkplus"] = "rbxassetid://10709782044",
		["bot"] = "rbxassetid://10709782230",
		["box"] = "rbxassetid://10709782497",
		["boxselect"] = "rbxassetid://10709782342",
		["boxes"] = "rbxassetid://10709782582",
		["briefcase"] = "rbxassetid://10709782662",
		["brush"] = "rbxassetid://10709782758",
		["bug"] = "rbxassetid://10709782845",
		["building"] = "rbxassetid://10709783051",
		["building2"] = "rbxassetid://10709782939",
		["bus"] = "rbxassetid://10709783137",
		["cake"] = "rbxassetid://10709783217",
		["calculator"] = "rbxassetid://10709783311",
		["calendar"] = "rbxassetid://10709789505",
		["calendarcheck"] = "rbxassetid://10709783474",
		["calendarcheck2"] = "rbxassetid://10709783392",
		["calendarclock"] = "rbxassetid://10709783577",
		["calendardays"] = "rbxassetid://10709783673",
		["calendarheart"] = "rbxassetid://10709783835",
		["calendarminus"] = "rbxassetid://10709783959",
		["calendaroff"] = "rbxassetid://10709788784",
		["calendarplus"] = "rbxassetid://10709788937",
		["calendarrange"] = "rbxassetid://10709789053",
		["calendarsearch"] = "rbxassetid://10709789200",
		["calendarx"] = "rbxassetid://10709789407",
		["calendarx2"] = "rbxassetid://10709789329",
		["camera"] = "rbxassetid://10709789686",
		["cameraoff"] = "rbxassetid://10747822677",
		["car"] = "rbxassetid://10709789810",
		["carrot"] = "rbxassetid://10709789960",
		["cast"] = "rbxassetid://10709790097",
		["charge"] = "rbxassetid://10709790202",
		["check"] = "rbxassetid://10709790644",
		["checkcircle"] = "rbxassetid://10709790387",
		["checkcircle2"] = "rbxassetid://10709790298",
		["checksquare"] = "rbxassetid://10709790537",
		["chefhat"] = "rbxassetid://10709790757",
		["cherry"] = "rbxassetid://10709790875",
		["chevrondown"] = "rbxassetid://10709790948",
		["chevronfirst"] = "rbxassetid://10709791015",
		["chevronlast"] = "rbxassetid://10709791130",
		["chevronleft"] = "rbxassetid://10709791281",
		["chevronright"] = "rbxassetid://10709791437",
		["chevronup"] = "rbxassetid://10709791523",
		["chevronsdown"] = "rbxassetid://10709796864",
		["chevronsdownup"] = "rbxassetid://10709791632",
		["chevronsleft"] = "rbxassetid://10709797151",
		["chevronsleftright"] = "rbxassetid://10709797006",
		["chevronsright"] = "rbxassetid://10709797382",
		["chevronsrightleft"] = "rbxassetid://10709797274",
		["chevronsup"] = "rbxassetid://10709797622",
		["chevronsupdown"] = "rbxassetid://10709797508",
		["chrome"] = "rbxassetid://10709797725",
		["circle"] = "rbxassetid://10709798174",
		["circledot"] = "rbxassetid://10709797837",
		["circleellipsis"] = "rbxassetid://10709797985",
		["circleslashed"] = "rbxassetid://10709798100",
		["citrus"] = "rbxassetid://10709798276",
		["clapperboard"] = "rbxassetid://10709798350",
		["clipboard"] = "rbxassetid://10709799288",
		["clipboardcheck"] = "rbxassetid://10709798443",
		["clipboardcopy"] = "rbxassetid://10709798574",
		["clipboardedit"] = "rbxassetid://10709798682",
		["clipboardlist"] = "rbxassetid://10709798792",
		["clipboardsignature"] = "rbxassetid://10709798890",
		["clipboardtype"] = "rbxassetid://10709798999",
		["clipboardx"] = "rbxassetid://10709799124",
		["clock"] = "rbxassetid://10709805144",
		["clock1"] = "rbxassetid://10709799535",
		["clock10"] = "rbxassetid://10709799718",
		["clock11"] = "rbxassetid://10709799818",
		["clock12"] = "rbxassetid://10709799962",
		["clock2"] = "rbxassetid://10709803876",
		["clock3"] = "rbxassetid://10709803989",
		["clock4"] = "rbxassetid://10709804164",
		["clock5"] = "rbxassetid://10709804291",
		["clock6"] = "rbxassetid://10709804435",
		["clock7"] = "rbxassetid://10709804599",
		["clock8"] = "rbxassetid://10709804784",
		["clock9"] = "rbxassetid://10709804996",
		["cloud"] = "rbxassetid://10709806740",
		["cloudcog"] = "rbxassetid://10709805262",
		["clouddrizzle"] = "rbxassetid://10709805371",
		["cloudfog"] = "rbxassetid://10709805477",
		["cloudhail"] = "rbxassetid://10709805596",
		["cloudlightning"] = "rbxassetid://10709805727",
		["cloudmoon"] = "rbxassetid://10709805942",
		["cloudmoonrain"] = "rbxassetid://10709805838",
		["cloudoff"] = "rbxassetid://10709806060",
		["cloudrain"] = "rbxassetid://10709806277",
		["cloudrainwind"] = "rbxassetid://10709806166",
		["cloudsnow"] = "rbxassetid://10709806374",
		["cloudsun"] = "rbxassetid://10709806631",
		["cloudsunrain"] = "rbxassetid://10709806475",
		["cloudy"] = "rbxassetid://10709806859",
		["clover"] = "rbxassetid://10709806995",
		["code"] = "rbxassetid://10709810463",
		["code2"] = "rbxassetid://10709807111",
		["codepen"] = "rbxassetid://10709810534",
		["codesandbox"] = "rbxassetid://10709810676",
		["coffee"] = "rbxassetid://10709810814",
		["cog"] = "rbxassetid://10709810948",
		["coins"] = "rbxassetid://10709811110",
		["columns"] = "rbxassetid://10709811261",
		["command"] = "rbxassetid://10709811365",
		["compass"] = "rbxassetid://10709811445",
		["component"] = "rbxassetid://10709811595",
		["conciergebell"] = "rbxassetid://10709811706",
		["connection"] = "rbxassetid://10747361219",
		["contact"] = "rbxassetid://10709811834",
		["contrast"] = "rbxassetid://10709811939",
		["cookie"] = "rbxassetid://10709812067",
		["copy"] = "rbxassetid://10709812159",
		["copyleft"] = "rbxassetid://10709812251",
		["copyright"] = "rbxassetid://10709812311",
		["cornerdownleft"] = "rbxassetid://10709812396",
		["cornerdownright"] = "rbxassetid://10709812485",
		["cornerleftdown"] = "rbxassetid://10709812632",
		["cornerleftup"] = "rbxassetid://10709812784",
		["cornerrightdown"] = "rbxassetid://10709812939",
		["cornerrightup"] = "rbxassetid://10709813094",
		["cornerupleft"] = "rbxassetid://10709813185",
		["cornerupright"] = "rbxassetid://10709813281",
		["cpu"] = "rbxassetid://10709813383",
		["croissant"] = "rbxassetid://10709818125",
		["crop"] = "rbxassetid://10709818245",
		["cross"] = "rbxassetid://10709818399",
		["crosshair"] = "rbxassetid://10709818534",
		["crown"] = "rbxassetid://10709818626",
		["cupsoda"] = "rbxassetid://10709818763",
		["curlybraces"] = "rbxassetid://10709818847",
		["currency"] = "rbxassetid://10709818931",
		["database"] = "rbxassetid://10709818996",
		["delete"] = "rbxassetid://10709819059",
		["diamond"] = "rbxassetid://10709819149",
		["dice1"] = "rbxassetid://10709819266",
		["dice2"] = "rbxassetid://10709819361",
		["dice3"] = "rbxassetid://10709819508",
		["dice4"] = "rbxassetid://10709819670",
		["dice5"] = "rbxassetid://10709819801",
		["dice6"] = "rbxassetid://10709819896",
		["dices"] = "rbxassetid://10723343321",
		["diff"] = "rbxassetid://10723343416",
		["disc"] = "rbxassetid://10723343537",
		["divide"] = "rbxassetid://10723343805",
		["dividecircle"] = "rbxassetid://10723343636",
		["dividesquare"] = "rbxassetid://10723343737",
		["dollarsign"] = "rbxassetid://10723343958",
		["download"] = "rbxassetid://10723344270",
		["downloadcloud"] = "rbxassetid://10723344088",
		["droplet"] = "rbxassetid://10723344432",
		["droplets"] = "rbxassetid://10734883356",
		["drumstick"] = "rbxassetid://10723344737",
		["edit"] = "rbxassetid://10734883598",
		["edit2"] = "rbxassetid://10723344885",
		["edit3"] = "rbxassetid://10723345088",
		["egg"] = "rbxassetid://10723345518",
		["eggfried"] = "rbxassetid://10723345347",
		["electricity"] = "rbxassetid://10723345749",
		["electricityoff"] = "rbxassetid://10723345643",
		["equal"] = "rbxassetid://10723345990",
		["equalnot"] = "rbxassetid://10723345866",
		["eraser"] = "rbxassetid://10723346158",
		["euro"] = "rbxassetid://10723346372",
		["expand"] = "rbxassetid://10723346553",
		["externallink"] = "rbxassetid://10723346684",
		["eye"] = "rbxassetid://10723346959",
		["eyeoff"] = "rbxassetid://10723346871",
		["factory"] = "rbxassetid://10723347051",
		["fan"] = "rbxassetid://10723354359",
		["fastforward"] = "rbxassetid://10723354521",
		["feather"] = "rbxassetid://10723354671",
		["figma"] = "rbxassetid://10723354801",
		["file"] = "rbxassetid://10723374641",
		["filearchive"] = "rbxassetid://10723354921",
		["fileaudio"] = "rbxassetid://10723355148",
		["fileaudio2"] = "rbxassetid://10723355026",
		["fileaxis3d"] = "rbxassetid://10723355272",
		["filebadge"] = "rbxassetid://10723355622",
		["filebadge2"] = "rbxassetid://10723355451",
		["filebarchart"] = "rbxassetid://10723355887",
		["filebarchart2"] = "rbxassetid://10723355746",
		["filebox"] = "rbxassetid://10723355989",
		["filecheck"] = "rbxassetid://10723356210",
		["filecheck2"] = "rbxassetid://10723356100",
		["fileclock"] = "rbxassetid://10723356329",
		["filecode"] = "rbxassetid://10723356507",
		["filecog"] = "rbxassetid://10723356830",
		["filecog2"] = "rbxassetid://10723356676",
		["filediff"] = "rbxassetid://10723357039",
		["filedigit"] = "rbxassetid://10723357151",
		["filedown"] = "rbxassetid://10723357322",
		["fileedit"] = "rbxassetid://10723357495",
		["fileheart"] = "rbxassetid://10723357637",
		["fileimage"] = "rbxassetid://10723357790",
		["fileinput"] = "rbxassetid://10723357933",
		["filejson"] = "rbxassetid://10723364435",
		["filejson2"] = "rbxassetid://10723364361",
		["filekey"] = "rbxassetid://10723364605",
		["filekey2"] = "rbxassetid://10723364515",
		["filelinechart"] = "rbxassetid://10723364725",
		["filelock"] = "rbxassetid://10723364957",
		["filelock2"] = "rbxassetid://10723364861",
		["fileminus"] = "rbxassetid://10723365254",
		["fileminus2"] = "rbxassetid://10723365086",
		["fileoutput"] = "rbxassetid://10723365457",
		["filepiechart"] = "rbxassetid://10723365598",
		["fileplus"] = "rbxassetid://10723365877",
		["fileplus2"] = "rbxassetid://10723365766",
		["filequestion"] = "rbxassetid://10723365987",
		["filescan"] = "rbxassetid://10723366167",
		["filesearch"] = "rbxassetid://10723366550",
		["filesearch2"] = "rbxassetid://10723366340",
		["filesignature"] = "rbxassetid://10723366741",
		["filespreadsheet"] = "rbxassetid://10723366962",
		["filesymlink"] = "rbxassetid://10723367098",
		["fileterminal"] = "rbxassetid://10723367244",
		["filetext"] = "rbxassetid://10723367380",
		["filetype"] = "rbxassetid://10723367606",
		["filetype2"] = "rbxassetid://10723367509",
		["fileup"] = "rbxassetid://10723367734",
		["filevideo"] = "rbxassetid://10723373884",
		["filevideo2"] = "rbxassetid://10723367834",
		["filevolume"] = "rbxassetid://10723374172",
		["filevolume2"] = "rbxassetid://10723374030",
		["filewarning"] = "rbxassetid://10723374276",
		["filex"] = "rbxassetid://10723374544",
		["filex2"] = "rbxassetid://10723374378",
		["files"] = "rbxassetid://10723374759",
		["film"] = "rbxassetid://10723374981",
		["filter"] = "rbxassetid://10723375128",
		["fingerprint"] = "rbxassetid://10723375250",
		["flag"] = "rbxassetid://10723375890",
		["flagoff"] = "rbxassetid://10723375443",
		["flagtriangleleft"] = "rbxassetid://10723375608",
		["flagtriangleright"] = "rbxassetid://10723375727",
		["flame"] = "rbxassetid://10723376114",
		["flashlight"] = "rbxassetid://10723376471",
		["flashlightoff"] = "rbxassetid://10723376365",
		["flaskconical"] = "rbxassetid://10734883986",
		["flaskround"] = "rbxassetid://10723376614",
		["fliphorizontal"] = "rbxassetid://10723376884",
		["fliphorizontal2"] = "rbxassetid://10723376745",
		["flipvertical"] = "rbxassetid://10723377138",
		["flipvertical2"] = "rbxassetid://10723377026",
		["flower"] = "rbxassetid://10747830374",
		["flower2"] = "rbxassetid://10723377305",
		["focus"] = "rbxassetid://10723377537",
		["folder"] = "rbxassetid://10723387563",
		["folderarchive"] = "rbxassetid://10723384478",
		["foldercheck"] = "rbxassetid://10723384605",
		["folderclock"] = "rbxassetid://10723384731",
		["folderclosed"] = "rbxassetid://10723384893",
		["foldercog"] = "rbxassetid://10723385213",
		["foldercog2"] = "rbxassetid://10723385036",
		["folderdown"] = "rbxassetid://10723385338",
		["folderedit"] = "rbxassetid://10723385445",
		["folderheart"] = "rbxassetid://10723385545",
		["folderinput"] = "rbxassetid://10723385721",
		["folderkey"] = "rbxassetid://10723385848",
		["folderlock"] = "rbxassetid://10723386005",
		["folderminus"] = "rbxassetid://10723386127",
		["folderopen"] = "rbxassetid://10723386277",
		["folderoutput"] = "rbxassetid://10723386386",
		["folderplus"] = "rbxassetid://10723386531",
		["foldersearch"] = "rbxassetid://10723386787",
		["foldersearch2"] = "rbxassetid://10723386674",
		["foldersymlink"] = "rbxassetid://10723386930",
		["foldertree"] = "rbxassetid://10723387085",
		["folderup"] = "rbxassetid://10723387265",
		["folderx"] = "rbxassetid://10723387448",
		["folders"] = "rbxassetid://10723387721",
		["forminput"] = "rbxassetid://10723387841",
		["forward"] = "rbxassetid://10723388016",
		["frame"] = "rbxassetid://10723394389",
		["framer"] = "rbxassetid://10723394565",
		["frown"] = "rbxassetid://10723394681",
		["fuel"] = "rbxassetid://10723394846",
		["functionsquare"] = "rbxassetid://10723395041",
		["gamepad"] = "rbxassetid://10723395457",
		["gamepad2"] = "rbxassetid://10723395215",
		["gauge"] = "rbxassetid://10723395708",
		["gavel"] = "rbxassetid://10723395896",
		["gem"] = "rbxassetid://10723396000",
		["ghost"] = "rbxassetid://10723396107",
		["gift"] = "rbxassetid://10723396402",
		["giftcard"] = "rbxassetid://10723396225",
		["gitbranch"] = "rbxassetid://10723396676",
		["gitbranchplus"] = "rbxassetid://10723396542",
		["gitcommit"] = "rbxassetid://10723396812",
		["gitcompare"] = "rbxassetid://10723396954",
		["gitfork"] = "rbxassetid://10723397049",
		["gitmerge"] = "rbxassetid://10723397165",
		["gitpullrequest"] = "rbxassetid://10723397431",
		["gitpullrequestclosed"] = "rbxassetid://10723397268",
		["gitpullrequestdraft"] = "rbxassetid://10734884302",
		["glass"] = "rbxassetid://10723397788",
		["glass2"] = "rbxassetid://10723397529",
		["glasswater"] = "rbxassetid://10723397678",
		["glasses"] = "rbxassetid://10723397895",
		["globe"] = "rbxassetid://10723404337",
		["globe2"] = "rbxassetid://10723398002",
		["grab"] = "rbxassetid://10723404472",
		["graduationcap"] = "rbxassetid://10723404691",
		["grape"] = "rbxassetid://10723404822",
		["grid"] = "rbxassetid://10723404936",
		["griphorizontal"] = "rbxassetid://10723405089",
		["gripvertical"] = "rbxassetid://10723405236",
		["hammer"] = "rbxassetid://10723405360",
		["hand"] = "rbxassetid://10723405649",
		["handmetal"] = "rbxassetid://10723405508",
		["harddrive"] = "rbxassetid://10723405749",
		["hardhat"] = "rbxassetid://10723405859",
		["hash"] = "rbxassetid://10723405975",
		["haze"] = "rbxassetid://10723406078",
		["headphones"] = "rbxassetid://10723406165",
		["heart"] = "rbxassetid://10723406885",
		["heartcrack"] = "rbxassetid://10723406299",
		["hearthandshake"] = "rbxassetid://10723406480",
		["heartoff"] = "rbxassetid://10723406662",
		["heartpulse"] = "rbxassetid://10723406795",
		["helpcircle"] = "rbxassetid://10723406988",
		["hexagon"] = "rbxassetid://10723407092",
		["highlighter"] = "rbxassetid://10723407192",
		["history"] = "rbxassetid://10723407335",
		["home"] = "rbxassetid://10723407389",
		["hourglass"] = "rbxassetid://10723407498",
		["icecream"] = "rbxassetid://10723414308",
		["image"] = "rbxassetid://10723415040",
		["imageminus"] = "rbxassetid://10723414487",
		["imageoff"] = "rbxassetid://10723414677",
		["imageplus"] = "rbxassetid://10723414827",
		["import"] = "rbxassetid://10723415205",
		["inbox"] = "rbxassetid://10723415335",
		["indent"] = "rbxassetid://10723415494",
		["indianrupee"] = "rbxassetid://10723415642",
		["infinity"] = "rbxassetid://10723415766",
		["info"] = "rbxassetid://10723415903",
		["inspect"] = "rbxassetid://10723416057",
		["italic"] = "rbxassetid://10723416195",
		["japaneseyen"] = "rbxassetid://10723416363",
		["joystick"] = "rbxassetid://10723416527",
		["key"] = "rbxassetid://10723416652",
		["keyboard"] = "rbxassetid://10723416765",
		["lamp"] = "rbxassetid://10723417513",
		["lampceiling"] = "rbxassetid://10723416922",
		["lampdesk"] = "rbxassetid://10723417016",
		["lampfloor"] = "rbxassetid://10723417131",
		["lampwalldown"] = "rbxassetid://10723417240",
		["lampwallup"] = "rbxassetid://10723417356",
		["landmark"] = "rbxassetid://10723417608",
		["languages"] = "rbxassetid://10723417703",
		["laptop"] = "rbxassetid://10723423881",
		["laptop2"] = "rbxassetid://10723417797",
		["lasso"] = "rbxassetid://10723424235",
		["lassoselect"] = "rbxassetid://10723424058",
		["laugh"] = "rbxassetid://10723424372",
		["layers"] = "rbxassetid://10723424505",
		["layout"] = "rbxassetid://10723425376",
		["layoutdashboard"] = "rbxassetid://10723424646",
		["layoutgrid"] = "rbxassetid://10723424838",
		["layoutlist"] = "rbxassetid://10723424963",
		["layouttemplate"] = "rbxassetid://10723425187",
		["leaf"] = "rbxassetid://10723425539",
		["library"] = "rbxassetid://10723425615",
		["lifebuoy"] = "rbxassetid://10723425685",
		["lightbulb"] = "rbxassetid://10723425852",
		["lightbulboff"] = "rbxassetid://10723425762",
		["linechart"] = "rbxassetid://10723426393",
		["link"] = "rbxassetid://10723426722",
		["link2"] = "rbxassetid://10723426595",
		["link2off"] = "rbxassetid://10723426513",
		["list"] = "rbxassetid://10723433811",
		["listchecks"] = "rbxassetid://10734884548",
		["listend"] = "rbxassetid://10723426886",
		["listminus"] = "rbxassetid://10723426986",
		["listmusic"] = "rbxassetid://10723427081",
		["listordered"] = "rbxassetid://10723427199",
		["listplus"] = "rbxassetid://10723427334",
		["liststart"] = "rbxassetid://10723427494",
		["listvideo"] = "rbxassetid://10723427619",
		["listx"] = "rbxassetid://10723433655",
		["loader"] = "rbxassetid://10723434070",
		["loader2"] = "rbxassetid://10723433935",
		["locate"] = "rbxassetid://10723434557",
		["locatefixed"] = "rbxassetid://10723434236",
		["locateoff"] = "rbxassetid://10723434379",
		["lock"] = "rbxassetid://10723434711",
		["login"] = "rbxassetid://10723434830",
		["logout"] = "rbxassetid://10723434906",
		["luggage"] = "rbxassetid://10723434993",
		["magnet"] = "rbxassetid://10723435069",
		["mail"] = "rbxassetid://10734885430",
		["mailcheck"] = "rbxassetid://10723435182",
		["mailminus"] = "rbxassetid://10723435261",
		["mailopen"] = "rbxassetid://10723435342",
		["mailplus"] = "rbxassetid://10723435443",
		["mailquestion"] = "rbxassetid://10723435515",
		["mailsearch"] = "rbxassetid://10734884739",
		["mailwarning"] = "rbxassetid://10734885015",
		["mailx"] = "rbxassetid://10734885247",
		["mails"] = "rbxassetid://10734885614",
		["map"] = "rbxassetid://10734886202",
		["mappin"] = "rbxassetid://10734886004",
		["mappinoff"] = "rbxassetid://10734885803",
		["maximize"] = "rbxassetid://10734886735",
		["maximize2"] = "rbxassetid://10734886496",
		["medal"] = "rbxassetid://10734887072",
		["megaphone"] = "rbxassetid://10734887454",
		["megaphoneoff"] = "rbxassetid://10734887311",
		["meh"] = "rbxassetid://10734887603",
		["menu"] = "rbxassetid://10734887784",
		["messagecircle"] = "rbxassetid://10734888000",
		["messagesquare"] = "rbxassetid://10734888228",
		["mic"] = "rbxassetid://10734888864",
		["mic2"] = "rbxassetid://10734888430",
		["micoff"] = "rbxassetid://10734888646",
		["microscope"] = "rbxassetid://10734889106",
		["microwave"] = "rbxassetid://10734895076",
		["milestone"] = "rbxassetid://10734895310",
		["minimize"] = "rbxassetid://10734895698",
		["minimize2"] = "rbxassetid://10734895530",
		["minus"] = "rbxassetid://10734896206",
		["minuscircle"] = "rbxassetid://10734895856",
		["minussquare"] = "rbxassetid://10734896029",
		["monitor"] = "rbxassetid://10734896881",
		["monitoroff"] = "rbxassetid://10734896360",
		["monitorspeaker"] = "rbxassetid://10734896512",
		["moon"] = "rbxassetid://10734897102",
		["morehorizontal"] = "rbxassetid://10734897250",
		["morevertical"] = "rbxassetid://10734897387",
		["mountain"] = "rbxassetid://10734897956",
		["mountainsnow"] = "rbxassetid://10734897665",
		["mouse"] = "rbxassetid://10734898592",
		["mousepointer"] = "rbxassetid://10734898476",
		["mousepointer2"] = "rbxassetid://10734898194",
		["mousepointerclick"] = "rbxassetid://10734898355",
		["move"] = "rbxassetid://10734900011",
		["move3d"] = "rbxassetid://10734898756",
		["movediagonal"] = "rbxassetid://10734899164",
		["movediagonal2"] = "rbxassetid://10734898934",
		["movehorizontal"] = "rbxassetid://10734899414",
		["movevertical"] = "rbxassetid://10734899821",
		["music"] = "rbxassetid://10734905958",
		["music2"] = "rbxassetid://10734900215",
		["music3"] = "rbxassetid://10734905665",
		["music4"] = "rbxassetid://10734905823",
		["navigation"] = "rbxassetid://10734906744",
		["navigation2"] = "rbxassetid://10734906332",
		["navigation2off"] = "rbxassetid://10734906144",
		["navigationoff"] = "rbxassetid://10734906580",
		["network"] = "rbxassetid://10734906975",
		["newspaper"] = "rbxassetid://10734907168",
		["octagon"] = "rbxassetid://10734907361",
		["option"] = "rbxassetid://10734907649",
		["outdent"] = "rbxassetid://10734907933",
		["package"] = "rbxassetid://10734909540",
		["package2"] = "rbxassetid://10734908151",
		["packagecheck"] = "rbxassetid://10734908384",
		["packageminus"] = "rbxassetid://10734908626",
		["packageopen"] = "rbxassetid://10734908793",
		["packageplus"] = "rbxassetid://10734909016",
		["packagesearch"] = "rbxassetid://10734909196",
		["packagex"] = "rbxassetid://10734909375",
		["paintbucket"] = "rbxassetid://10734909847",
		["paintbrush"] = "rbxassetid://10734910187",
		["paintbrush2"] = "rbxassetid://10734910030",
		["palette"] = "rbxassetid://10734910430",
		["palmtree"] = "rbxassetid://10734910680",
		["paperclip"] = "rbxassetid://10734910927",
		["partypopper"] = "rbxassetid://10734918735",
		["pause"] = "rbxassetid://10734919336",
		["pausecircle"] = "rbxassetid://10735024209",
		["pauseoctagon"] = "rbxassetid://10734919143",
		["pentool"] = "rbxassetid://10734919503",
		["pencil"] = "rbxassetid://10734919691",
		["percent"] = "rbxassetid://10734919919",
		["personstanding"] = "rbxassetid://10734920149",
		["phone"] = "rbxassetid://10734921524",
		["phonecall"] = "rbxassetid://10734920305",
		["phoneforwarded"] = "rbxassetid://10734920508",
		["phoneincoming"] = "rbxassetid://10734920694",
		["phonemissed"] = "rbxassetid://10734920845",
		["phoneoff"] = "rbxassetid://10734921077",
		["phoneoutgoing"] = "rbxassetid://10734921288",
		["piechart"] = "rbxassetid://10734921727",
		["piggybank"] = "rbxassetid://10734921935",
		["pin"] = "rbxassetid://10734922324",
		["pinoff"] = "rbxassetid://10734922180",
		["pipette"] = "rbxassetid://10734922497",
		["pizza"] = "rbxassetid://10734922774",
		["plane"] = "rbxassetid://10734922971",
		["play"] = "rbxassetid://10734923549",
		["playcircle"] = "rbxassetid://10734923214",
		["plus"] = "rbxassetid://10734924532",
		["pluscircle"] = "rbxassetid://10734923868",
		["plussquare"] = "rbxassetid://10734924219",
		["podcast"] = "rbxassetid://10734929553",
		["pointer"] = "rbxassetid://10734929723",
		["poundsterling"] = "rbxassetid://10734929981",
		["power"] = "rbxassetid://10734930466",
		["poweroff"] = "rbxassetid://10734930257",
		["printer"] = "rbxassetid://10734930632",
		["puzzle"] = "rbxassetid://10734930886",
		["quote"] = "rbxassetid://10734931234",
		["radio"] = "rbxassetid://10734931596",
		["radioreceiver"] = "rbxassetid://10734931402",
		["rectanglehorizontal"] = "rbxassetid://10734931777",
		["rectanglevertical"] = "rbxassetid://10734932081",
		["recycle"] = "rbxassetid://10734932295",
		["redo"] = "rbxassetid://10734932822",
		["redo2"] = "rbxassetid://10734932586",
		["refreshccw"] = "rbxassetid://10734933056",
		["refreshcw"] = "rbxassetid://10734933222",
		["refrigerator"] = "rbxassetid://10734933465",
		["regex"] = "rbxassetid://10734933655",
		["repeat"] = "rbxassetid://10734933966",
		["repeat1"] = "rbxassetid://10734933826",
		["reply"] = "rbxassetid://10734934252",
		["replyall"] = "rbxassetid://10734934132",
		["rewind"] = "rbxassetid://10734934347",
		["rocket"] = "rbxassetid://10734934585",
		["rockingchair"] = "rbxassetid://10734939942",
		["rotate3d"] = "rbxassetid://10734940107",
		["rotateccw"] = "rbxassetid://10734940376",
		["rotatecw"] = "rbxassetid://10734940654",
		["rss"] = "rbxassetid://10734940825",
		["ruler"] = "rbxassetid://10734941018",
		["russianruble"] = "rbxassetid://10734941199",
		["sailboat"] = "rbxassetid://10734941354",
		["save"] = "rbxassetid://10734941499",
		["scale"] = "rbxassetid://10734941912",
		["scale3d"] = "rbxassetid://10734941739",
		["scaling"] = "rbxassetid://10734942072",
		["scan"] = "rbxassetid://10734942565",
		["scanface"] = "rbxassetid://10734942198",
		["scanline"] = "rbxassetid://10734942351",
		["scissors"] = "rbxassetid://10734942778",
		["screenshare"] = "rbxassetid://10734943193",
		["screenshareoff"] = "rbxassetid://10734942967",
		["scroll"] = "rbxassetid://10734943448",
		["search"] = "rbxassetid://10734943674",
		["send"] = "rbxassetid://10734943902",
		["separatorhorizontal"] = "rbxassetid://10734944115",
		["separatorvertical"] = "rbxassetid://10734944326",
		["server"] = "rbxassetid://10734949856",
		["servercog"] = "rbxassetid://10734944444",
		["servercrash"] = "rbxassetid://10734944554",
		["serveroff"] = "rbxassetid://10734944668",
		["settings"] = "rbxassetid://10734950309",
		["settings2"] = "rbxassetid://10734950020",
		["share"] = "rbxassetid://10734950813",
		["share2"] = "rbxassetid://10734950553",
		["sheet"] = "rbxassetid://10734951038",
		["shield"] = "rbxassetid://10734951847",
		["shieldalert"] = "rbxassetid://10734951173",
		["shieldcheck"] = "rbxassetid://10734951367",
		["shieldclose"] = "rbxassetid://10734951535",
		["shieldoff"] = "rbxassetid://10734951684",
		["shirt"] = "rbxassetid://10734952036",
		["shoppingbag"] = "rbxassetid://10734952273",
		["shoppingcart"] = "rbxassetid://10734952479",
		["shovel"] = "rbxassetid://10734952773",
		["showerhead"] = "rbxassetid://10734952942",
		["shrink"] = "rbxassetid://10734953073",
		["shrub"] = "rbxassetid://10734953241",
		["shuffle"] = "rbxassetid://10734953451",
		["sidebar"] = "rbxassetid://10734954301",
		["sidebarclose"] = "rbxassetid://10734953715",
		["sidebaropen"] = "rbxassetid://10734954000",
		["sigma"] = "rbxassetid://10734954538",
		["signal"] = "rbxassetid://10734961133",
		["signalhigh"] = "rbxassetid://10734954807",
		["signallow"] = "rbxassetid://10734955080",
		["signalmedium"] = "rbxassetid://10734955336",
		["signalzero"] = "rbxassetid://10734960878",
		["siren"] = "rbxassetid://10734961284",
		["skipback"] = "rbxassetid://10734961526",
		["skipforward"] = "rbxassetid://10734961809",
		["skull"] = "rbxassetid://10734962068",
		["slack"] = "rbxassetid://10734962339",
		["slash"] = "rbxassetid://10734962600",
		["slice"] = "rbxassetid://10734963024",
		["sliders"] = "rbxassetid://10734963400",
		["slidershorizontal"] = "rbxassetid://10734963191",
		["smartphone"] = "rbxassetid://10734963940",
		["smartphonecharging"] = "rbxassetid://10734963671",
		["smile"] = "rbxassetid://10734964441",
		["smileplus"] = "rbxassetid://10734964188",
		["snowflake"] = "rbxassetid://10734964600",
		["sofa"] = "rbxassetid://10734964852",
		["sortasc"] = "rbxassetid://10734965115",
		["sortdesc"] = "rbxassetid://10734965287",
		["speaker"] = "rbxassetid://10734965419",
		["sprout"] = "rbxassetid://10734965572",
		["square"] = "rbxassetid://10734965702",
		["star"] = "rbxassetid://10734966248",
		["starhalf"] = "rbxassetid://10734965897",
		["staroff"] = "rbxassetid://10734966097",
		["stethoscope"] = "rbxassetid://10734966384",
		["sticker"] = "rbxassetid://10734972234",
		["stickynote"] = "rbxassetid://10734972463",
		["stopcircle"] = "rbxassetid://10734972621",
		["stretchhorizontal"] = "rbxassetid://10734972862",
		["stretchvertical"] = "rbxassetid://10734973130",
		["strikethrough"] = "rbxassetid://10734973290",
		["subscript"] = "rbxassetid://10734973457",
		["sun"] = "rbxassetid://10734974297",
		["sundim"] = "rbxassetid://10734973645",
		["sunmedium"] = "rbxassetid://10734973778",
		["sunmoon"] = "rbxassetid://10734973999",
		["sunsnow"] = "rbxassetid://10734974130",
		["sunrise"] = "rbxassetid://10734974522",
		["sunset"] = "rbxassetid://10734974689",
		["superscript"] = "rbxassetid://10734974850",
		["swissfranc"] = "rbxassetid://10734975024",
		["switchcamera"] = "rbxassetid://10734975214",
		["sword"] = "rbxassetid://10734975486",
		["swords"] = "rbxassetid://10734975692",
		["syringe"] = "rbxassetid://10734975932",
		["table"] = "rbxassetid://10734976230",
		["table2"] = "rbxassetid://10734976097",
		["tablet"] = "rbxassetid://10734976394",
		["tag"] = "rbxassetid://10734976528",
		["tags"] = "rbxassetid://10734976739",
		["target"] = "rbxassetid://10734977012",
		["tent"] = "rbxassetid://10734981750",
		["terminal"] = "rbxassetid://10734982144",
		["terminalsquare"] = "rbxassetid://10734981995",
		["textcursor"] = "rbxassetid://10734982395",
		["textcursorinput"] = "rbxassetid://10734982297",
		["thermometer"] = "rbxassetid://10734983134",
		["thermometersnowflake"] = "rbxassetid://10734982571",
		["thermometersun"] = "rbxassetid://10734982771",
		["thumbsdown"] = "rbxassetid://10734983359",
		["thumbsup"] = "rbxassetid://10734983629",
		["ticket"] = "rbxassetid://10734983868",
		["timer"] = "rbxassetid://10734984606",
		["timeroff"] = "rbxassetid://10734984138",
		["timerreset"] = "rbxassetid://10734984355",
		["toggleleft"] = "rbxassetid://10734984834",
		["toggleright"] = "rbxassetid://10734985040",
		["tornado"] = "rbxassetid://10734985247",
		["toybrick"] = "rbxassetid://10747361919",
		["train"] = "rbxassetid://10747362105",
		["trash"] = "rbxassetid://10747362393",
		["trash2"] = "rbxassetid://10747362241",
		["treedeciduous"] = "rbxassetid://10747362534",
		["treepine"] = "rbxassetid://10747362748",
		["trees"] = "rbxassetid://10747363016",
		["trendingdown"] = "rbxassetid://10747363205",
		["trendingup"] = "rbxassetid://10747363465",
		["triangle"] = "rbxassetid://10747363621",
		["trophy"] = "rbxassetid://10747363809",
		["truck"] = "rbxassetid://10747364031",
		["tv"] = "rbxassetid://10747364593",
		["tv2"] = "rbxassetid://10747364302",
		["type"] = "rbxassetid://10747364761",
		["umbrella"] = "rbxassetid://10747364971",
		["underline"] = "rbxassetid://10747365191",
		["undo"] = "rbxassetid://10747365484",
		["undo2"] = "rbxassetid://10747365359",
		["unlink"] = "rbxassetid://10747365771",
		["unlink2"] = "rbxassetid://10747397871",
		["unlock"] = "rbxassetid://10747366027",
		["upload"] = "rbxassetid://10747366434",
		["uploadcloud"] = "rbxassetid://10747366266",
		["usb"] = "rbxassetid://10747366606",
		["user"] = "rbxassetid://10747373176",
		["usercheck"] = "rbxassetid://10747371901",
		["usercog"] = "rbxassetid://10747372167",
		["userminus"] = "rbxassetid://10747372346",
		["userplus"] = "rbxassetid://10747372702",
		["userx"] = "rbxassetid://10747372992",
		["users"] = "rbxassetid://10747373426",
		["utensils"] = "rbxassetid://10747373821",
		["utensilscrossed"] = "rbxassetid://10747373629",
		["venetianmask"] = "rbxassetid://10747374003",
		["verified"] = "rbxassetid://10747374131",
		["vibrate"] = "rbxassetid://10747374489",
		["vibrateoff"] = "rbxassetid://10747374269",
		["video"] = "rbxassetid://10747374938",
		["videooff"] = "rbxassetid://10747374721",
		["view"] = "rbxassetid://10747375132",
		["voicemail"] = "rbxassetid://10747375281",
		["volume"] = "rbxassetid://10747376008",
		["volume1"] = "rbxassetid://10747375450",
		["volume2"] = "rbxassetid://10747375679",
		["volumex"] = "rbxassetid://10747375880",
		["wallet"] = "rbxassetid://10747376205",
		["wand"] = "rbxassetid://10747376565",
		["wand2"] = "rbxassetid://10747376349",
		["watch"] = "rbxassetid://10747376722",
		["waves"] = "rbxassetid://10747376931",
		["webcam"] = "rbxassetid://10747381992",
		["wifi"] = "rbxassetid://10747382504",
		["wifioff"] = "rbxassetid://10747382268",
		["wind"] = "rbxassetid://10747382750",
		["wraptext"] = "rbxassetid://10747383065",
		["wrench"] = "rbxassetid://10747383470",
		["x"] = "rbxassetid://10747384394",
		["xcircle"] = "rbxassetid://10747383819",
		["xoctagon"] = "rbxassetid://10747384037",
		["xsquare"] = "rbxassetid://10747384217",
		["zoomin"] = "rbxassetid://10747384552",
		["zoomout"] = "rbxassetid://10747384679"
	},
	SaveSettings = {Theme = "Silver Slate", Font = "RobotoCondensed", Animation = true, Transparency = 0.6},
	Themes = {
	    Names = {
	        "Biscuit Cream",
	        "Forest Mint",
	        "Amethyst",
	        "Silver Slate"
	    },
	    ["Biscuit Cream"] = {
			Name = "Biscuit Cream",
	        Text = Color3.fromRGB(249, 204, 183),
	        Main = Color3.fromRGB(249, 204, 183),
	        Background = Color3.fromRGB(10, 10, 10),
	        Background2 = Color3.fromRGB(40, 40, 40),
	    },
	    ["Forest Mint"] = {
			Name = "Forest Mint",
	        Text = Color3.fromRGB(180, 255, 200),
	        Main = Color3.fromRGB(80, 220, 150),
	        Background = Color3.fromRGB(10, 15, 12),
	        Background2 = Color3.fromRGB(30, 40, 35),
	    },
	    ["Amethyst"] = {
			Name = "Amethyst",
	        Text = Color3.fromRGB(210, 160, 255),
	        Main = Color3.fromRGB(150, 80, 255),
	        Background = Color3.fromRGB(10, 8, 15),
	        Background2 = Color3.fromRGB(35, 25, 50),
	    },
	    ["Silver Slate"] = {
			Name = "Silver Slate",
	        Text = Color3.fromRGB(220, 220, 220),
	        Main = Color3.fromRGB(200, 200, 200),
	        Background = Color3.fromRGB(15, 15, 15),
	        Background2 = Color3.fromRGB(45, 45, 45),
	    },
	},
	Objects = {},
	Properties = {
		ScreenGui = {
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			ZIndexBehavior = "Sibling",
			DisplayOrder = 1,
		},
		UICorner = {
			CornerRadius = UDim.new(0, 4),
		},
	},
}
local Fonts = {}
for _, Font in Enum.Font:GetEnumItems() do
	table.insert(Fonts, Font.Name)
end
table.sort(Fonts)
Astral.Fonts = Fonts

function New(Class, Properties, TypeData)
    local Obj = Instance.new(Class)
    local DefaultProps = Astral.Properties[Class]
    if DefaultProps then
        for k, v in pairs(DefaultProps) do
            Obj[k] = v
        end
    end
    for k, v in pairs(Properties) do
        Obj[k] = v
    end
    if typeof(TypeData) == "table" then
        Astral.Objects[Obj] = TypeData
    end
    return Obj
end

function Astral:SetTheme(ThemeName)
    local SelectedTheme = self.Themes[ThemeName]
    if not SelectedTheme then return end
    self.SaveSettings.Theme = ThemeName
    Theme = SelectedTheme
    for Obj, TypeData in pairs(self.Objects) do
        if Obj and Obj.Parent then
            pcall(function()
                for Property, ColorKey in pairs(TypeData) do
                    local TargetColor = SelectedTheme[ColorKey]
                    if TargetColor then
                        Obj[Property] = TargetColor
                    end
                end  
                if Obj:IsA("TextLabel") or Obj:IsA("TextBox") or Obj:IsA("TextButton") then
                    Obj.Font = self.SaveSettings.Font
                end
                if Obj:IsA("ScrollingFrame") then
                    Obj.ScrollBarImageColor3 = SelectedTheme.Main
                end
            end)
        else
            self.Objects[Obj] = nil
        end
    end
    Astral:Save()
end

function Astral:Save()
	local Data = HttpService:JSONEncode(self.SaveSettings)
	writefile(self.File, Data)
end

function Astral:AddTheme(Data)
	assert(typeof(Data) == "table", "Invalid argument #1 (expected table)")
	assert(Data.Name, "Theme.Name is required")
	assert(Data.Text, "Theme.Text is required")
	assert(Data.Main, "Theme.Main is required")
	assert(Data.Background, "Theme.Background is required")
	assert(Data.Background2, "Theme.Background is required")
	self.Themes[Data.Name] = {
		Text = Data.Text,
		Main = Data.Main,
		Background = Data.Background,
	}
	table.insert(self.Themes.Names, Data.Name)
end

function Astral:GetTheme()
	if isfile(self.File) then
		local Data = HttpService:JSONDecode(readfile(self.File))
		if Data and Data.Theme and self.Themes[Data.Theme] then
			return self.Themes[Data.Theme]
		end
	end
	return self.Themes[self.SaveSettings.Theme]
end

function Astral:Draggable(Frame)
	local StartPosition, DragStart, DragInput, Dragging
	function Update(input)
		local Delta = input.Position - DragStart
		local NewX = StartPosition.X.Offset + Delta.X
		local NewY = StartPosition.Y.Offset + Delta.Y
		NewX = math.clamp(NewX, 0, workspace.CurrentCamera.ViewportSize.X - Frame.AbsoluteSize.X)
		NewY = math.clamp(NewY, 0, workspace.CurrentCamera.ViewportSize.Y - Frame.AbsoluteSize.Y)
		Frame.Position = UDim2.new(StartPosition.X.Scale, NewX, StartPosition.Y.Scale, NewY)
	end
	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = input.Position
			StartPosition = Frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					Dragging = false
					DragInput = nil
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then
			DragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == DragInput and Dragging then
			Update(input)
		end
	end)
	return Frame
end

function Astral:GetIcon(Value)
	if typeof(Value) == "string" then
		if Value:match("^rbxassetid://%d+$") then
			return Value
		end
		if self.Icons[Value] then
			return self.Icons[Value]
		end
		if Value:find("^https?://") then
			local Root = "Astral Library"
			local Folder = Root .. "/Assets"
			if not isfolder(Root) then
				makefolder(Root)
			end
			if not isfolder(Folder) then
				makefolder(Folder)
			end
			local SafeName = Value:gsub("https?://", ""):gsub("[^%w%-_%.]", "_")
			local FileName = Folder .. "/" .. SafeName .. ".png"
			if not isfile(FileName) then
				local Bytes = game:HttpGet(Value)
				writefile(FileName, Bytes)
			end
			local Icon = getcustomasset(FileName)
			delfile(FileName)
			if Icon then
				return Icon
			end
		end
	end
end

local Theme = Astral:GetTheme()

local Gui = New("ScreenGui", {Parent = LocalPlayer.PlayerGui, Name = Astral.Name})
local GuiFind = Gui.Parent:FindFirstChild(Gui.Name)
if GuiFind ~= Gui then
	GuiFind:Destroy()
end

function Astral:Intro(Configs)
	if not Astral.SaveSettings.Animation then return end
	local TitleText = Configs.Title or Configs.Name or "Astral Library"
	local DescText = Configs.Description or Astral.Version
	local LoadingConfigs = Configs.Config or {{20, math.random(0, 4)}, {50, math.random(0, 4)}, {80, math.random(0, 4)}, {100, math.random(0, 4)}}
	local Info = TweenInfo.new(0.5)
	
	local IntroFrame = New("Frame", {Parent = Gui, Name = "Intro", Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Theme.Background, ZIndex = 100}, {BackgroundColor3 = "Background"})
	local BackgroundImg = New("ImageLabel", {Parent = IntroFrame, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = ""})
	local TitleLabel = New("TextLabel", {Parent = IntroFrame, Position = UDim2.new(0.5, -200, 0.4, 0), Size = UDim2.new(0, 400, 0, 30), BackgroundTransparency = 1, Text = "", TextColor3 = Theme.Text, Font = Astral.SaveSettings.Font, TextSize = 25, RichText = true}, {TextColor3 = "Text"})
	local DescLabel = New("TextLabel", {Parent = IntroFrame, Position = UDim2.new(0.5, -200, 0.4, 35), Size = UDim2.new(0, 400, 0, 20), BackgroundTransparency = 1, Text = "", TextColor3 = Theme.Text, Font = Astral.SaveSettings.Font, TextSize = 14, TextTransparency = 0.4}, {TextColor3 = "Text"})
	local BarContainer = New("Frame", {Parent = IntroFrame, Position = UDim2.new(0.5, -100, 0.8, 0), Size = UDim2.new(0, 200, 0, 4), BackgroundColor3 = Theme.Background2}, {"BackgroundColor3", "Background2"})
	New("UICorner", {Parent = BarContainer})	
	local Bar = New("Frame", {Parent = BarContainer, Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Theme.Main}, {BackgroundColor3 = "Main"})
	New("UICorner", {Parent = Bar})
	local PercentText = New("TextLabel", {Parent = IntroFrame, Position = UDim2.new(0.5, -50, 0.8, -25), Size = UDim2.new(0, 100, 0, 20), BackgroundTransparency = 1, Text = "0%", TextColor3 = Theme.Text, Font = Astral.SaveSettings.Font, TextSize = 14}, {TextColor3 = "Text"})
	
	task.spawn(function()
		for i = 1, #TitleText do
			TitleLabel.Text = string.sub(TitleText, 1, i)
			task.wait(0.05)
		end
		for i = 1, #DescText do
			DescLabel.Text = string.sub(DescText, 1, i)
			task.wait(0.03)
		end
	end)
	local CurrentPercent = 0
	local DefaultStepTime = 5 / 100
	task.spawn(function()
		while CurrentPercent < 100 do
			CurrentPercent = CurrentPercent + 1
			local WaitTime = DefaultStepTime
			for _, cfg in pairs(LoadingConfigs or {}) do
				if CurrentPercent == cfg[1] then
					WaitTime = cfg[2]
					break
				end
			end
			TweenService:Create(Bar, TweenInfo.new(WaitTime, Enum.EasingStyle.Linear), {Size = UDim2.new(CurrentPercent/100, 0, 1, 0)}):Play()
			PercentText.Text = CurrentPercent .. "%"
			task.wait(WaitTime)
		end
		TweenService:Create(IntroFrame, Info, {BackgroundTransparency = 1}):Play()
		TweenService:Create(TitleLabel, Info, {TextTransparency = 1}):Play()
		TweenService:Create(DescLabel, Info, {TextTransparency = 1}):Play()
		TweenService:Create(PercentText, Info, {TextTransparency = 1}):Play()
		TweenService:Create(Bar, Info, {BackgroundTransparency = 1}):Play()
		TweenService:Create(BarContainer, Info, {BackgroundTransparency = 1}):Play()		
		task.wait(0.5)
		IntroFrame:Destroy()
	end)
end

function Astral:AddWindow(Configs)
	local WTitle = Configs.Title or Configs.Name or "Window"
	local WSubTitle = Configs.SubTitle or Configs.Description or ""
	
	local MainFrame = self:Draggable(New("ImageLabel", {Parent = Gui, Name = "Window", BackgroundColor3 = Theme.Background, BorderSizePixel = 0, Position = UDim2.new(0, 260, 0, 100), Size = UDim2.new(0, 450, 0, 300), ClipsDescendants = true}, {BackgroundColor3 = "Background"}))
	New("UICorner", {Parent = MainFrame})
	local TopFrame = New("Frame", {Parent = MainFrame, BorderSizePixel = 0, BackgroundTransparency = 1, Name = "Top", Size = UDim2.new(1, 0, 0.1, 0), ClipsDescendants = true})
	local WindowTitle = New("TextLabel", {Parent = TopFrame, Name = "Window Title", AutomaticSize = Enum.AutomaticSize.X, BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 5, 0, 5), Size = UDim2.new(0, 0, 0, 15), Font = Astral.SaveSettings.Font, RichText = true, Text = WTitle, TextColor3 = Theme.Text, TextScaled = false, TextSize = 10, TextXAlignment = "Left"}, {TextColor3 = "Text"})
	local WindowSubTitle = New("TextLabel", {Parent = TopFrame, Name = "Window SubTitle", AutomaticSize = Enum.AutomaticSize.X, BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, WindowTitle.TextBounds.X + 12, 0, 5), Size = UDim2.new(0, 0, 0, 13), Font = Astral.SaveSettings.Font, RichText = true, Text = WSubTitle, TextColor3 = Theme.Text, TextScaled = false, TextSize = 8, TextXAlignment = "Left", TextYAlignment = "Bottom"}, {TextColor3 = "Text"})
	local SearchBox = New("TextBox", {Parent = TopFrame, Name = "Search", Position = UDim2.new(1, -275, 0, 5), Size = UDim2.new(0, 120, 0, 20), BackgroundTransparency = 1, Text = "", PlaceholderText = "Search...", PlaceholderColor3 = Theme.Text, BorderSizePixel = 0, TextSize = 10, Font = Astral.SaveSettings.Font, TextColor3 = Theme.Text}, {TextColor3 = "Text"})
	local TabList = New("ScrollingFrame", {Parent = MainFrame, Name = "TabList", BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 5, 0, (TopFrame.AbsoluteSize.Y+5)), Size = UDim2.new(0.2, 0, 1, -(TopFrame.AbsoluteSize.Y+5)), CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = "Y", ScrollingDirection = "Y", ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Main, ElasticBehavior = "Never"}, {"ScrollBarImageColor3", "Main"})
	New("UIListLayout", {Parent = TabList, Padding = UDim.new(0, 5)})
	local Container = New("Frame", {Parent = MainFrame, Name = "Container", BackgroundTransparency = 1, Position = UDim2.new(0.2, 10, 0, (TopFrame.AbsoluteSize.Y)), Size = UDim2.new(1, -(TabList.AbsoluteSize.X+15), 1, -40)})
	
	local Tabs = {}
	local Elements = {}

	SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	    local Input = SearchBox.Text:lower()
	    for _, Data in pairs(Elements) do
	        if Input == "" or Data.Title:lower():find(Input) then
	            Data.Instance.Visible = true
	        else
	            Data.Instance.Visible = false
	        end
	    end
	end)

	local Window = {}
	function Window:AddTab(Configs)
		local TTitle = Configs.Title or Configs.Name or "Tab"
		
		local TabBtn = New("Frame", {Parent = TabList, Size = UDim2.new(1, 0, 0, 25), BackgroundColor3 = Theme.Background2}, {BackgroundColor3 = "Background2"})
		New("UICorner", {Parent = TabBtn})
		local Click = New("TextButton", {Parent = TabBtn, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = ""})
		local SelectBar = New("Frame", {Parent = TabBtn, Name = "SelectBar", Size = UDim2.new(0, 3, 1, 0), BackgroundColor3 = Theme.Main, Visible = false}, {BackgroundColor3 = "Main"})
		if Configs.Icon then
		    New("ImageLabel", {Parent = TabBtn, Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new(0, 8, 0.5, -8), BackgroundTransparency = 1, Image = Astral:GetIcon(Configs.Icon), ImageColor3 = Theme.Text}, {ImageColor3 = "Text"})
		end
		local Label = New("TextLabel", {Parent = TabBtn, Size = UDim2.new(1, -30, 1, 0), Position = UDim2.new(0, 30, 0, 0), BackgroundTransparency = 1, Text = TTitle, TextColor3 = Theme.Text, Font = Astral.SaveSettings.Font, TextSize = 10, TextXAlignment = "Left"}, {TextColor3 = "Text"})
		local TabPage = New("ScrollingFrame", {Parent = Container, Name = TTitle, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, AutomaticCanvasSize = "Y", ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Main, BorderSizePixel = 0, ScrollingDirection = "Y", CanvasSize = UDim2.fromScale(0, 0)}, {ScrollBarImageColor3 = "Main"})
		New("UIListLayout", {Parent = TabPage, Padding = UDim.new(0, 5)})
		
		Click.MouseButton1Click:Connect(function()
		    for _, v in pairs(Container:GetChildren()) do
		        if v:IsA("ScrollingFrame") then v.Visible = false end
		    end
		    for _, b in pairs(TabList:GetChildren()) do
		        if b:IsA("Frame") and b:FindFirstChild("SelectBar") then b.SelectBar.Visible = false end
		    end
		    TabPage.Visible = true
		    SelectBar.Visible = true
		end)

		local Tab = {}
		function Tab:AddSection(Configs)
		    local STitle = typeof(Configs) == "string" and Configs or Configs.Title or Configs.Name or Configs[1] or "Section"
		    local SectionFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 25), BackgroundTransparency = 1, LayoutOrder = #Elements}, {BackgroundColor3 = "Background"})
		    local SectionLabel = New("TextLabel", {Parent = SectionFrame, Size = UDim2.new(1, -10, 1, 0), Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1, Text = STitle:upper(), TextColor3 = Theme.Main, Font = Astral.SaveSettings.Font, TextSize = 16.5, TextXAlignment = "Left"}, {TextColor3 = "Main"})
		    
		    local SectionFuncs = {}
		    function SectionFuncs:SetTitle(t) SectionLabel.Text = t:upper() end
		    function SectionFuncs:SetVisible(s) SectionFrame.Visible = s end
		    
		    table.insert(Elements, {Title = STitle, Instance = SectionFrame})
		    return SectionFuncs
		end
		
		function Tab:AddParagraph(Configs)
		    local PTitle = Configs.Title or Configs.Name or "Paragraph"
		    local PContent = Configs.Content or Configs.Description or ""
		    
		    local ParagraphFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements, AutomaticSize = Enum.AutomaticSize.Y}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = ParagraphFrame})
		    local TitleLabel = New("TextLabel", {Parent = ParagraphFrame, Name = "TitleLabel", Size = UDim2.new(1, -20, 0, 0), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = PTitle.."\n", TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, RichText = true, TextXAlignment = "Left", TextWrapped = true, AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = 1}, {TextColor3 = "Background"}) 
		    local ContentLabel = New("TextLabel", {Parent = ParagraphFrame, Name = "ContentLabel", Size = UDim2.new(1, -20, 0, 0), Position = UDim2.new(0, 10, 0, 24), BackgroundTransparency = 1, Text = PContent.."\n", TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, RichText = true, TextXAlignment = "Left", TextWrapped = true, AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = 2}, {TextColor3 = "Background"})
		    
		    local ParaFuncs = {}
		    function ParaFuncs:SetTitle(t) TitleLabel.Text = t  end
		    function ParaFuncs:SetContent(c) ContentLabel.Text = c end
		    function ParaFuncs:SetVisible(s) ParagraphFrame.Visible = s end
		    function ParaFuncs:Destroy() ParagraphFrame:Destroy() end
		
		    table.insert(Elements, {Title = PTitle, Instance = ParagraphFrame})
		    return ParaFuncs
		end
		
		function Tab:AddButton(Configs)
		    local BTitle = Configs.Title or Configs.Name or "Button"
		    local BDescription = Configs.Description or ""
		    local BCallback = Configs.Callback or function() end
		
		    local ButtonFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = ButtonFrame})
		    local TitleLabel = New("TextLabel", {Parent = ButtonFrame, Size = UDim2.new(0.6, -10, 0, 15), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = BTitle, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local DescLabel = New("TextLabel", {Parent = ButtonFrame, Position = UDim2.new(0, 10, 0, 24), Size = UDim2.new(0.6, -10, 0, 12), BackgroundTransparency = 1, Text = BDescription, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local Icon = New("ImageLabel", {Parent = ButtonFrame, Position = UDim2.new(1, -10, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), Size = UDim2.new(0, 25, 0, 25), BackgroundTransparency = 1, Rotation = -90, Image = "rbxassetid://6034818372", ImageColor3 = Theme.Background, ImageTransparency = 0}, {"ImageColor3", "Background"})
		
		    local ClickBtn = New("TextButton", {Parent = ButtonFrame, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", AutoButtonColor = true})
		    ClickBtn.MouseButton1Click:Connect(function()
		        TweenService:Create(ButtonFrame, TweenInfo.new(0.1), {BackgroundTransparency = 0.2}):Play()
		        task.wait(0.1)
		        TweenService:Create(ButtonFrame, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play()
		        BCallback()
		    end)
		
		    local ButtonFuncs = {}
		    function ButtonFuncs:SetTitle(t) TitleLabel.Text = t end
		    function ButtonFuncs:SetDesc(d) DescLabel.Text = d end
		    function ButtonFuncs:SetVisible(s) ButtonFrame.Visible = s end
		    function ButtonFuncs:Destroy() ButtonFrame:Destroy() end
		    function ButtonFuncs:Fire() BCallback() end
		
		    table.insert(Elements, {Title = BTitle, Instance = ButtonFrame})
		    return ButtonFuncs
		end
		
		function Tab:AddToggle(Configs)
		    local TTitle = Configs.Title or Configs.Name or "Toggle"
			local TDescription = Configs.Description or ""
			local TDefault = Configs.Default or false
			local TCallback = Configs.Callback or function() end
		    local Toggled = TDefault
		
			if Toggled then
				pcall(TCallback, Toggled)
			end
			
		    local ToggleFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = ToggleFrame})
		    local TitleLabel = New("TextLabel", {Parent = ToggleFrame, Size = UDim2.new(0.6, -10, 0, 15), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = TTitle, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local DescLabel = New("TextLabel", {Parent = ToggleFrame, Position = UDim2.new(0, 10, 0, 24), Size = UDim2.new(0.6, -10, 0, 12), BackgroundTransparency = 1, Text = TDescription, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local Switch = New("Frame", {Parent = ToggleFrame, Position = UDim2.new(1, -10, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), Size = UDim2.new(0, 35, 0, 20), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.8}, {BackgroundColor3 = "Background"})
		    New("UICorner", {Parent = Switch, CornerRadius = UDim.new(1, 0)})
		    local Ball = New("Frame", {Parent = Switch, Position = Toggled and UDim2.new(1, -17, 0.48, -7.5) or UDim2.new(0, 2, 0.48, -7.5), Size = UDim2.new(0, 15, 0, 15), BackgroundColor3 = Toggled and Theme.Main or Theme.Background, ZIndex = 2}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = Ball, CornerRadius = UDim.new(1, 0)})
		    local Btn = New("TextButton", {Parent = ToggleFrame, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = ""})
		
		    local function Update()
		        local TargetPos = Toggled and UDim2.new(1, -17, 0.48, -7.5) or UDim2.new(0, 2, 0.48, -7.5)
		        local TargetColor = Toggled and Theme.Main or Theme.Background
		        TweenService:Create(Ball, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position = TargetPos, BackgroundColor3 = TargetColor}):Play()
		        TCallback(Toggled)
		    end
		    Btn.MouseButton1Click:Connect(function() Toggled = not Toggled Update() end)
		
		    local ToggleFuncs = {}
		    function ToggleFuncs:SetTitle(t) TitleLabel.Text = t end
		    function ToggleFuncs:SetDesc(d) DescLabel.Text = d end
		    function ToggleFuncs:SetVisible(s) ToggleFrame.Visible = s end
		    function ToggleFuncs:Destroy() ToggleFrame:Destroy() end
		    function ToggleFuncs:SetValue(v) Toggled = v Update() end
		
		    table.insert(Elements, {Title = TTitle, Instance = ToggleFrame})
		    return ToggleFuncs
		end
		
		function Tab:AddTextbox(Configs)
		    local TTitle = Configs.Title or Configs.Name or "Textbox"
			local TDescription = Configs.Description or ""
			local TPlaceholder = Configs.Placeholder or "..."
		    local TClearText = Configs.ClearTextOnFocus or Configs.ClearText or false
			local TOnlyNumbers = Configs.OnlyNumbers or false
			local TOnlyLetters = Configs.OnlyLetters or false
			local TMaxLength = Configs.MaxLength or nil
		    local TCallback = Configs.Callback or function() end
		
		    local TextboxFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = TextboxFrame})
		    local TitleLabel = New("TextLabel", {Parent = TextboxFrame, Size = UDim2.new(0.6, -10, 0, 15), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = TTitle, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local DescLabel = New("TextLabel", {Parent = TextboxFrame, Position = UDim2.new(0, 10, 0, 24), Size = UDim2.new(0.6, -10, 0, 12), BackgroundTransparency = 1, Text = TDescription, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local Input = New("TextBox", {Parent = TextboxFrame, Size = UDim2.new(0, 120, 0, 30), Position = UDim2.new(1, -10, 0, 7), AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.8, Text = "", PlaceholderText = TPlaceholder, TextColor3 = Theme.Background, PlaceholderColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 11, ClearTextOnFocus = TClearText}, {TextColor3 = "Background"})
		    New("UICorner", {Parent = Input})
		
		    Input:GetPropertyChangedSignal("Text"):Connect(function()
		        local FinalText = Input.Text
		        if TOnlyNumbers then FinalText = FinalText:gsub("%D", "") elseif TOnlyLetters then FinalText = FinalText:gsub("[^%a%s]", "") end
		        if TMaxLength and #FinalText > TMaxLength then FinalText = FinalText:sub(1, TMaxLength) end
		        if Input.Text ~= FinalText then Input.Text = FinalText end
		    end)
		    Input.FocusLost:Connect(function(EnterPressed) TCallback(Input.Text, EnterPressed) end)
		
		    local TextboxFuncs = {}
		    function TextboxFuncs:SetTitle(t) TitleLabel.Text = t end
		    function TextboxFuncs:SetDesc(d) DescLabel.Text = d end
		    function TextboxFuncs:SetText(t) Input.Text = t end
		    function TextboxFuncs:SetVisible(s) TextboxFrame.Visible = s end
		    function TextboxFuncs:Destroy() TextboxFrame:Destroy() end
		
		    table.insert(Elements, {Title = TTitle, Instance = TextboxFrame})
		    return TextboxFuncs
		end
		
		function Tab:AddKeybind(Configs)
		    local KTitle = Configs.Title or Configs.Name or "Keybind"
			local KDescription = Configs.Description or ""
			local KDefault = Configs.Default or Enum.KeyCode.E
			local KCallback = Configs.Callback or function() end	
			local CurrentKey = KDefault.Name
			local Binding = false
		
		    local KeybindFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = KeybindFrame})
		    local TitleLabel = New("TextLabel", {Parent = KeybindFrame, Size = UDim2.new(0.6, -10, 0, 15), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = KTitle, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local DescLabel = New("TextLabel", {Parent = KeybindFrame, Position = UDim2.new(0, 10, 0, 24), Size = UDim2.new(0.6, -10, 0, 12), BackgroundTransparency = 1, Text = KDescription, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local KeyBtn = New("TextButton", {Parent = KeybindFrame, Size = UDim2.new(0, 80, 0, 30), Position = UDim2.new(1, -10, 0, 7), AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.8, Text = CurrentKey, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 11}, {TextColor3 = "Background"})
		    New("UICorner", {Parent = KeyBtn})
		
		    KeyBtn.MouseButton1Click:Connect(function()
		        Binding = true
		        KeyBtn.Text = "..."
		    end)
		    UserInputService.InputBegan:Connect(function(Input, Processed)
		        if Processed then return end
		        if Binding and Input.UserInputType == Enum.UserInputType.Keyboard then
		            CurrentKey = Input.KeyCode.Name
		            KeyBtn.Text = CurrentKey
		            Binding = false
		        elseif not Binding and Input.KeyCode.Name == CurrentKey then
		            KCallback(Input.KeyCode)
		        end
		    end)
		
		    local KeyFuncs = {}
		    function KeyFuncs:SetKey(key) CurrentKey = key.Name KeyBtn.Text = CurrentKey end
		    function KeyFuncs:SetVisible(s) KeybindFrame.Visible = s end
		    function KeyFuncs:Destroy() KeybindFrame:Destroy() end
		
		    table.insert(Elements, {Title = KTitle, Instance = KeybindFrame})
		    return KeyFuncs
		end
		
		function Tab:AddSlider(Configs)
		    local STitle = Configs.Title or Configs.Name or "Slider"
			local SDescription = Configs.Description or ""
			local SMin = Configs.Min or 0
			local SMax = Configs.Max or 100
			local SDefault = Configs.Default or Configs.Min or 0
			local SIncrease = Configs.Increase or Configs.Step or 1
			local SCallback = Configs.Callback or function() end	
			local Value = SDefault
			local Dragging = false
			
			if Value then
				pcall(SCallback, Value)
			end
			
		    local SliderFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = SliderFrame})
		    local TitleLabel = New("TextLabel", {Parent = SliderFrame, Size = UDim2.new(0.6, -10, 0, 15), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = STitle, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local DescLabel = New("TextLabel", {Parent = SliderFrame, Position = UDim2.new(0, 10, 0, 24), Size = UDim2.new(0.6, -10, 0, 12), BackgroundTransparency = 1, Text = SDescription, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local ValueInput = New("TextBox", {Parent = SliderFrame, Size = UDim2.new(0, 45, 0, 18), Position = UDim2.new(1, -10, 0, 7), AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.8, Text = tostring(Value), TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 11, ClearTextOnFocus = false}, {TextColor3 = "Background"})
		    New("UICorner", {Parent = ValueInput})
		    local BarContainer = New("Frame", {Parent = SliderFrame, Size = UDim2.new(0, 120, 0, 4), Position = UDim2.new(1, -10, 0, 32), AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.7}, {BackgroundColor3 = "Background"})
		    New("UICorner", {Parent = BarContainer})
		    local Fill = New("Frame", {Parent = BarContainer, Size = UDim2.new(math.clamp((Value - SMin) / (SMax - SMin), 0, 1), 0, 1, 0), BackgroundColor3 = Theme.Background}, {BackgroundColor3 = "Background"})
		    New("UICorner", {Parent = Fill})
		    local SliderDot = New("Frame", {Parent = Fill, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.new(0, 10, 0, 10), BackgroundColor3 = Theme.Background, ZIndex = 3}, {BackgroundColor3 = "Background"})
		    New("UICorner", {Parent = SliderDot, CornerRadius = UDim.new(1, 0)})
		    New("UIStroke", {Parent = SliderDot, Color = Theme.Main, Thickness = 1.5}, {Color = "Main"})
		
		    local function UpdateVisuals()
		        local percent = math.clamp((Value - SMin) / (SMax - SMin), 0, 1)
		        ValueInput.Text = tostring(Value)
		        TweenService:Create(Fill, TweenInfo.new(0.1, Enum.EasingStyle.Quart), {Size = UDim2.new(percent, 0, 1, 0)}):Play()
		    end	
		    local function SnapValue(raw)
		        local snapped = math.floor(raw / SIncrease + 0.5) * SIncrease
		        return math.clamp(snapped, SMin, SMax)
		    end
		    local function UpdateFromInput(Input)
		        local Pos = math.clamp((Input.Position.X - BarContainer.AbsolutePosition.X) / BarContainer.AbsoluteSize.X, 0, 1)
		        Value = SnapValue(Pos * (SMax - SMin) + SMin)
		        UpdateVisuals()
		        SCallback(Value)
		    end
		    SliderDot.InputBegan:Connect(function(Input)
		        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then Dragging = true end
		    end)
		    UserInputService.InputChanged:Connect(function(Input)
		        if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then UpdateFromInput(Input) end
		    end)
		    UserInputService.InputEnded:Connect(function(Input)
		        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then Dragging = false end
		    end)
		    ValueInput.FocusLost:Connect(function()
		        local num = tonumber(ValueInput.Text)
		        Value = num and SnapValue(num) or Value
		        UpdateVisuals()
		        SCallback(Value)
		    end)
		
		    local SliderFuncs = {}
		    function SliderFuncs:SetTitle(t) TitleLabel.Text = t end
		    function SliderFuncs:SetDesc(d) DescLabel.Text = d end
		    function SliderFuncs:SetVisible(s) SliderFrame.Visible = s end
		    function SliderFuncs:Destroy() SliderFrame:Destroy() end
		    function SliderFuncs:SetValue(v) Value = SnapValue(v) UpdateVisuals() SCallback(Value) end
		
		    table.insert(Elements, {Title = STitle, Instance = SliderFrame})
		    return SliderFuncs
		end
		
		function Tab:AddDropdown(Configs)
		    local DTitle = Configs.Title or Configs.Name or "Dropdown"
			local DDescription = Configs.Description or ""
			local DOptions = Configs.Options or Configs.Values or {}
			local DDefault = Configs.Default or ""
			local DMulti = Configs.Multi or false
			local DSearch = Configs.Search or false
			local DCallback = Configs.Callback or function() end
			local Selected = DMulti and {} or DDefault
			local Opened = false
			
			if Selected then
				DCallback(Selected)
			end
			
		    local DropdownFrame = New("Frame", {Parent = TabPage, Name = "Frame", Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements, ZIndex = 1}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = DropdownFrame})
		    local TitleLabel = New("TextLabel", {Parent = DropdownFrame, Size = UDim2.new(0.6, -10, 0, 15), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = DTitle, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local DescLabel = New("TextLabel", {Parent = DropdownFrame, Position = UDim2.new(0, 10, 0, 24), Size = UDim2.new(0.6, -10, 0, 12), BackgroundTransparency = 1, Text = DDescription, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local SelectBtn = New("TextButton", {Parent = DropdownFrame, Position = UDim2.new(1, -10, 0, 7), AnchorPoint = Vector2.new(1, 0), Size = UDim2.new(0, 120, 0, 30), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.8, Text = tostring(DMulti and "Select..." or Selected), TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 11, AutoButtonColor = true, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true}, {TextColor3 = "Background"})
		    New("UICorner", {Parent = SelectBtn})
		    local Arrow = New("ImageLabel", {Parent = SelectBtn, Position = UDim2.new(1, -20, 0.5, -7), Size = UDim2.new(0, 14, 0, 14), BackgroundTransparency = 1, Image = "rbxassetid://6034818372", ImageColor3 = Theme.Background}, {"ImageColor3", "Background"})
		    local Container = New("Frame", {Parent = DropdownFrame, Position = UDim2.new(1, 0, 0, 0), AnchorPoint = Vector2.new(1, 0), Size = UDim2.new(0, 120, 0, 0), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.1, Visible = false, AutomaticSize = Enum.AutomaticSize.Y, ZIndex = 99999}, {BackgroundColor3 = "Background"})
		    New("UICorner", {Parent = Container})
		    New("UIStroke", {Parent = Container, Color = Theme.Main, Thickness = 1}, {Color = "Main"})
		    local ContainerLayout = New("UIListLayout", {Parent = Container, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), HorizontalAlignment = Enum.HorizontalAlignment.Center})
		    ContainerLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		        local height = ContainerLayout.AbsoluteContentSize.Y + 10
		        Container.Position = UDim2.new(1, 0, 0, (SelectBtn.Size.Y.Offset / 2) - (height / 2))
		    end)
		    local SearchInput
		    if DSearch then
		        SearchInput = New("TextBox", {Parent = Container, Size = UDim2.new(1, -10, 0, 22), Position = UDim2.new(0, 0, 0, 2), BackgroundColor3 = Theme.Main, BackgroundTransparency = 0.8, TextColor3 = Theme.Text, PlaceholderText = "Search...", Text = "", Font = Astral.SaveSettings.Font, TextSize = 10, LayoutOrder = 1}, {TextColor3 = "Text", BackgroundColor3 = "Background"})
		        New("UICorner", {Parent = SearchInput})
		    end
		    local OptionScroll = New("ScrollingFrame", {Parent = Container, Size = UDim2.new(1, 0, 0, 0), CanvasSize = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1, ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Main, LayoutOrder = 2, AutomaticCanvasSize = Enum.AutomaticSize.Y, AutomaticSize = Enum.AutomaticSize.Y, ScrollingDirection = "Y", BorderSizePixel = 0}, {"ScrollBarImageColor3", "Main"})
		    local ScrollLayout = New("UIListLayout", {Parent = OptionScroll, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2)})
		
		    ScrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		        local contentHeight = ScrollLayout.AbsoluteContentSize.Y
		        OptionScroll.AutomaticSize = contentHeight > 100 and Enum.AutomaticSize.None or Enum.AutomaticSize.Y
		        OptionScroll.Size = contentHeight > 100 and UDim2.new(1, 0, 0, 100) or UDim2.new(1, 0, 0, 0)
		    end)
		    local function UpdateOptions(filter)
		        for _, v in pairs(OptionScroll:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
		        for _, opt in pairs(DOptions) do
		            if not filter or string.find(opt:lower(), filter:lower()) then
		                local isSelected = DMulti and table.find(Selected, opt) or (Selected == opt)
		                local OptBtn = New("TextButton", {Parent = OptionScroll, Size = UDim2.new(1, -10, 0, 20), BackgroundTransparency = 1, Text = (isSelected and "● " or "  ") .. opt, TextColor3 = Astral:GetTheme().Text, Font = Astral.SaveSettings.Font, TextSize = 10, TextXAlignment = "Left"}, {TextColor3 = "Text"})
		                OptBtn.MouseButton1Click:Connect(function()
		                    if DMulti then
		                        local f = table.find(Selected, opt)
		                        if f then table.remove(Selected, f) else table.insert(Selected, opt) end
		                        SelectBtn.Text = #Selected > 0 and table.concat(Selected, ", ") or "Select..."
		                        UpdateOptions(filter)
		                    else
		                        Selected = opt; SelectBtn.Text = opt; Opened = false; Container.Visible = false; DropdownFrame.ZIndex = 1
		                        TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
		                    end
		                    DCallback(Selected)
		                end)
		            end
		        end
		    end
		    SelectBtn.MouseButton1Click:Connect(function()
		        Opened = not Opened
		        DropdownFrame.ZIndex = Opened and 50 or 1
		        Container.Visible = Opened
		        TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = Opened and 180 or 0}):Play()
		        if Opened then UpdateOptions(DSearch and SearchInput.Text or nil) end
		    end)
		    UserInputService.InputBegan:Connect(function(input)
		        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and Opened then
		            local pos = input.Position
		            local guiPos, guiSize = Container.AbsolutePosition, Container.AbsoluteSize
		            local btnPos, btnSize = SelectBtn.AbsolutePosition, SelectBtn.AbsoluteSize
		            local inContainer = pos.X >= guiPos.X and pos.X <= guiPos.X + guiSize.X and pos.Y >= guiPos.Y and pos.Y <= guiPos.Y + guiSize.Y
		            local inBtn = pos.X >= btnPos.X and pos.X <= btnPos.X + btnSize.X and pos.Y >= btnPos.Y and pos.Y <= btnPos.Y + btnSize.Y
		            if not inContainer and not inBtn then
		                Opened = false; DropdownFrame.ZIndex = 1; Container.Visible = false
		                TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
		            end
		        end
		    end)
		
		    if DSearch then SearchInput:GetPropertyChangedSignal("Text"):Connect(function() UpdateOptions(SearchInput.Text) end) end
		
		    local DropdownFuncs = {}
		    function DropdownFuncs:SetTitle(t) TitleLabel.Text = t end
		    function DropdownFuncs:SetDesc(d) DescLabel.Text = d end
		    function DropdownFuncs:SetVisible(s) DropdownFrame.Visible = s end
		    function DropdownFuncs:Destroy() DropdownFrame:Destroy() end
		    function DropdownFuncs:SetValue(val)
		        if DMulti then Selected = typeof(val) == "table" and val or {val}; SelectBtn.Text = #Selected > 0 and table.concat(Selected, ", ") or "Select..."
		        else Selected = tostring(val); SelectBtn.Text = Selected end
		        if Opened then UpdateOptions(DSearch and SearchInput.Text or nil) end
		        DCallback(Selected)
		    end
		    function DropdownFuncs:AddOption(opt) table.insert(DOptions, opt) if Opened then UpdateOptions(DSearch and SearchInput.Text or nil) end end
		    function DropdownFuncs:RemoveOption(opt)
		        local f = table.find(DOptions, opt)
		        if f then table.remove(DOptions, f)
		            if not DMulti and Selected == opt then Selected = "None"; SelectBtn.Text = "None"
		            elseif DMulti then local sf = table.find(Selected, opt) if sf then table.remove(Selected, sf) end SelectBtn.Text = #Selected > 0 and table.concat(Selected, ", ") or "Select..." end
		            if Opened then UpdateOptions(DSearch and SearchInput.Text or nil) end
		        end
		    end
		    function DropdownFuncs:AddNewList(newList) DOptions = newList or {}; if not DMulti then Selected = "None"; SelectBtn.Text = "None" else Selected = {}; SelectBtn.Text = "Select..." end if Opened then UpdateOptions(DSearch and SearchInput.Text or nil) end end
		
		    table.insert(Elements, {Title = DTitle, Instance = DropdownFrame})
		    return DropdownFuncs
		end

		local ColorsList = {
		    ["white"] = Color3.fromRGB(255, 255, 255),
		    ["black"] = Color3.fromRGB(0, 0, 0),
		    ["red"] = Color3.fromRGB(255, 0, 0),
		    ["green"] = Color3.fromRGB(0, 255, 0),
		    ["blue"] = Color3.fromRGB(0, 0, 255),
		    ["yellow"] = Color3.fromRGB(255, 255, 0),
		    ["cyan"] = Color3.fromRGB(0, 255, 255),
		    ["magenta"] = Color3.fromRGB(255, 0, 255),
		    ["orange"] = Color3.fromRGB(255, 165, 0),
		    ["purple"] = Color3.fromRGB(128, 0, 128),
		    ["gray"] = Color3.fromRGB(128, 128, 128),
		    ["darkgray"] = Color3.fromRGB(60, 60, 60),
		    ["lightgray"] = Color3.fromRGB(200, 200, 200),
		    ["brown"] = Color3.fromRGB(165, 42, 42),
		    ["pink"] = Color3.fromRGB(255, 192, 203),
		    ["lime"] = Color3.fromRGB(50, 205, 50),
		    ["maroon"] = Color3.fromRGB(128, 0, 0),
		    ["navy"] = Color3.fromRGB(0, 0, 128),
		    ["olive"] = Color3.fromRGB(128, 128, 0),
		    ["teal"] = Color3.fromRGB(0, 128, 128),
		    ["silver"] = Color3.fromRGB(192, 192, 192),
		    ["gold"] = Color3.fromRGB(255, 215, 0),
		    ["violet"] = Color3.fromRGB(238, 130, 238),
		    ["indigo"] = Color3.fromRGB(75, 0, 130),
		    ["crimson"] = Color3.fromRGB(220, 20, 60),
		    ["darkred"] = Color3.fromRGB(139, 0, 0),
		    ["forestgreen"] = Color3.fromRGB(34, 139, 34),
		    ["skyblue"] = Color3.fromRGB(135, 206, 235),
		    ["royalblue"] = Color3.fromRGB(65, 105, 225),
		    ["hotpink"] = Color3.fromRGB(255, 105, 180),
		    ["tan"] = Color3.fromRGB(210, 180, 140),
		    ["beige"] = Color3.fromRGB(245, 245, 220),
		    ["khaki"] = Color3.fromRGB(240, 230, 140),
		    ["coral"] = Color3.fromRGB(255, 127, 80),
		    ["salmon"] = Color3.fromRGB(250, 128, 114),
		    ["wheat"] = Color3.fromRGB(245, 222, 179),
		    ["plum"] = Color3.fromRGB(221, 160, 221),
		    ["lavender"] = Color3.fromRGB(230, 230, 250),
		    ["mint"] = Color3.fromRGB(189, 252, 201),
		    ["turquoise"] = Color3.fromRGB(64, 224, 208)
		}

		function Tab:AddColorpicker(Configs)
		    local CTitle = Configs.Title or Configs.Name or "Colorpicker"
			local CDescription = Configs.Description or ""
			local CCallback = Configs.Callback or function() end
			local CDefault = typeof(Configs.Default) == "Color3" and Configs.Default or typeof(Configs.Default) == "string" and ColorsList[Configs.Default] or Color3.fromRGB(255,255,255)
			local Opened, H, S, V = false, Color3.toHSV(CDefault)
			
			if CDefault then
				CCallback(CDefault)
			end
			
		    local ColorFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 45), BackgroundColor3 = Theme.Main, LayoutOrder = #Elements, ZIndex = 1}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = ColorFrame})
		    local TitleLabel = New("TextLabel", {Parent = ColorFrame, AutomaticSize = "XY", Position = UDim2.new(0, 10, 0, 10), Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1, Text = CTitle, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 12, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local DescLabel = New("TextLabel", {Parent = ColorFrame, AutomaticSize = "XY", Position = UDim2.new(0, 10, 0, 25), Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1, Text = CDescription, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 9, TextXAlignment = "Left"}, {TextColor3 = "Background"})
		    local ColorDisplay = New("TextButton", {Parent = ColorFrame, Position = UDim2.new(1, -7, 0, 7), AnchorPoint = Vector2.new(1, 0), Size = UDim2.new(0, 40, 0, 30), BackgroundColor3 = CDefault, Text = ""})
		    New("UICorner", {Parent = ColorDisplay})
		    local Container = New("Frame", {Parent = ColorFrame, Position = UDim2.new(1, 0, 0, -150), AnchorPoint = Vector2.new(1, 0), Size = UDim2.new(0, 180, 0, 175), BackgroundColor3 = Theme.Background, BackgroundTransparency = 0.05, Visible = false, ZIndex = 1000}, {BackgroundColor3 = "Background"})
		    New("UICorner", {Parent = Container})
		    local CStroke = New("UIStroke", {Parent = Container, Color = Theme.Main, Thickness = 1.5}, {Color = "Main"})
		    New("UIListLayout", {Parent = Container, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8), HorizontalAlignment = "Center"})
		    New("UIPadding", {Parent = Container, PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)})
		    local SatValFrame = New("ImageLabel", {Parent = Container, Size = UDim2.new(1, 0, 0, 80), Image = "rbxassetid://4155801252", BackgroundColor3 = Color3.fromHSV(H, 1, 1), LayoutOrder = 1})
		    local SatCursor = New("Frame", {Parent = SatValFrame, Size = UDim2.new(0, 6, 0, 6), Position = UDim2.new(S, 0, 1 - V, 0), BackgroundColor3 = CDefault, BorderSizePixel = 1, AnchorPoint = Vector2.new(0.5, 0.5)})
		    New("UICorner", {Parent = SatCursor, CornerRadius = UDim.new(1, 0)})
		    local HueSlider = New("Frame", {Parent = Container, Size = UDim2.new(1, 0, 0, 15), BackgroundColor3 = Color3.new(1, 1, 1), LayoutOrder = 2})
		    New("UICorner", {Parent = HueSlider, CornerRadius = UDim.new(0, 4)})
		    local HueGradient = New("UIGradient", {Parent = HueSlider, Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(1, 1, 1)), ColorSequenceKeypoint.new(0.16, Color3.fromHSV(0.83, 1, 1)), ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.66, 1, 1)), ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)), ColorSequenceKeypoint.new(0.66, Color3.fromHSV(0.33, 1, 1)), ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.16, 1, 1)), ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 1, 1))})})
		    local HueCursor = New("Frame", {Parent = HueSlider, Size = UDim2.new(0, 4, 1, 2), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1 - H, 0, 0.5, 0), BackgroundColor3 = Color3.fromHSV(H, 1, 1), BorderSizePixel = 1})
		    local InfoFrame = New("Frame", {Parent = Container, Size = UDim2.new(1, 0, 0, 45), BackgroundTransparency = 1, LayoutOrder = 3})
		    local RInput = New("TextBox", {Parent = InfoFrame, Size = UDim2.new(0.3, -2, 0, 20), Text = math.floor(CDefault.R*255), BackgroundColor3 = Theme.Main, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 10, ClearTextOnFocus = false}, {BackgroundColor3 = "Main"})
		    local GInput = New("TextBox", {Parent = InfoFrame, Size = UDim2.new(0.3, -2, 0, 20), Position = UDim2.new(0.35, 0, 0, 0), Text = math.floor(CDefault.G*255), BackgroundColor3 = Theme.Main, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 10, ClearTextOnFocus = false}, {BackgroundColor3 = "Main"})
		    local BInput = New("TextBox", {Parent = InfoFrame, Size = UDim2.new(0.3, -2, 0, 20), Position = UDim2.new(0.7, 0, 0, 0), Text = math.floor(CDefault.B*255), BackgroundColor3 = Theme.Main, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 10, ClearTextOnFocus = false}, {BackgroundColor3 = "Main"})
		    local HexInput = New("TextBox", {Parent = InfoFrame, Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 0, 25), Text = "#"..CDefault:ToHex(), BackgroundColor3 = Theme.Main, TextColor3 = Theme.Background, Font = Astral.SaveSettings.Font, TextSize = 10, ClearTextOnFocus = false}, {BackgroundColor3 = "Main"})
		
		    local function Update(fromInput)
		        local color = Color3.fromHSV(H, S, V)
		        SatValFrame.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
		        ColorDisplay.BackgroundColor3, SatCursor.BackgroundColor3, HueCursor.BackgroundColor3 = color, color, Color3.fromHSV(H, 1, 1)
		        if not fromInput then RInput.Text, GInput.Text, BInput.Text, HexInput.Text = math.floor(color.R*255), math.floor(color.G*255), math.floor(color.B*255), "#"..color:ToHex() end
		        CCallback(color)
		    end
		    local function UpdateFromRGB()
		        local r, g, b = math.clamp(tonumber(RInput.Text) or 0, 0, 255), math.clamp(tonumber(GInput.Text) or 0, 0, 255), math.clamp(tonumber(BInput.Text) or 0, 0, 255)
		        local newCol = Color3.fromRGB(r, g, b)
		        H, S, V = Color3.toHSV(newCol)
		        SatCursor.Position, HueCursor.Position = UDim2.new(S, 0, 1 - V, 0), UDim2.new(1 - H, 0, 0.5, 0)
		        Update(true); HexInput.Text = "#"..newCol:ToHex()
		    end
		    RInput.FocusLost:Connect(UpdateFromRGB); GInput.FocusLost:Connect(UpdateFromRGB); BInput.FocusLost:Connect(UpdateFromRGB)
		    HexInput.FocusLost:Connect(function()
		        local success, result = pcall(function() return Color3.fromHex(HexInput.Text) end)
		        if success then H, S, V = Color3.toHSV(result); SatCursor.Position, HueCursor.Position = UDim2.new(S, 0, 1 - V, 0), UDim2.new(1 - H, 0, 0.5, 0); Update(true); RInput.Text, GInput.Text, BInput.Text = math.floor(result.R*255), math.floor(result.G*255), math.floor(result.B*255) end
		    end)
		    ColorDisplay.MouseButton1Click:Connect(function() Opened = not Opened ColorFrame.ZIndex = Opened and 50 or 1 Container.Visible = Opened end)
		    HueSlider.InputBegan:Connect(function(input)
		        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		            local function move(i) H = 1 - math.clamp((i.Position.X - HueSlider.AbsolutePosition.X) / HueSlider.AbsoluteSize.X, 0, 1) HueCursor.Position = UDim2.new(1 - H, 0, 0.5, 0) Update() end
		            local con; con = UserInputService.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then move(i) end end)
		            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then con:Disconnect() end end)
		            move(input)
		        end
		    end)
		    SatValFrame.InputBegan:Connect(function(input)
		        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		            local function move(i) S = math.clamp((i.Position.X - SatValFrame.AbsolutePosition.X) / SatValFrame.AbsoluteSize.X, 0, 1) V = 1 - math.clamp((i.Position.Y - SatValFrame.AbsolutePosition.Y) / SatValFrame.AbsoluteSize.Y, 0, 1) SatCursor.Position = UDim2.new(S, 0, 1 - V, 0) Update() end
		            local con; con = UserInputService.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then move(i) end end)
		            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then con:Disconnect() end end)
		            move(input)
		        end
		    end)
		    UserInputService.InputBegan:Connect(function(input)
		        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and Opened then
		            local pos = input.Position
		            local guiPos, guiSize = Container.AbsolutePosition, Container.AbsoluteSize
		            local btnPos, btnSize = ColorDisplay.AbsolutePosition, ColorDisplay.AbsoluteSize
		            if not (pos.X >= guiPos.X and pos.X <= guiPos.X + guiSize.X and pos.Y >= guiPos.Y and pos.Y <= guiPos.Y + guiSize.Y) and not (pos.X >= btnPos.X and pos.X <= btnPos.X + btnSize.X and pos.Y >= btnPos.Y and pos.Y <= btnPos.Y + btnSize.Y) then Opened = false ColorFrame.ZIndex = 1 Container.Visible = false end
		        end
		    end)
		
		    local ColorFuncs = {}
		    function ColorFuncs:SetColor(c) H, S, V = Color3.toHSV(c) Update() end
		    function ColorFuncs:SetVisible(s) ColorFrame.Visible = s end
		    function ColorFuncs:Destroy() ColorFrame:Destroy() end
		
		    table.insert(Elements, {Title = CTitle, Instance = ColorFrame})
		    return ColorFuncs
		end
		
		function Tab:AddDiscord(Configs)
		    local InviteLink = Configs.Link or ""
		    local InviteCode = InviteLink:match("discord%.gg/(%w+)") or InviteLink:match("discord%.com/invite/(%w+)") or InviteLink
		    
		    local DiscordFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 110), BackgroundColor3 = Color3.fromRGB(255, 255, 255), LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = DiscordFrame})
		    New("UIGradient", {Parent = DiscordFrame, Rotation = -45, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 85, 255)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}, Offset = Vector2.new(0, 0.5)})
		    local InviterIcon = New("ImageLabel", {Parent = DiscordFrame, Position = UDim2.new(0, 5, 0, 5), Size = UDim2.new(0, 20, 0, 20), BackgroundTransparency = 1})
		    New("UICorner", {Parent = InviterIcon, CornerRadius = UDim.new(1, 0)})
		    local InviterLabel = New("TextLabel", {Parent = DiscordFrame, Position = UDim2.new(0, 30, 0, 5), Size = UDim2.new(1, -35, 0, 20), BackgroundTransparency = 1, TextXAlignment = "Left", Font = Astral.SaveSettings.Font, TextSize = 10, TextColor3 = Color3.fromRGB(255, 255, 255), RichText = true, Text = "Invited by: ..."})
		    local Icon = New("ImageLabel", {Parent = DiscordFrame, Position = UDim2.new(0, 5, 0, 30), Size = UDim2.new(0, 40, 0, 40), BackgroundTransparency = 1})
		    New("UICorner", {Parent = Icon, CornerRadius = UDim.new(0, 8)})
		    local ServerName = New("TextLabel", {Parent = DiscordFrame, Position = UDim2.new(0, 50, 0, 30), Size = UDim2.new(1, -55, 0, 15), BackgroundTransparency = 1, TextXAlignment = "Left", Font = Astral.SaveSettings.Font, TextSize = 12, TextColor3 = Color3.fromRGB(255, 255, 255), RichText = true, Text = "Loading Name..."})
		    local ServerDesc = New("TextLabel", {Parent = DiscordFrame, Position = UDim2.new(0, 50, 0, 45), Size = UDim2.new(1, -55, 0, 25), BackgroundTransparency = 1, TextXAlignment = "Left", TextYAlignment = "Top", Font = Astral.SaveSettings.Font, TextSize = 9, TextColor3 = Color3.fromRGB(255, 255, 255), TextWrapped = true, Text = "No description available."})
		    local InfoLabel = New("TextLabel", {Parent = DiscordFrame, Position = UDim2.new(0, 5, 0, 75), Size = UDim2.new(1, -10, 0, 30), BackgroundTransparency = 1, TextXAlignment = "Left", TextYAlignment = "Bottom", Font = Astral.SaveSettings.Font, TextSize = 12, TextColor3 = Color3.fromRGB(255, 255, 255), RichText = true, Text = "Online: 0 | Total: 0 | Boosts: 0"})   
		    local JoinBtn = New("TextButton", {Parent = DiscordFrame, Size = UDim2.new(0, 80, 0, 20), Position = UDim2.new(1, -85, 0, 5), BackgroundColor3 = Color3.fromRGB(22, 160, 84), Text = "Copy Invite", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Astral.SaveSettings.Font, TextSize = 12})
		    New("UICorner", {Parent = JoinBtn})
		
		    local cooldown = false
		    JoinBtn.MouseButton1Click:Connect(function()
		        if cooldown then return end
		        cooldown = true; setclipboard(InviteLink)
		        JoinBtn.BackgroundColor3, JoinBtn.Text, JoinBtn.Active = Color3.fromRGB(100, 100, 100), "Copied to Clipboard", false
		        task.delay(5, function() 
		            cooldown = false; 
		            JoinBtn.BackgroundColor3, JoinBtn.Text, JoinBtn.Active = Color3.fromRGB(22, 160, 84), "Copy Invite", true 
		        end)
		    end)	
		    task.spawn(function()
		        local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request
		        if httpRequest then
		            local Response = httpRequest({Url = "https://discord.com/api/v9/invites/" .. InviteCode .. "?with_counts=true", Method = "GET"})
		            if Response.StatusCode == 200 then
		                local Data = game:GetService("HttpService"):JSONDecode(Response.Body)
		                local Guild, Inviter = Data.guild, Data.inviter
		                ServerName.Text = "<b>" .. Guild.name .. "</b>"
		                ServerDesc.Text = Guild.description or "No description available."
		                if Guild.id and Guild.icon then Icon.Image = Astral:GetIcon("https://cdn.discordapp.com/icons/" .. Guild.id .. "/" .. Guild.icon .. ".png") end
		                if Inviter then
		                    InviterIcon.Image = Astral:GetIcon("https://cdn.discordapp.com/avatars/" .. Inviter.id .. "/" .. Inviter.avatar .. ".png")
		                    InviterLabel.Text = string.format("Invited by: %s (@%s)", Inviter.global_name or Inviter.username, Inviter.username)
		                end
		                InfoLabel.Text = string.format("Online: %d | Total: %d | Boosts: %d", Data.approximate_presence_count or 0, Data.approximate_member_count or 0, Guild.premium_subscription_count or 0)
		            end
		        end
		    end)
		
		    table.insert(Elements, {Title = "Discord Invite", Instance = DiscordFrame})
		    return {Frame = DiscordFrame, Button = JoinBtn}
		end
		
		function Tab:AddGithub(Configs)
		    local GithubUser = Configs.User or "AstralScripts"
		    local ProfileLink = "https://github.com/" .. GithubUser
		
		    local GithubFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 110), BackgroundColor3 = Color3.fromRGB(255, 255, 255), LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {Parent = GithubFrame})
		    New("UIGradient", {Parent = GithubFrame, Rotation = -45, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}, Offset = Vector2.new(0, 0.5)})
		    local AvatarIcon = New("ImageLabel", {Parent = GithubFrame, Position = UDim2.new(0, 10, 0, 15), Size = UDim2.new(0, 50, 0, 50), BackgroundTransparency = 1})
		    New("UICorner", {Parent = AvatarIcon, CornerRadius = UDim.new(1, 0)}) -- Redondo
		    local NameLabel = New("TextLabel", {Parent = GithubFrame, Position = UDim2.new(0, 70, 0, 10), Size = UDim2.new(1, -160, 0, 20), BackgroundTransparency = 1, TextXAlignment = "Left", Font = Astral.SaveSettings.Font, TextSize = 14, TextColor3 = Color3.fromRGB(255, 255, 255), RichText = true, Text = "Loading..."})
		    local BioLabel = New("TextLabel", {Parent = GithubFrame, Position = UDim2.new(0, 70, 0, 30), Size = UDim2.new(1, -75, 0, 35), BackgroundTransparency = 1, TextXAlignment = "Left", TextYAlignment = "Top", Font = Astral.SaveSettings.Font, TextSize = 10, TextColor3 = Color3.fromRGB(200, 200, 200), TextWrapped = true, Text = "..."})
		    local StatsLabel = New("TextLabel", {Parent = GithubFrame, Position = UDim2.new(0, 10, 0, 70), Size = UDim2.new(1, -10, 0, 20), BackgroundTransparency = 1, TextXAlignment = "Left", TextYAlignment = "Bottom", Font = Astral.SaveSettings.Font, TextSize = 11, TextColor3 = Color3.fromRGB(255, 255, 255), RichText = true, Text = "Repos: 0 | Followers: 0 | Following: 0"})
		    local UpdatedLabel = New("TextLabel", {Parent = GithubFrame, Position = UDim2.new(0, 10, 0, 90), Size = UDim2.new(1, -10, 0, 15), BackgroundTransparency = 1, TextXAlignment = "Left", TextYAlignment = "Bottom", Font = Astral.SaveSettings.Font, TextSize = 9, TextColor3 = Color3.fromRGB(150, 150, 150), Text = "Last Update: ..."})
		    local CopyBtn = New("TextButton", {Parent = GithubFrame, Size = UDim2.new(0, 80, 0, 20), Position = UDim2.new(1, -85, 0, 10), BackgroundColor3 = Color3.fromRGB(35, 134, 54), Text = "Copy Profile", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Astral.SaveSettings.Font, TextSize = 12})
		    New("UICorner", {Parent = CopyBtn})
		
		    local cooldown = false
		    CopyBtn.MouseButton1Click:Connect(function()
		        if cooldown then return end
		        cooldown = true; setclipboard(ProfileLink)
		        CopyBtn.BackgroundColor3, CopyBtn.Text, CopyBtn.Active = Color3.fromRGB(100, 100, 100), "Copied!", false
		        task.delay(3, function() 
		            cooldown = false; 
		            CopyBtn.BackgroundColor3, CopyBtn.Text, CopyBtn.Active = Color3.fromRGB(35, 134, 54), "Copy Profile", true 
		        end)
		    end)
		    task.spawn(function()
		        local HttpService = game:GetService("HttpService")
		        local FileName = "GithubCache_" .. GithubUser .. ".json"
		        local UserData = nil
		        local NeedsUpdate = true
		        if isfile(FileName) then
		            local Success, FileContent = pcall(readfile, FileName)
		            if Success then
		                local Decoded = HttpService:JSONDecode(FileContent)
		                if Decoded.Timestamp and (os.time() - Decoded.Timestamp < 86400) then
		                    UserData = Decoded.Data
		                    NeedsUpdate = false
		                end
		            end
		        end
		        if NeedsUpdate then
		            local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request
		            if httpRequest then
		                local Response = httpRequest({Url = "https://api.github.com/users/" .. GithubUser, Method = "GET"})
		                if Response.StatusCode == 200 then
		                    UserData = HttpService:JSONDecode(Response.Body)
		                    writefile(FileName, HttpService:JSONEncode({
		                        Timestamp = os.time(),
		                        Data = UserData
		                    }))
		                end
		            end
		        end
		        if UserData then
		            NameLabel.Text = "<b>" .. (UserData.name or UserData.login) .. "</b>"
		            BioLabel.Text = UserData.bio or "No bio available."
		            local LastUpdateStr = UserData.updated_at or ""
		            local DateOnly = LastUpdateStr:match("(%d+-%d+-%d+)") or LastUpdateStr
		            UpdatedLabel.Text = "Last Update: " .. DateOnly
		            StatsLabel.Text = string.format("<font color='#000000'>Repos: </font><font color='#8bc34a'>%d</font> | Followers: <font color='#4fc3f7'>%d</font> | Following: <font color='#ffb74d'>%d</font>", UserData.public_repos or 0, UserData.followers or 0, UserData.following or 0)
		            if UserData.avatar_url then
		                if Astral.GetIcon then
		                     AvatarIcon.Image = Astral:GetIcon(UserData.avatar_url)
		                else
		                     AvatarIcon.Image = UserData.avatar_url -- Fallback
		                end
		            end
		        else
		            NameLabel.Text = "Error loading data"
		        end
		    end)
		
		    table.insert(Elements, {Title = "Github Profile", Instance = GithubFrame})
		    return {Frame = GithubFrame, Button = CopyBtn}
		end
		
		function Tab:AddGame(Configs)
		    local GPlace = Configs.Id or Configs.Place or game.PlaceId
		
			local GInfo = game:GetService("MarketplaceService"):GetProductInfo(GPlace)
			local GName = GInfo.Name or "Game"
			local GDesc = GInfo.Description or "No Description Available"
			local GCreator = GInfo.Creator.Name or "Astral Inc."
			local GCreatorType = GInfo.Creator.CreatorType or "Group"
			local GImage = ("rbxassetid://%d"):format(GInfo.IconImageAssetId) or "rbxassetid://0"
			
		    local GameFrame = New("Frame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 110), BackgroundColor3 = Color3.fromRGB(255, 255, 255), LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UICorner", {CornerRadius = UDim.new(0, 4), Name = "UICorner", Parent = GameFrame})
			New("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,0)), ColorSequenceKeypoint.new(0.4000000059604645, Color3.fromRGB(0,0,0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}), Enabled = true, Name = "UIGradient", Offset = Vector2.new(0, 0.4000000059604645), Parent = GameFrame, Rotation = -45})
			local GameImage = New("ImageLabel", {Active = true, AnchorPoint = Vector2.new(0, 0), AutoLocalize = false, AutomaticSize = "None", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Draggable = false, Image = GImage, ImageColor3 = Color3.fromRGB(255, 255, 255), ImageTransparency = 0, LayoutOrder = 0, Name = "GameImage", Parent = GameFrame, Position = UDim2.new(0, 5, 0, 5), Rotation = 0, ScaleType = "Crop", Size = UDim2.new(0, 100, 1, -10), Visible = true, ZIndex = 1})
			New("UICorner", {CornerRadius = UDim.new(0, 8), Name = "UICorner", Parent = GameImage})
			local GameName = New("TextLabel", {Active = true, AnchorPoint = Vector2.new(0, 0), AutoLocalize = false, AutomaticSize = "None", BackgroundColor3 = Color3.fromRGB(163, 162, 165), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Draggable = false, Font = Theme.Font, LayoutOrder = 0, Name = "GameName", Parent = GameFrame, Position = UDim2.new(0, 110, 0, 5), RichText = true, Rotation = 0, Size = UDim2.new(1, -115, 0, 15), Text = GName, TextColor3 = Color3.fromRGB(255, 255, 255), TextDirection = "Auto", TextScaled = true, TextSize = 10, TextTransparency = 0, TextTruncate = "None", TextWrapped = true, TextXAlignment = "Left", TextYAlignment = "Top", Visible = true, ZIndex = 1})
			local GameDescription = New("TextLabel", {Active = true, AnchorPoint = Vector2.new(0, 0), AutoLocalize = false, AutomaticSize = "None", BackgroundColor3 = Color3.fromRGB(163, 162, 165), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Draggable = false, Font = Theme.Font, LayoutOrder = 0, Name = "GameDescription", Parent = GameFrame, Position = UDim2.new(0, 110, 0, 25), RichText = true, Rotation = 0, Size = UDim2.new(1, -115, 0, 55), Text = GDesc, TextColor3 = Color3.fromRGB(255, 255, 255), TextDirection = "Auto", TextScaled = false, TextSize = 6, TextTransparency = 0, TextTruncate = "SplitWord", TextWrapped = true, TextXAlignment = "Left", TextYAlignment = "Top", Visible = true, ZIndex = 1})
			local GameCreator = New("TextLabel", {Active = true, AnchorPoint = Vector2.new(0, 0), AutoLocalize = false, AutomaticSize = "None", BackgroundColor3 = Color3.fromRGB(163, 162, 165), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Draggable = false, Font = Theme.Font, LayoutOrder = 0, Name = "GameCredits", Parent = GameFrame, Position = UDim2.new(0, 110, 0, 80), RichText = true, Rotation = 0, Size = UDim2.new(1, -115, 0, 25), Text = ("By %s: %s"):format(GCreatorType, GCreator), TextColor3 = Color3.fromRGB(255, 255, 255), TextDirection = "Auto", TextScaled = false, TextSize = 7, TextTransparency = 0, TextTruncate = "AtEnd", TextWrapped = true, TextXAlignment = "Left", TextYAlignment = "Center", Visible = true, ZIndex = 1})
		    table.insert(Elements, {Title = "Data Analysis", Instance = GameFrame})
		    return {Frame = GameFrame}
		end
		
		function Tab:AddLogger(Configs)
		    
			local Logger = {}
		    local LoggerFrame = New("ScrollingFrame", {Parent = TabPage, Size = UDim2.new(1, -5, 0, 75), BackgroundColor3 = Color3.fromRGB(255, 255, 255), LayoutOrder = #Elements}, {BackgroundColor3 = "Main"})
		    New("UIListLayout", {Parent = LoggerFrame, Padding = UDim.new(0, 5), VerticalAlignment = "Center"})
			New("UICorner", {Parent = LoggerFrame})
			
			function Logger:NewLog(Text)
				New("TextLabel", {Parent = LoggerFrame, Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, -10, 0, 15), BackgroundTransparency = 1, TextXAlignment = "Left", TextYAlignment = "Bottom", Font = Astral.SaveSettings.Font, TextSize = 9, TextColor3 = Color3.fromRGB(150, 150, 150), Text = Text})
			end
			
		    table.insert(Elements, {Title = "Logger", Instance = LoggerFrame})
		    return Logger
		end
		function Tab:AddButtonsGrid(Configs)
			
		end
		return Tab
	end
	
	return Window
end

local Interface = {
	Tab = nil,
	File = nil,
	Flags = nil,
	Defaults = nil,
}

function Interface:SetTab(Tab)
	self.Tab = Tab
end

function Interface:SetFile(Path)
	self.File = Path
end

function Interface:DelFile()
	if isfile(self.File) then
		delfile(self.File)
	end
end

function Interface:SetDefault(Table)
	self.Defaults = Table
end

function Interface:EnsureFolders()
	local parts = {}
	for part in string.gmatch(self.File, "[^/]+") do
		table.insert(parts, part)
	end
	local current = ""
	for i = 1, #parts - 1 do
		current = current == "" and parts[i] or current .. "/" .. parts[i]
		if not isfolder(current) then
			makefolder(current)
		end
	end
end

function Interface:Save()
	if not self.File or not self.Flags then return end
	self:EnsureFolders()
	writefile(self.File, HttpService:JSONEncode(self.Flags))
end

function Interface:Load()
	if not self.File then return end
	if isfile(self.File) then
		local ok, data = pcall(readfile, self.File)
		if ok then
			local ok2, decoded = pcall(HttpService.JSONDecode, HttpService, data)
			if ok2 then
				self.Flags = decoded
				return
			end
		end
	end
	self.Flags = {}
	if self.Defaults then
		for k, v in pairs(self.Defaults) do
			self.Flags[k] = v
		end
	end
	self:Save()
end

function Interface:GetFlag(Name)
	if not self.Flags then self:Load() end
	return self.Flags[Name]
end

function Interface:SetFlag(Name, Value)
	if not self.Flags then self:Load() end
	self.Flags[Name] = Value
	self:Save()
end

function Interface:Build(Configs)
	local BTheme = Configs.Themes or true
	local BFont = Configs.Fonts or true
	local BTransparency = Configs.Transparency or true
	local BAcrilic = Configs.Acrilic or true
	local BResetButton = Configs.ResetConfigs or true
	local Tab = self.Tab
	Tab:AddSection({Name = "Interface Manager"})
	if BTheme then
		Tab:AddDropdown({
			Title = "Select Theme",
			Description = "",
			Search = true,
			Default = "Biscuit Cream",
			Options = Astral.Themes.Names,
			Callback = function(Value)
				Astral:SetTheme(Value)
			end
		})
	end
	if BResetButton then
		Tab:AddButton({
			Title = "Reset Configs",
			Description = "",
			Callback = function()
				Interface:DelFile()
			end
		})
	end
end

return Astral, Interface