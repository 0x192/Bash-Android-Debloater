#!/usr/bin/env bash

# VOCABULARY : 
# overlay : https://budhdisharma.medium.com/rro-runtime-resource-overlay-in-android-aosp-e094be17f4bc
# 			https://source.android.com/devices/architecture/rros

declare -a aosp=(

	"com.android.bips"
	# Default print Service.
	# Safe to remove if you don't plan to print from your phone.
	
	"com.android.bluetoothmidiservice"
	# Provides classes for using the MIDI protocol over Bluetooth. Safe to remove if you don't plan to connect MIDI devices. 
	# (Seriously, use a PC if you want to do this !)

	"com.android.bookmarkprovider" 
	# Only exists for compatibility reasons to prevent apps querying it from getting null cursors they do not expect and crash.

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

	"com.android.dreams.phototable.overlay"
	# Overlay for com.android.dreams.phototable

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

	"com.android.email.partnerprovider"
	"com.android.email.partnerprovider.overlay"
	# Lets Google partners (OEM in most of the case) to customize the default email settings.
	# The manufacturer often change the default signature displayed the end of each of your mail (e.g "Sent from my Nokia phone")

	"com.android.providers.partnerbookmarks" 
	# Provides bookmarks about partners of Google in Chrome.

	"com.android.runintest.ddrtest"
	# DDR Test
	# RAM Stress tester
	# Can be run from the bootloader
	# NOTE: I'm not sure it's really from AOSP (seen in TCL Plex phone)

	"com.android.simappdialog"
	# Sim App Dialog
	# Used to install the carrier SIM app when the SIM is inserted.

	"com.android.soundrecorder" 
	# AOSP Sound recorder. OEM often use their own solution
	# NOTE: On some phones, Huawei & Xiaomi also use this package name for their own browser app.
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
	"com.android.wallpaper.livepicker.overlay"
	# Enables you to pick a live wallpaper.

	"com.android.wallpapercropper" 
	# Wallpaper cropper.

	"com.example.android.notepad" 
	# (Bad) notepad app.


	#####################   UP TO YOU (can be useful features but safe to remove)   #####################

	"android.auto_generated_vendor_" # [MORE INFO NEEDED]
	# Auto generated vendor's stuff for Android Auto (https://www.android.com/intl/en_en/auto/)
	# Note: You don't need this if you don't use Android auto

	"android.auto_generated_rro__"
	# rro = Runtime Resources Overlay.
	# Changes values of a package config, based in the overlay definitions (heavily used by OEM for custom themming android) 
	# Link: https://source.android.com/devices/architecture/rros and https://code.tutsplus.com/tutorials/quick-tip-theme-android-with-the-runtime-resource-overlay-framework--cms-29708

	"com.android.apps.tag"
	# Support for NFC tags interactions (5 permissions : Contacts/Phone On by default).
	# NFC Tags are for instance used in bus to let you validate your transport card with your phone 
	# Other exemple : https://en.wikipedia.org/wiki/TecTile
	# You will still be able to connect to a NFC device (e.g a speaker) if removed.
	#"com.google.android.GoogleCamera" 
	# Google Camera (https://play.google.com/store/apps/details?id=com.google.android.GoogleCamera)
	
	#"com.android.backupconfirm"
	# Restore google settings with Google Backup restore function.
	# Also display confirmation popup when doing ADB backup. If you remove this package you couldn't do ADB Backup.

	#"com.android.bio.face.service"
	# Handles facial regognition. 

	#"com.android.bluetooth"
	# Bluetooth service

	"com.android.browser" 
	# AOSP Browser. You honeslty shoud use something else. It is no longer maintained and lacks a lot of features.
	# If you have this package you most likely have an old android version (< Android KitKat v4.4) so you can't really install
	# another browser. 
	# Your android device is insecure so you really shouldn't use this device to browse the web.
	# NOTE: On some phones, Huawei & Xiaomi also use this package name for their own browser app (e.g Mi browser)

	"com.android.browser.provider" 
	# Strange package. It is old (2014) and there is a hardcoded Picasa URL in the code
	# https://android.googlesource.com/platform/packages/apps/Browser/+/refs/heads/master/src/com/android/browser/provider/BrowserProvider.java
	# Related to bookmarks but removing it doesn't seems to affect anything visible.

	#"com.android.calendar" 
	# AOSP Calendar app
	# NOTE: On some phones, Huawei & Xiaomi also use this package name for their own calendar app.

	#"com.android.calculator2"
	# AOSP calculator app.
	# NOTE: On some phones, Huawei & Xiaomi also use this package name for their own calculator app.

	#"com.android.calllogbackup"
	# Call Logs Backup/Restore feature.
	# https://android.googlesource.com/platform/packages/providers/CallLogProvider/+/refs/heads/master/src/com/android/calllogbackup

	#"com.android.captiveportallogin"
	# Support for captive portal : https://en.wikipedia.org/wiki/Captive_portal
	# A captive portal login is a web page where the users have to input their login information or accept the displayed terms of use. 
	# Some networks (typically public wifi network) use the captive portal login to block access until the user inputs 
	# some necessary information

	#"com.android.carrierconfig"
	# Gives carriers and OEMs the ability to dynamically provide carrier configuration (APN settings) trough their app.
	# NOTE : The probability that your carrier's APN change is very low. If you change your carrier and insert a new SIM card
	# This package will be triggered to automatically choose the suitable APN.
	# https://source.android.com/devices/tech/config/carrier
	# https://android.googlesource.com/platform/packages/apps/CarrierConfig/+/refs/heads/master/src/com/android/carrierconfig/DefaultCarrierConfigService.java

	#"com.android.cellbroadcastreceiver"
	# Cell broadcast has been designed to deliver messages to multiple users in an area.
	# This is notably used by ISP to send Emergency/Government alerts. This package handles the situation on occurence of this event.
	# Runs at boot time and is also triggered after exiting airplane mode.
	# https://en.wikipedia.org/wiki/Cell_Broadcast
	# https://www.androidcentral.com/amber-alerts-and-android-what-you-need-know
	# https://android.googlesource.com/platform/packages/apps/CellBroadcastReceiver/+/refs/heads/master/src/com/android/cellbroadcastreceiver

	#"com.android.contacts" 
	# AOSP contacts app (it is not Google contacts)
	# NOTE: On some phones Huawei & Xiaomi also use this package name for their contacts app.

	#"com.android.cts.ctsshim" # [MORE INFO NEEDED]
	#"com.android.cts.priv.ctsshim"
	# Compatibilty Test Service. The CTS shim is a package that resides on a device's /system partition in order
	# to verify certain upgrade scenarios. Could mess up witch OTA updates.
	# https://android.googlesource.com/platform/frameworks/base/+/51e458e/packages/CtsShim

	#"com.android.deskclock" 
	# AOSP Clock app
	# NOTE: On some phones Huawei & Xiaomi also use this package name for their own clock app.

	#"com.android.email" 
	# AOSP Email app (it is NOT gmail).
	# NOTE: On some phones Huawei & Xiaomi also use this package name for their own EMAIL app.

	#"com.android.emergency"
	# Emergency informations. Safe to remove if you don't want this feature.

	#"com.android.exchange" # [MORE INFO NEEDED]
	# Handles all aspects of starting, maintaining, and stopping the various sync adapters for the email accounts.
	# Is it only needed for the email stock app?

	#"com.android.facelock" 
	# Essential if you wanna use Face Unlock features, removable if you don't want to.

	#"com.android.gallery3d" 
	# Gallery app. 
	# NOTE: On some phones, Huawei & Xiaomi also use this package name for their own Gallery app.

	#"com.android.hotspot2"
	# Provides wifi tethering (lets you share your mobile device's Internet connection with other devices)
	# https://en.wikipedia.org/wiki/Tethering)

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

	#"com.android.internal.systemui.navbar.gestural"
	# Gesture navigation
	# Lets you use swipes and other actions to control your phone, rather than tapping on buttons.
	# Option -> System -> Gestures -> System Navigation
	# https://android-developers.googleblog.com/2019/08/gesture-navigation-backstory.html

	#"com.android.internal.systemui.navbar.gestural_extra_wide_back" 
	#"com.android.internal.systemui.navbar.gestural_narrow_back"
	#"com.android.internal.systemui.navbar.gestural_wide_back"
	# Enables you to turn down the sensitivity to make it easier to perform gestures in apps (i.e. making back harder to trigger)

	#"com.android.internal.systemui.navbar.threebutton" # 3-button navigation
	#"com.android.internal.systemui.navbar.twobutton" # 2-button navigation

	#"com.android.musicfx" 
	# Audio equalizer. Some 3-party music apps can use it to provide you equalizing features.

	#"com.android.mms" 
	# AOSP SMS app.
	# NOTE: On some phones, Huawei & Xiaomi also use this package name for their own SMS app.

	#"com.android.nfc"
	# NFC service

	#"com.android.ons"
	# Opportunistic Network Service
	# Opportunistic networks are networks which are formed when devices come into contact opportunistically through 
	# physical proximity, and communicate wirelessly to share each other’s content, resources and services.
	# This kind of networks leads to a set of challenging issues (congestion, transfer ordering, and resilience)
	# Basically, this package implements ions (asynchronous networking) to resolve these issues.
	# Run in background after booting the phone.
	# https://en.wikipedia.org/wiki/Opportunistic_mobile_social_network

	#"com.android.otaprovisioningclient"
	# OTA Access Point Configuration
	# OTA (Over the air : https://fr.wikipedia.org/wiki/Over-the-air_programming) is the method used by OEM to push updates on
	# your phone.
	# An OTA access point is used to run system software updates over a special gateway. This package is most likely customized
	# by your OEM.

	#"com.android.pacprocessor"
	# A PAC (Proxy Auto-Config) is a file which defines how an app can automatically define the correct proxy server for fetching an URL. 
	# Should be safe to remove if you don't use Auto-proxy (with PAC file config)
	# https://en.wikipedia.org/wiki/Proxy_auto-config

	#"com.android.phone.recorder" 
	# AOSP Call recorder function. Most of the time OEM use their own code for this.
	# NOTE: On some phones, Huawei & Xiaomi also use this package name for their own closed-source recorder app.

	#"com.android.printservice.recommendation"
	# Used to discover and interact one or more printers via one or more protocols. 
	# You can remove it if you don't need to print directly from your phone.

	#"com.android.printspooler"
	# Print spooler. Manage the printing process. 
	# Safe to remove if you don't plan to print from your phone
	# Note: Break connection preferences from the settings app on some phones (Pixel 4a / Android 11)

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

	#"com.android.se" # [MORE INFO NEEDED]
	# Underlying implementation for Open Mobile API SEService (OMAPI SE)
	# Enables apps to use the OMAPI API to access secure elements (SE) to enable smart-card payments and other secure services.
	# 
	# A SE is a special chip (e.g SIM-card) whose the main purpose is to store cryptographic secrets in such a way 
	# that illicit use is hard or impossible to do.
	#
	# FYI : The Open Mobile Alliance (OPA) is a standards organization which develops open standards for the mobile phone industry.

	#"com.android.settings.intelligence"
	# Setting search feature 
	# Note: Settings app may crash when searching for a setting if you removed this package (it depends on the phone)
	# See https://gitlab.com/W1nst0n/universal-android-debloater/-/issues/51

	#"com.android.sharedstoragebackup"
	# Used during backup. Fetch shared storage (files accessible by every apps with STORAGE permission)
	# Things have changed with Android 10. Don't know if this package is still relevant for new phones.
	# https://blog.mindorks.com/understanding-the-scoped-storage-in-android.

	#"com.android.smspush" # [MORE INFO NEEDED]
	# This service is used to push/send specially formatted SMS messages that display an alert message to the user, 
	# and give the user the option of connecting directly to a particular app.
	# For instance, a SMS notifying the user he as a new e-mail, with a URL link to connect directly to the e-mail application
	# https://web.archive.org/web/20200915164901/https://www.nowsms.com/doc/submitting-sms-messages/sending-wap-push-messages

	#"com.android.systemui.theme.dark"
	# Enables you to use Android dark theme.

	#"com.android.theme.color.black"
	#"com.android.theme.color.cinnamon"
	#"com.android.theme.color.green"
	#"com.android.theme.color.ocean"
	#"com.android.theme.color.orchid"
	#"com.android.theme.color.purple"
	#"com.android.theme.color.space"	
	#"com.android.theme.font.notoserifsource"
	#"com.android.theme.icon.roundedrect"
	#"com.android.theme.icon.squircle"
	#"com.android.theme.icon.teardrop"
	#"com.android.theme.icon_pack.circular.android"
	#"com.android.theme.icon_pack.circular.launcher"
	#"com.android.theme.icon_pack.circular.settings"
	#"com.android.theme.icon_pack.circular.systemui"
	#"com.android.theme.icon_pack.circular.themepicker"
	#"com.android.theme.icon_pack.filled.android"
	#"com.android.theme.icon_pack.filled.launcher"
	#"com.android.theme.icon_pack.filled.settings"
	#"com.android.theme.icon_pack.filled.systemui"
	#"com.android.theme.icon_pack.filled.themepicker"
	#"com.android.theme.icon_pack.rounded.android"
	#"com.android.theme.icon_pack.rounded.launcher"
	#"com.android.theme.icon_pack.rounded.settings"
	#"com.android.theme.icon_pack.rounded.systemui"
	# Android themes / icons pack / fonts

	#"com.android.timezone.updater"
	# Time Zone Updater
	# Automatically updates the clock to correspond to your current time zone
	# This *may* causes a bootloop if removed. Timezone packages often causes that. 

	#"com.android.voicedialer" 
	# AOSP Voice dialer. Let's you call someone or open an app with your voice from the dialer.
	# OEM often use their own code (embeded in their voice-controlled digital assistant)
	# NOTE: On some phones Huawei & Xiaomi also use this package name for their own voice dialer app.

	#"com.android.wallpaperpicker"
	# Enables you to pick a wallpaper.

	#"com.android.wallpaperbackup"
	# Backup your wallapaper and load this backup instead of the original file in case you delete it.
	# Safe to remove if you really want to.

	#"com.android.webview"
	# AOSP webview
	# It's a system component for the Android operating system (OS) that allows Android apps to display content 
	# from the web directly inside an application. 
	# This package is no longer used in recent phones as it was replaced by com.google.android.webview
	#
	# On open-source privacy oriented Webview is Bromite (https://www.bromite.org/system_web_view)
	)


