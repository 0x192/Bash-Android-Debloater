#!/bin/bash

declare -a brands=("Asus" "Huawei" "LG" "Nokia" "Samsung" "Sony" "Xiaomi")

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
	"com.google.android.ext.services" #Android Services Library. Do some minors things to notifications (https://android.stackexchange.com/a/169291)
	"com.google.android.ext.shared" #???????????????????????????
	"com.google.android.feedback" #When an app crashes, this is the app that briefly asks you if you want to feedback the crash on the market, Google Play Store.
	"com.google.android.googlequicksearchbox" #Google Search box (https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox)
	"com.google.android.keep" #Google Keep (https://play.google.com/store/apps/details?id=com.google.android.keep)
	"com.google.android.markup" #Google Markup app made for modifying pictures, ships by default on every Pie+ device.
	"com.google.android.marvin.talkback" #Android Accessibility Suite (https://play.google.com/store/apps/details?id=com.google.android.marvin.talkback)   
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
	"com.niksoftware.snapseed" #Snapseed (https://play.google.com/store/apps/details?id=com.niksoftware.snapseed)



	#**********ADVANCED DEBLOAT **********#
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
	#"com.google.android.gms" #Google Play Services ----------------------------------- DO NOT remove this unless you know what you're doing ! --> No Bootloop on Xiaomi Note 5
	#"com.google.android.gsf" #Google Services Framework, needed for Google Apps ------ DO NOT remove this unless you know what you're doing ! --> No Bootloop on Xiaomi Note 5
	#"com.google.android.gsf.login" #Support for managing Google accounts ------------- DO NOT remove this unless you know what you're doing !
	
	#"com.google.android.inputmethod.latin" #Google Keyboard (https://play.google.com/store/apps/details?id=com.google.android.inputmethod.latin)
	#"com.google.android.apps.inputmethod.hindi" #Google Keyboard + Hinndi languages (https://play.google.com/store/apps/details?id=com.google.android.apps.inputmethod.hindi&hl=en)
	#"com.google.android.inputmethod.japanese"
	#"com.google.android.inputmethod.korean"
	#"com.google.android.inputmethod.pinyin"
	#**********DEBLOAT AVANCE**********#
	)

