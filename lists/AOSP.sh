#!/bin/bash

declare -a AOSP_bloat=(

	#####################  SAFE TO DEBLOAT (useless features)  #####################

	"com.android.apps.tag"
	# NFC Tagging (5 permissions : Contacts/Phone On by default).
	# https://en.wikipedia.org/wiki/TecTile
	# It will NOT prevent you to use NFC devices (like speakers)

	"com.android.bips"
	# Default print Service.
	# Safe to remove if you don't plan to print from your phone.

	"com.android.bluetoothmidiservice"
	# Provides classes for using the MIDI protocol over Bluetooth. Safe to remove if you don't plan to connect MIDI devices. 
	# (Seriously, use a PC if you want to do this !)

	"com.android.bookmarkprovider" 
	# Only exist for compatibility reasons to prevent apps querying it from getting null cursors they do not expect and crash.

	"com.android.carrierconfig"
	# Provides access to telephony configuration values that are carrier-specific.

	"com.android.carrierdefaultapp"
	# Allows carrier customization. Carrier action upon specific signal.

	"com.android.dreams.basic" 
	# Daydream (not Google Daydream VR) is an interactive screensaver mode built into Android. 
	# When you dock your Android phone or tablet or charge it, its screen normally stays off. 
	# When you enable Daydream mode, the device’s screen will stay on and display the Daydream app you choose. 
	# You can use this to display the time, weather, quotes, photos, news, tweets, or anything else that developers write a Daydream app for.
	# https://developer.android.com/reference/android/service/dreams/DreamService

	"com.android.dreams.phototable" 
	# Photographic screensavers (Daydream stuff, see above)

	"com.android.egg" 
	# Android build's easter egg feature (when you click 5 times on the android version in the settings)

	"com.android.htmlviewer" 
	# In-built HTML viewer. Basically lets you read HTML files stored on your device.
	# REMINDER : A web-browser can also read HTML files...

	"com.android.inputdevices"
	# Empty package ? 
	# https://android.googlesource.com/platform/frameworks/base/+/master/packages/InputDevices/src/com/android/inputdevices/InputDeviceReceiver.java

	"com.android.magicsmoke" 
	# "Magic smoke" Live wallpaper.

	"com.android.managedprovisioning"
	# Manage separate profile on devices. The typical example is setting up a corporate profile that is controlled by their employer on a
	# users personal device to keep personal and work data separate.
	# Safe to remove

	"com.android.noisefield" 
	# "Noise filed" live wallpaper.

	"com.android.phasebeam" 
	# "Phase beam" live wallpaper

	"com.android.printservice.recommendation" 
	# Keep it, if you need to print directly via your phone.

	"com.android.printspooler"
	# Print spooler. Manage the printing process. 
	# Safe to remove if you don't plan to print from your phone

	"com.android.providers.partnerbookmarks" 
	# Provides bookmarks about partners of Google in Chrome.

	"com.android.simappdialog"
	# Sim App Dialog
	# Used to install the carrier SIM app when the SIM is inserted.

	"com.android.soundrecorder" 
	# Sound recorder, obviously. 

	"com.android.stk" 
	# SIM toolkit app. Enable carriers to make SIM cards initiate "value-added services" (== some crappy stuff)
	# Basically, Some operators give SIMs which has applications installed in it. 
	# https://en.wikipedia.org/wiki/SIM_Application_Toolkit#cite_note-CellularZA-1
	# Has already be abused : 
	# - SimJacker : https://thehackernews.com/2019/09/simjacker-mobile-hacking.html
	# - WIBattack : https://www.zdnet.com/article/new-sim-card-attack-disclosed-similar-to-simjacker/

	"com.android.wallpaper.holospiral" 
	# "Holo spiral" Live wallpaper.

	"com.android.wallpaper.livepicker" 
	# Enable you to pick live wallpaper.

	"com.android.wallpapercropper" 
	# Wallpaper cropper.

	"com.example.android.notepad" 
	# (Bad) notepad app.

	"org.simalliance.openmobileapi.service"
	# Smart Card Service by Simalliance
	# https://simalliance.org/about-us/mission-objectives/
	# 
	# The SmartCard API is a reference implementation of the SIMalliance Open Mobile API specification that enables Android applications 
	# to communicate with Secure Elements, (SIM card, embedded Secure Elements, Mobile Security Card or others)
	# https://github.com/seek-for-android/pool/wiki/SmartcardAPI
	# Safe to remove if you don't think you need this


	#####################   UP TO YOU (can be useful features but safe to remove)   #####################

	#"com.android.backupconfirm"
	# Restore google settings with Google Backup restore function.
	# Also display confirmation popup when doing ADB backup. If you remove this package you couldn't do ADB Backup.

	#"com.android.bluetooth"
	# Bluetooth service

	"com.android.browser" 
	# Stock Browser

	"com.android.browser.provider" 
	# Strange package. It is old (2014) and there is a Picasa URL hardcoded.
	# https://android.googlesource.com/platform/packages/apps/Browser/+/refs/heads/master/src/com/android/browser/provider/BrowserProvider.java
	# Related to bookmarks but removing it doesn't seems to affect anything visible.

	"com.android.calendar" 
	# Access to events from the calendar.
	# Safe to remove if you don't use built-in calendar

	#"com.android.calculator2" 
	# Stock calculator app.

	"com.android.calllogbackup"
	# Call Logs Backup/Restore

	#"com.android.captiveportallogin"
	# Take care of redirecting to the web page that the user of a public access network is obliged to view and interect with, before access is granted.

	"com.android.cellbroadcastreceiver"
	# == EMERGENCY ALERTS  == 
	# This service manages enabling and disabling ranges of message identifiers that the radio should listen for. 
	# It operates independently of the other services and runs at boot time and after exiting airplane mode.
	# https://www.androidcentral.com/amber-alerts-and-android-what-you-need-know

	#"com.android.contacts" 
	# Stock contacts app (it is not Google contact)

	#"com.android.cts.ctsshim"
	#"com.android.cts.priv.ctsshim"
	# Compatibilty Test Service. The CTS shim is a package that resides on a device's /system partition in order
	# to verify certain upgrade scenarios. Could mess up OTA. 
	# Don't really know what happens with custom ROM if disabled. Should be safe. 
	# https://android.googlesource.com/platform/frameworks/base/+/51e458e/packages/CtsShim

	#"com.android.deskclock" 
	# Clock stock app 

	"com.android.email" 
	# AOSP Email app (it is NOT gmail).

	"com.android.emergency"
	# Emergency informations. Safe to remove if you don't want this feature.

	# com.android.exchange" 
	# The ExchangeService handles all aspects of starting, maintaining, and stopping the various sync adapters for email.
	# [WARNING] I need to know to test if it only concerns stock mail app.

	#"com.android.facelock" 
	# Essential if you wanna use Face Unlock features, removable if you don't want to.

	"com.android.gallery3d" 
	# AOSP Gallery app.

	#"com.android.inputmethod.latin" 
	# AOSP keyboard. (This is not Google Keyboard).

	"com.android.keychain" 
	# Enable apps to use system wide credential KeyChain (shared credentials between apps)
	# https://security.stackexchange.com/questions/216716/android-keychain-what-is-a-system-wide-credential

	#"com.android.mms" 
	# Stock SMS app.

	#"com.android.nfc"
	# NFC service

	"com.android.pacprocessor"
	# A PAC (Proxy Auto-Config) is a file which defines how an app can automatically define the correct proxy server for fetching an URL. 
	# Should be safe to remove if you don't use Auto-proxy (with PAC file config)
	# https://en.wikipedia.org/wiki/Proxy_auto-config

	#"com.android.phone.recorder" 
	# Call recorder function.

	#"com.android.providers.blockednumber"
	# Handle blocked numbers storage

	"com.android.providers.calendar" 
	# Necessary to sync stock Calendar app and lets it work correctly.

	#"com.android.providers.userdictionary"
	# Handle user dictionary for keyboard apps.

	#"com.android.proxyhandler"
	# Handle proxy config
	# Safe to remove if you don't use a proxy.

	"com.android.quicksearchbox" 
	# Google quick search box.

	"com.android.sharedstoragebackup"
	# Used during backup. Fetch shared storage (files accessible by every apps with STORAGE permission)
	# Things have changed with Android 10. Don't know if this package is still relevant.
	# https://blog.mindorks.com/understanding-the-scoped-storage-in-android.

	"com.android.voicedialer" 
	# Voice search.

	"com.android.wallpaperbackup"
	# Backup your wallapaper and load this backup instead of the original file in case you delete it.
	# Safe to remove but it's not worth it.

	)


