#!/bin/bash

declare -a brands=("Asus" "Huawei" "LG,Nokia" "Samsung" "Xiaomi")

declare -a google_bloat=(
	"com.android.chrome" #Chrome app
	"com.google.android.apps.books" #Google Books.
	"com.google.android.apps.cloudprint" #Cloud print.
	"com.google.android.apps.currents" #Currents.
	"com.google.android.apps.docs" #Google Drive.
	"com.google.android.apps.fitness" #Google Fit.
	"com.google.android.apps.magazines" #Google magazines
	"com.google.android.apps.photos" #Google Photos.
	"com.google.android.apps.plus" #Google+.
	"com.google.android.apps.restore" #Restore apps during first boot.
	"com.google.android.apps.tachyon" #Google Duo.
	"com.google.android.apps.wallpaper" #Google Wallpapers. Safe to remove.
	"com.google.android.apps.wellbeing" #Digital Wellbeing app that is prebuilt in Android Pie. Safe to remove.
	"com.google.android.backuptransport" #Allows Android apps to back up their data on Google servers.
	"com.google.android.drive" #Google Drive
	"com.google.android.feedback" #When an app crashes, this is the app that briefly asks you if you want to feedback the crash on the market, Google Play Store.
	"com.google.android.gm" #G-mail app.
	"com.google.android.googlequicksearchbox" #Google Search.
	"com.google.android.markup" #Google Markup app made for modifying pictures, ships by default on every Pie+ device.
	"com.google.android.music" #Google Music
	"com.google.android.onetimeinitializer" #Provides first time setup, safe to remove.
	"com.google.android.partnersetup" #Software that helps other apps to work with Google products.
	"com.google.android.play.games" #Google Play Games.
	"com.google.android.printservice.recommendation"
	"com.google.android.setupwizard" #Removable after the first start of the phone, it's the basic configuration wizard that drives you through first boot.
	"com.google.android.soundpicker" #Google Sounds. Removable if you already have another media select service.
	"com.google.android.street" #Google Street View app.
	"com.google.android.syncadapters.calendar" #Google Calendar sync.
	"com.google.android.syncadapters.contacts" #Google Contacts sync.
	"com.google.android.talk" #Google Hangouts.
	"com.google.android.tts" #Text-to-speech powers apps to read text on your scream aloud, in many languages.
	"com.google.android.videos" #Google Play Movies.
	"com.google.android.videos" #Google Videos
	"com.google.android.youtube" #YouTube app.
	"com.google.ar.core" #Google ARCore app.
	"com.google.marvin.talkback" #Adds some features about accessibility settings.
	"com.google.tango.measure" #Google Measure app. 
	"com.google.vr.vrcore" # VR stuff
	#**********DEBLOAT AVANCE**********#
	#"com.android.vending" #Google Play Store app.
	#"com.google.android.apps.maps" #Google maps
	#"com.google.android.apps.photos" #Application photo
	#"com.google.android.gms" #Google Play Services. DO NOT remove this.
	#"com.google.android.gsf" #Google Services Framework, needed for Google Apps. DO NOT remove this.
	#"com.google.android.gsf.login" #Support for managing Google accounts. DO NOT remove this.
	#"com.google.android.inputmethod.latin" #Google Board (Clavier Google).
	#**********DEBLOAT AVANCE**********#
	)

declare -a samsung_bloat=(
	"com.android.dreams.phototable"
	"com.android.exchange"
	"com.dsi.ant.plugins.antplus" #Samsung+ ?
	"com.enhance.gameservice"
	"com.samsung.android.app.episodes"
	"com.samsung.android.app.ledcoverdream"
	"com.samsung.android.app.memo"
	"com.samsung.android.app.sbrowseredge"
	"com.samsung.android.app.storyalbumwidget"
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
	"com.samsung.android.voicewakeup"
	"com.samsung.android.weather" # Météo
	"com.samsung.android.widgetapp.yahooedge.finance"
	"com.samsung.android.widgetapp.yahooedge.sport"
	"com.samsung.groupcast"
	"com.samsung.svoice.sync"
	"com.samsung.voiceserviceplatform"
	"com.sec.android.app.desktoplauncher"
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
	)

declare -a facebook_bloat=(
	"com.facebook.katana"
	"com.facebook.system"
	"com.facebook.appmanager"
	"com.facebook.services"
	"com.facebook.orca"
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
	)

declare -a microsoft_bloat=(
	"com.microsoft.skydrive"
	"com.skype.raider"
	"com.microsoft.office.excel"
	"com.microsoft.office.word"
	"com.microsoft.office.powerpoint"
	)

