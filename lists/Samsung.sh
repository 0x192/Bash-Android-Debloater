#!/usr/bin/env bash

declare -a samsung=(

	#####################  SAFE TO DEBLOAT (useless features)  #####################
	
	"android.autoinstalls.config.samsung"
	# Samsung's implementation of the "necessary apps" that need to be downloaded upon first setting up the device.

	"com.cnn.mobile.android.phone.edgepanel" # (Samsung-exclusive)
	# CNN Edge panel. Twitter trends, and news from CNN.

	"com.enhance.gameservice"
	# Legacy game Optimizing Service (was replaced by com.samsung.android.game.gos)
	# Is supposed to "improve" game performance.

	"com.hiya.star" # also called android-ss-service-lib (Samsung-exclusive)
	# Third-party that provides caller profile information to help consumers identify incoming calls and block unwanted ones.
	# https://en.wikipedia.org/wiki/Hiya_(company)
	# https://hiya.com/ 
	# NOTE : Never trust a company which promotes spam blocking features 
	# https://itmunch.com/robocall-caught-sending-customers-confidential-data-without-consent/
	#
	# Have a look at their privacy policy. That's... pretty scary : https://hiya.com/fr/hiya-data-policy	
	# Needed for Samsung Smart Call (com.samsung.android.smartcallprovider)
	
	"com.knox.vpn.proxyhandler" # KNOX stuff
	# Samsung Knox allows business and personal content to "securely" coexist on the same handset. 
	# This package handle proxy along side KNOX

	"com.mobeam.barcodeService"
	# The Beaming Service enables your device to beam (relay) barcodes, as found on digital coupons, event tickets, library cards, loyalty 
	# cards and membership cards to 1D red laser and Image based scanners prevalent at nearly every retail store and checkout stand around the world.
	# Mobeam is a 3-party (https://mobeam.com/)

	"com.osp.app.signin"
	# Samsung Account app

	"com.samsung.aasaservice"
	# Sometimes, eat a LOT of battery.
	# Security policy apps (kind of things which prevents installation of applications)

	#"com.samsung.advp.imssettings"
	# Needed for VoLTE, a standard for high-speed wireless communication (https://en.wikipedia.org/wiki/Voice_over_LTE)
	# IMS id an open industry standard for voice and multimedia communications over IP.
	# NOTE: this package is needed for messaging apps that sends SMS/RCS code to verify your phone number (see issue #17)

	#"com.samsung.accessibility" 
	# Accessibility settings (useful for apps creating virtual buttons such as a pie-menu)
	# Weirdly, it can cause bootloop when removed if you set a lock code on your phone. (see issue #20)
	
	"com.samsung.android.app.tips"
	# Tips on how to use your phone"

	"com.samsung.android.net.wifi.wifiguider"
	# Wi-Fi Tips
	# I've never seen any "wifi tips" so I'm not sure if this app has any other functionality
	# Upon reinstalling a notification pops up saying "Analyzing Wi-Fi" for a few seconds, no idea what it's doing

	"com.samsung.android.aircommandmanager"
	# AirCommandManager manager
	# Gives you access to signature S Pen features. You can access Air command anytime you are using your phone by simply taking out the S Pen.
	# https://www.samsung.com/global/galaxy/what-is/air-command/

	#"com.samsung.android.allshare.service.fileshare"
	# Wi-Fi Direct
	# Allows two devices to establish a direct Wi-Fi connection without requiring a wireless router.
	# https://www.samsung.com/au/support/mobile-devices/connecting-devices-via-wifi-direct/
	# https://en.wikipedia.org/wiki/Wi-Fi_Direct
	
	"com.samsung.android.allshare.service.mediashare"
	# Samsung Allshare service (now called SmartView).
	# Used to stream content from your phone to a Samsung smart TV.
	# https://www.samsung.com/us/apps/smart-view-2/

	"com.samsung.android.app.advsounddetector"
	# Samsung Sound detectors
	# Uses microphone to identify recognizable sounds. For example, if it recognizes a baby's cry, it can alert you with flashing lights so 
	# you know to check on your baby. Or it can notify you if it hears the doorbell ring so you know to open the door.
	#
	# adv maybe refers to Samsung Advanced Institute of Technology 

	#"com.samsung.android.app.amcagent" # [NEED MORE INFO] [NEED APK]
	# Advanced Management Console Agent
	# Entreprise feature I guess.

	#"com.samsung.android.app.aodservice"
	# Always On Display (https://play.google.com/store/apps/details?id=com.samsung.android.app.aodservice&hl=en)
	# Displays stuff when the screen is off (useless) but also handle the clock on the lockscreen.

	"com.samsung.android.app.appsedge"
	# Samsung apps edge (https://www.samsung.com/global/galaxy/what-is/apps-edge/)
	# Displays your five most frequently used apps for you to access at a moment’s notice.

	"com.samsung.android.app.assistantmenu"
	# Assistant menu
	# Designed for individuals with motor control or other physical impairments. 
	# By using Assistant menu, you can access hardware buttons and all parts of the screen by simply tapping or swiping.
	# https://www.samsung.com/uk/accessibility/mobile-assistant-menu/

	"com.samsung.android.app.camera.sticker.facear.preload"
	"com.samsung.android.app.camera.sticker.facear3d.preload" # Default 3D live stickers
	"com.samsung.android.app.camera.sticker.stamp.preload"
	# Annoying Stickers/stamps of the Samsung camera app. C'mon it feels like Snapshat.
	# https://developer.samsung.com/galaxy/stickers
	# Safe to remove

	"com.samsung.android.arzone"
	# AR Zone
	# Lets you access other AR apps.

	"com.samsung.android.aremojieditor"
	# AR Emoji Editor
	# Edits those AR people emoji things

	"com.samsung.android.livestickers"
	# Deco Pic (accessible through AR Zone)
	# Camera app with stickers and snapchat-like filters

	"com.samsung.android.ardrawing"
	# AR Doodles (accessible through AR Zone)
	# Lets you draw on your face using the front camera and uses AR Core for drawing on the environment with the rear camera.
	# Only Sasmung AR app (afaik) that requests location access, and it refuses to run without it

	"com.samsung.android.visionarapps"
	# "AR apps"
	# Not really sure what this is, but the icon is Bixby as an eye so I assume it's for accessing AR stuff through Bixby.

	"com.samsung.android.app.camera.sticker.facearframe.preload" # [MORE INFO NEEDED]
	# Frames sticker ? 
	# I don't know what this sticker is and I don't have this package.

	"com.samsung.android.app.camera.sticker.facearavatar.preload"
	# Kid avatar stockers on Samsung camera ? (not sure)
	
	"com.samsung.android.app.clipboardedge"
	# Clipboard edge panel

	#"com.sec.android.app.clockpackage"
	# Samsung clock 

	"com.samsung.android.app.cocktailbarservice"
	# Edge screen
	# Enables you to open your five most used apps by simply swiping the edge of the screen.
	# Swipe one of the edges of the screen to bring up information even when your device is locked (with the screen off). 
	# You can also set it up to display the news or weather, for example.

	"com.samsung.android.app.episodes"
	# Samsung story album (https://www.samsung.com/in/support/mobile-devices/what-is-story-album-application-in-samsung-galaxy-s4/)

	"com.samsung.android.app.filterinstaller"
	# Filter installer
	# I have no clue about the usefulness of this package. Maybe it filters apps that are not compatible with the phone.
	# This package is only triggered when you install an app (private class PackageIntentReceiver)

	#"com.samsung.android.app.galaxyfinder" # [MORE INFO NEEDED]
	# S Finder is a search application that allows you to find what you want in an instant by searching the content on your 
	# Galaxy smartphone and on the web as well. (https://www.samsung.com/global/galaxy/what-is/s-finder/)
	# NOTE : Removing this seems to also remove the search bar in the settings and the dialer. Can someone confirm? 

	"com.samsung.app.highlightplayer"
	# Samsung Story Video Editor
	# Lets you edit your videos stories 

	"com.samsung.android.app.interactivepanoramaviewer" #Name : Visual. photo virt.
	# Samsung Virtual Shot Viewer enable sharing virtual shot
	# Safe to remove if you don't want virtual photos.

	"com.samsung.android.app.ledbackcover"
	"com.samsung.android.app.ledcoverdream"
	# I think it enable doing things with LEDs on the cover
	# https://www.samsung.com/hk_en/mobile-accessories/led-cover-for-galaxy-s10/EF-KG973CBEGWW/
	# HOW IT WORKS : https://forum.xda-developers.com/galaxy-note-8/accessories/how-led-cover-t3686694

	"com.samsung.android.app.omcagent"
	# Open Market Customization Agent
	# By default, the device prevents from being customized by a source other than Knox Configure.
	# https://docs.samsungknox.com/admin/knox-configure/normal-mode.html

	"com.samsung.android.app.memo"
	# Samsung Memo (was replaced by Samsung Notes app :	com.samsung.android.app.notes)

	"com.samsung.android.app.mhswrappertmo"
	# Mobile Hotspot
	# Is it linked to T-Mobile ? ("tmo" at the end of the package)
	# You can debloat this and still create hotspot. 

	"com.samsung.android.app.mirrorlink"
	# Used to connect your phone to a car in order to provide audio streaming, GPS navigation...
	# https://www.samsung.com/us/support/answer/ANS00048972/

	#"com.samsung.android.app.motionpanoramaviewer"
	# Motion panorama viewer
	# Let you see the result of a motion panorama
	# https://www.samsung.com/global/galaxy/what-is/motion-panorama/

	"com.samsung.android.app.news"
	# News Samsung app
	# Doesn't exist anymore ? 

	"com.samsung.android.app.notes" 
	# Samsung Notes app (https://play.google.com/store/apps/details?id=com.samsung.android.app.notes)

	"com.samsung.android.app.pinboard"
	# Samsung Scrapbook (discontinued)
	# https://www.samsung.com/za/support/mobile-devices/how-do-i-use-the-scrapbook-memo-feature-on-my-samsung-galaxy-note3/

	"com.samsung.android.app.reminder"
	# Samsung bixby reminder (https://www.samsung.com/global/galaxy/apps/bixby/reminder/)
	# Set up smart reminders to get notified when and where you need to. You can even link websites, videos, photos and more.
	# Uses wifi/data regularly.

	"com.samsung.android.app.routines"
	# Samsung bixby routines (https://www.samsung.com/global/galaxy/what-is/bixby-routines/)
	# Automating actions triggered by context clues: location, time, or event

	"com.samsung.android.app.sbrowseredge"
	# Related to internet browser. For Galaxy Edge ? 	

	#"com.samsung.android.app.selfmotionpanoramaviewer"
	# Selfie panorama viewer
	# # Let you see the result of a selfie motion panorama
	# https://www.samsung.com/global/galaxy/what-is/motion-panorama/

	"com.samsung.android.app.settings.bixby"
	# Bixby settings (Bixby = Samsung intelligence assistant)

	"com.samsung.android.app.simplesharing"
	# Samsung Link Sharing
	# Lets you share large size files by using the Samsung Cloud.
	# https://www.samsung.com/au/support/mobile-devices/what-is-link-sharing/

	#"com.samsung.android.app.smartcapture"
	# Samsung screenshot

	"com.samsung.android.app.social"
	# I know this has been discontinued by Samsung but that it.
	# Surely a social app like Samsung Members (com.samsung.oh)

	"com.samsung.android.app.spage"
	# Bixby Home is a vertically scrolling list of information that Bixby can interact with for example weather, fitness activity and buttons
	# for controlling their smart home gadgets.

	"com.samsung.android.app.storyalbumwidget"
	# The Story Album widget enables you to access the Story Album app and create digital picture albums that you can view and acess directly 
	# from the widget on a Home screen.
	# Old feature (from Galaxy S4)

	"com.samsung.android.app.talkback"
	# Voice assistant. Accessibility feature
	# Can activate a Screen Reader to provide audible feedback to assist blind and low-vision users.

	"com.samsung.android.app.taskedge"
	# Handle task edge panel
	# Through Tasks edge, you can quickly perform frequently used tasks, such as composing messages and creating events.
	# https://www.samsung.com/levant/support/mobile-devices/galaxy-s7-edge-how-do-i-add-tasks-edge/

	"com.samsung.android.app.vrsetupwizards"
	"com.samsung.android.app.vrsetupwizardstub"
	# Samsung Gear VR (Virtual Reality) setup wizard (https://en.wikipedia.org/wiki/Samsung_Gear_VR)
	# https://360samsungvr.com/portal/content/about_samsung_vr
	# Stub = https://stackoverflow.com/questions/10648280/what-is-stub-and-aidl-for-in-java
	# Setup wizard : The first time you turn your device on, a Welcome screen is displayed. It guides you through the basics of setting up your device.
	# It's the setup for Samsung VR services.

	"com.samsung.android.app.watchmanager"
	# Samsung Galaxy Wearable (Samsung Gear) (https://play.google.com/store/apps/details?id=com.samsung.android.app.watchmanager)

	"com.samsung.android.app.watchmanagerstub"
	# Stub for the watch manager. See above
	# Stub = https://stackoverflow.com/questions/10648280/what-is-stub-and-aidl-for-in-java

	"com.samsung.android.app.withtv"
	# WitTV (replaced by com.sec.android.app.withtv)
	# Used to stream content from your phone to a Samsung smart TV.
	# https://www.samsung.com/us/apps/smart-view-2/

	"com.samsung.android.aremoji"
	# AR Emoji mode for Samsung camera 
	# https://www.samsung.com/global/galaxy/what-is/ar-emoji/

	"com.samsung.android.asksmanager"
	# Samsung device protection manager.
	# It's anti-theft feature. I couldn't find exactly what does the samsung layer to the already existing android device protection : 
	# https://www.greenbot.com/article/2904397/everything-you-need-to-know-about-device-protection-in-android-51.html

	"com.samsung.android.authfw"
	# Used by Samsung Pass
	# Biometric authentication service that can be used to sign in to websites and apps in your mobile.
	# https://www.samsung.com/global/galaxy/apps/samsung-pass/

	"com.samsung.android.bbc.bbcagent"
	# BBCAgent. KNOX related.
	# Couldn't find more information about it.

	"com.samsung.android.bbc.fileprovider"
	# KNOX BBC Provider.
	# Couldn't find more information about it.

	"com.samsung.android.beaconmanager"
	# Replaced by Samsung Smart Things (com.samsung.android.ststub)
	# Allows users to control, automate, and monitor their home environment via mobile device. 
	# https://en.wikipedia.org/wiki/SmartThings

	# "com.samsung.android.bio.face.service"
	# Handle Face recognition unlock 
	# https://kp-cdn.samsungknox.com/b60a7f0f59df8f466e8054f783fbbfe2.pdf

	# Bixby (Samsung intelligence assistant)
	# Enable or Disable access to S-Voice or Bixby voice controls. 
	# This does not prevent access to other voice-controlled apps, only the Samsung-provided ones.
	"com.samsung.android.bixby.agent" # Bixby voice
	"com.samsung.android.bixby.agent.dummy" # Bixby Voice Stub
	"com.samsung.android.bixby.es.globalaction"
	"com.samsung.android.bixby.plmsync"
	"com.samsung.android.bixby.service" # Bixby Service
	"com.samsung.android.bixby.voiceinput"
	"com.samsung.android.bixby.wakeup" # Bixby voice wake-up
	"com.samsung.android.bixbyvision.framework" # BixbyVision Framework

	#"com.samsung.android.bluelightfilter"
	# Blue ligth filter
	# You should use it, it's great)

	"com.samsung.android.calendar"
	# Samsung Calendar App

	#"com.samsung.android.contacts"
	# Samsung contacts app
	# Safe to debloat if you use another contacts app
	# NOTE : If you do, you will no longer be able to access Contacts from the Samsung dialer app.

	"com.samsung.android.da.daagent"
	# Samsung dual messenger (https://www.samsung.com/global/galaxy/what-is/dual-messenger/)
	# Allows you to use two separate accounts for the same app.

	"com.samsung.android.dlp.service"
	# SamsungDLPService (KNOX). Old feature. Was replaced by SDP (Sensitive Data Protection)
	# Data Loss Prevention (DLP) feature
	# Good security feature but only works with Samsung apps.
	# https://docs.samsungknox.com/admin/whitepaper/kpe/sensitive-data-protection.htm 
	# https://docs.samsungknox.com/knox-platform-for-enterprise/admin-guide/sensitive-data-protection.htm

	"com.samsung.android.dqagent"
	# Samsung Device Quality Agent
	# Monitors how the device uses wifi. Has the ability to identify network operator related data.
	# Find mention of some packages in the Java code : 
	#  - com.samsung.android.app.mobiledoctor (https://play.google.com/store/apps/details?id=com.samsung.heartwiseVcr)
	#  - com.samsung.android.dhr (Device Health Report)
	#  - om.salab.act (https://play.google.com/store/apps/details?id=com.jquiz.act)
	#  - kr.co.avad.diagnostictool (unkown stuff from South Korea)
	# 
	#  2 hard-coded URL strings : PRD="https://dc.dqa.samsung.com" | STG="https://stg-dc.dqa.samsung.com"
	#  PRD = Portable recording devices and STG = Security Threat Group 2 terms related to law enforcment.

	"com.samsung.android.drivelink.stub"
	# Stub for car mode 
	# REMINDER : Stub = https://stackoverflow.com/questions/10648280/what-is-stub-and-aidl-for-in-java

	"com.samsung.android.easysetup"
	# Samsung Connect Easy Setup (now SmartThings)
	# Used to connect every Samsung device you have in your house.
	# What's weird is that Galaxy S10 has this package (available nowhere) but S9 has com.samsung.android.oneconnect
	# available on the Playstore (https://play.google.com/store/apps/details?id=com.samsung.android.oneconnect)
	#
	# Needs "com.samsung.android.beaconmanager" to be useful.

	"com.samsung.android.email.provider"
	# Samsung email app (https://play.google.com/store/apps/details?id=com.samsung.android.email.provider)

	#"com.samsung.android.fingerprint.service"
	# Fingerprint service

	"com.samsung.android.fmm"
	# Find My Mobile
	# Tracks down your device when it gets lost. 
	# Lets you remotely lock your device, block access to Samsung Pay and wipe data from the entire device.
	# https://www.samsung.com/global/galaxy/what-is/find-my-mobile/
	# https://findmymobile.samsung.com/

	"com.samsung.android.game.gamehome"
	# Samsung Game Launcher 
	# https://www.samsung.com/global/galaxy/apps/game-launcher/
	# All in one hub for mobiles games

	"com.samsung.android.game.gametools"
	# Samsung Game Tools (https://www.samsung.com/au/support/mobile-devices/how-to-use-game-tools/)
	# Let you record and share screenshots of your game-play. 

	"com.samsung.android.game.gos"
	# Samsung Game Optimizing Service 
	# Is supposed to "improve" game performance.

	"com.samsung.android.gametuner.thin"
	# Samsung Game Tuner (https://play.google.com/store/apps/details?id=com.samsung.android.gametuner.thin)
	# Game Tuner is advanced setting app. It enables you to change the resolution and frames per second settings
	# in mobile games that require tuning for different Android devices, and thereby control heat generation and battery drain.

	"com.samsung.android.hmt.vrshell"
	# Gear VR Shell 
	# Gear VR : https://360samsungvr.com/portal/content/about_samsung_vr

	"com.samsung.android.hmt.vrsvc"
	# Gear VR Service
	# See above.

	"com.samsung.android.intelligenceservice2"
	# It seems that this package is a kind of spyware. Very difficult to find information about this.
	# Some people say it's linked to Carrier IQ (which is a carrier rootkit for the NSA).
	# https://en.wikipedia.org/wiki/Carrier_IQ
	# https://forum.xda-developers.com/showpost.php?s=c85df628dfc39c3a971e6f9cfa98cbb8&p=54071328&postcount=6
	# This package also have very stranges permissions : READ_PLACE / WRITE_PLACE. I couldn't find any explaination on the web. 
	# So either it's a useless samsung package either it's a spyware. I delete it and I didn't notice anything bad.

	"com.samsung.android.keyguardwallpaperupdator"
	# Lets you customize your Samsung device with different images (provided by Samsung) on the lock screen. 

	"com.samsung.android.kidsinstaller"
	# Samsung Kids Home (https://www.samsung.com/global/galaxy/apps/samsung-kids-home/)
	# Lets you shape a "safe environment" for your child.
	# NOTE : You shouldn't give your phone to a child. That bad ! 
	# https://ifstudies.org/blog/a-smartphone-will-change-your-child-in-ways-you-might-not-expect-or-want

	"com.samsung.android.knox.containeragent" # Older version of "com.sec.knox.containeragent2" ?
	"com.samsung.android.knox.containercore"
	# KNOX Work profile/space
	# Providess an isolated environment to store data (see Secure Folder)
	# 
	# Note : With Knox 3.4, Knox containers are now deprecated and replaced by Android work profiles.
	# Comunicate with Samsung servers :
	# - https://vas.samsungapps.com (App updates)
	# - http://cn-ms.samsungapps.com (APK Server)
	#
	# https://support.samsungknox.com/hc/en-us/articles/115012547907-What-URLs-do-I-have-to-whitelist-to-make-Samsung-apps-work-with-an-authenticated-proxy-

	"com.samsung.android.location"
	# IMO it handles GPS needs for some samsungs apps. I have it removed on my phone and I still can use the GPS with a 3-party app.

	#"com.samsung.android.lool" # Device maintenance
	# Samsung Device Care (phone optimizer) (https://play.google.com/store/apps/details?id=com.samsung.android.lool)
	# This package phone home (China, Qihoo 360)
	# The clean feature (in storage setting) is provided by Qihoo 360 which is a shady company (https://en.wikipedia.org/wiki/Qihoo_360)
	# https://www.reddit.com/r/Android/comments/ektg8u/chinese_spyware_preinstalled_on_all_samsung/
	# https://www.virustotal.com/gui/file/048ead2be8d18bbe2b05651380069b3740dd05703e9bd66630da986026518398/details
	# NOTE : If you don't want to delete this package, at least use a firewall (Netguard/AfWall+) to block internet access 

	"com.samsung.android.mateagent"
	# Samsung Galaxy Friends is an accessory platform service that allows the user to enjoy a variety of content quickly 
	# and easily by simply connecting an accessory, without having to install additional applications.
	# https://developer.samsung.com/codelab/SDC18-experiences/Galaxy-Friends

	"com.samsung.android.mdm"
	# MDMApp (Mobile Device Management app)
	# Used to monitor and manage remotely  mobile devices.
	# For exemple locking split-screen, blocking safe mode boot, enabling branding logo in the lock screen, remotely configuring IMAP email...
	# Most likely related to KNOX 
	# https://www.samsungknox.com/en/solutions/it-solutions/knox-manage
	# https://developer.samsung.com/tech-insights/knox/mobile-device-management

	"com.samsung.android.mdx"
	# Media & Devices feature
	# https://www.samsung.com/latin_en/support/mobile-devices/media-and-device-feature/

	#"com.samsung.android.messaging"
	# Samsung Messaging app 

	"com.samsung.android.mobileservice"
	# Samsung Experience Service (https://play.google.com/store/apps/details?id=com.samsung.android.mobileservice)
	# Handle you samsung account and is needed to use some samsung apps features.
	# It allows you to use multiple Samsung apps, such as Samsung Health, Samsung Pay, Galaxy Apps, Samsung Members, and SmartThings, 
	# with your Samsung account credentials.

	#"com.samsung.android.MtpApplication"
	# Samsung overlay for MTP. Talks to com.android.mtp
	# Needed to access to your phone from a computer.

	"com.samsung.android.networkdiagnostic"
	# Network Diagnostic
	# Autostart after boot. 9 permissions (including ACCESS_FINE_LOCATION : precise GPS location) + 1 unknown permission : SEC_FACTORY_PHONE
	# Seems to be telemetry.

	"com.samsung.android.oneconnect"
	# Samsung Smart Things (https://play.google.com/store/apps/details?id=com.samsung.android.oneconnect)
	# Lets you manage all your Samsung and SmartThings-compatible devices.
	# https://www.samsung.com/global/galaxy/apps/smartthings/
	# 
	# Probably needs com.samsung.android.beaconmanager

	"com.samsung.android.personalpage.service"
	# Private mode (was replaced by Secure Folder)
	# https://www.samsung.com/uk/support/mobile-devices/what-is-private-mode-and-how-do-i-use-it/
	#"com.samsung.android.provider.shootingmodeprovider"
	# Provide camera modes (when you swipe left fromt the camera app)
	# Safe to remove (but it is quite useful)

	#"com.samsung.android.provider.stickerprovider" 
	# One more package related to camera stickers.
	# DO NOT REMOVE THIS IF YOU USE STOCK CAMERA (Samsung camera-app closes after about 4s!) 
	# adb shell 'pm disable-user com.samsung.android.provider.stickerprovider' can be used as a workaround if you want to stop this running in the background.

	"com.samsung.android.providers.context"
	# Spyware 
	# https://www.eteknix.com/samsungs-context-service-may-take-data-collection-surveillance-worrying-levels/
	# https://www.theinquirer.net/inquirer/news/2328363/samsung-context-service-will-collect-user-data-to-share-with-developers

	"com.samsung.android.samsungpass"
	# Samsung Pass app
	# https://www.samsung.com/global/galaxy/apps/samsung-pass/

	"com.samsung.android.samsungpassautofill"
	# Auto Fill for Samsung Pass
	# Once your account information is registered, you can use iris, fingerprint, or face recognition to sign in.
	# https://www.samsung.com/us/support/answer/ANS00082282/

	"com.samsung.android.samsungpositioning"
	# Run at startup and ask for an unknown permission SEC_FACTORY_PHONE
	# This package seems to be used for samsung apps needing location.

	"com.samsung.android.sdk.professionalaudio.utility.jammonitor"
	# Professional Audio
	# Allows you to create virtual instrument applications with Android.
	# https://developer.samsung.com/html/techdoc/ProgrammingGuide_ProfessionalAudio.pdf

	"com.samsung.android.sdk.professionalaudio.app.audioconnectionservice" # [MORE INFO NEEDED]
	# AudioConnectionService
	# I believe it allows to modulate an audio signal. I didn't find a lot of apps using this package.
	# Nothing really worrying but safe to remove if you want.

	"com.samsung.android.shortcutbackupservice"
	# ShortcutBNR 
	# Related to smartSwitch Samsung Cloud features

	"com.samsung.android.slinkcloud"
	# Samsung Cloud Gateway
	# NEEDED FOR Scloud app
	# A cloud storage gateway is designed to provide interoperability between different data protocols used 
	# in a client (Scloud app)/server cloud architecture. 
	# MORE INFO : https://searchstorage.techtarget.com/definition/cloud-storage-gateway
	#
	# Needs a lot of permission (including the dangerous one : READ_PHONE_STATE)
	# It means the app has the ability to read the device ID (e.g. IMEI or ESN) and phone number.
	# https://developer.android.com/reference/android/Manifest.permission#READ_PHONE_STATE
	#
	# Hardcoded Alibaba (chinese) server IP (42.120.153.17) 
	# https://www.hybrid-analysis.com/sample/2ef5367f700d2644fc51d2cdd8dd0ce97e9a6594cb5b89052537037c5a7aac56?environmentId=200
	# https://web.archive.org/web/20200604093347/https://www.hybrid-analysis.com/sample/2ef5367f700d2644fc51d2cdd8dd0ce97e9a6594cb5b89052537037c5a7aac56?environmentId=200

	"com.samsung.android.smartface"
	# SmartFaceService
	# Used to automatically detects faces when using the Samsung camera
	# NOTE : This package has nothing to do with face unlock (com.samsung.android.bio.face.service)

	"com.samsung.android.stickerplugin" # [MORE INFO NEEDED]
	# StickerPlugin
	# Not sure if this package also provides stickers for camera. I don't have it so I can't test
	# https://developer.samsung.com/galaxy/stickers

	"com.samsung.android.sm"
	# Smart Manager app 
	# Provides pretty useless optimizing features using Chinese company Qihoo database.
	# Automatically scans and optimizes data usage to preserve battery levels, manage storage and RAM
	# https://www.privateinternetaccess.com/blog/android-community-worried-about-presence-of-chinese-spyware-by-qihoo-360-in-samsung-smartphones-and-tablets/
	# https://forum.xda-developers.com/galaxy-note-9/help/samsung-services-dialling-home-to-china-t3894033

	#"com.samsung.android.sm.devicesecurity"
	# Samsung Device security for the Smart Manager app using McAfee antivirus engine.
	# This is the antivirus in Settings -> Device care -> Security
	# Privacy nightmare (holy moly there is a LOT of permissions!) for a bit of security. 
	# https://www.hybrid-analysis.com/sample/05dab93ee2102a2fb6edf16e85750eb1f0189d7b82703c6a00c92cd08d62bb28?environmentId=200
	# ARCHIVE : https://web.archive.org/web/20200607140002/https://www.hybrid-analysis.com/sample/05dab93ee2102a2fb6edf16e85750eb1f0189d7b82703c6a00c92cd08d62bb28?environmentId=200
	# 
	# There is always a trade-off between security and privacy.
	# Some people reported that without this package they weren't able to install apps anymore BUT I personnally removed this and
	# I still can install apps.
	# I think (but I'm not sure at all) that you can remove this safely if you also remove com.samsung.aasaservice and com.samsung.android.sm

	# Samsung Cloud (https://www.samsung.com/us/support/owners/app/samsung-cloud)
	"com.samsung.android.scloud" # Samsung Cloud app
	"com.samsung.android.scloud.auth" # Handle authentifcation for Samsung cloud
	"com.samsung.android.scloud.sync" # Samsung cloud synchronisation service

	"com.samsung.android.sconnect"
	# Samsung Quick connect (discontinued ?)
	# In theorie, it lets you connect your phone to a variety of devices over Wifi
	# that support multiple protocols — including Wifi Direct and Miracast — to display photos, video or audio.
	# https://www.samsung.com/uk/support/tv-audio-video/what-is-screen-mirroring-and-how-do-i-use-it-with-my-samsung-tv-and-samsung-mobile-device/

	"com.samsung.android.securitylogagent"
	# Security Log Agent
	# https://www.androidexplained.com/galaxy-note-9-disable-security-log-agent/
	# Run in the background and monitore your device for any change to the /system partition.
	# NOTE : When you root your phone, it will constantly tell you that your device is modified.

	"com.samsung.android.service.livedrawing"
	# Live Message enables you to draw your own animated GIFs or emojis.
	# https://www.samsung.com/global/galaxy/what-is/live-message/

	"com.samsung.android.service.peoplestripe"
	# People Edge
	# Gives you immediate access to your favorite contacts from the edge of your phone.
	# https://www.samsung.com/global/galaxy/what-is/people-edge/
	# https://videotron.tmtx.ca/en/topic/samsung_galaxys9/using_people_edge.html
	# It gives you immediate access to your favorite contacts from the edge panel.

	"com.samsung.android.service.travel"
	# Samsung Travel Wallpaper (discontinued)

	"com.samsung.android.smartcallprovider"
	# Samsung Smart Call
	# Provides caller profile information to help consumers identify incoming calls and block unwanted ones.
	# Also related to the 'local places' feature in Samsung dialer.
	# Relies on Hiya (see com.hiya.star)
	# TL;DR : Really bad for privacy.

	"com.samsung.android.smartmirroring"
	# Samsung Smart View
	# Enable you to mirror screen your phone to a TV
	# https://www.samsung.com/us/apps/smart-view-2/

	"com.samsung.android.spay"
	# Samsung Pay (https://play.google.com/store/apps/details?id=com.samsung.android.spay)
	# Samsung Pay is a mobile payment and digital wallet service by Samsung Electronics that lets users make payments using compatible phones 
	# and other Samsung-produced devices
	# https://en.wikipedia.org/wiki/Samsung_Pay
	# NOTE : Samsung Pay is KNOX dependant and will never work again if you root your phone.
	# FYI : Your data are sold (https://www.sammobile.com/news/samsung-pay-new-privacy-policy-your-data-sold/)

	"com.samsung.android.spayfw" 
	# Samsung Pay Framework needed for Samsung Pay
	# See above

	#"com.samsung.android.spdclient"
	# Security policy updates (part of KNOX)
	# Updates the SELinux policies according to Security Enhancements for Android (SE for Android)
	# There are privacy implications to the data collected by Samsung
	# https://security.stackexchange.com/questions/161190/does-samsungs-security-enhancements-for-android-offer-anything-for-consumers
	# Not mandatory if you know what you are doing and if you don't install software from unknown sources.
	# Needs confirmation but removing this package should change SELinux mode (enforcing by default)
	# https://source.android.com/security/selinux

	"com.samsung.android.spdfnote"
	# Write on PDF (https://play.google.com/store/apps/details?id=com.samsung.android.spdfnote)
	# PDF annotator

	"com.samsung.android.stickercenter"
	# Sticker center. Used to retrieve stickers from the web in the camera app.
	# https://developer.samsung.com/galaxy/stickers

	"com.samsung.android.ststub"
	# Allows users to control, automate, and monitor their home environment via mobile device. 
	# https://en.wikipedia.org/wiki/SmartThings
	# REMINDER : stub = https://stackoverflow.com/questions/10648280/what-is-stub-and-aidl-for-in-java

	"com.samsung.android.svcagent"
	# Impossible to know what this system app does. It has full access to internet network anyway.
	# Safe to remove

	"com.samsung.android.svoice"
	# Samsung Voice (S Voice) was replaced by bixby on Samsung Galaxy S8(+) and newer phones.
	# Virtual mobile personal assistant capable of running a  basic tasks through voice command alone.
	# https://www.samsung.com/global/galaxy/what-is/s-voice/

	"com.samsung.android.svoiceime"
	# Samsung voice input 
	# Voice input powered by Bixby. See above.

	"com.samsung.android.themecenter"
	# Samsung theme center
	# Run at startup and enable you to download theme from samsung
	# Safe to remove

	"com.samsung.android.themestore"
	# Galaxy Themes
	# Official Samsung app for modifying your smartphone's theme.
	# https://www.samsung.com/global/galaxy/apps/galaxy-themes/

	"com.samsung.android.tripwidget"
	# Discontinued package (used in Galaxy S4) handling trip wallpaper widget.

	"com.samsung.android.universalswitch"
	# Universal Switch lets you designate certain touches or gestures to control specific actions on your phone. 
	# https://www.samsung.com/uk/accessibility/mobile-universal-switch/

	"com.samsung.android.visioncloudagent"
	# VisionCloudAgent
	# Cloud Agent is a service which automatically upload on the cloud the photos you take on your phone. It connects to your "Samsung account".
	# It is related to Dropbox.
	# Given the Vision in the package name there is a link with Bixby.

	"com.samsung.android.visionintelligence"
	# Bixby Vision
	# Augmented reality camera that can identify objects in real-time and potentially offer the user
	# to purchase them online, translate text, read QR codes, and recognize landmarks. 
	# https://www.samsung.com/global/galaxy/apps/bixby/vision/

	"com.samsung.android.voc"
	# Samsung Members (https://play.google.com/store/apps/details?id=com.samsung.android.voc)
	# The other version is "com.samsung.oh".

	"com.samsung.android.voicewakeup"
	# Voice wake-up for using Bixby
	# https://www.samsung.com/us/support/answer/ANS00080448/

	"com.samsung.android.weather"
	# Samsung Weather

	"com.samsung.android.wellbeing"
	# Digital Welbeing (https://play.google.com/store/apps/details?id=com.google.android.apps.wellbeing)
	# is a feature which shows apps dashboard through which one can see how much time any application opened and 
	# also swiping to different screens allows you to see breakdowns by day, by hour and by app.

	"com.samsung.android.widgetapp.yahooedge.finance"
	# Samsung Finance provided by Yahoo

	"com.samsung.android.widgetapp.yahooedge.sport"
	# Samsung Sport provided by Yahoo 

	#"com.samsung.app.slowmotion"
	# Slowmotion mode in camera app

	#"com.samsung.clipboardsaveservice"
	# Clipboard Save service save all the content you saved in the clipboard (clipboard history)
	# If you remove this you will still be able to copy/cust/past but a new content in clipboard will replace the current content.
	# In short : there will no longer be a history.

	#"com.samsung.cmh" # [MORE INFO NEEDED]
	# CMH Provider is a dependency for the the samsung gallery app. This pacakge asks for a lot of permissions. 
	# It seems to be be used for cloud and story stuff in the gallery and also seems needed for content recognition.
	# Has the same shared user id than com.samsung.faceservice, com.samsung.mlp, com.samsung.mpl
	#  
	# NOTE : Deleting this package will also prevent to preview photos from the camera app.
	# Seems to trigger com.samsung.faceservice, com.samsung.mlp, com.samsung.mpl when needed.

	"com.samsung.crane"
	# Call+ (https://support.vodafone.co.uk/Vodafone-apps/Call-and-Message/60900956/What-is-Call.htm)
	# Call+ features on Samsung dialer
	# NOTE: I have the feeling that these features are carrier/country dependant because I don't have them. But I have this package anyway.

	"com.samsung.daydream.customization"
	# Samsung customization for Google Daydream VR headset (https://arvr.google.com/daydream/)
	# NOTE : Google discontinued Daydream in 2019 and it no longer works on Android 10 Samsung devices

	"com.samsung.desktopsystemui"
	# Samsung DEX UI
	# Extends your smartphone into a "desktop computing experience".
	# https://developer.samsung.com/samsung-dex/how-it-works

	#"com.samsung.dcmservice"
	# Hard to find what it really does but I do know what DCM is in telecommunication. It means Dual Carrier Modulation.
	# To stay simple, we use signal modulation to transfer information. DCM can be seen as an enhancement to conventional QPSK modulation
	# that expand the coverage and robustness of an outdoor hotspot.
	# https://www.ekahau.com/wp-content/uploads/2017/03/Webinar-slides-802.11ax-Sneak-Peek-%E2%80%93-The-Next-Generation-Wi-Fi.pdf
	# Not a good idea to remove this unless it only impacts samsung apps. I will test.

	"com.samsung.ecomm"
	# Shop Samsung (https://play.google.com/store/apps/details?id=com.samsung.ecomm)
	# App where you can buy all (and only) Samsung products.
	# https://www.samsung.com/us/explore/shop-samsung-app/

	"com.samsung.enhanceservice"
	# Enhanced service is the process for Samsung cloud messaging (equivalent to iMessage on iOS). 
	# Messages on Samsung phones can be transmitted through either the network carrier or the non-archived Samsung service 
	# (which is transmitted over wireless data).
	# This features is available in stock samsung SMS app settings.

	"com.samsung.faceservice" # [MORE INFO NEEDED]
	# Face service detection 
	# Same shared user id as com.samsung.ipservice, com.samsung.mlp, com.samsung.cmh
	# Needed for face recognition in the Gallery
	# NOTE : Removing this package *should* not break face unlock (confirmation needed)

	"com.samsung.groupcast"
	# Samsung Group Play (discontinued)
	# Allows you to share pictures , documents and music files with many people at same time  if everyone is connected to a Wi-Fi network. 
	# https://www.samsung.com/in/support/mobile-devices/what-is-group-play-in-samsung-smartphones/

	"com.samsung.helphub"
	# Not sure if this package still exist.
	# Provide help 

	"com.samsung.hiddennetworksetting"
	# Set of hidden network settings (inlcuding frequency bands choice)
	# How to see these settings : https://forum.xda-developers.com/galaxy-note-8/help/q-hidden-network-settings-pie-t3914421/page4
	
	"com.samsung.ipservice" # [MORE INFO NEEDED]
	# Same shared user id as com.samsung.faceservice, com.samsung.mlp, com.samsung.cmh
	# Used by Galaxy Finder & Galaxy Vision to access web data
	# Do removing this package break face/content recognition?  
	#
	# Name and permissions of this package suggest that it is used by Galaxy Finder to seek stuff on the web.
	# Same shared user id as com.samsung.faceservice, com.samsung.mlp, com.samsung.cmh

	########## KNOX ###########
	# Provides a list of security features—both hardware and software—that allow business and personal content to securely coexist on the same handset
	# https://en.wikipedia.org/wiki/Samsung_Knox
	# https://images.samsung.com/is/content/samsung/p5/ch/business/enterprise-edition/Knox_Platform_for_Enterprise_Whitepaper_2019.pdf

	"com.samsung.klmsagent"
	# Checks the validity of your KLM/KPE (Knox Licence Manager) licence.
	# This packages is needed for Samsung Health (com.sec.android.app.shealth) and probably all Knox related apps (like secure folder, samsung Pay...)
	# 
	# Note: KLM licences are depreciated. Samsung now only support KPE (Knox Platform for Enterprise) keys.
	# KPE keys are provided by Samsung and enable app's developers to access knox features.

	"com.samsung.android.knox.analytics.uploader"
	# Knox Analytics Uploader
	# Sends analytcs to Samsung

	"com.samsung.knox.knoxtrustagent"
	# Knox Quick Access allows users to access the Knox Workspace container using wearables such as the Galaxy Gear S2.

	"com.samsung.knox.kss"
	# Knox Keyguard. Not much more information 

	"com.samsung.knox.securefolder"
	# Knox Secure Folder (https://play.google.com/store/apps/details?id=com.samsung.knox.securefolder)
	# Create a secure space on your device to encrypt and store your private data and apps.
	# https://www.samsungknox.com/en/solutions/personal-apps/secure-folder
	# NOTE : The key used to encrypt the files is not derived from the password you use to unlock the secure folder 
	# but rather from a key stored in the hardware that is set in the factory.

	"com.samsung.mdl.radio"
	# Samsung Milk Music (discontinued in 2016)
	# It was a freemium online music streaming service, with music streams and a recommendation engine powered by Slacker Radio.
	# https://en.wikipedia.org/wiki/Milk_Music_(streaming_service)

	"com.samsung.mlp"
	# Samsung content recognition.
	# mpl= Media Learning Platform. Has permissions linked to com.samsung.cmh and com.samsung.android.visionintelligence

	"com.samsung.mdl.radio.radiostub"
	# Milk Music (shut down by Samsung)
	# It was a music streaming app
	# https://en.wikipedia.org/wiki/Milk_Music_(streaming_service)

	"com.samsung.oh"
	# Samsung Members (https://play.google.com/store/apps/details?id=com.samsung.oh)
	# Samsung community. It's a kind of social media app for Samsung users.
	# https://www.samsung.com/global/galaxy/apps/samsung-members/
	# OOOPS ! https://bgr.com/2019/10/31/samsung-members-dong-pic-oops/
	# The other version is "com.samsung.android.voc".

	"com.samsung.rcs" # [MORE INFO NEEDED]
	# RCS (Rich Communication Services)
	# Has permissions linked to com.samsung.cmh, and com.samsung.android.visionintelligence (and I don't understand why)
	# RCS is a communication protocol between mobile telephone carriers and between phone and carrier, aiming at replacing SMS.
	# https://en.wikipedia.org/wiki/Rich_Communication_Services
	# Note that it uses IP protocol so you need to connect to Wifi/3G/4G...  to take advantage of it.
	#
	# It's a hot mess right now. It aims at being universal but you still need to have a Samsung Messages 
	# or Google Message. 3-party apps can't support it because google hasn't released a public API yet.
	# 
	# In a lot of country messages go through Google's Jibe servers.
	# https://jibe.google.com/policies/terms/	
	#
	# https://pocketnow.com/why-you-should-probably-avoid-googles-rcs-text-messaging-chat-feature

	"com.samsung.safetyinformation"
	# Some safety information telling you not to put your phone in your eyes (it's not a joke)

	#"com.samsung.sdm"
	# Handles OTA system Updates. 

	#"com.samsung.sdm.sdmviewer" # [MORE INFO NEEDED]
	# Lets you view installed updates?

	#"com.samsung.sec.android.application.csc"
	# Do something related to Country Specific Code (CSC). Maybe it only let you change your CSC
	# Every Android device from Samsung has a folder called CSC.
	# This folder contains some XML files that keep the configuration codes for the country and carrier-based customization options.
	# Maybe it's safe to remove if you'll never change your CSC but it needs testing and I lack time for this.
	# (I already have plenty of other packages uninstallation to test)

	"com.samsung.SMT"
	# Samsung TTS (Text-to-speech)
	# Seems discontinued.

	"com.samsung.storyservice"
	# Samsung StoryService
	# Create stories in the Gallery from your pictures and videos.
	# https://www.samsung.com/uk/support/mobile-devices/what-is-video-collage-and-how-do-i-use-it/
	# Use of content recognition (so may be related)

	"com.samsung.svoice.sync"
	# Samsung Voice service

	"com.samsung.systemui.bixby"
	"com.samsung.systemui.bixby2"
	# System UI for Bixby/Bixby2

	"com.samsung.tmovvm"
	# Samsung Visual Voicemail
	# Allows you to review and manage your voicemail directly from your smartphone, eliminating the need to dial into your mailbox.
	# https://mobile.spectrum.com/support/article/360001296667/samsung-visual-voicemail

	"com.samsung.ucs.agent.boot"
	# Boot agent
	# UCS is a company which has partnered with Samsung to provide licenses for Samsung Knox
	# https://www.ucssolutions.com/blog/samsung-knox/
	# I don't have precise information about the package itself but there are chances that it verifies some files on boot. If theses files are not verified
	# then it prevent the phone to boot 

	"com.samsung.ucs.agent.ese"
	# eSE UCS Plugin is another package from UCS. It makes possible for apps to access eSE of Samsung mobile devices by using the UCM 
	# (Universal Credential Management) APIs and framework.
	# https://docs.samsungknox.com/dev/knox-sdk/faqs/general/what-is-universal-credential-management_-ucm.htm
	# https://www.samsung.com/semiconductor/security/ese/
	# See above

	#"com.samsung.upsmtheme"
	# Handle the theme of UPSM (Ultra Power Saving Mode)
	# Safe to remove

	"com.samsung.voiceserviceplatform"
	# Samsung Voice (for Galaxy S7)
	# Virtual mobile personal assistant capable of running basic tasks through voice
	# https://www.samsung.com/global/galaxy/what-is/s-voice/

	"com.samsung.vvm"
	# Samsung Voicemail 
	# Allows you to review and manage your voicemail directly from your smartphone, eliminating the need to dial into your mailbox.
	# https://mobile.spectrum.com/support/article/360001296667/samsung-visual-voicemail

	"com.sec.allsharecastplayer"
	# Screen Mirroring (only in Galaxy S6)
	# Cast your mobile screen to a TV.
	# https://www.samsung.com/us/2012-allshare-play/

	"com.sec.android.app.apex"
	# Samsung ApexService
	# Provides a motion photos player/viewer
	# https://www.samsung.com/global/galaxy/what-is/motion-photo/

	"com.sec.android.app.applinker"
	# Related to FeliCa Networks (https://en.wikipedia.org/wiki/FeliCa / https://www.felicanetworks.co.jp/en/).
	# FeliCa is contactless RFID smart card system mainly used for wallet function on mobile devices
	#
	# Has the permission INSTALL_PACKAGES

	"com.sec.android.app.billing"
	# Samsung billing/Checkout
	# Used to purchase apps through Samsung Store application that is delivered with Samsung phones. 
	# Acts as bridge between Samsung Store and payment servers.

	#"com.sec.android.app.camera"
	# Samsung camera app
	# Safe to remove (but not recommanded)

	"com.sec.android.app.desktoplauncher"
	# Samsung DeX Home (launcher)
	# Dex Enables users to extend their device into a desktop-like experience by connecting a keyboard, mouse, and monitor.
	# "DeX" is a contraction of "Desktop eXperience".
	# https://en.wikipedia.org/wiki/Samsung_DeX

	"com.sec.android.diagmonagent" 
	# Diagnostic Monitoring Agent
	# Used to send diagnostic data to Samsung
	# Data collection from Settings > Biometrics and security > Send diagnostic data

	"com.sec.android.app.dictionary"
	# Samsung Dictionary is is an app that enables you to manage all the dictionaries stored on your Samsung device.

	"com.sec.android.app.easysetup"
	# Core of Samsung SmartThings (formerly Samsung Easy Setup)
	# See com.samsung.android.easysetup

	"com.sec.android.app.factorykeystring"
	# DeviceKeyString : Dialable hidden diagnostic/debug app
	# Dial *#0283# to open audio LoopbackTest control, dial *#2663# for TSP firmware update

	"com.sec.android.app.gamehub"
	# Samsung Game Hub
	# Was replaced by "com.samsung.android.game.gamehome"
	# https://www.techradar.com/news/phone-and-communications/mobile-phones/the-samsung-game-hub-explained-1143450

	"com.sec.android.app.hwmoduletest" 
	# HwModuleTest, a hardware hidden test app (dial *#0*# to open it). 
	# Fun low-level stuff to see in there

	#"com.sec.android.app.launcher"
	# Samsung One UI Home launcher (homescreen) (https://play.google.com/store/apps/details?id=com.sec.android.app.launcher)
	# It is samsung Touchwiz default launcher
	# DO NOT REMOVE THIS IF YOU DON'T USE ANOTHER LAUNCHER ! 

	"com.sec.android.app.magnifier"
	# Lets you use your device as a magnifying glass making it easier to read any small font or expand the details of any object, for example.

	#"com.sec.android.app.myfiles"
	# Samsung file manager app (https://play.google.com/store/apps/details?id=com.sec.android.app.myfiles) 

	"com.sec.android.app.mt"
	# The Mobile tracker is a security feautre in your device that if someone inserts a new SIM card in your device the device will automatically 
	# sends the SIM contact number to specified recipients to help you locate and recover you device.
	# https://www.samsung.com/nz/support/mobile-devices/what-is-mobile-tracker/

	"com.sec.android.app.ocr"
	# Optical Read (feature replaced by Bixby Vision : com.samsung.android.visionintelligence)
	# Lets you scan or extract text or data from images, documents, business cards, or QR codes.

	"com.sec.android.app.parser" 
	# DRParser Mode 
	# Secret code parser
	# Support for hidden samsung apps launched via secret codes

	#"com.sec.android.app.personalization"
	# Without a doubt this package is involved in personalization of something but It's hard to find what.
	# 2 permissions : READ_PHONE_STATE and CHANGE_PHONE_STATE

	#"com.sec.android.app.popupcalculator"
	# Samsung calculator app (https://play.google.com/store/apps/details?id=com.sec.android.app.popupcalculator)

	"com.sec.android.app.quicktool"
	# The Quick Tools panel includes a ruler, a compass and a torch. To add this to the Edge Panel (com.samsung.android.app.clipboardedge)

	"com.sec.android.app.samsungapps"
	# Samsung Galaxy Store
	# Samsung app store.
	# https://en.wikipedia.org/wiki/Samsung_Galaxy_Store

	"com.sec.android.app.safetyassurance"
	# Safety assurance is related to emergency features. It is especially used for SOS messages.
	# https://www.samsung.com/nz/support/mobile-devices/samsung-sos-smart-phone-emergency-message-guide/

	"com.sec.android.app.sbrowser"
	# Samsung web browser (https://play.google.com/store/apps/details?id=com.sec.android.app.sbrowser)

	"com.sec.android.app.scloud" # [APK_NEEDED]
	# I guess it's the core of Samsung scloud.

	#"com.sec.android.app.simsettingmgr"
	# SIM card manager.
	# Contains configuration and settings for handling dual SIM (give a SIM an icon, a name, and so on)

	"com.sec.android.app.SecSetupWizard"
	# Samsung Setup Wizard
	# The first time you turn your device on, a Welcome screen is displayed. It guides you through the basics of setting up your device.
	# It's the setup for Samsung services.

	"com.sec.android.app.servicemodeapp" 
	# SysDump hidden app
	# Low-level debugging and diagnostics tools (dial *#9900# to open it)

	"com.sec.android.app.shealth"
	# Samsung Health (https://play.google.com/store/apps/details?id=com.sec.android.app.shealth)
	# Serves to track various aspects of daily life contributing to well being such as physical activity, diet, and sleep.
	# https://en.wikipedia.org/wiki/Samsung_Health

	#"com.sec.android.app.soundalive" 
	# Responsible for Dobly Atmos and other pre-programmed equalizer stuff (accessible from the Settings app)
	# Needed by Adapt Sound (com.sec.hearingadjust) which a pretty useful but little known feature.

	"com.sec.android.app.sns3"
	# Samsung Galaxy (Only installed on older phone before Galaxy S7)
	# Don't really know what this app does but majority of people deleted this.

	"com.sec.android.app.translator"
	# Samsung Translater (S Translater)
	# https://www.samsung.com/africa_en/support/mobile-devices/what-is-s-translator-and-how-does-it-work/

	"com.sec.android.app.voicenote"
	# Samsung Voice recorder (https://play.google.com/store/apps/details?id=com.sec.android.app.voicenote)

	"com.sec.android.app.withtv"
	# Samsung Smart View
	# Allows you to cast your phone screen to the TV.
	# https://www.samsung.com/us/apps/smart-view-2/

	"com.sec.android.AutoPreconfig"
	# Auto Preconfig
	# Tells you to format the device when sim from other country is used basically (won't let you use another one)

	"com.sec.android.cover.ledcover"
	# Samsung LED cover service
	# Display stuff on the LED case.
	# https://www.samsung.com/us/support/troubleshooting/TSG01001489/
	# HOW IT WORKS : https://forum.xda-developers.com/galaxy-note-8/accessories/how-led-cover-t3686694

	"com.sec.android.daemonapp"
	# Unified Daemon app 
	# provides support for a number of different apps on your device. These include the Weather, Yahoo Finance and Yahoo News apps amongst others. 
	# The data is used by apps such as the Alarm, Calendar app and the camera.

	"com.sec.android.desktopcommunity" # [MORE INFO NEEDED]
	# Samsung DeX panel

	"com.sec.android.app.dexonpc"
	"com.sec.android.desktopmode.uiservice"
	# Samsung DeX
	# Extends your smartphone into a "desktop computing experience".
	# Concretely this lets you access all your mobile apps and content from a computer.
	# Only works on Windows/MacOS. You will need to install the Samsung DeX app on your computer.
	# https://en.wikipedia.org/wiki/Samsung_DeX
	# https://www.samsung.com/global/galaxy/apps/samsung-dex/

	"com.sec.android.easyMover"
	# Samsung Smart Switch Mobile (https://play.google.com/store/apps/details?id=com.sec.android.easyMover)
	# Allows you to easily transfer content (contacts, photos, music, notes, etc.) to a new Samsung Galaxy device. 
	# https://www.samsung.com/global/galaxy/apps/smart-switch/
	# https://fr.wikipedia.org/wiki/Smart_Switch

	"com.sec.android.easyMover.Agent"
	# Smart Switch Agent
	# Needed to use Smart Switch. See above.

	"com.sec.android.easyonehand"
	# Samsung Easy One Hand mode (replaced by One Hand Operation + : com.samsung.android.sidegesturepad)

	#"com.sec.android.emergencylauncher"
	# Samsung Launcher when in emergency mode. 
	# Here, emergency = low battery 
	# See below

	#"com.sec.android.emergencymode.service"
	# Emergency mode enables you to extend your device’s standby time when you are in an emergency situation and you want your device to 
	# conserve power for as long as possible. When this mode is activated, the screen’s brightness will decrease and some of  
	# the device's functionality will be limited in order to conserve your battery's charge. The home screen will be changed to a black theme 
	# to reduce battery consumption.
	# It is NOT related to SOS messages/911.
	# https://www.samsung.com/uk/support/mobile-devices/what-is-emergency-mode/

	"com.sec.android.fido.uaf.asm"
	# Fido is a set of open technical specifications for mechanisms of authenticating users to online services that do not depend on passwords.
	# https://fidoalliance.org/specs/u2f-specs-1.0-bt-nfc-id-amendment/fido-glossary.html
	# https://fidoalliance.org/specs/fido-v2.0-rd-20170927/fido-overview-v2.0-rd-20170927.html
	#
	# The UAF protocol is designed to enable online services to offer passwordless and multi-factor security by allowing users to register their device 
	# to the online service and using a local authentication mechanism such as iris or fingerprint recognition. .
	# https://developers.google.com/identity/fido/android/native-apps
	#
	# The UAF Authenticator-Specific Module (ASM) is a software interface on top of UAF authenticators which gives a standardized way for FIDO UAF clients 
	# to detect and access the functionality of UAF authenticators and hides internal communication complexity from FIDO UAF Client.
	# Source : https://fidoalliance.org/specs/fido-uaf-v1.0-ps-20141208/fido-uaf-asm-api-v1.0-ps-20141208.html
	#
	# Safe to remove if you don't use password-less authentification to access online servics

	"com.sec.android.fido.uaf.client"
	# Fido UAF client. It's a layer that connects authenticator and RP (the application owner) and ensures validity of the connection. 
	# So it can be browser, desktop application, mobile application, platform(i.e. android/ios).
	# See above
	# 
	# Safe to remove if you don't use password-less authentification to acess online servics

	#"com.sec.android.gallery3d"
	# Samsung Gallery app (https://play.google.com/store/apps/details?id=com.sec.android.gallery3d)
	# Note: Samsung Gallery is a dependency for the camera so it's not a good idea to delete it.
	# Note : Good to know. When the original version of the image is deleted, the copy of it within the com.sec.android.gallery3d  folder is not removed.
	# https://athenaforensics.co.uk/com-sec-android-gallery3d-mobile-phone-forensics/
	# NOTE : Deleting this package will also prevent to preview photos from the camera app.

	#"com.sec.android.gallery3d.panorama360view"
	# Let you see panoramic photos in the samsung Gallery.

	"com.sec.android.game.gamehome"
	# Samsung Game launcher
	# Centralizes all your android games. This app can track all your games, how many hours you've spent playing each one, and which genres you play the most.
	# Recommends games based on your profile.
	# https://galaxystore.samsung.com/prepost/000004906980?appId=com.samsung.android.game.gamehome 

	"com.sec.android.mimage.avatarstickers"
	# Samsung My Emoji Stickers
	# Let you turn yourself into an emoji. Woah ! What an incredible feature...
	# https://www.samsung.com/us/support/answer/ANS00078920/

	"com.sec.android.mimage.gear360editor"
	# 360 Photo Editor
	# Lets you edit the 360-degree photos you took.

	#"com.sec.android.mimage.photoretouching"
	# Samsung Photo Editor
	# Disabling this will disable the inbuilt photo editor accessed via the stock gallery.
	# Safe to remove if you don't use Samsung gallery.

	#"com.sec.android.ofviewer"
	# Samsung selective focus camera mode.
	# Safe to remove (but it's pretty useful)

	"com.sec.android.preloadinstaller"
	# Very shady apk. According to if you're chinese or not, Samsung mount an hidden partition during the first boot and install some apps.
	# https://nitter.net/fs0c131y/status/1046689524691218432#m
	# Archive : https://web.archive.org/web/20200107110205/https://nitter.net/fs0c131y/status/1046689524691218432

	#"com.sec.android.provider.emergencymode"
	# Provider for emergency mode (com.sec.android.emergencylauncher)
	# Reminder : Content providers help an application manage access to data stored by itself, stored by other apps, 
	# and provide a way to share data with other apps. They encapsulate the data, and provide mechanisms for defining data security
	# Source : https://developer.android.com/guide/topics/providers/content-providers.html

	"com.sec.android.provider.snote"
	# Content provider for S Note (https://www.samsung.com/global/galaxy/apps/samsung-notes/).
	# REMINDER : Content providers help an application manage access to data stored by itself, stored by other apps, 
	# and provide a way to share data with other apps. They encapsulate the data, and provide mechanisms for defining data security
	# Source : https://developer.android.com/guide/topics/providers/content-providers.html	

	"com.sec.android.RilServiceModeApp"
	# Service mode RIL hidden app. Used for debug and diagnostics
	# dial *#0011# for modem connectivity info, *#9090# for diagnostics control
	#
	# RIL means Radio Interface Layer. It's the bridge between Android phone framework services and the hardware.
	# https://wladimir-tm4pda.github.io/porting/telephony.html
	# https://stackoverflow.com/questions/11111067/how-does-modem-code-talk-to-android-code
	# Samsung RIL is a add on from Samsung : Modem <=> Linux kernel <=> libsamsung-ipc <=> Samsung-RIL <=> Android framework <=> Android applications

	#"com.sec.android.sdhms"
	# Samsung Device Health Manager Service
	# Battery estimation service for Samsung Care/Device maintenance (com.samsung.android.lool)
	# There is some weird stuff in the java code. I don't understand why there is a need to parse torrent files for instance
	# or why there is a string "googleapis.com/drive"
	# https://developers.google.com/drive/api/v3/reference

	"com.sec.android.service.health"
	# Samsung Health Service
	# Needed for Samsung Health (com.sec.android.app.shealth)

	"com.sec.android.sidesync30"
	# SideSync (discontinued)
	# Lets you share the screen and data between your PC and mobile device. 
	# Receive alarms of your phone through PC and use various features of your phone on the computer.
	# https://www.samsung.com/levant/support/side-sync/

	#"com.sec.android.soagent"
	# SOAgent
	# Responsible for checking software/security OTA updates, readying, alerting the user and downloading such updates 
	# Software update, works along com.wssyncmldm

	"com.sec.android.splitsound" 
	# SplitSoundService
	# Provides ability to play music on the smartphone and an external speaker at the same time
	# https://www.samsung.com/nz/support/mobile-devices/samsung-separate-app-sound/

	"com.sec.android.uibcvirtualsoftkey"
	# UIBC (User input back channel) 
	# Allows users to experience the dual monitor function, with the keyboard and mouse having the ability to control your smartphone device.
	# Either discontinued (for the benefit of Smart View : com.samsung.android.smartmirroring) or related to Smart View.

	#"com.sec.android.wallpapercropper2"
	# Samsung Wallpaper. Needed for choosing a wallpaper.
	# Note : it is technically possible to change the wallpaper and then delete this package. 
	# Used wallpaper are stored in /data/data/com.sec.android.wallpapercropper2/ 

	"com.sec.android.widgetapp.diotek.smemo"
	# Samsung Memo widget (was replaced by Samsung Note : com.samsung.android.app.notes)
	# Partnership with 3-party DIOTEK : https://www.diotek.co.kr/

	"com.sec.android.widgetapp.easymodecontactswidget" # [MORE INFO NEEDED]
	# Favourite Contacts widget
	# Lets you add favorite contacts to home screen
	# https://www.samsung.com/au/getstarted/advanced/create-favourite-contacts-on-your-home-screen/
	# Is it only usable when enabling the "simple use" senior mode?

	"com.sec.android.widgetapp.samsungapps"
	# Galaxy Essential widget
	# Galaxy Essentials is a collection of specially chosen applications available through Samsung Apps. 
	# From the Galaxy Essentials widget you can access and download a collection of premium content, free of charge.
	# https://www.samsung.com/my/support/mobile-devices/what-is-galaxy-essentials-and-how-can-i-add-or-remove-it-from-my-smartphone-home-screen/

	#"com.sec.automation"
	# Tethering Automation enable sharing phone internet to the PC with a usb cable.
	# Safe to remove (but it's a useful feature)

	"com.sec.bcservice"
	# Broadcast Service
	# Diagnostic/debug hidden app. TCP dump.

	"com.sec.enterprise.knox.attestation"
	# KNOX Attestation
	# Lets you check the health of a Samsung Android device,
	# https://docs.samsungknox.com/dev/knox-attestation/index.htm

	"com.sec.enterprise.knox.shareddevice.keyguard"
	# KNOX shared device keyguard.
	# Knox Configure Shared Device feature enables multiple users to access the same device without sharing data across multiple devices.
	# https://docs.samsungknox.com/KC-Getting-Started/Content/about-shared-device.htm

	"com.sec.enterprise.mdm.services.simpin"
	# Entreprise Sim Pin Service
	# I couldn't find information about this package. No permissions asked. It's quite strange.
	#
	# Mobile device management (MDM) is a type of security software used by an IT department to monitor employees' mobile devices.
	# 
	# IMO this package is related to KNOX. The term "entreprise" in the package name strengthens me in my view.
	# Maybe it is related : https://developer.samsung.com/tech-insights/knox/mobile-device-management

	"com.sec.enterprise.mdm.vpn"
	# Entreprise VPN service
	# I couldn't find information about this package. No permissions asked too.
	# See above for MDM signification

	#"com.sec.epdg"
	# Huh... that's hard to explain quickly. Let's try : 
	# First you need to know that there is a standards organization which develops protocols for mobile telephony called 3GPP (mobile network : 2G/3G/4G/5G).
	# RAT (physical connection method to a wireless communication network) non specified by the 3GPP is called non-3GPP. RAT Wifi is non-3GPP.
	# 
	# ePDG means Evolved Packet Data Gateway. The main role of the ePDG is to provide security mechanisms such as IPsec tunnelling of connections 
	# with the device over an untrusted non-3GPP access. It is mainly use for VoWifi (Voice over wifi).
	# For further information : 
	# - https://www.3gpp.org/technologies/keywords-acronyms/100-the-evolved-packet-core
	# - https://www.aptilo.com/solutions/mobile-data-offloading/3gpp-wifi-access/
	# - https://en.wikipedia.org/wiki/System_Architecture_Evolution#Evolved_Packet_Core_(EPC)
	#
	# Safe to remove if not using VoWifi. 

	"com.sec.epdgtestapp"
	# Test app for ePDG (see com.sec.epdg)

	"com.sec.everglades"
	# Samsung Hub (discontinued)
	# It was a cloud-based music service launched by Samsung. It allowed users to listen to music from a variety of Samsung devices
	# https://en.wikipedia.org/wiki/Samsung_Music_Hub

	"com.sec.everglades.update"
	# SamsungHub Updater (discontinued - See above)

	"com.sec.factory"
	# Device Test app
	# Diagnostic hidden app.

	"com.sec.factory.camera" 
	# Camera Test (dial *#34971539# to open CameraFirmware Standard)

	"com.sec.factory.iris.usercamera" 
	# Camera Iris User Test (by dialing *#0*#)

	#"com.sec.hearingadjust" 
	# Samsung Adapt Sound
	# Configures a sound profile according to your ears.
	# Improve audio experience in the end (even with headphones)
	# https://www.howtogeek.com/316375/how-to-use-adapt-sound-on-the-galaxy-s7-and-s8-for-better-sound-quality/
	#
	# Settings > Sound  and vibration > Sound Quality and effects > Adapt Sound
	# NOTE : com.sec.android.app.soundalive is needed

	#"com.sec.ims" # [MORE INFO NEEDED]
	# IMS is an open industry standard for voice and multimedia communications over packet-based IP networks (Volte/VoIP/Wifi calling).
	# Don't really know the difference with com.sec.imsservice. Anyway, there is obviously strong interactions between them.
	# May be unsafe to uninstall it. I need some more testing. 

	"com.sec.imslogger"
	# IMS Logger provide logging optins.
	# Security flaw : https://nitter.net/fs0c131y/status/1115889065285562368

	#"com.sec.imsservice"
	# This service allows calls and text messages to be delivered via an IP network (Volte/VoIP/Wifi calling). Video calling are obviously also concerned.
	# Note : Samsung Dialer will crash if you delete this package and have wifi-calling activated in the Dialer's settings.
	# May be unsafe to uninstall it. I need some more testing. 

	"com.sec.kidsplat.installer"
	# Kids Mode (replaced by Kids Home : com.samsung.android.kidsinstaller)
	# Samsung Kids Home (https://www.samsung.com/global/galaxy/apps/kids-mode/)
	# Lets you shape a safe environment for your child to happily explore and connect with the world.
	# NOTE : You shouldn't give your phone to a child. That bad ! 
	# https://ifstudies.org/blog/a-smartphone-will-change-your-child-in-ways-you-might-not-expect-or-want

	"com.sec.knox.bluetooth"
	# KNOX bluetooth
	# https://docs.samsungknox.com/knox-platform-for-enterprise/admin-guide/bluetooth.htm
	# NOTE : This not affect regular bluetooth.

	"com.sec.knox.bridge"
	# Debug Bridge ? 

	"com.sec.knox.containeragent2"
	# Samsung Knox Container (v2 ?)
	# https://docs.samsungknox.com/whitepapers/knox-platform/app-container.htm

	"com.sec.knox.foldercontainer"
	# Needed by KNOX Secure folder (com.samsung.knox.securefolder)

	"com.sec.knox.knoxsetupwizardclient"
	# KNOX SetupWizardClien
	# The first time you turn your device on, a Welcome screen is displayed. It guides you through the basics of setting up your device.
	# It's the setup for Samsung KNOX services.

	"com.sec.knox.packageverifier"
	# KNOX Verifier
	# Used to scan nstalled packages

	"com.sec.knox.shortcutsms"
	# Knox shortcut to switch to workspace 
	# https://docs.samsungknox.com/knox-platform-for-enterprise/admin-guide/workspace-shortcuts.htm

	"com.sec.knox.switcher"
	"com.sec.knox.switchknoxI"
	"com.sec.knox.switchknoxII"
	# Handles switches between KNOW/Work container and personnal profile. 
	# It also manage data sharing between them.
	# https://docs.samsungknox.com/dev/knox-sdk/container-data-sharing-policies.htm

	"com.sec.location.nsflp2"
	# Samsung Location 
	# I just know this doesn't impact on GPS stuff. 
	# It seems to be only used along samsung apps.

	"com.sec.mldapchecker"
	# MLDAP log. Still a big thing to explain. 
	# LDAP (Lightweight Directory Access Protocol; I don't know what the M means. Mobile ?) is an open, vendor-neutral, industry standard application 
	# protocol for accessing and maintaining distributed directory information services over an IP network.
	#
	# Directory service refers to the collection of software, hardware, and processes that store and organize everyday items and network resources
	# (folders, files, printers, users, groups, devices, telephone numbers...)
	# It looks like a database but it's different.
	# The thing that Directory service excels at is fast lookups for rarely changing data (email, username etc...)
	# Differences between database and Directory Service : https://www.c-sharpcorner.com/article/directory-services-vs-rdbms/
	#
	# LDAP uses a relatively simple, string-based query to extract information from Active Directory. LDAP can store and extract objects such as usernames 
	# and passwords in Active Directory, and share that object data throughout a network. 
	# Example of LDAP usage : https://stackoverflow.com/questions/239385/what-is-ldap-used-for/592339
	# 
	# I don't know why and how Samsung uses LDAP. This package, according to its name only does logging.

	"com.sec.modem.settings"
	# Name : SilentLogging
	# This package runs at startup and logs things (related to the modem ?). Seems Pretty shady to me (I don't like its orwellian name).

	"com.sec.readershub"
	# Samsung Books (discontinued)
	# All-in-one e-Reading solution that offers instant access to thousands of e-reading contents.

	"com.sec.smartcard.manager"
	# Smart Card Manager
	# Smart Card enables communication with Secure Elements (SIM card, embedded Secure Elements, Mobile Security Card...)
	# This packages seems to be Samsung implemnentation.

	"com.sec.spp.push"
	# Samsung Push Service (https://play.google.com/store/apps/details?id=com.sec.spp.push)
	# Provide updates and notifications for services exclusive to Samsung..
	# https://www.samsunggeeks.com/2015/10/25/what-is-the-samsung-push-service/

	"com.sec.sve"
	# SecVideoEngineService is arguably a Samsung video engine service (handle enconding/decoding ?) for displaying video trough Samsung apps. 
	# 3 permissions : RECORD_AUDIO, CAMERA, INTERACT_ACROSS_USERS_FULL
	# Safe to remove.

	#Language Pack for S-voice, the Samsung assistant (com.samsung.android.svoice)
	#"com.sec.svoice.lang.en_US" # English (US)
	#"com.sec.svoice.lang.es_US" # Spanish
	#"com.sec.svoice.lang.fr_US" # French
	#"com.sec.svoice.lang.de_US" # German
	#"com.sec.svoice.lang.it_US" # Italian
	#"com.sec.svoice.lang.ru_US" # Russian
	#"com.sec.svoice.lang.it_GB" # English (GB)

	"com.sec.vsimservice"
	# VSim Service 
	# Something related to virtual SIM. I didn't find what Samsung does with this.
	# https://www.quora.com/What-is-VSIM-virtual-SIM-technology
	# Has a LOT of permissions (and involving IMS service)
	# Interact with VoWifi stuff and can receive messages from Google Cloud Messaging.
	# Run at startup.

	"com.sec.vsim.ericssonnsds.webapp" 
	# NSDSWebApp. 
	# Non Sim Device Solution (NSDS) is needed for VoLTE and VoWifi (Wifi Calling) if you have a virtual SIM. 
	# NSDS allows connecting non sim devices to IMS core: https://uk.linkedin.com/in/hemant-kumar-dewnarain-2b779679

	"com.sec.yosemite.phone"
	# Samsung WatchON (discontinued)
	# It was a service allowing you to view programming information on the TV and choose programs directly from the phone.
	# https://en.wikipedia.org/wiki/Samsung_WatchON

	"com.skms.android.agent"
	# Samsung KMS agent service a client application for Android devices to support eSE-based (embedded secure element) mobile-NFC Services.
	# https://developer.samsung.com/eSE
	# KMS = Key Management System
	# KNOX feature (https://en.wikipedia.org/wiki/Samsung_Knox)

	"com.sec.usbsettings"
	# USBSettings
	# Hidden settings. Lets you choose from ADB, MTP, RNDIS, ACM, DM (dial *#0808# to open)
	# Run at startup

	"com.vlingo.midas"
	# Old Samsung Voice app (for voice recognition)

	#"com.wssyncmldm" 
	# Software update
	# Fetch System OTA updates
	# Works along com.sec.android.soagent
	
	"com.monotype.android.font.samsungone"
	# SamsungOne font

	"com.wsomacp"
	# omacp = OMA Client Provisioning. It is a protocol specified by the Open Mobile Alliance (OMA).
	# Configuration messages parser. Used for provisioning APN settings to Samsung devices via SMS 
	# In my case, it was automatic and I never needed configuration messages. I'm pretty sure that in France this package is useless.
	# Maybe it's useful if carriers change their APN. But you still can change it manually, it's not difficult.
	# Keep in mind these special types of SMS can be abused : 
	# https://www.csoonline.com/article/3435729/sms-based-provisioning-messages-enable-advanced-phishing-on-android-phones.html
	# https://www.zdnet.fr/actualites/les-smartphones-samsung-huawei-lg-et-sony-vulnerables-a-des-attaques-par-provisioning-39890045.htm

	"tv.peel.samsung.app"
	# Peel Smart Remote (WatchON)
	# Application is an application that turns your smart phone or tablet into a TV remote. 
	# The app uses the IR Blaster of your device, so devices not equipped with that feature will not be able to use all of Peel Smart Remote's functions. 
	# https://www.samsung.com/za/support/mobile-devices/what-is-the-peel-smart-remote-application/
	)