declare -a samsung_bloat=(
	"com.cnn.mobile.android.phone.edgepanel"
	"com.customermobile.preload.vzw"
	"com.dsi.ant.plugins.antplus" #Samsung+ ?
	"com.dsi.ant.sample.acquirechannels"
	"com.dsi.ant.server"
	"com.dsi.ant.service.socket"
	"com.hiya.star" # system/app/HiyaService/HiyaService.apk
	"com.mobeam.barcodeService"
	"com.monotype.android.font.chococooky"
	"com.monotype.android.font.cooljazz"
	"com.monotype.android.font.foundation"
	"com.monotype.android.font.rosemary"
	"com.policydm"
	"com.samsung.aasaservice"
	"com.samsung.advp.imssettings"
	"com.samsung.android.allshare.service.mediashare"
	"com.samsung.android.app.appsedge"
	"com.samsung.android.app.camera.sticker.facearavatar.preload"
	"com.samsung.android.app.clipboardedge" # system/app/ClipboardEdge/ClipboardEdge.apk
	"com.samsung.android.app.episodes"
	"com.samsung.android.app.galaxyfinder"
	"com.samsung.android.app.ledbackcover"
	"com.samsung.android.app.ledcoverdream"
	"com.samsung.android.app.memo"
	"com.samsung.android.app.mhswrappertmo"
	"com.samsung.android.app.mirrorlink"
	"com.samsung.android.app.news"
	"com.samsung.android.app.notes"
	"com.samsung.android.app.reminder"
	"com.samsung.android.app.routines"
	"com.samsung.android.app.sbrowseredge"
	"com.samsung.android.app.social"
	"com.samsung.android.app.spage"
	"com.samsung.android.app.storyalbumwidge"
	"com.samsung.android.app.talkback"
	"com.samsung.android.app.talkback" # system/app/STalkback/STalkback.apk
	"com.samsung.android.app.taskedge"
	"com.samsung.android.app.vrsetupwizardstub"
	"com.samsung.android.app.watchmanager"
	"com.samsung.android.app.watchmanagerstub"
	"com.samsung.android.app.withtv" # system/app/withTV/withTV.apk
	"com.samsung.android.aremoji"
	"com.samsung.android.asksmanager"
	"com.samsung.android.authfw"
	"com.samsung.android.bbc.bbcagent"
	"com.samsung.android.beaconmanager"
	"com.samsung.android.bixby.agent"
	"com.samsung.android.bixby.agent.dummy"
	"com.samsung.android.bixby.es.globalaction"
	"com.samsung.android.bixby.plmsync"
	"com.samsung.android.bixby.service"
	"com.samsung.android.bixby.voiceinput"
	"com.samsung.android.bixby.wakeup"
	"com.samsung.android.bixbyvision.framework"
	"com.samsung.android.calendar"
	"com.samsung.android.da.daagent"
	"com.samsung.android.drivelink.stub"
	"com.samsung.android.easysetup"
	"com.samsung.android.email.provider"
	"com.samsung.android.game.gamehome"
	"com.samsung.android.game.gametools"
	"com.samsung.android.game.gos"
	"com.samsung.android.gametuner.thin"
	"com.samsung.android.hmt.vrshell"
	"com.samsung.android.hmt.vrsvc"
	"com.samsung.android.keyguardwallpaperupdator"
	"com.samsung.android.kidsinstaller"
	"com.samsung.android.lool"
	"com.samsung.android.mateagent"
	"com.samsung.android.mdx" 
	"com.samsung.android.mobileservice"
	"com.samsung.android.samsungpass"
	"com.samsung.android.samsungpassautofill"
	"com.samsung.android.scloud" # Samsung Cloud
	"com.samsung.android.securitylogagent"
	"com.samsung.android.service.livedrawing"
	"com.samsung.android.service.peoplestripe"
	"com.samsung.android.service.travel"
	"com.samsung.android.smartmirroring"
	"com.samsung.android.spay"
	"com.samsung.android.spayfw"
	"com.samsung.android.spayfw" #Samsung Pay Framework"
	"com.samsung.android.spdfnote"
	"com.samsung.android.ststub"
	"com.samsung.android.svoice"
	"com.samsung.android.tripwidget"
	"com.samsung.android.visionintelligence"
	"com.samsung.android.voicewakeup"
	"com.samsung.android.weather"
	"com.samsung.android.weather" # Météo
	"com.samsung.android.wellbeing"
	"com.samsung.android.widgetapp.yahooedge.finance"
	"com.samsung.android.widgetapp.yahooedge.sport"
	"com.samsung.desktopsystemui"
	"com.samsung.ecomm"
	"com.samsung.groupcast"
	"com.samsung.knox.securefolder"
	"com.samsung.oh"
	"com.samsung.safetyinformation"
	"com.samsung.SMT"
	"com.samsung.svoice.sync"
	"com.samsung.systemui.bixby"
	"com.samsung.tmovvm"
	"com.samsung.voiceserviceplatform"
	"com.sec.android.app.billing"
	"com.sec.android.app.gamehub"
	"com.sec.android.app.launcher"
	"com.sec.android.app.magnifier"
	"com.sec.android.app.myfiles"
	"com.sec.android.app.ocr"
	"com.sec.android.app.quicktool"
	"com.sec.android.app.samsungapps"
	"com.sec.android.app.sbrowser" # Navigateur internet par defaut
	"com.sec.android.app.SecSetupWizard"
	"com.sec.android.app.shealth"
	"com.sec.android.app.translator"
	"com.sec.android.app.voicenote"
	"com.sec.android.app.withtv"
	"com.sec.android.cover.ledcover"
	"com.sec.android.daemonapp"
	"com.sec.android.desktopmode.uiservice"
	"com.sec.android.easyMover"
	"com.sec.android.easyMover.Agent"
	"com.sec.android.easyonehand"
	"com.sec.android.gallery3d"
	"com.sec.android.mimage.avatarstickers"
	"com.sec.android.mimage.photoretouching"
	"com.sec.android.provider.snote"
	"com.sec.android.sidesync30"
	"com.sec.android.uibcvirtualsoftkey"
	"com.sec.android.widgetapp.diotek.smemo"
	"com.sec.android.widgetapp.easymodecontactswidget"
	"com.sec.android.widgetapp.samsungapps"
	"com.sec.bcservice"
	"com.sec.epdgtestapp"
	"com.sec.everglades"
	"com.sec.everglades.update"
	"com.sec.factory"
	"com.sec.kidsplat.installer"
	"com.sec.location.nsflp2"
	"com.sec.readershub"
	"com.sec.spp.push"
	"com.sec.svoice.lang.en_US"
	"com.sec.svoice.lang.es_US"
	"com.sec.yosemite.phone"
	"com.trustonic.tuiservice"
	"com.turner.cnvideoapp"
	"com.vlingo.midas"
	"com.wsomacp"
	"net.sharewire.parkmobilev2"
	"samsung.android.app.galaxyfinder"
	"samsung.android.app.pinboard"
	"samsung.android.bbc.bbcagent"
	"samsung.android.bbc.fileprovider"
	"samsung.android.scloud.auth"
	"samsung.android.scloud.sync"
	"samsung.android.sconnect"
	"samsung.android.securitylogagent"
	"samsung.helphub"
	"samsung.klmsagent"
	"samsung.knox.knoxtrustagent"
	"samsung.knox.kss"
	"samsung.mdl.radio"
	"samsung.sdm"
	"samsung.sdm.sdmviewer"
	"samsung.vvm"
	"sec.allsharecastplayer"
	"sec.android.app.billing"
	"sec.android.app.mt"
	"sec.android.app.samsungapps"
	"sec.android.app.shealth"
	"sec.android.app.sns3"
	"sec.enterprise.knox.attestation"
	"sec.enterprise.knox.shareddevice.keyguard"
	"sec.knox.bluetooth"
	"sec.knox.bridge"
	"sec.knox.containeragent2"
	"sec.knox.foldercontainer"
	"sec.knox.knoxsetupwizardclient"
	"sec.knox.packageverifier"
	"sec.knox.shortcutsms"
	"sec.knox.switcher"
	"sec.knox.switchknoxI"
	"sec.knox.switchknoxII"
	"tv.peel.samsung.app"

	###### ADVANCED DEBLOAT ######
	#"com.sec.android.app.desktoplauncher"
	#"sec.android.emergencylauncher"
	)

