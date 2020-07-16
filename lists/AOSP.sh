#!/usr/bin/env bash

declare -a aosp=(

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

	"com.android.galaxy4"
	# built-in Dynamic wallpaper

	"com.android.htmlviewer" 
	# In-built HTML viewer. Basically lets you read HTML files stored on your device.
	# REMINDER : A web-browser can also read HTML files...

	"com.android.magicsmoke" 
	# "Magic smoke" Live wallpaper.

	"com.android.managedprovisioning"
	# Manage separate profile on devices. The typical example is setting up a corporate profile that is controlled by their employer on a
	# users personal device to keep personal and work data separate.
	# https://support.google.com/work/android/answer/6191949?
	# https://developers.google.com/android/work/requirements/work-profile

	"com.android.musicvis"
	# Music Visualization Wallpapers

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
	# AOSP Sound recorder. OEM often use their own solution
	# There are better apps (on F-droid) anyway 

	"com.android.stk"
	"com.android.stk2" # (special package for dual-sim devices?)
	# SIM toolkit 
	# SIM toolkit app. Enable carriers to make SIM cards initiate "value-added services" (== some crappy stuff)
	# Basically, Some operators give SIMs which has applications installed in it. 
	# https://en.wikipedia.org/wiki/SIM_Application_Toolkit#cite_note-CellularZA-1
	# Has already be abused : 
	# - SimJacker : https://thehackernews.com/2019/09/simjacker-mobile-hacking.html
	# - WIBattack : https://www.zdnet.com/article/new-sim-card-attack-disclosed-similar-to-simjacker/

	"com.android.traceur"
	# System Tracing
	# Recording device activity over a short period of time is known as system tracing. System tracing produces a trace file that can be used to generate 
	# a system report.
	# Not useful if you're not a developer.

	"com.android.wallpaper.holospiral" 
	# "Holo spiral" Live wallpaper.

	"com.android.wallpaper.livepicker" 
	# Enable you to pick live wallpaper.

	"com.android.wallpapercropper" 
	# Wallpaper cropper.

	"com.example.android.notepad" 
	# (Bad) notepad app.


	#####################   UP TO YOU (can be useful features but safe to remove)   #####################

	#"com.android.backupconfirm"
	# Restore google settings with Google Backup restore function.
	# Also display confirmation popup when doing ADB backup. If you remove this package you couldn't do ADB Backup.

	#"com.android.bio.face.service"
	# Handles facial regognition. 

	#"com.android.bluetooth"
	# Bluetooth service

	"com.android.browser" 
	# AOSP Browser. You honeslty shoud use something else. It is no longer maintained and lack a lot of features.
	# If you have this package you most likely have an old android version (< Android KitKat v4.4) so you can't really install
	# another browser. 
	# Your android device is insecure so you really shouldn't use this device to browse the web.

	"com.android.browser.provider" 
	# Strange package. It is old (2014) and there is a hardcoded Picasa URL in the code
	# https://android.googlesource.com/platform/packages/apps/Browser/+/refs/heads/master/src/com/android/browser/provider/BrowserProvider.java
	# Related to bookmarks but removing it doesn't seems to affect anything visible.

	"com.android.calendar" 
	# Old AOSP Calendar app

	#"com.android.calculator2" 
	# Stock calculator app.

	"com.android.calllogbackup"
	# Call Logs Backup/Restore feature.

	#"com.android.captiveportallogin"
	# Take care of redirecting to the web page that the user of a public access network is obliged to view and interect with, before access is granted.

	#"com.android.carrierconfig"
	# Gives carriers and OEMs the ability to dynamically provide carrier configuration (APN settings) trough their app.
	# NOTE : The probability that your carrier's APN change is very low. If you change your carrier and insert a new SIM card
	# This package will be triggered to automatically choose the suitable APN.
	# https://source.android.com/devices/tech/config/carrier

	#"com.android.cellbroadcastreceiver"
	# == EMERGENCY ALERTS  == 
	# This service manages enabling and disabling ranges of message identifiers that the radio should listen for. 
	# It operates independently of the other services and runs at boot time and after exiting airplane mode.
	# https://www.androidcentral.com/amber-alerts-and-android-what-you-need-know

	#"com.android.contacts" 
	# AOSP contacts app (it is not Google contacts)

	#"com.android.cts.ctsshim" # [MORE INFO NEEDED]
	#"com.android.cts.priv.ctsshim"
	# Compatibilty Test Service. The CTS shim is a package that resides on a device's /system partition in order
	# to verify certain upgrade scenarios. Could mess up witch OTA updates.
	# https://android.googlesource.com/platform/frameworks/base/+/51e458e/packages/CtsShim

	#"com.android.deskclock" 
	# AOSP Clock app 

	"com.android.email" 
	# AOSP Email app (it is NOT gmail).

	"com.android.emergency"
	# Emergency informations. Safe to remove if you don't want this feature.

	#"com.android.exchange" # [MORE INFO NEEDED]
	# The ExchangeService handles all aspects of starting, maintaining, and stopping the various sync adapters for email.
	# [WARNING] I need to know if it only concerns stock mail app.

	#"com.android.facelock" 
	# Essential if you wanna use Face Unlock features, removable if you don't want to.

	"com.android.gallery3d" 
	# AOSP Gallery app.

	#"com.android.inputdevices"
	# Only contains a receiver named "Android keyboard", possibly for an external keyboard.
	# Locates available keyboard layouts. 
	# An application can offer additional keyboard layouts to the user by declaring a suitable broadcast receiver in its manifest.

	#"com.android.inputmethod.latin" 
	# AOSP keyboard. (This is not Google Keyboard).

	#"com.android.internal.display.cutout.emulation.corner"
	#"com.android.internal.display.cutout.emulation.double"
	#"com.android.internal.display.cutout.emulation.noCutout"
	#"com.android.internal.display.cutout.emulation.tall"
	# Support for display cutouts
	# https://developer.android.com/guide/topics/display-cutout
	# https://source.android.com/devices/tech/display/display-cutouts

	#"com.android.keychain" 
	# Enable apps to use system wide credential KeyChain (shared credentials between apps)
	# https://security.stackexchange.com/questions/216716/android-keychain-what-is-a-system-wide-credential

	#"com.android.musicfx" 
	# Audio equalizer. Some 3-party music apps can use it to provide you equalizing features.

	#"com.android.mms" 
	# AOSP SMS app.

	#"com.android.nfc"
	# NFC service

	#"com.android.pacprocessor"
	# A PAC (Proxy Auto-Config) is a file which defines how an app can automatically define the correct proxy server for fetching an URL. 
	# Should be safe to remove if you don't use Auto-proxy (with PAC file config)
	# https://en.wikipedia.org/wiki/Proxy_auto-config

	#"com.android.phone.recorder" 
	# AOSP Call recorder function. Most of the time OEM use their own code for this.

	#"com.android.providers.blockednumber"
	# Handles blocked numbers storage
	# On some devices this packages seems to be tied to recent apps menu (see https://gitlab.com/W1nst0n/universal-android-debloater/-/issues/6)

	#"com.android.providers.calendar" 
	# Necessary to sync stock Calendar app and lets it work correctly.

	#"com.android.providers.drm" # [MORE INFO NEEDED]
	# DRM Protected Content Storage 
	# Provides DRM functions to stop you from copying things like ringtones, live wallpapers, etc.
	# May be needed to access media files (to be verified)

	#"com.android.providers.userdictionary"
	# Handles user dictionary for keyboard apps. 

	#"com.android.proxyhandler"
	# Handles proxy config
	# Safe to remove if you don't use a proxy.

	"com.android.quicksearchbox" 
	# Google quick search box.

	#"com.android.settings.intelligence" # [MORE INFO NEEDED]
	# Settings tips in Settings menu ?
	# I don't have this in my phone. It for Android Pie. Can someone check ? 

	#"com.android.sharedstoragebackup"
	# Used during backup. Fetch shared storage (files accessible by every apps with STORAGE permission)
	# Things have changed with Android 10. Don't know if this package is still relevant for new phones.
	# https://blog.mindorks.com/understanding-the-scoped-storage-in-android.

	#"com.android.systemui.theme.dark"
	# Enables you to use Android dark theme.

	#"com.android.timezone.updater"
	# Time Zone Updater
	# Automatically updates the clock to correspond to your current time zone

	#"com.android.voicedialer" 
	# AOSP Voice dialer. Let's you call someone or open an app with your voice from the dialer.
	# OEM often use their own code (embeded in their voice-controlled digital assistant)

	#"com.android.wallpaperbackup"
	# Backup your wallapaper and load this backup instead of the original file in case you delete it.
	# Safe to remove if you really want to.

	#"org.simalliance.openmobileapi.service"
	# Smart Card Service by Simalliance
	# https://simalliance.org/about-us/mission-objectives/
	# 
	# The SmartCard API is a reference implementation of the SIMalliance Open Mobile API specification that enables Android applications 
	# to communicate with Secure Elements, (SIM card, embedded Secure Elements, Mobile Security Card or others)
	# https://github.com/seek-for-android/pool/wiki/SmartcardAPI
	# Safe to remove if you don't think you need this

	)


