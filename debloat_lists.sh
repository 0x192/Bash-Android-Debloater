#!/bin/bash

declare -a brands=("Asus" "Huawei" "LG" "Nokia" "Samsung" "Sony" "Xiaomi")

declare -a google_bloat=(
	"com.android.hotwordenrollment.okgoogle" #OK Google
	"com.chrome.beta"
	"com.chrome.canary"
	"com.chrome.dev"
	"com.google.android.apps.access.wifi.consumer"
	"com.google.android.apps.adm"
	"com.google.android.apps.ads.publisher"
	"com.google.android.apps.adwords"
	"com.google.android.apps.authenticator2"
	"com.google.android.apps.blogger"
	"com.google.android.apps.books" #Google Books.
	"com.google.android.apps.chromecast.app"
	"com.google.android.apps.cloudprint" #Cloud print.
	"com.google.android.apps.cultural"
	"com.google.android.apps.currents" #Currents.
	"com.google.android.apps.docs" #Google Drive.
	"com.google.android.apps.docs.editors.docs"
	"com.google.android.apps.docs.editors.sheets"
	"com.google.android.apps.docs.editors.slides"
	"com.google.android.apps.dynamite"
	"com.google.android.apps.enterprise.cpanel"
	"com.google.android.apps.enterprise.dmagent"
	"com.google.android.apps.fireball"
	"com.google.android.apps.fitness" #Google Fit.
	"com.google.android.apps.freighter"
	"com.google.android.apps.giant"
	"com.google.android.apps.googleassistant"
	"com.google.android.apps.handwriting.ime"
	"com.google.android.apps.hangoutsdialer"
	"com.google.android.apps.inbox"
	"com.google.android.apps.inputmethod.hindi"
	"com.google.android.apps.kids.familylink"
	"com.google.android.apps.kids.familylinkhelper"
	"com.google.android.apps.m4b"
	"com.google.android.apps.magazines" #Google magazines
	"com.google.android.apps.maps"
	"com.google.android.apps.mapslite"
	"com.google.android.apps.meetings"
	"com.google.android.apps.messaging"
	"com.google.android.apps.navlite"
	"com.google.android.apps.nbu.files"
	"com.google.android.apps.paidtasks"
	"com.google.android.apps.pdfviewer"
	"com.google.android.apps.photos" #Google Photos.
	"com.google.android.apps.photos.scanner"
	"com.google.android.apps.plus" #Google+.
	"com.google.android.apps.podcasts"
	"com.google.android.apps.restore" #Restore apps during first boot.
	"com.google.android.apps.santatracker"
	"com.google.android.apps.subscriptions.red"
	"com.google.android.apps.tachyon" #Google Duo.
	"com.google.android.apps.tasks"
	"com.google.android.apps.translate"
	"com.google.android.apps.travel.onthego"
	"com.google.android.apps.vega"
	"com.google.android.apps.walletnfcrel"
	"com.google.android.apps.wallpaper" #Google Wallpapers. Safe to remove.
	"com.google.android.apps.wellbeing" #Digital Wellbeing app that is prebuilt in Android Pie. Safe to remove.
	"com.google.android.apps.youtube.creator"
	"com.google.android.apps.youtube.gaming"
	"com.google.android.apps.youtube.kids"
	"com.google.android.apps.youtube.music"
	"com.google.android.apps.youtube.vr"
	"com.google.android.backuptransport" #Allows Android apps to back up their data on Google servers.
	"com.google.android.calculator"
	"com.google.android.calendar" #Google Calendar (NOTE SURE maybe "com.google.android.apps.calendar")
	"com.google.android.configupdater"
	"com.google.android.contacts"
	"com.google.android.drive" #Google Drive
	"com.google.android.ext.services"
	"com.google.android.ext.shared"
	"com.google.android.feedback" #When an app crashes, this is the app that briefly asks you if you want to feedback the crash on the market, Google Play Store.
	"com.google.android.gm"
	"com.google.android.googlequicksearchbox" #Google Search.
	"com.google.android.ims"
	"com.google.android.inputmethod.japanese"
	"com.google.android.inputmethod.korean"
	"com.google.android.inputmethod.pinyin"
	"com.google.android.keep"
	"com.google.android.markup" #Google Markup app made for modifying pictures, ships by default on every Pie+ device.
	"com.google.android.marvin.talkback"         
	"com.google.android.music" #Google Music 
	"com.google.android.onetimeinitializer" #Provides first time setup, safe to remove.
	"com.google.android.partnersetup" #Software that helps other apps to work with Google products.
	"com.google.android.play.games" #Google Play Games.
	"com.google.android.printservice.recommendation"
	"com.google.android.projection.gearhead"
	"com.google.android.setupwizard" #Removable after the first start of the phone, it's the basic configuration wizard that drives you through first boot.
	"com.google.android.soundpicker" #Google Sounds. Removable if you already have another media select service.
	"com.google.android.street" #Google Street View app.
	"com.google.android.syncadapters.calendar" #Google Calendar sync.
	"com.google.android.syncadapters.contacts" #Google Contacts sync.
	"com.google.android.talk" #Google Hangouts.
	"com.google.android.tts" #Text-to-speech powers apps to read text on your scream aloud, in many languages #Google Play Movies #Google Videos
	"com.google.android.tv.remote"
	"com.google.android.videos"
	"com.google.android.vr.home"
	"com.google.android.vr.inputmethod"
	"com.google.android.wearable.app"
	"com.google.android.youtube" #YouTube app.
	"com.google.ar.core" #Google ARCore app (Augmented Reality)
	"com.google.ar.lens" #Google AR again
	"com.google.chromeremotedesktop"
	"com.google.earth"
	"com.google.marvin.talkback" #Adds some features about accessibility settings.
	"com.google.samples.apps.cardboarddemo"
	"com.google.tango.measure" #Google Measure app. 
	"com.google.vr.cyclops"
	"com.google.vr.expeditions"
	"com.google.vr.vrcore" # VR stuff
	"com.google.zxing.client.android"
	"com.niksoftware.snapseed"

	#**********DEBLOAT AVANCE**********#
	#"com.google.android.webview"
	"com.google.android.launcher" #Google Now Launcher
	"com.android.chrome" #Chrome app
	"com.google.android.deskclock" #Default clock app
	"com.google.android.gm" #G-mail app.
	#"com.android.vending" #Google Play Store app.
	"com.google.android.apps.maps" #Google maps
	"com.google.android.apps.photos" #Application photo
	#"com.google.android.packageinstaller" #Gives ability to install, update or remove applications on the device --> !!!! WARNING : Bootloop on Xiaomi Note 5 
	#"com.google.android.gms" #Google Play Services ----------------------------------- DO NOT remove this unless you know what you're doing ! --> No Bootloop on Xiaomi Note 5
	#"com.google.android.gsf" #Google Services Framework, needed for Google Apps ------ DO NOT remove this unless you know what you're doing ! --> No Bootloop on Xiaomi Note 5
	#"com.google.android.gsf.login" #Support for managing Google accounts ------------- DO NOT remove this unless you know what you're doing !
	#"com.google.android.inputmethod.latin" #Google Board (Clavier Google).
	#**********DEBLOAT AVANCE**********#
	)