declare -a US_carrier_bloat=(
	

	#T-Mobile
	"com.mobitv.client.tmobiletvhd"
	"com.tmobile.pr.adapt"
	"com.tmobile.pr.mytmobile"
	"com.tmobile.services.nameid" #Name ID T-Mobile
	"com.tmobile.simlock"
	"com.tmobile.vvm.application"
	"com.whitepages.nameid.tmobile"
	"us.com.dt.iq.appsource.tmobile"

	#Verizon
	"asurion.android.verizon.vms"
	"com.asurion.android.verizon.vms"
	"com.motorola.vzw.phone.extensions"
	"com.securityandprivacy.android.verizon.vms"
	"com.telecomsys.directedsms.android.SCG"
	"com.verizon.llkagent"
	"com.verizon.messaging.vzmsgs"
	"com.verizon.mips.services"
	"com.verizon.obdm"
	"com.verizon.obdm_permissions"
	"com.verizon.vzwavs"
	"com.verizontelematics.verizonhum"
	"com.vzw.ecid"
	"com.vzw.hss.myverizon"
	"com.vzw.qualitydatalog"
	"customermobile.preload.vzw"
	"vznavigator.Generic"
	"vzw.hss.widgets.infozone.large"
	)

declare -a French_carrier_bloat=(
	#SFR
	#Bouygues
	#Free
	#Orange / Sosh
	)


declare -a amazon_bloat=(
	"com.amazon.mShop.android"
	"com.sec.android.app.dictionary"
	"com.amazon.fv"
	"com.amazon.kindle"
	"com.amazon.mp3"
	"com.amazon.venezia"
	"com.amazon.aa.attribution"
	"com.amazon.aa"
	"com.amazon.mShop.android.shopping"
	"com.amazon.clouddrive.photo"
	"com.amazon.avod.thirdpartyclient"
	"amazon.venezia"
	"amazon.mp3"
	"amazon.mShop.android"
	"amazon.fv"
	"amazon.kindle"
	)

declare -a facebook_bloat=(
	"com.facebook.katana"
	"com.facebook.system"
	"com.facebook.appmanager"
	"com.facebook.services"
	"com.facebook.orca"
	"com.instagram.android"
	#"com.whatsapp"
	)

declare -a misc_bloat=(
	"audible.application"
	"cequint.ecid"
	"com.audible.application"
	"com.blurb.checkout"
	"com.booking"
	"com.cequint.ecid"
	"com.ebay.mobile"
	"com.enhance.gameservice"
	"com.evernote"
	"com.gotv.nflgamecenter.us.lite"
	"com.hancom.office.editor.hidden"
	"com.imdb.mobile"
	"com.infraware.polarisoffice5"
	"com.linkedin.android"
	"com.micredit.in"
	"com.netflix.mediaclient"
	"com.netflix.partner.activation"
	"com.nuance.swype.input"
	"com.opera.app.news"
	"com.opera.branding"
	"com.opera.mini.native"
	"com.s.antivirus"
	"com.spotify.music"
	"com.til.timesnews"
	"com.tripadvisor.tripadvisor"
	"com.UCMobile.intl"
	"flipboard.app"
	"flipboard.boxer.app"
	"gotv.nflgamecenter.us.lite"
	"in.mohalla.sharechat"
	"yahoo.mobile.client.android.liveweather"

	)

declare -a microsoft_bloat=(
	"com.microsoft.skydrive"
	"com.skype.raider"
	"com.microsoft.office.excel"
	"com.microsoft.office.word"
	"com.microsoft.office.outlook"
	"com.microsoft.office.powerpoint"
	"com.skype.m2"
	"com.microsoft.office.officehubhl"
	"com.microsoft.office.officehub"
	"com.microsoft.office.officehubrow"
	"com.microsoft.appmanager"
	)