#####################  DO NOT REMOVE THIS (will prevent core stuff to work)  #####################

#"com.android.certinstaller"
# Certificate installer. Identifies your device and confirms that it should be able to access something.
# Here it is used for accepting and revoking of Internet certificates. Break wifi if removed.

#"com.android.companiondevicemanager"
# Companion Device Manager that comes by default in every Oreo+ device. 
# This handles connections to other devices, like Bluetooth Headphones, desktop Operative Systems, ecc. 

#"com.android.defcontainer"
# Package Access Helper 
# Determine the recommended install location for packages and if there is enough free space for the package.

#"com.android.documentsui" # Files picker
# Interface for apps wishing to access access files outside of their own storage area.

#"com.android.externalstorage"
# Needed by apps to access external storage (SD card)

#"com.android.location.fused"
# Manages the underlying location technologies, such as GPS and Wi-Fi.

#"com.android.mms.service"
# Provides support for sending MMS.

#"com.android.mtp" 
# MTP Host
# Handles MTP (protocol allowing files to be transferred to and from your PC)

#"com.android.packageinstaller"
# Handles installation, upgrade, and removal of applications.

#"com.android.provision"
# Application that sets the provisioned bit, like SetupWizard does.
# Add a persistent setting to allow other apps to know the device has been provisioned.