##################### YOU SHOULDN'T MESS WITH THEM (core packages and may cause bootloop)  #####################

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

#"com.android.documentsui.a_overlay"
# DocumentsUI Overlay
# The DocumentsUI controls access to specific files for components that handle document permissions 
# (such as attaching a file to an email)
# https://source.android.com/devices/architecture/modular-system/documentsui?hl=en

#"com.android.dynsystem"
# Dynamic System Updates
# Treble gived the ability to boot an AOSP Generic System Image (GSI) on any supported device. 
# Dynamic System Updates allows to boot into a Generic System Image (GSI) without interfering with the current installation.
# That means the bootloader doesn’t need to be unlocked and the user data doesn’t need to be wiped.
# https://developer.android.com/topic/dsu

#"com.android.externalstorage"
# Needed by apps to access external storage (SD card)

#"com.android.keychain" 
# Enable apps to use system wide credential KeyChain (shared credentials between apps)
# https://security.stackexchange.com/questions/216716/android-keychain-what-is-a-system-wide-credential

#"com.android.localtransport"
# Backup transport for stashing stuff into a known location on disk, and later restoring from there.
# Seems needed for storeing backup data locally on the device. 
# This package also provides the backup confirmation UI.
# https://developer.android.com/guide/topics/data/testingbackup

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
# Provisioning is the process of setting up a network connection that will allow new users. 
# This service is for exemple needed when the user's phone moves from one cell-tower to another.

#"com.android.phone"
#"com.android.phone.a_overlay"
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
# Telephony provider. Controls and stores phone-related data such as text messages, APN list, operation, etc.

#"com.android.server.telecom"
#"com.android.server.telecom.a_overlay"
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