declare -a generic_bloat=(
	"org.simalliance.openmobileapi.service"
	"com.android.sharedstoragebackup"
	"com.sec.android.AutoPreconfig"
	"com.android.apps.tag" #Still unclear how it acts with system, but should be safe to remove...
	"com.android.backupconfirm" # ??? (Sony)
	"com.android.bips" #Built-in Print Service. Safe to remove.
	"com.android.bluetoothmidiservice" #Provides classes for sending and receiving messages using the MIDI event protocol over Bluetooth LE.
	"com.android.bookmarkprovider" #Found on Xiaomi Note 5
	"com.android.browser" #Stock Browser
	"com.android.calculator2" #Stock calculator app.
	"com.android.calllogbackup" # ???? (Sony)
	"com.android.carrierconfig" #Provides access to telephony configuration values that are carrier-specific.
	"com.android.carrierdefaultapp" # Found on Xiaomi Note 5 
	"com.android.cellbroadcastreceiver" #Alerts for Broadcasts.
	"com.android.deskclock" #Clock app, plus alarm function.
	"com.android.dreams.basic" #Support for screensaver mode.
	"com.android.dreams.phototable" #Photographic screensavers.
	"com.android.egg" #Android build's easter egg feature.
	"com.android.exchange" #Needed for email app to work correctly if you use a mail different from Gmail.
	"com.android.hotwordenrollment.okgoogle" #"OK Google" detection service (used when you wanna enroll Assistant by the hotword.
	"com.android.htmlviewer" #In-built HTML viewer.
	"com.android.inputdevices" #Manages the input devices.
	"com.android.keychain" #Should provide access to private keys plus their certificate chains in storage.
	"com.android.magicsmoke" #Live wallpaper.
	"com.android.managedprovisioning" #For corporate restritctions on phones with Google Workplace.
	"com.android.mediacenter" #EMUI music app.
	"com.android.noisefield" #Live wallpaper.
	"com.android.pacprocessor" #PAC stands for proxy auto-config, and this file defines how web browsers and other agents can automatically define the correct proxy server for fetching an URL. Removable, if you don't use proxies on your phone.
	"com.android.partnerbrowsercustomizations.chromeHomepage" 
	"com.android.phasebeam" #Wallpaper.
	"com.android.printservice.recommendation" #Keep it, if you need to print directly via your phone.
	"com.android.printspooler" #Keep it, if you need to print directly via your phone.
	"com.android.providers.partnerbookmarks" #Provides bookmarks about partners of Google in Chrome.
	"com.android.soundrecorder" #Sound recorder, obviously.
	"com.android.spul" #SUPL20SERVICES, seems related to GPS in Huawei devices. Should be safe to remove.
	"com.android.stk" #SIM toolkit app.
	"com.android.voicedialer" #Voice search.
	"com.android.wallpaper.holospiral" #Live wallpaper.
	"com.android.wallpaper.livepicker" #Wallpaper picker.
	"com.android.wallpapercropper" #Wallpaper cropper.
	"com.example.android.notepad" #Notepad app.
	"com.google.android.marvin.talkback" #Accessibility Service that helps blind and vision-impaired users 
	"com.qualcomm.atfwd"
	"com.qualcomm.qti.qms.service.telemetry"
	"com.LogiaGroup.LogiaDeck"
	"com.vcast.mediamanager"
	"com.sec.android.service.health"
	"com.lookout"
	"com.qualcomm.qti.rcsbootstraputil"
	"com.qualcomm.qti.rcsimsbootstraputil"
	"com.qualcomm.timeservice"


	#******** ADVANCED DEBLOAT ********#
	"com.android.quicksearchbox" #Search box.
	"com.qualcomm.qti.qms.service.connectionsecurity" #CURRENTLY IN TEST / MAY NOT BE SAFE
	"com.qualcomm.qti.services.secureui"
	"com.qualcomm.qti.auth.fidocryptoservice"
	"com.qualcomm.qti.perfdump"
	"com.android.musicfx" #Audio Equalizer
	"com.android.providers.calendar" #Stock calendar app           
	"com.android.calendar" #Stock calendar app.
	"com.android.contacts" #Stock contacts app.
	"com.android.providers.downloads.ui" #Stock download app
	"com.android.email" #Stock Email app (not Gmail).
	#"com.android.emergency" #Emergency Contacts. Remove it if you don't use this feature.
	"com.android.facelock" #Essential if you wanna use Face Unlock features, removable if you don't want to.
	"com.android.gallery3d" #Gallery app.
	#"com.android.inputmethod.latin" #AOSP keyboard.
	"com.android.mms" #Stock SMS app.
	#"com.android.phone" #Dialer app (!!! WARNING No SIM with a Xiaomi Note 5 Phone !!! Seems NOT to be safe)
	#"com.android.providers.blockednumber" #Storage of blocked numbers.
	#"android.browser.provider" # ???????????????
	#"com.android.vpndialogs" #VPN system.
	#"com.android.phone.recorder" #Call recorder function.
	#"com.android.providers.userdictionary" #User dictionary for keyboard apps.
	"contacts.com.android.providers.calendar" #Necessary to sync stock Calendar app and let it work correctly.
	#"com.android.backupconfirm" #Restore google settings with Google Backup restore function. Essential package for ADB backup !! 
	#******** DEBLOAT AVANCE ********#
	)

declare -a motorola_bloat=(
	"com.motorola.mot5gmod"
	"com.motorola.vzw.mot5gmod"
	"com.discoveryscreen"
	"com.motorola.vzw.cloudsetup"
	"com.motorola.ltebroadcastservices_vzw"
	"com.motorola.vzw.loader"
	"com.motorola.omadm.vzw"
	"com.motorola.vzw.provider"
	)

