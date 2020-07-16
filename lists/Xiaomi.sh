#!/usr/bin/env bash

declare -a xiaomi=(

	"android.autoinstalls.config.Xiaomi.cepheus"
	# Used to **auto** install stuff (Cepheus phone model) !
	# IMO it's a similar feature than Play Auto Install (https://forum.xda-developers.com/xperia-z/help/how-stop-google-play-auto-install-t2590253)

	"android.autoinstalls.config.Xiaomi.dipper"
	# Used to **auto** install stuff (Dipper phone model) ! 
	# See above.

	"com.autonavi.minimap"
	# 高德地图 (Yeah no english translation) (https://play.google.com/store/apps/details?id=com.autonavi.minimap)
	# Xiaomi GPS

	"com.baidu.duersdk.opensdk"
	# Duer stuff from Baidu 
	# Duer is a virtual AI assistant.

	"com.baidu.input_mi"
	# Baidu IME (Baidu keyboard)
	# YOU SHOULD NEVER USE A CLOSED-SOURCE KEYBOARD ! 
	# https://www.techrepublic.com/blog/asian-technology/japanese-government-warns-baidu-ime-is-spying-on-users/
	# Archive : https://web.archive.org/save/https://www.techrepublic.com/blog/asian-technology/japanese-government-warns-baidu-ime-is-spying-on-users/

	"com.baidu.searchbox"
	# 百度 (https://play.google.com/store/apps/details?id=com.baidu.searchbox)
	# Baidu App search engine.

	"com.bsp.catchlog"
	# bsp = Board support package
	# Used to catch log files obviously.

	"com.duokan.phone.remotecontroller"
	# Mi Remote Controller (https://play.google.com/store/apps/details?id=com.duokan.phone.remotecontroller)
	# Control your electric appliances with your phone using Mi Remote.

	"com.duokan.phone.remotecontroller.peel.plugin"
	# Peel Mi Remote (https://play.google.com/store/apps/details?id=com.duokan.phone.remotecontroller.peel.plugin)
	# Peel Mi Remote is a TV guide extension for Xiaomi Mi Remote by "Peel Smart Remote".

	"com.milink.service"
	# UniPlay Service
	# I couldn't find info about it but I have the feeling it is related to some wireless/remote control. 

	"com.mipay.wallet.id"
	# Mi Pay for Indonesia ? 

	"com.mipay.wallet.in"
	# Mi Pay for India ? 

	"com.miui.audioeffect"
	# AudioEffect from Xiaomi (https://developer.android.com/reference/android/media/audiofx/AudioEffect)
	# Used by the equalizer (to be confirmed)

	"com.miui.cit"
	# Hardware tests
	# Secret codes (https://nitter.net/fs0c131y/status/933353182956326913#m) let you run hardware tests.
	# https://c.mi.com/thread-1744085-1-0.html

	"com.miui.cloudservice" 
	# Mi Cloud Service
	# NOTE : Settings will crash when pressing on any "Mi Cloud" button if this package is deleted.

	"com.miui.enbbs" 
	# Xiaomi Forums old package.
	# Now com.mi.global.bbs.

	"com.miui.greenguard"
	# Security Guard Service
	# The app includes three different antivirus brands built in that the user can choose from to keep their phone protected: Avast, AVL and Tencent. 
	# Upon selecting the app, the user selects one of these providers as the default Anti-Virus engine to scan the device.
	# It the app that scan an app before installing it
	# NOTE : A vulnerability was found in 2019 : https://research.checkpoint.com/2019/vulnerability-in-xiaomi-pre-installed-security-app/

	"com.miui.hybrid.accessory"
	# Xiaomi Hybrid Accessory
	# I don't know what the purpose of this package. 
	# Safe to remove according to a lot of people.

	"com.miui.micloudsync"
	# Mi Cloud Sync
	# Needed for Cloud syncronisation

	"com.miui.miwallpaper"
	# Mi Wallpaper 

	"com.miui.nextpay"
	# Next Pay 
	# ????

	"com.miui.qr"
	# MUI Qr code scanner

	"com.miui.touchassistant" 
	# Quick Ball/Touch Assistant
	# Touch assistant with a combination of five unique shortcuts which aimed to give easy and quick access to functions and apps you use frequently.

	"com.miui.translation.xmcloud"
	# Translation stuff. Does not impact global translation for non-chinesse users.

	"com.miui.translationservice"
	# Translation stuff. Does not impact global translation for non-chinesse users.

	"com.miui.userguide"
	# Xiaomi User guide

	"com.mipay.wallet"
	# Mi Pay (https://play.google.com/store/apps/details?id=com.mipay.in.wallet)
	# Contactless NFC-based mobile payment system that supports credit, debit and public transportation cards in China.
	# https://www.mi-pay.com/

	"com.miui.analytics" 
	# Xiaomi Analytics
	# This app is shady. According to a guy who try to reverse engineered the app, Xiaomi Analytics can replace any (signed?) package 
	# they want silently on your device within 24 hours. Maybe that no longer the case now but... you don't want analytics anyway.
	# Source : http://blog.thijsbroenink.com/2016/09/xiaomis-analytics-app-reverse-engineered/

	"com.miui.android.fashiongallery"
	# Mi Wallpaper Carousel (https://play.google.com/store/apps/details?id=com.miui.android.fashiongallery)
	# Display new photos on your lock screen every time you turn ON your screen.

	"com.miui.antispam"
	# MIUI Antispam 
	# I didn't find any info about this package.

	"com.miui.bugreport" 
	# Mi Feedback
	# Used to seend bug report to devs

	"com.miui.cleanmaster"
	# Mi Cleaner
	# Clean useless files

	"com.miui.cloudbackup"
	# Mi Cloud backup
	# Needed for Xiaomi cloud backup.

	"com.miui.cloudservice"
	# Mi Cloud Services needed for Mi Cloud

	"com.miui.cloudservice.sysbase"
	# Another Mi Cloud dependency 

	"com.miui.compass" 
	# Mi Compass
	# I think you understand its purpose...

	"com.miui.contentcatcher"
	# Application Extension Service	
	# I don't have a Xiaomi device so I can't test. A lot of people delete this package but I'd like to know its purpose.
	# IMO it's related to web browsing from a xiaomi app

	"com.miui.daemon"
	# MIUI daemon
	# Collect a lot of data and send them to China.
	# See : https://nitter.net/fs0c131y/status/938872347087564800?lang=en

	"com.miui.fm"
	# MIUI FM Radio app

	"com.miui.gallery"
	# MIUI Gallery app.
	# Simple Gallery is way better, ligther and open-source (https://f-droid.org/en/packages/com.simplemobiletools.gallery.pro/)

	"com.miui.hybrid"
	# Quick Apps
	# It's basically an app which show you ads and tracks you...
	# Funny thing, Xiaomi's Quick Apps was reportedly being blocked by Google Play Protect.
	# https://www.androidpolice.com/2019/11/19/xiaomi-quick-apps-flagged-blocked-google-play-protect/
	#
	# Reverse engineering of the app : 
	# https://medium.com/@gags.gk/reverse-engineering-quick-apps-from-xiaomi-a1c9131ae0b7
	# Spoiler : you really should delete this package.

	"com.miui.klo.bugreport"
	# KLO Bugreport
	# This app registers system failures and Android applications errors and sends bugs to Xiaomi servers.

	"com.miui.msa.global"
	# Main System Ads
	# Analyzation of user behaviors to show you ads. Yeah Xiaomi phones has ads...
	# https://www.theverge.com/2018/9/19/17877970/xiaomi-ads-settings-menu-android-phones

	"com.miui.notes" 
	# Mi Notes

	"com.miui.personalassistant"
	# Seems to be App Vault on some phones (https://play.google.com/store/apps/details?id=com.mi.android.globalpersonalassistant)
	# https://c.mi.com/thread-1017547-1-0.html

	"com.miui.player" 
	# Mi Music (https://play.google.com/store/apps/details?id=com.miui.player)

	"com.miui.providers.weather"
	# Xiaomi provider for MI Weather app (com.miui.weather)
	# REMINDER : Content providers helps an application manage access to data stored by itself, stored by other apps, 
	# and provide a way to share data with other apps. They encapsulate the data, and provide mechanisms for defining data security
	# Source : https://developer.android.com/guide/topics/providers/content-providers.html

	"com.miui.screenrecorder" 
	# Mi Screen Recorder

	"com.miui.systemAdSolution"
	# Analyzation of user behaviors to show you ads. Yeah Xiaomi phones has ads...
	# https://www.theverge.com/2018/9/19/17877970/xiaomi-ads-settings-menu-android-phones

	"com.miui.translation.kingsoft"
	# Translation stuff by Kingsoft (https://en.wikipedia.org/wiki/Kingsoft)

	"com.miui.translation.youdao"
	# Translation stufff by Youdao (https://en.wikipedia.org/wiki/Youdao)

	"com.miui.video"
	# IMO it's needed by com.miui.videoplayer (confirmation needed)

	"com.miui.videoplayer" 
	# Mi Video (https://play.google.com/store/apps/details?id=com.miui.videoplayer)

	"com.miui.videoplayer.overlay"
	# Mi Video overlay
	# REMINDER : A screen overlay in Android, also referred to as “Draw On Top”, allows an app to display content over another app

	"com.miui.virtualsim"
	# Mi Roaming
	# It enables users to connect to roaming data on-demand via virtual SIM technology.
	# https://alertify.eu/xiaomi-mi-roaming/

	"com.miui.vsimcore"
	# Virtual Sim core service

	"com.miui.weather2"
	# Mi Weather app

	"com.miui.yellowpage"
	# Yellow Page from MIUI.
	# REMINDER : Yellow pages contain phone numbers of companies and services. They are provided by Xiaomi partners or businesses themselves.

	"com.mfashiongallery.emag"
	# Wallpapers by Xiaomi

	"com.mi.android.globalpersonalassistant" 
	# MI Vault aka the "assistant" you open swiping left from MI Home

	"com.mi.global.bbs"
	# Mi Community (https://play.google.com/store/apps/details?id=com.mi.global.bbs)
	# Xiaomi Forum app

	"com.mi.global.shop"
	# Mi Store (https://play.google.com/store/apps/details?id=com.mi.global.shop)
	# Xiaomi app store

	"com.mi.globalTrendNews"
	# Can't find info about this package
	# Probably used for displaying (useless) news

	"com.mi.liveassistant"
	# Mi Live Assistant
	# I don't really know what it is. Maybe an old name for "com.mi.android.globalpersonalassistant" 

	"com.mi.webkit.core"
	# MI WebView
	# Xiaomi alternative to Google WebView
	# REMINDER : It is a system component for the Android operating system that allows Android apps to display content 
	# from the web directly inside an application. It's based on Chrome.
	# On open-source privacy oriented Webview is Bromite (https://www.bromite.org/system_web_view)

	"com.qiyi.video"
	# IQIYI (https://play.google.com/store/apps/details?id=com.qiyi.video_US)
	# Online video platform from Baidu (https://en.wikipedia.org/wiki/IQiyi).
	# I didn't know this is currently one of the largest online video sites in the world, 
	# with nearly 6 billion hours spent on its service each month, and over 500 million monthly active users.

	"com.sohu.inputmethod.sogou.xiaomi"
	# Sogou keyboard for chinese only.

	"com.xiaomi.ab"
	# MAB 
	# Has a LOT of permissions. If you try to desinstall it, Xiaomi will reinstall after reboot.
	# https://thoughtarama.wordpress.com/2017/05/09/mab-fucker-or-why-im-giving-up-my-xiaomi-redmi-note-3-phone/
	# Mab is a part of MIUI Analytics.

	"com.xiaomi.account" 
	# Mi Account

	"com.xiaomi.channel"
	# Mi Talk 
	# Mi instant messaging app that lets you do practically the same thing as Whatsapp. 
	# NOTE : You should use Signal or Wire instead Whatsapp/Mi Talk for more privacy.

	"com.xiaomi.gamecenter.sdk.service"
	# Game Service
	# Surely used to "improve" game performance

	"com.xiaomi.joyose"
	# Joyse Analytics and advertising
	# Run in background and can't be stopped. 

	"com.xiaomi.jr"
	# Help you getting loans when shopping.

	"com.xiaomi.lens"
	# Related to camera app ?
	# Safe to remove (according to a lot of users)
	# I'd like to have more info about it. Can a Xiaomi user help ? 

	"com.xiaomi.midrop" 
	# Share Me (Mi Drop) (https://play.google.com/store/apps/details?id=com.xiaomi.midrop)
	# P2P file transfer tool.

	"com.xiaomi.midrop.overlay"
	# Mi Drop overlay
	# REMINDER : A screen overlay in Android, also referred to as “Draw On Top”, allows an app to display content over another app

	"com.xiaomi.mipicks" 
	# Mi Picks (becomed Mi Apps Store and now Get Apps -- Xiaomi app store)
	# I believe this package is discontinued.
	# https://play.google.com/store/apps/details?id=com.mi.global.shop

	"com.xiaomi.o2o"
	# o2o = online-to-offline
	# ==> Describe systems enticing consumers within a digital environment to make purchases of goods or services from physical businesses.
	# https://en.wikipedia.org/wiki/Online_to_offline
	# NOTE : This package can make phone calls without user intervention.

	"com.xiaomi.pass"
	# Mi Pass is an App allows Xiaomi NFC phones to replace cards and keys in real life usage. 
	# Support NFC payment, bus card, key card, door and car lock features all together.

	"com.xiaomi.payment"
	# Old package name for Mi Credit (https://play.google.com/store/apps/details?id=com.micredit.in.gp)
	# Mi Credit is a personal loan platform from Xiaomi.

	"com.xiaomi.scanner" 
	# Mi Scanner
	# Lets you scan documents, crop, adjust grayscale and OCR.

	"com.xiaomi.shop"
	# Xiaomi app store (I thinks it's discontinued)
	# Now com.mi.global.shop (https://play.google.com/store/apps/details?id=com.mi.global.shop)

	"com.xiaomi.vipaccount"
	# Xiaomi VIP account
	# https://www.mi.com/in/service/privilegefaq/

	"com.xiaomi.glgm"
	# Xiaomi Games
	# Not sure if this app still exists.

	"com.xiaomi.micloud.sdk"
	# Mi Cloud sdk 
	# sdk = Software development kit

	"com.xiaomi.mirecycle"
	# Mi Recycle 
	# Xiaomi has extended its partnership with Cashify to launch the 'Mi Recycle' feature through its MIUI Security app. 
	# It will let Xiaomi phone users check the health of their smartphone and get their resale value directly from Cashify, 
	# the online re-commerce company based out of New Delhi.
	# Source : https://gadgets.ndtv.com/mobiles/news/xiaomi-mi-recycle-cashify-miui-security-app-2018024

	"com.xiaomi.oversea.ecom"
	# Xiaomi ShopPlus.
	# Given its name I think this package is useless.

	"com.xiaomi.providers.appindex"
	# Provider for indexing app ? 
	# I believe it is a provider for the settings but I can't confirm (I don't have a Xiaomi device)
	# A lot of people debloat this but I'd like to know more about this one.

	##################################  ADVANCED DEBLOAT  ##################################

	#"com.miui.calculator" 
	# MIUI Calculator (https://play.google.com/store/apps/details?id=com.miui.calculator)

	#"com.xiaomi.discover"
	# System Apps Updater
	# WARNING : Disable System app updates (but not firmware updates)

	#"com.mi.android.globalFileexplorer" 
	# Xiaomi Files Manager (https://play.google.com/store/apps/details?id=com.mi.android.globalFileexplorer)

	#"com.miui.home"
	# MIUI System Launcher
	# It's basically the home screen, the way icons apps are organized and displayed.
	# DON'T REMOVE THIS IF YOU DIDN'T INSTALL ANOTHER LAUNCHER ! 

	)


#######################  DO NOT REMOVE THIS (will prevent core stuff to work)  #######################

#"com.xiaomi.finddevice"
# Find My Device feature (in the Settings)
# REMOVING THIS WILL BOOTLOOP YOUR DEVICE !
# 
# NOTE : I don't have a Xiaomi phone on hand anymore but maybe only disabling it will work : adb shell 'pm disable-user com.xiaomi.finddevice'
# Can someone try ? 

#"com.miui.securitycenter"
# MIUI Security app
# REMOVING THIS WILL BOOTLOOP YOUR DEVICE !
# 
# NOTE : I don't have a Xiaomi phone on hand anymore but maybe only disabling it will work : adb shell 'pm disable-user com.miui.securitycenter'
# Can someone try ? 

#"com.miui.securityadd"
# Related to the MIUI Security app
# REMOVING THIS WILL BOOTLOOP YOUR DEVICE !
# 
# NOTE : I don't have a Xiaomi phone on hand anymore but maybe only disabling it will work : adb shell 'pm disable-user com.miui.securityadd'
# Can someone try ? 

