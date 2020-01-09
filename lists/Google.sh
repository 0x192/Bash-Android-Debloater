#!/bin/bash

declare -a google_bloat=(
	"com.android.hotwordenrollment.okgoogle" #OK Google
	"com.chrome.beta" #Google Chrome Beta (https://play.google.com/store/apps/details?id=com.chrome.beta)
	"com.chrome.canary" #Google Chrome Canary (Nightly build) (https://play.google.com/store/apps/details?id=com.chrome.canary)
	"com.chrome.dev" #Google Chrome (developer)	(https://play.google.com/store/apps/details?id=com.chrome.dev)
	"com.google.android.apps.access.wifi.consumer" #Google Wifi app (https://play.google.com/store/apps/details?id=com.google.android.apps.access.wifi.consumer&hl=en)
	"com.google.android.apps.adm" #Google Find my device app (https://play.google.com/store/apps/details?id=com.google.android.apps.adm&hl=en)
	"com.google.android.apps.ads.publisher" #Google Adsense app (https://play.google.com/store/apps/details?id=com.google.android.apps.ads.publisher&hl=en) 
	"com.google.android.apps.adwords" #Google Ads app (https://play.google.com/store/apps/details?id=com.google.android.apps.adwords&hl=en)
	"com.google.android.apps.authenticator2" #Google authentificator app (https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en)
	"com.google.android.apps.blogger" #Google blogger app (https://play.google.com/store/apps/details?id=com.google.android.apps.blogger&hl=en)
	"com.google.android.apps.books" #Google Play Books (https://play.google.com/store/apps/details?id=com.google.android.apps.books&hl=en)
	"com.google.android.apps.chromecast.app" #Google Home (https://play.google.com/store/apps/details?id=com.google.android.apps.chromecast.app&hl=en_US)
	"com.google.android.apps.cloudprint" #Cloud print (https://play.google.com/store/apps/details?id=com.google.android.apps.cloudprint&hl=en)
	"com.google.android.apps.cultural" #Google Arts & Culture (https://play.google.com/store/apps/details?id=com.google.android.apps.cultural&hl=en_US)
	"com.google.android.apps.currents" #Google Currents (discontinued)
	"com.google.android.apps.docs" #Google Drive (https://play.google.com/store/apps/details?id=com.google.android.apps.docs&hl=en_US)
	"com.google.android.apps.docs.editors.docs" #Google Docs (https://play.google.com/store/apps/details?id=com.google.android.apps.docs.editors.docs&hl=en)
	"com.google.android.apps.docs.editors.sheets" #Google sheets
	"com.google.android.apps.docs.editors.slides" #Google slides (for presentation)
	"com.google.android.apps.dynamite" #Hangout chat (https://play.google.com/store/apps/details?id=com.google.android.apps.dynamite&hl=en)
	"com.google.android.apps.enterprise.cpanel" #Google Admin (https://play.google.com/store/apps/details?id=com.google.android.apps.enterprise.cpanel&hl=en)
	"com.google.android.apps.enterprise.dmagent" #Google apps device policy (https://play.google.com/store/apps/details?id=com.google.android.apps.enterprise.dmagent&hl=en)
	"com.google.android.apps.fireball" #Google Allo (discontinued)
	"com.google.android.apps.fitness" #Google Fit (https://play.google.com/store/apps/details?id=com.google.android.apps.fitness)
	"com.google.android.apps.freighter" #Google Datally (discontinued)
	"com.google.android.apps.giant" #Google Analytics (https://play.google.com/store/apps/details?id=com.google.android.apps.giant&hl=en)
	"com.google.android.apps.googleassistant" #Google Assistant (https://play.google.com/store/apps/details?id=com.google.android.apps.googleassistant&hl=en_US)
	"com.google.android.apps.handwriting.ime" #Google Handwriting Input (https://play.google.com/store/apps/details?id=com.google.android.apps.handwriting.ime&hl=en) 
	"com.google.android.apps.hangoutsdialer" #Google Hangout Dialer (https://play.google.com/store/apps/details?id=com.google.android.apps.hangoutsdialer&hl=en)
	"com.google.android.apps.inbox" #Inbox by Gmail (Discontinued)
	"com.google.android.apps.kids.familylink" #Google Family Link (https://play.google.com/store/apps/details?id=com.google.android.apps.kids.familylink&hl=en)
	"com.google.android.apps.kids.familylinkhelper" #Google Family Link for children & teens (https://play.google.com/store/apps/details?id=com.google.android.apps.kids.familylinkhelper&hl=en)
	"com.google.android.apps.m4b" #Google My Maps (https://play.google.com/store/apps/details?id=com.google.android.apps.m4b&hl=en)
	"com.google.android.apps.magazines" #Google News (https://play.google.com/store/apps/details?id=com.google.android.apps.magazines&hl=en)
	"com.google.android.apps.mapslite" #Google Maps Go (lite web app of Maps) (https://play.google.com/store/apps/details?id=com.google.android.apps.mapslite&hl=en)
	"com.google.android.apps.meetings" #Hangout Meet (https://play.google.com/store/apps/details?id=com.google.android.apps.meetings&hl=en)
	"com.google.android.apps.messaging" #Google Messaging (SMS) (https://play.google.com/store/apps/details?id=com.google.android.apps.messaging&hl=en)
	"com.google.android.apps.navlite" #Google Maps GPS (https://play.google.com/store/apps/details?id=com.google.android.apps.navlite&hl=en)
	"com.google.android.apps.nbu.files" #File Management (https://play.google.com/store/apps/details?id=com.google.android.apps.nbu.files&hl=en)
	"com.google.android.apps.paidtasks" #Google Opinion Rewards (https://play.google.com/store/apps/details?id=com.google.android.apps.paidtasks&hl=en)
	"com.google.android.apps.pdfviewer" #Google PDF Viewer (https://play.google.com/store/apps/details?id=com.google.android.apps.pdfviewer&hl=en)
	"com.google.android.apps.photos" #Google Photos (https://play.google.com/store/apps/details?id=com.google.android.apps.photos&hl=en_US)
	"com.google.android.apps.photos.scanner" #PhotoScan app (https://play.google.com/store/apps/details?id=com.google.android.apps.photos.scanner&hl=en)
	"com.google.android.apps.plus" #Google+ (https://play.google.com/store/apps/details?id=com.google.android.apps.plus&hl=en_US)
	"com.google.android.apps.podcasts" #Google Podcasts (https://play.google.com/store/apps/details?id=com.google.android.apps.podcasts&hl=en)
	"com.google.android.apps.restore" #Restore apps during first boot.
	"com.google.android.apps.santatracker" #Google Santa Tracker WTF ??? (https://play.google.com/store/apps/details?id=com.google.android.apps.santatracker&hl=en)
	"com.google.android.apps.subscriptions.red" #Google One (https://play.google.com/store/apps/details?id=com.google.android.apps.subscriptions.red&hl=en_US)
	"com.google.android.apps.tachyon" #Google Duo (Video Calls) (https://play.google.com/store/apps/details?id=com.google.android.apps.tachyon&hl=en)
	"com.google.android.apps.tasks" #Google Task (TODO list) (https://play.google.com/store/apps/details?id=com.google.android.apps.tasks&hl=en)
	"com.google.android.apps.translate" #Google Translate (https://play.google.com/store/apps/details?id=com.google.android.apps.translate&hl=en)
	"com.google.android.apps.travel.onthego" #Google Trip (discontinued)
	"com.google.android.apps.vega" #Google My Business (https://play.google.com/store/apps/details?id=com.google.android.apps.vega&hl=en)
	"com.google.android.apps.walletnfcrel" #Google Pay (https://play.google.com/store/apps/details?id=com.google.android.apps.walletnfcrel&hl=en)
	"com.google.android.apps.wallpaper" #Google Wallpapers (https://play.google.com/store/apps/details?id=com.google.android.apps.wallpaper&hl=en)
	"com.google.android.apps.wellbeing" #Digital Wellbeing (habits tracking tool) (https://play.google.com/store/apps/details?id=com.google.android.apps.wellbeing&hl=en)
	"com.google.android.apps.youtube.creator" #Youtube Studio (https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.creator&hl=en)
	"com.google.android.apps.youtube.gaming" #Youtube Gaming -(discontinued in March 2019, features integrated in main youtube app)
	"com.google.android.apps.youtube.kids" #Youtube Kid (https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.kids&hl=en)
	"com.google.android.apps.youtube.music" #Youtube Music (https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.music&hl=en)
	"com.google.android.apps.youtube.vr" #Youtube VR (https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.vr&hl=en)
	"com.google.android.backuptransport" #Allows Android apps to back up their data on Google servers.
	"com.google.android.calculator" #Google Calculator (https://play.google.com/store/apps/details?id=com.google.android.calculator&hl=en)
	"com.google.android.calendar" #Google Calendar (https://play.google.com/store/apps/details?id=com.google.android.calendar&hl=en)
	"com.google.android.configupdater" #??? Discontinued
	"com.google.android.contacts" #Google Contacts (https://play.google.com/store/apps/details?id=com.google.android.contacts&hl=en)
	"com.google.android.feedback" #When an app crashes, this is the app that briefly asks you if you want to feedback the crash on the market, Google Play Store.
	"com.google.android.googlequicksearchbox" #Google Search box (https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox)
	"com.google.android.keep" #Google Keep (https://play.google.com/store/apps/details?id=com.google.android.keep)
	"com.google.android.markup" #Google Markup app made for modifying pictures, ships by default on every Pie+ device.
	"com.google.android.marvin.talkback" #(https://play.google.com/store/apps/details?id=com.google.android.marvin.talkback)
	# Android Accessibility Suite that helps blind and vision-impaired users    
	"com.google.android.music" #Google Play Music (https://play.google.com/store/apps/details?id=com.google.android.music)
	"com.google.android.onetimeinitializer" #Provides first time setup, safe to remove.
	"com.google.android.partnersetup" #Software that helps other apps to work with Google products.
	"com.google.android.play.games" #Google Play Games (https://play.google.com/store/apps/details?id=com.google.android.play.games)
	"com.google.android.printservice.recommendation" #Something linked to Print service
	"com.google.android.projection.gearhead" #Android auto (https://play.google.com/store/apps/details?id=com.google.android.projection.gearhead&hl=en)
	"com.google.android.setupwizard" #Removable after the first start of the phone, it's the basic configuration wizard that drives you through first boot.
	"com.google.android.soundpicker" #Google Sounds. Removable if you already have another media select service.
	"com.google.android.street" #Google Street View (https://play.google.com/store/apps/details?id=com.google.android.street)
	"com.google.android.syncadapters.calendar" #Synchronisation for Google Calendar.
	"com.google.android.syncadapters.contacts" #Synchronisation for Google Contacts.
	"com.google.android.talk" #Google Hangouts (https://play.google.com/store/apps/details?id=com.google.android.talk)
	"com.google.android.tts" #Text-to-speech powers apps to read text on your scream aloud, in many languages #Google Play Movies #Google Videos
	"com.google.android.tv.remote" #Android TV remote control (https://play.google.com/store/apps/details?id=com.google.android.tv.remote)
	"com.google.android.videos" #Google Play Movies & TV (https://play.google.com/store/apps/details?id=com.google.android.videos)
	"com.google.android.vr.home" #Daydream (VR stuff) (https://play.google.com/store/apps/details?id=com.google.android.vr.home)
	"com.google.android.vr.inputmethod" #Daydream virtual keyboard (VR stuff) (https://play.google.com/store/apps/details?id=com.google.android.vr.inputmethod)
	"com.google.android.wearable.app" #Wear OS Smartwatch (https://play.google.com/store/apps/details?id=com.google.android.wearable.app)
	"com.google.android.youtube" #YouTube app (https://play.google.com/store/apps/details?id=com.google.android.youtube)
	"com.google.ar.core" #Google Play Services for AR (Augmented Reality) (https://play.google.com/store/apps/details?id=com.google.ar.core)
	"com.google.ar.lens" #Google Lens (for AR too) (https://play.google.com/store/apps/details?id=com.google.ar.lens)
	"com.google.chromeremotedesktop" #Chrome Remote Desktop (https://play.google.com/store/apps/details?id=com.google.chromeremotedesktop)
	"com.google.earth" #Google Earth (https://play.google.com/store/apps/details?id=com.google.earth)
	"com.google.marvin.talkback" #Adds some features about accessibility settings.
	"com.google.samples.apps.cardboarddemo" #Google Cardboard (VR stuff) (https://play.google.com/store/apps/details?id=com.google.samples.apps.cardboarddemo)
	"com.google.tango.measure" #Google Measure (https://play.google.com/store/apps/details?id=com.google.tango.measure)
	"com.google.vr.cyclops" #Google Cardboard Camera (VR stuff) (https://play.google.com/store/apps/details?id=com.google.vr.cyclops)
	"com.google.vr.expeditions" #Google Expedition (VR stuff) (https://play.google.com/store/apps/details?id=com.google.vr.expeditions)
	"com.google.vr.vrcore" # Google VR services (https://play.google.com/store/apps/details?id=com.google.vr.vrcore)
	"com.google.zxing.client.android" #Google Barcode Scanner (Discontinued) (https://play.google.com/store/apps/details?id=com.google.zxing.client.android)



	#**********ADVANCED DEBLOAT **********#
	"com.google.android.ext.services"
	# Android Services Library only contains, for now, an "Android Notification Ranking Service." 
	# It sorts notifications by "importance" based on things like freshness, app type (IM apps come first), and by contact. 
	# For now it is safe to remove if you really want.
	# The library android.ext.services is open-source but this apk is not. Google probably uses it to update its API without having to rely to the OEM
	# https://arstechnica.com/gadgets/2016/11/android-extensions-could-be-googles-plan-to-make-android-updates-suck-less/
	
	"com.google.android.ext.shared"
	## Google shared library (used to share common code between apps)
	# For now the library (android.ext.shared is empty). So this apk is useless. 
	# This apk has the same role than the one above.
	
	#"com.google.android.webview" #Android System Webview (https://play.google.com/store/apps/details?id=com.google.android.webview)
	"com.google.android.launcher" #Google Now Launcher (https://play.google.com/store/apps/details?id=com.google.android.launcher)
	"com.android.chrome" #Chrome app (https://play.google.com/store/apps/details?id=com.android.chrome)
	"com.google.android.deskclock" #Google clock app (https://play.google.com/store/apps/details?id=com.google.android.deskclock)
	"com.google.android.gm" #Gmail (https://play.google.com/store/apps/details?id=com.google.android.gm)
	"com.google.android.ims" #Carrier Services (for Google phones). Not really sure about this one (https://play.google.com/store/apps/details?id=com.google.android.ims)
	#"com.android.vending" #Google Play Store app.
	#"com.google.android.apps.maps" #Google maps (https://play.google.com/store/apps/details?id=com.google.android.apps.maps)
	"com.google.android.apps.photos" #Google photos (https://play.google.com/store/apps/details?id=com.google.android.apps.photos)
	#"com.google.android.packageinstaller" #Gives ability to install, update or remove applications on the device --> !!!! WARNING : Bootloop on Xiaomi Note 5 
	#"com.googlel.android.gms" #Google Play Services ----------------------------------- DO NOT remove this unless you know what you're doing ! --> No Bootloop on Xiaomi Note 5
	#"com.google.android.gsf" #Google Services Framework, needed for Google Apps ------ DO NOT remove this unless you know what you're doing ! --> No Bootloop on Xiaomi Note 5
	#"com.google.android.gsf.login" #Support for managing Google accounts ------------- DO NOT remove this unless you know what you're doing !
	
	#"com.google.android.inputmethod.latin" #Google Keyboard (https://play.google.com/store/apps/details?id=com.google.android.inputmethod.latin)
	#"com.google.android.apps.inputmethod.hindi" #Google Keyboard + Hinndi languages (https://play.google.com/store/apps/details?id=com.google.android.apps.inputmethod.hindi&hl=en)
	#"com.google.android.inputmethod.japanese"
	#"com.google.android.inputmethod.korean"
	#"com.google.android.inputmethod.pinyin"
	#**********DEBLOAT AVANCE**********#
	)