declare -a huawei_bloat=(
	"com.baidu.input_huawei " #Huawei chinese stock input keyboard. Safe to remove.
	"com.huawei.android.chr " #HwChrService. Safe to remove.
	"com.huawei.android.FloatTasks " #Floating dock function. 
	"com.huawei.android.hsf " #Huawei Services Framework. Safe to remove.
	"com.huawei.android.hwpay " #Huawei Pay. Safe to remove.
	"com.huawei.android.instantshare " #Huawei Share features. DO NOT remove this.
	"com.huawei.android.internal.app " #Component of Huawei sharing. DO NOT remove this.
	"com.huawei.android.karaoke " #Karaoke mode feature. Safe to remove.
	"com.huawei.android.launcher " #Huawei launcher app.
	"com.huawei.android.mirrorshare " #MirrorShare feature.
	"com.huawei.android.remotecontroller " #Juawei Smart Controller app.
	"com.huawei.android.tips " #Huawei Tips. Safe to remove.
	"com.huawei.android.totemweather " #Huawei Weather app.
	"com.huawei.android.wfdirect " #Wi-Fi Direct feature.
	"com.huawei.aod " #Always On Display feature. DO NOT remove this.
	"com.huawei.appmarket " #Huawei Market app.
	"com.huawei.arengine.service " #Augmented reality service. Safe to remove.
	"com.huawei.bluetooth " #Import contact via Bluetooth function.
	"com.huawei.browser " #Huawei Browser app. More than safe to remove if you have another browser installed.
	"com.huawei.compass " #Huawei Compass app.
	"com.huawei.contactscamcard " #CamCard is a business card reader app. Safe to remove.
	"com.huawei.desktop.explorer " #Service that is been used when you wanna use your phone as an operative system on a PC. Safe to remove.
	"com.huawei.fido.uafclient " #Fast ID Online function. Safe to remove.
	"com.huawei.gameassistant " #Huawei Game Suite (HiGame). Safe to remove.
	"com.huawei.geofence " #GeofenceService. Safe to remove.
	"com.huawei.hdiw " #Huawei ID app. Safe to remove.
	"com.huawei.hifolder " #Huawei Online Cloud folder service. Safe to remove.
	"com.huawei.himovie.overseas " #Huawei videos App. Safe to remove.
	"com.huawei.hitouch " #Floating dock by Huawei. Safe to remove. 
	"com.huawei.hwasm " #FIDO UAF Autenthicator-Specific Module.
	"com.huawei.hwdetectrepair " #Huawei Smart diagnosis app. Safe to remove.
	"com.huawei.HwMultiScreenShot " #Sliding screen feature.
	"com.huawei.iaware " #Never understood what thid does, but hey it's safe to remove.
	"com.huawei.ihealth " #MotionService package, it's required for actions like shaking the phone to shut off the alarm, ecc. " #remove it, if you don't care about this.
	"com.huawei.livewallpaper.paradise " #Live wallpaper service.
	"com.huawei.mirror " #Huawei Mirror app. Safe to remove.
	"com.huawei.parentcontrol " #Parental controls functions. Safe to remove.
	"com.huawei.pcassistant " #HiSuite service. If you use it, keep it.
	"com.huawei.phoneservice " #HiCare app. Safe to remove.
	"com.huawei.screenrecorder " #Huawei Screen recorder feature. Safe to remove.
	"com.huawei.search " #HiSearch. Safe to remove.
	"com.huawei.stylus.floatmenu " #Floating menu with M-Pen feature. Safe to remove.
	"com.huawei.synergy " #Huawei Cloud Synergy. Shouldn't be safe to remove, need to learn more 'bout this.
	"com.huawei.trustagent " #Intelligent unlock feature.
	"com.huawei.vassistant " #HiVoice app. Safe to remove.
	"com.huawei.videoeditor " #Video editor function. Safe to remove.
	"com.huawei.wallet " #Huawei Wallet. Safe to remove.
	"com.huawei.watch.sync " #Huawei Watch sync function. Safe to remove.
	"com.iflytek.speechsuite " #Default voice input method.
	"com.nuance.swype.emui " #Huawei Swype functions.

	#******** ADVANCED DEBLOAT ********#
	#"com.hisi.mapcon " #Don't disable/remove this if you use WiFi Calling, or it'll kill the app. If you don't use WiFi Calling, this is safe to remove. (Thanks @mj084 !)
	#"com.huawei.hidisk " #Huawei File Manager app.
	)