declare -a samsung_bloat=(
	"com.android.dreams.phototable"
	"com.android.exchange"
	#"com.sec.android.app.desktoplauncher"
	#"com.samsung.android.mdx" 
	"com.dsi.ant.plugins.antplus" #Samsung+ ?
	"com.enhance.gameservice"
	"com.samsung.android.calendar"
	"com.samsung.android.app.episodes"
	"com.samsung.android.app.ledcoverdream"
	"com.samsung.android.app.memo"
	"com.samsung.android.app.reminder"
	"com.samsung.android.smartmirroring"
	"com.samsung.android.app.sbrowseredge"
	"com.samsung.android.app.storyalbumwidge"
	"com.samsung.android.app.vrsetupwizardstub"
	"com.samsung.android.app.watchmanager"
	"com.samsung.android.drivelink.stub"
	"com.samsung.android.email.provider"
	"com.samsung.android.game.gamehome"
	"com.samsung.android.game.gametools"
	"com.samsung.android.hmt.vrshell"
	"com.samsung.android.hmt.vrsvc"
	"com.samsung.android.samsungpass"
	"com.samsung.android.scloud" # Samsung Cloud
	"com.samsung.android.service.travel"
	"com.samsung.android.spay"
	"com.samsung.android.spayfw" #Samsung Pay Framework"
	"com.samsung.android.spdfnote"
	"com.samsung.android.svoice"
	"com.samsung.android.tripwidget"
	#"com.samsung.android.mobileservice"
	"com.samsung.android.voicewakeup"
	"com.samsung.android.weather" # Météo
	"com.samsung.android.widgetapp.yahooedge.finance"
	"com.samsung.android.widgetapp.yahooedge.sport"
	"com.samsung.groupcast"
	"com.samsung.svoice.sync"
	"com.samsung.voiceserviceplatform"
	"com.sec.android.app.gamehub"
	"com.sec.android.app.ocr"
	"com.sec.android.app.samsungapps"
	"com.sec.android.app.sbrowser" # Navigateur internet par defaut
	"com.sec.android.app.shealth"
	"com.sec.android.app.translator"
	"com.sec.android.app.withtv"
	"com.sec.android.cover.ledcover"
	"com.sec.android.provider.snote"
	"com.sec.android.service.health"
	"com.sec.android.sidesync30"
	"com.sec.android.widgetapp.diotek.smemo"
	"com.sec.android.widgetapp.samsungapps"
	"com.sec.everglades"
	"com.sec.everglades.update"
	"com.sec.kidsplat.installer"
	"com.sec.readershub"
	"com.sec.spp.push"
	"com.sec.yosemite.phone"
	"com.tripadvisor.tripadvisor"
	"com.vlingo.midas"
	"tv.peel.samsung.app"

	########## Galaxy S10 #############
	# BIXBY
	#"com.samsung.android.bixby.wakeup"
	#"com.samsung.android.app.spage"
	#"com.samsung.android.app.routines"
	#"com.samsung.android.bixby.service"
	#"com.samsung.android.visionintelligence"
	#"com.samsung.android.bixby.agent"
	#"com.samsung.android.bixby.agent.dummy"
	#"com.samsung.android.bixbyvision.framework"

	# GENERAL SYSTEM
	"com.dsi.ant.sample.acquirechannels"
	"com.dsi.ant.service.socket"
	"com.dsi.ant.server"
	"com.dsi.ant.plugins.antplus"
	"com.samsung.android.app.social"
	"com.samsung.android.app.watchmanagerstub"
	"com.samsung.android.mateagent"
	"com.sec.android.app.launcher"
	"com.sec.android.daemonapp"
	"com.sec.android.easyMover.Agent"
	"com.sec.android.easyonehand"

	# SAMSUNG PASS / PAY
	"com.samsung.android.samsungpassautofill"
	"com.samsung.android.authfw"
	"com.samsung.android.spayfw"

	# GIMMICKY APPS
	"com.samsung.android.aremoji"
	"com.google.ar.core"
	"flipboard.boxer.app"
	"com.samsung.android.wellbeing"
	"com.samsung.android.da.daagent"
	"com.samsung.android.service.livedrawing"
	"com.sec.android.mimage.avatarstickers"

	# PRINTING
	"com.android.printspooler"

	# SAMSUNG EMAIL
	"com.wsomacp"

	# SAMSUNG GAME LAUNCHER
	"com.samsung.android.game.gos"
	"com.samsung.android.gametuner.thin"

	# SAMSUNG KIDS
	"com.samsung.android.kidsinstaller"
	"com.samsung.android.app.camera.sticker.facearavatar.preload"

	# SAMSUNG LED COVER
	"com.samsung.android.app.ledbackcover"

	# EDGE
	"com.samsung.android.service.peoplestripe"

	# SAMSUNG DEX
	"com.sec.android.desktopmode.uiservice"
	"com.samsung.desktopsystemui"
	)