declare -a generic_bloat=(
	"com.android.apps.tag" #Still unclear how it acts with system, but should be safe to remove...
	"com.android.bips" #Built-in Print Service. Safe to remove.
	"com.android.bluetoothmidiservice" #Provides classes for sending and receiving messages using the MIDI event protocol over Bluetooth LE.
	"com.android.browser" #Stock Browser
	"com.android.calculator2" #Stock calculator app.
	"com.android.carrierconfig" #Provides access to telephony configuration values that are carrier-specific.
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
	"com.android.phasebeam" #Wallpaper.
	"com.android.printservice.reccomendation" #Keep it, if you need to print directly via your phone.
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


	#******** DEBLOAT AVANCE ********#
	#"com.android.calendar" #Stock calendar app.
	#"com.android.contacts" #Stock contacts app.
	#"com.android.email" #Stock Email app (not Gmail).
	#"com.android.emergency" #Emergency Contacts. Remove it if you don't use this feature.
	#"com.android.facelock" #Essential if you wanna use Face Unlock features, removable if you don't want to.
	#"com.android.gallery3d" #Gallery app.
	#"com.android.inputmethod.latin" #AOSP keyboard.
	#"com.android.mms" #Stock SMS app.
	#"com.android.phone" #Dialer app.
	#"com.android.providers.blockednumber" #Storage of blocked numbers.
	#"com.android.vpndialogs" #VPN system.
	#"com.android.phone.recorder" #Call recorder function.
	#"com.android.providers.userdictionary" #User dictionary for keyboard apps.
	#"contacts.com.android.providers.calendar" #Necessary to sync stock Calendar app and let it work correctly.
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
	"com.android.wallpaper.holospiral"
	"com.autonavi.minimap"
	"com.baidu.duersdk.opensdk"
	"com.baidu.input_mi"
	"com.baidu.searchbox"
	"com.bsp.catchlog"
	"com.caf.fmradio"
	"com.duokan.phone.remotecontroller"
	"com.duokan.phone.remotecontroller.peel.plugin"
	"com.mfashiongallery.emag"
	"com.mi.android.globalpersonalassistant"
	"com.mi.global.bbs"
	"com.mi.globalTrendNews"
	"com.mi.liveassistant"
	"com.milink.service"
	"com.mipay.wallet"
	"com.mipay.wallet.id"
	"com.mipay.wallet.in"
	"com.miui.analytics"
	"com.miui.audioeffect"
	"com.miui.bugreport"
	"com.miui.cit"
	"com.miui.cleanmaster"
	"com.miui.cloudbackup"
	"com.miui.cloudservice"
	"com.miui.cloudservice.sysbase"
	"com.miui.compass"
	"com.miui.contentcatcher"
	"com.miui.daemon"
	"com.miui.enbbs"
	"com.miui.fm"
	"com.miui.greenguard"
	"com.miui.hybrid"
	"com.miui.hybrid.accessory"
	"com.miui.klo.bugreport"
	"com.miui.micloudsync"
	"com.miui.miwallpaper"
	"com.miui.msa.global"
	"com.miui.nextpay"
	"com.miui.notes"
	"com.miui.personalassistant"
	"com.miui.player"
	"com.miui.qr"
	"com.miui.screenrecorder"
	"com.miui.systemAdSolution"
	"com.miui.touchassistant"
	"com.miui.translation.kingsoft"
	"com.miui.translation.xmcloud"
	"com.miui.translation.youdao"
	"com.miui.translationservice"
	"com.miui.userguide"
	"com.miui.video"
	"com.miui.videoplayer"
	"com.miui.virtualsim"
	"com.miui.vsimcore"
	"com.miui.weather2"
	"com.miui.yellowpage"
	"com.opera.preinstall"
	"com.qiyi.video"
	"com.qualcomm.qti.perfdump"
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
	"com.xiaomi.midrop"
	"com.xiaomi.mipicks"
	"com.xiaomi.o2o"
	"com.xiaomi.pass"
	"com.xiaomi.payment"
	"com.xiaomi.providers.appindex"
	"com.xiaomi.scanner"
	"com.xiaomi.shop"
	"com.xiaomi.vipaccount"
	"org.codeaurora.gps.gpslogsave"
	"org.simalliance.openmobileapi.service"
	#******** DEBLOAT AVANCE ********#
	"com.miui.gallery" #MIUI Gallery 
	#******** DEBLOAT AVANCE ********#
	)