declare -a xiaomi_bloat=(
	"com.mipay.wallet"
	"com.miui.analytics #Analytics"
	"com.miui.android.fashiongallery"
	"com.miui.antispam"
	"com.miui.bugreport" #Mi Feedback
	"com.miui.calculator" #Calculator
	"com.miui.cleanmaster"
	"com.miui.cloudbackup"
	"com.miui.cloudservice"
	"com.miui.cloudservice.sysbase"
	"com.miui.compass" #Mi Compass
	"com.miui.contentcatcher"
	"com.miui.daemon"
	"com.miui.fm"
	"com.miui.gallery"
	"com.miui.home"
	"com.miui.hybrid"
	"com.miui.klo.bugreport"
	"com.miui.msa.global" #Main System Advertising
	"com.miui.notes" #Mi Notes
	"com.miui.personalassistant"
	"com.miui.player" #Mi Music
	"com.miui.providers.weather"
	"com.miui.screenrecorder" #Mi Screen Recorder
	"com.miui.systemAdSolution"
	"com.miui.translation.kingsoft"
	"com.miui.translation.youdao"
	"com.miui.video"
	"com.miui.videoplayer" #Mi Video
	"com.miui.videoplayer.overlay"
	"com.miui.virtualsim"
	"com.miui.vsimcore"
	"com.miui.weather2"
	"com.miui.yellowpage"
	"com.mi.webkit.core"
	"com.qiyi.video"
	"com.sohu.inputmethod.sogou.xiaomi"
	"com.xiaomi.ab"
	"com.xiaomi.account" #Mi Account
	"com.xiaomi.channel"
	"com.xiaomi.gamecenter.sdk.service"
	"com.xiaomi.joyose"
	"com.xiaomi.jr"
	"com.xiaomi.lens"
	"com.xiaomi.midrop" #Mi Drop
	"com.xiaomi.midrop.overlay"
	"com.xiaomi.mipicks" #Mi Apps
	"com.xiaomi.o2o"
	"com.xiaomi.pass"
	"com.xiaomi.payment"
	"com.xiaomi.scanner" #Mi Scannercom.miui.screenrecorder
	"com.xiaomi.shop"
	"com.xiaomi.vipaccount"
	"android.autoinstalls.config.Xiaomi.cepheus"
	"android.autoinstalls.config.Xiaomi.dipper"
	"com.autonavi.minimap"
	"com.baidu.duersdk.opensdk"
	"com.baidu.input_mi"
	"com.baidu.searchbox"
	"com.bsp.catchlog"
	"com.caf.fmradio"
	"com.duokan.phone.remotecontroller"
	"com.duokan.phone.remotecontroller.peel.plugin"
	"com.mfashiongallery.emag"	# Wallpapers by xiaomi
	"com.mi.android.globalpersonalassistant" # MI Vault, aka the "assistent" you open swiping left from MI Home
	"com.mi.global.bbs"
	"com.mi.global.shop"
	"com.mi.globalTrendNews"
	"com.mi.liveassistant"
	"com.milink.service"
	"com.mipay.wallet.id"
	"com.mipay.wallet.in"
	"com.miui.analytics"
	"com.miui.android.fashiongallery" # Wallpapers by xiaomi
	"com.miui.audioeffect"
	"com.miui.bugreport"
	"com.miui.cit"
	"com.miui.cloudservice" # Settings will crash when pressing on any "Mi Cloud" button
	"com.miui.compass"
	"com.miui.enbbs" # Xiaomi Forums
	"com.eterno"
	"com.miui.greenguard"
	"com.miui.hybrid.accessory"
	"com.miui.micloudsync"
	"com.miui.miwallpaper"
	"com.miui.msa.global" # MIUI System Ads Solution
	"com.miui.nextpay"
	"com.miui.notes"
	"com.miui.player"
	"com.miui.qr"
	"com.miui.screenrecorder"
	"com.miui.touchassistant" # Quick Ball/Touch Assistant
	"com.miui.translation.xmcloud"
	"com.miui.translationservice"
	"com.miui.userguide"
	"com.miui.videoplayer"
	"com.mi.android.globalpersonalassistant"
	"com.opera.preinstall"
	"com.phonepe.app"
	"com.samsung.aasaservice"
	"com.xiaomi.glgm"
	"com.xiaomi.micloud.sdk"
	"com.xiaomi.midrop"
	"com.xiaomi.mipicks"
	"com.xiaomi.mirecycle"
	"com.xiaomi.oversea.ecom"
	"com.xiaomi.providers.appindex"
	"com.xiaomi.scanner"
	"org.codeaurora.gps.gpslogsave"
	#******** ADVCANED DEBLOAT ********#
	"com.xiaomi.account"
	"com.miui.gallery" #MIUI Gallery
	#"com.xiaomi.discover" # !!! WARNING : Disable System app update (but not firmware update)
	#"com.mi.android.globalFileexplorer" #Stock Files Manager
	#"com.miui.home" #MIUI launcher. Install another launcher before deleting this one
	#******** ADVANCED DEBLOAT ********#

	#******** DO NOT DELETE ********#
	#"com.miui.securitycenter" ---- BOOTLOOP
	#"com.miui.securityadd" ------- BOOTLOOP
	#"com.xiaomi.finddevice" ------ BOOTLOOP
	)

declare -a sony_bloat=( 
	"com.sony.tvsideview.videoph" 
	"com.sonyericsson.android.addoncamera.artfilter" 
	"com.sonyericsson.android.omacp" 
	"com.sonyericsson.idd.agent" 
	"com.sonyericsson.mtp" 
	"com.sonyericsson.mtp.extension.backuprestore" 
	"com.sonyericsson.mtp.extension.update" 
	"com.sonyericsson.music"
	"com.sonyericsson.startupflagservice" 
	"com.sonyericsson.textinput.chinese" 
	"com.sonyericsson.unsupportedheadsetnotifier"  
	"com.sonyericsson.wappush" 
	"com.sonyericsson.warrantytime" 
	"com.sonyericsson.xhs"
	"com.sonyericsson.conversations.res.overlay _305"
	"com.sonyericsson.trackid.res.overlay_305"
	"com.sonymobile.themes.sou.cid18.black"
	"com.sonymobile.themes.sou.cid19.silver"
	"com.sonymobile.themes.sou.cid20.blue"
	"com.sonymobile.themes.sou.cid21.pink"

	"com.sonymobile.advancedlogging" 
	"com.sonymobile.advancedwidget.topcontacts"
	"com.sonymobile.android.addoncamera.soundphoto" 
	"com.sonymobile.android.contacts.res.overlay_305"
	"com.sonymobile.android.externalkeyboardjp"
	"com.sonymobile.anondata" 
	"com.sonymobile.aptx.notifier" 
	"com.sonymobile.assist" 
	"com.sonymobile.assist.persistent" 
	"com.sonymobile.camera"
	"com.sonymobile.cameracommon.wearablebridge" 
	"com.sonymobile.cellbroadcast.notification" 
	"com.sonymobile.coverapp2" 
	"com.sonymobile.demoappchecker" 
	"com.sonymobile.deviceconfigtool" 	 
	"com.sonymobile.dualshockmanager" 
	"com.sonymobile.email"
	"com.sonymobile.entrance" 
	"com.sonymobile.getmore.client"
	"com.sonymobile.getset" 
	"com.sonymobile.getset.priv"  
	"com.sonymobile.gettoknowit"
	"com.sonymobile.glovemode" 
	"com.sonymobile.googleanalyticsproxy"
	"com.sonymobile.intelligent.backlight" 
	"com.sonymobile.intelligent.gesture"
	"com.sonymobile.intelligent.iengine"
	"com.sonymobile.intelligent.observer" 
	"com.sonymobile.lifelog"
	"com.sonymobile.moviecreator.rmm"
	"com.sonymobile.mtp.extension.fotaupdate" 
	"com.sonymobile.music.googlelyricsplugin" 
	"com.sonymobile.music.wikipediaplugin"
	"com.sonymobile.music.youtubekaraokeplugin" 
	"com.sonymobile.music.youtubeplugin" 
	"com.sonymobile.pip" 
	"com.sonymobile.pobox" 
	"com.sonymobile.prediction" 
	"com.sonymobile.retaildemo" 
	"com.sonymobile.scan3d"
	"com.sonymobile.simlockunlockapp" 
	"com.sonymobile.smartcharger" 
	"com.sonymobile.support"
	"com.sonymobile.synchub" 
	"com.sonymobile.xperialounge.services" 
	"com.sonymobile.xperiaservices" 
	"com.sonymobile.xperiatransfermobile" 
	"com.sonymobile.xperiaweather"

	#*** ADVANCED DEBLOAT ****
	#"com.sonyericsson.album"
	#"com.sonyericsson.music"
	#"com.sonymobile.email"
	#"com.sonymobile.android.contacts"
	
	)