#####################  DO NOT REMOVE THIS (will prevent core stuff to work)  #####################

#"com.policydm"
# Samsung security policy update. I don't have this package and I'm not sure if it is really necessary.
# Can someone disable it and test if he/she still receives security updates ? 
# https://www.samsung.com/nz/support/mobile-devices/security-policy-updates/

#"com.samsung.android.SettingsReceiver"
# Samsung overlay of AOSP Settings. It has 39 permissions. I guess it handles interactions with features controled by the settings.

#"com.samsung.android.timezone.updater"
#"com.samsung.android.timezone.autoupdate_O" 
# Samsung Time Zone Updater
# Used to automatically detect appropriate timezone
# REMOVING THIS WILL BOOTLOOP YOUR DEVICE 

#"com.samsung.android.app.soundpicker"
# Lets you select a sound for alarm/ringtone

#"com.samsung.android.clipboarduiservice"
# User interface for clipboard 

#"com.samsung.android.communicationservice"
# Message Service.
# Needed for SMS/MMS communication

#"com.samsung.android.incallui"
# UI when "being called/in call". It's basically the screen that shows you who is calling, lets you answer and hang up, switch to speaker, etc

#"com.samsung.android.provider.filterprovider" 
# FilterProvider dependency to Samsung Camera
# Provides access to filters (when you swipe right from the camera app)
# WARNING : Samsung camera will crash if this package is deleted.

#"com.samsung.networkui"
# User interface of the Mobile Network settings

#"com.samsung.android.sm.policy" # [MORE INFO NEEDED]
# SPCM (Striped Phase Change Memory ?) client.
# It kills rarely used apps running in background.
# Surely linked to Smart Manager. I think it can have a very bad impact on battery performance if deleted. I'm testing.

#"com.sec.android.inputmethod"
# Samsung keyboard
# Note : used for unlocking the phone after a reboot. Third-parties keyboards cannot be used here.
# DO NOT REMOVE THIS. NEVER ! 