#"com.android.phone"
# AOSP code for dialer app features
# SIM card will also not be detected if deleted.

#"com.android.providers.applications"
# Fetches the list of applications installed on the phone to provide search suggestions.

#"com.android.providers.contacts"
# Handle interaction with contacts data

#"com.android.providers.downloads"
# Provider for downloads manager.

#"com.android.providers.downloads.ui"
# User interface for listing downloads.

#"com.android.providers.media"
# Handle access to media files.

#"com.android.providers.settings"
# Handles settings app datas (contentProvider)
# https://android.stackexchange.com/questions/37195/why-are-there-two-settings-apps-settings-and-settings-storage

#"com.android.providers.telephony"
# [AOSP] Telephony provider. Handle access to telephony database.

#"com.android.server.telecom"
# Management your calls via your network provider or SIM and controls the phone modem.

#"com.android.settings"
# AOSP Settings app features

#"com.android.shell"
# Unix shell to communicate via ADB commands through PC.

#"com.android.statementservice"
# Intent Filter Verification Service
# Intent : https://developer.android.com/reference/android/content/Intent
# Intent Filters : https://developer.android.com/guide/components/intents-filters
# https://android.stackexchange.com/questions/191163/what-does-the-intent-filter-verification-service-app-from-google-do

#"com.android.storagemanager"
# Storage manager (Maintenance/Storage panel in the settings)
# Clean up unused files, show size of files regrouped by categories...

#"com.android.systemui"
# Everything you see in Android that's not an app. User interface of Android

#"com.android.vpndialogs"
# Provide VPN support to Android
# https://en.wikipedia.org/wiki/Dialog_(software)
# Safe to remove if you don't plan to use a VPN.