declare -a nokia_bloat=(
	"com.android.cellbroadcastreceiver.overlay.base.s600ww"
	"com.android.partnerbrowsercustomizations.btl.s600ww.overlay"
	"com.android.providers.calendar.overlay.base.s600ww"
	"com.android.providers.partnerbookmarks"
	"com.android.providers.settings.btl.s600ww.overlay"
	"com.android.providers.settings.overlay.base.s600ww"
	"com.android.retaildemo.overlay.base.s600ww"
	"com.android.simappdialog"
	"com.data.overlay.base.s600ww"
	"com.evenwell.apnwidget.overlay.base.s600ww"
	"com.evenwell.AprUploadService"
	"com.evenwell.AprUploadService.data.overlay.base.s600ww"
	"com.evenwell.autoregistration"
	"com.evenwell.autoregistration.overlay.base.s600ww"
	"com.evenwell.batteryprotect"
	"com.evenwell.batteryprotect.overlay.base.s600ww"
	"com.evenwell.bboxsbox"
	"com.evenwell.bboxsbox.app"
	"com.evenwell.bokeheditor"
	"com.evenwell.bokeheditor.overlay.base.s600ww"
	"com.evenwell.CPClient"
	"com.evenwell.CPClient.overlay.base.s600ww"
	"com.evenwell.custmanager"
	"com.evenwell.custmanager.data.overlay.base.s600ww"
	"com.evenwell.customerfeedback.overlay.base.s600ww"
	"com.evenwell.dataagent"
	"com.evenwell.dataagent.overlay.base.s600ww"
	"com.evenwell.DbgCfgTool"
	"com.evenwell.DbgCfgTool.overlay.base.s600ww"
	"com.evenwell.defaultappconfigure.overlay.base.s600ww"
	"com.evenwell.DeviceMonitorControl"
	"com.evenwell.DeviceMonitorControl.data.overlay.base.s600ww"
	"com.evenwell.email.data.overlay.base.s600ww"
	"com.evenwell.factorywizard"
	"com.evenwell.factorywizard.overlay.base.s600ww"
	"com.evenwell.fmradio"
	"com.evenwell.fmradio.overlay.base.s600ww"
	"com.evenwell.foxlauncher.partner"
	"com.evenwell.fqc"
	"com.evenwell.legalterm"
	"com.evenwell.legalterm.overlay.base.s600ww"
	"com.evenwell.managedprovisioning.overlay.base.s600ww"
	"com.evenwell.mappartner"
	"com.evenwell.nps"
	"com.evenwell.nps.overlay.base.s600ww"
	"com.evenwell.OTAUpdate"
	"com.evenwell.OTAUpdate.overlay.base.s600ww"
	"com.evenwell.partnerbrowsercustomizations.overlay.base.s600ww"
	"com.evenwell.permissiondetection"
	"com.evenwell.permissiondetection.overlay.base.s600ww"
	"com.evenwell.phone.overlay.base.s600ww"
	"com.evenwell.PowerMonitor"
	"com.evenwell.PowerMonitor.overlay.base.s600ww"
	"com.evenwell.providers.downloads.overlay.base.s600ww"
	"com.evenwell.providers.downloads.ui.overlay.base.s600ww"
	"com.evenwell.providers.partnerbookmarks.overlay.base.s600ww"
	"com.evenwell.providers.weather"
	"com.evenwell.providers.weather.overlay.base.s600ww"
	"com.evenwell.pushagent"
	"com.evenwell.pushagent.overlay.base.s600ww"
	"com.evenwell.retaildemoapp"
	"com.evenwell.retaildemoapp.overlay.base.s600ww"
	"com.evenwell.screenlock.overlay.base.s600ww"
	"com.evenwell.settings.data.overlay.base.s600ww"
	"com.evenwell.SettingsUtils"
	"com.evenwell.SettingsUtils.overlay.base.s600ww"
	"com.evenwell.SetupWizard"
	"com.evenwell.setupwizard.btl.s600ww.overlay"
	"com.evenwell.SetupWizard.overlay.base.s600ww"
	"com.evenwell.stbmonitor"
	"com.evenwell.stbmonitor.data.overlay.base.s600ww"
	"com.evenwell.tele"
	"com.evenwell.telecom.data.overlay.base.s600ww"
	"com.evenwell.UsageStatsLogReceiver"
	"com.evenwell.UsageStatsLogReceiver.data.overlay.base.s600ww"
	"com.evenwell.weather.overlay.base.s600ww"
	"com.evenwell.weatherservice"
	"com.evenwell.weatherservice.overlay.base.s600ww"
	"com.fih.infodisplay"
	"com.fih.StatsdLogger"
	"com.foxconn.ifaa"
	"com.hmdglobal.datago.overlay.base.s600ww"
	"com.quicinc.cne.CNEService"

	#************DEBLOAT AVANCE***********#
	#Inbuilt camera -> can be replaced by Open-camera 
	"com.hmdglobal.camera2"
	"com.evenwell.camera2"
	"com.hmdglobal.support"
	"com.evenwell.hdrservice"
	###############
	)

