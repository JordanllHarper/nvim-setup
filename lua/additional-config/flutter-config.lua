local flutter_emulators = {
	android_mobile = 'emulator-5556',
	android_tablet = 'emulator-5554',
	web = {
		device = 'chrome',
		port = 5000
	}
}


local android_main = {
	name = 'Android Main',                  -- an arbitrary name that you provide so you can recognise this config
	target = 'lib/main.dart',               -- your target
	flavor = 'preProd',
	device = flutter_emulators.android_mobile, -- the device ID, which you can get by running `flutter devices`
	dart_define = {
		API_URL = 'https://dev.example.com/api',
		IS_DEV = true,
	},
}
local tablet_main = {
	name = 'Tablet Main',                   -- an arbitrary name that you provide so you can recognise this config
	target = 'lib/main.dart',               -- your target
	flavor = 'preProd',
	device = flutter_emulators.android_tablet, -- the device ID, which you can get by running `flutter devices`
	dart_define = {
		API_URL = 'https://dev.example.com/api',
		IS_DEV = true,
	},
}
local android_preprod = {
	name = 'Android Preprod',               -- an arbitrary name that you provide so you can recognise this config
	target = 'lib/main_preProd.dart',       -- your target
	flavor = 'preProd',
	device = flutter_emulators.android_mobile, -- the device ID, which you can get by running `flutter devices`
	dart_define = {
		API_URL = 'https://dev.example.com/api',
		IS_DEV = true,
	},
}
local tablet_preprod = {
	name = 'Tablet Preprod',                -- an arbitrary name that you provide so you can recognise this config
	target = 'lib/main_preProd.dart',       -- your target
	flavor = 'preProd',
	device = flutter_emulators.android_tablet, -- the device ID, which you can get by running `flutter devices`
	dart_define = {
		API_URL = 'https://dev.example.com/api',
		IS_DEV = true,
	},
}

local web_preprod = {
	name = 'Web Preprod',
	device = flutter_emulators.web.device,
	flavor = 'preProd',
	target = 'lib/main_preProd.dart', -- your target
	web_port = flutter_emulators.web.port
}