declare -a T_Mobile_bloat=(
	"com.tmobile.services.nameid" #Name ID T-Mobile
	"com.mobitv.client.tmobiletvhd"
	"us.com.dt.iq.appsource.tmobile"
	"com.tmobile.pr.mytmobile"
	"com.tmobile.simlock"
	"com.whitepages.nameid.tmobile"
	"com.tmobile.pr.adapt"
	"com.tmobile.vvm.application"
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
	)

declare -a facebook_bloat=(
	"com.facebook.katana"
	"com.facebook.system"
	"com.facebook.appmanager"
	"com.facebook.services"
	"com.facebook.orca"
	"com.whatsapp"
	"com.instagram.android"
	)

declare -a misc_bloat=(
	"flipboard.app"
	"flipboard.boxer.app"
	"com.hancom.office.editor.hidden"
	"com.audible.application"
	"com.blurb.checkout"
	"com.cequint.ecid"
	"com.imdb.mobile"
	"com.gotv.nflgamecenter.us.lite"
	"com.infraware.polarisoffice5"
	"com.nuance.swype.input"
	"com.booking"
	"com.ebay.mobile"
	"com.netflix.partner.activation"
	"com.netflix.mediaclient"
	"com.spotify.music"
	"com.evernote"
	"com.UCMobile.intl"
	"com.opera.mini.native"
	"com.opera.app.news"
	"com.til.timesnews"
	"com.opera.branding"
	"in.mohalla.sharechat"
	"com.micredit.in"
	"flipboard.boxer.app"
	"com.s.antivirus"
	"com.enhance.gameservice"
	"com.linkedin.android"
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
	"com.android.keychain" # ????? (Sony)
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
	"com.android.quicksearchbox" #Search box.
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
	"com.qualcomm.qti.rcsbootstraputil"
	"com.qualcomm.qti.rcsimsbootstraputil"
	"com.qualcomm.timeservice"


	#******** DEBLOAT AVANCE ********#
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
	#"com.android.vpndialogs" #VPN system.
	#"com.android.phone.recorder" #Call recorder function.
	#"com.android.providers.userdictionary" #User dictionary for keyboard apps.
	"contacts.com.android.providers.calendar" #Necessary to sync stock Calendar app and let it work correctly.
	#"com.android.backupconfirm" #Restore google settings with Google Backup restore function. Essential package for ADB backup !! 
	#******** DEBLOAT AVANCE ********#
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
	#******** DEBLOAT AVANCE ********#
	#"com.hisi.mapcon " #Don't disable/remove this if you use WiFi Calling, or it'll kill the app. If you don't use WiFi Calling, this is safe to remove. (Thanks @mj084 !)
	#"com.huawei.hidisk " #Huawei File Manager app.
	#******** DEBLOAT AVANCE ********#
	)