declare -a asus_bloat=(
	"com.asus.soundrecorder"                     
	"com.caf.fmradio" #Radio app (Transistor [https://f-droid.org/en/packages/org.y20k.transistor/] is much better)
	"com.huaqin.FM"                                                  
	"com.generalmobi.go2pay"                                
	"com.asus.ia.asusapp"                        
	"id.co.babe"                                 
	"com.pure.indosat.care"                      
	"com.shopee.id"                                                        
	#******** DEBLOAT AVANCE *******#
	#"com.asus.calculator"                        
	)

declare -a lg_bloat=(
	"com.android.LGSetupWizard"
	"com.lge.appbox.client"
	"com.lge.bnr"
	"com.lge.bnr.launcher"
	"com.lge.cic.eden.service"
	"com.lge.clock"
	"com.lge.cloudhub"
	"com.lge.drmservice"
	"com.lge.easyhome"
	"com.lge.eltest"
	"com.lge.email"
	"com.lge.eula"
	"com.lge.eulaprovider"
	"com.lge.fmradio"
	"com.lge.friendsmanager"
	"com.lge.gallery.collagewallpaper"
	"com.lge.gallery.vr.wallpaper"
	"com.lge.gcuv"
	"com.lge.gestureanswering"
	"com.lge.gnss.airtest"
	"com.lge.gnsslogcat"
	"com.lge.gnsspostest"
	"com.lge.gnsstest"
	"com.lge.hifirecorder"
	"com.lge.homeselector"
	"com.lge.hotspotlauncher"
	"com.lge.ia.task.incalagent"
	"com.lge.ia.task.smartcare"
	"com.lge.ia.task.smartsetting"
	"com.lge.iftttmanager"
	"com.lge.ime"
	"com.lge.ime.solution.handwriting"
	"com.lge.ime.solution.text"
	"com.lge.launcher2"
	"com.lge.launcher2.theme.optimus"
	"com.lge.launcher3"
	"com.lge.leccp"
	"com.lge.lgaccount"
	"com.lge.lgdrm.permission"
	"com.lge.lginstallservies"
	"com.lge.lgmapui"
	"com.lge.lgsetupview"
	"com.lge.lgworld"
	"com.lge.lifetracker"
	"com.lge.mirrorlink"
	"com.lge.mlt"
	"com.lge.mtalk.sf"
	"com.lge.musicshare"
	"com.lge.myplace"
	"com.lge.myplace.engine"
	"com.lge.phonemanagement"
	"com.lge.privacylock"
	"com.lge.qhelp"
	"com.lge.qhelp.application"
	"com.lge.qmemoplus"
	"com.lge.remote.lgairdrive"
	"com.lge.remote.setting"
	"com.lge.sizechangable.musicwidget.widget"
	"com.lge.sizechangable.weather"
	"com.lge.sizechangable.weather.platform"
	"com.lge.sizechangable.weather.theme.optimus"
	"com.lge.smartdoctor.webview"
	"com.lge.smartshare"
	"com.lge.smartshare.provider"
	"com.lge.smartsharepush"
	"com.lge.snappage"
	"com.lge.springcleaning"
	"com.lge.sync"
	"com.lge.updatecenter"
	"com.lge.video.vr.wallpaper"
	"com.lge.videoplayer"
	"com.lge.videostudio"
	"com.lge.voicecare"
	"com.lge.vrplayer"
	"com.lge.wernicke"
	"com.lge.wernicke.nlp"
	"com.lge.wfd.spmirroring.source"	
	"com.lge.wfds.service.v3"
	"com.lge.wifi.p2p"
	"com.lge.wifihotspotwidget"
	"com.nextradioapp.nextradio"
	#******** DEBLOAT AVANCE ********#
	#"com.lge.filemanager"  #Stock file manager
	"com.lge.music"         #Stock music player
	#"com.lge.floatingbar"  #Floating bar
	)