#####################  DO NOT REMOVE THIS (will prevent core stuff to work)  #####################

"com.android.certinstaller"
# Certificate installer. Digital certificates identify computers, phones, and apps for security. Just like you'd use your driver’s license 
# to show that you can legally drive, a digital certificate identifies your device and confirms that it should be able to access something.
# Here it is used for accepting and revoking of Internet certificates. Break wifi if removed.

"com.android.companiondevicemanager"
# Companion Device Manager that comes by default in every Oreo+ device. 
# This handles connections to other devices, like Bluetooth Headphones, desktop Operative Systems, ecc. 

"com.android.defcontainer"
# Needed during apps installation.

"com.android.documentsui" # Files picker
# Interface for apps wishing to access access files outside of their own storage area.

"com.android.musicfx" 
# Audio equalizer. Some 3-party music apps can use it to provide you equalizing features.

"com.android.externalstorage"
# Needed by apps to access external storage (SD card)

"com.android.location.fused"
# Manages the underlying location technologies, such as GPS and Wi-Fi.

"com.android.mms.service"
# Provides support for sending MMS.

"com.android.mtp" #MTP Host
# Handle MTP (protocol allowing files to be transferred to and from your PC)

"com.android.phone"
# AOSP code for dialer app features
# SIM card will also not be detected if deleted.

"com.android.providers.contacts"
# Handle interaction with contacts data

"com.android.providers.downloads"
# Provider for downloads manager.

"com.android.providers.downloads.ui"
# User interface for listing downloads.

"com.android.providers.media"
# Handle access to media files.

"com.android.providers.settings"
# Handles settings app datas (contentProvider)
# https://android.stackexchange.com/questions/37195/why-are-there-two-settings-apps-settings-and-settings-storage

"com.android.providers.telephony"
# [AOSP] Telephony provider. Handle access to telephony database.

"com.android.server.telecom"
# Management your calls via your network provider or SIM and controls the phone modem.

"com.android.settings"
# AOSP Settings app features

"com.android.shell"
# Unix shell to communicate via ADB commands through PC.

"com.android.statementservice"
# Intent Filter Verification Service
# Intent : https://developer.android.com/reference/android/content/Intent
# Intent Filters : https://developer.android.com/guide/components/intents-filters
# https://android.stackexchange.com/questions/191163/what-does-the-intent-filter-verification-service-app-from-google-do

"com.android.storagemanager"
# Storage manager (Maintenance/Storage panel in the settings)
# Clean up unused files, show size of files regrouped by categories...

"com.android.systemui"
# Everything you see in Android that's not an app. User interface of Android

"com.android.vpndialogs"
# Handle VPN dialogs (UI boxes)
# https://en.wikipedia.org/wiki/Dialog_(software)
# Safe to remove if you don't plan to use a VPN.