declare -a xiaomi_bloat=(
	"android.autoinstalls.config.Xiaomi.cepheus"
	"android.autoinstalls.config.Xiaomi.dipper"
	"com.android.browser" # Xiaomi Browser
	"com.android.wallpaper.holospiral"
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
	"com.mi.webkit.core"
	"com.milink.service"
	"com.mipay.wallet"
	"com.mipay.wallet.id"
	"com.mipay.wallet.in"
	"com.miui.analytics"
	"com.miui.android.fashiongallery" # Wallpapers by xiaomi
	"com.miui.antispam"
	"com.miui.audioeffect"
	"com.miui.bugreport"
	"com.miui.cit"
	"com.miui.cleanmaster"
	"com.miui.cloudbackup"
	"com.miui.cloudservice" # Settings will crash when pressing on any "Mi Cloud" button
	"com.miui.cloudservice.sysbase"
	"com.miui.compass"
	"com.miui.contentcatcher"
	"com.miui.daemon"
	"com.miui.enbbs" # Xiaomi Forums
	"com.eterno"
	"com.miui.fm"
	"com.miui.greenguard"
	"com.miui.hybrid"
	"com.miui.hybrid.accessory"
	"com.miui.klo.bugreport"
	"com.miui.micloudsync"
	"com.miui.miwallpaper"
	"com.miui.msa.global" # MIUI System Ads Solution
	"com.miui.nextpay"
	"com.miui.notes"
	"com.miui.personalassistant"
	"com.miui.player"
	"com.miui.providers.weather"
	"com.miui.qr"
	"com.miui.screenrecorder"
	"com.miui.systemAdSolution"
	"com.miui.touchassistant" # Quick Ball/Touch Assistant
	"com.miui.translation.kingsoft"
	"com.miui.translation.xmcloud"
	"com.miui.translation.youdao"
	"com.miui.translationservice"
	"com.miui.userguide"
	"com.miui.video"
	"com.miui.videoplayer"
	"com.miui.videoplayer.overlay"
	"com.miui.virtualsim"
	"com.miui.vsimcore"
	"com.miui.weather2"
	"com.miui.yellowpage"
	"com.opera.preinstall"
	"com.phonepe.app"
	"com.qiyi.video"
	"com.samsung.aasaservice"
	"com.sec.android.AutoPreconfig"
	"com.sec.android.service.health"
	"com.sohu.inputmethod.sogou.xiaomi"
	"com.xiaomi.ab"
	"com.xiaomi.channel"
	"com.xiaomi.gamecenter.sdk.service"
	"com.xiaomi.glgm"
	"com.xiaomi.joyose"
	"com.xiaomi.jr"
	"com.xiaomi.lens"
	"com.xiaomi.micloud.sdk"
	"com.xiaomi.midrop"
	"com.xiaomi.midrop.overlay"
	"com.xiaomi.mipicks"
	"com.xiaomi.mirecycle"
	"com.xiaomi.o2o"
	"com.xiaomi.oversea.ecom"
	"com.xiaomi.pass"
	"com.xiaomi.payment"
	"com.xiaomi.providers.appindex"
	"com.xiaomi.scanner"
	"com.xiaomi.shop"
	"com.xiaomi.vipaccount"
	"org.codeaurora.gps.gpslogsave"
	"org.simalliance.openmobileapi.service"
	#******** DEBLOAT AVANCE ********#
	"com.xiaomi.account"
	"com.miui.gallery" #MIUI Gallery
	#"com.xiaomi.discover" # !!! WARNING : Disable System app update (but not firmware update)
	#"com.mi.android.globalFileexplorer" #Stock Files Manager
	#"com.miui.home" #MIUI launcher. Install another launcher before deleting this one
	#******** DEBLOAT AVANCE ********#

	#******** DO NOT DELETE ********#
	#"com.miui.securitycenter" ---- BOOTLOOP
	#"com.miui.securityadd" ------- BOOTLOOP
	#"com.xiaomi.finddevice" ------ BOOTLOOP
	)

declare -a sony_bloat=(
	"com.android.htmlviewer" 
	"com.android.partnerbrowsercustomizations.chromeHomepage" 
	"com.android.sharedstoragebackup" 
	"com.s.antivirus" 
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
	"org.simalliance.openmobileapi.service" 
	)

declare -a nokia_bloat=(
	"com.android.bips"
	"com.android.calllogbackup"
	"com.android.cellbroadcastreceiver.overlay.base.s600ww"
	"com.android.partnerbrowsercustomizations.btl.s600ww.overlay"
	"com.android.printspooler"
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
	"com.caf.fmradio" 
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
	"com.android.printspooler"
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
	"com.LogiaGroup.LogiaDeck"
	"com.lookout"
	"com.mobitv.client.tmobiletvhd"
	"com.nextradioapp.nextradio"
	"com.tmobile.pr.adapt"
	"com.tmobile.pr.mytmobile"
	"com.tmobile.services.nameid"
	"com.tmobile.simlock"

	#******** DEBLOAT AVANCE ********#
	#"com.lge.filemanager"  #Stock file manager
	"com.lge.music"         #Stock music player
	#"com.lge.floatingbar"  #Floating bar
	)

