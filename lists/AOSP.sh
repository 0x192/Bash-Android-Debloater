#!/bin/bash

declare -a AOSP_bloat=(
	"com.android.sharedstoragebackup"
	"com.android.apps.tag" #Still unclear how it acts with system, but should be safe to remove...
	"com.android.backupconfirm"
	"com.android.bips" #Built-in Print Service. Safe to remove.
	"com.android.bluetoothmidiservice" #Provides classes for sending and receiving messages using the MIDI event protocol over Bluetooth LE.
	"com.android.bookmarkprovider" #Found on Xiaomi Note 5
	"com.android.browser" #Stock Browser
	"com.android.calculator2" #Stock calculator app.
	"com.android.calllogbackup"
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
	"com.qualcomm.atfwd"
	"com.qualcomm.qti.qms.service.telemetry"
	"com.LogiaGroup.LogiaDeck"
	"com.vcast.mediamanager"
	"com.sec.android.service.health"
	"com.lookout"
	"org.simalliance.openmobileapi.service"


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
	#"com.android.browser.provider" # ???????????????
	#"com.android.vpndialogs" #VPN system.
	#"com.android.phone.recorder" #Call recorder function.
	#"com.android.providers.userdictionary" #User dictionary for keyboard apps.
	"contacts.com.android.providers.calendar" #Necessary to sync stock Calendar app and let it work correctly.
	#"com.android.backupconfirm" #Restore google settings with Google Backup restore function. Essential package for ADB backup !! 
	#******** DEBLOAT AVANCE ********#
	)
