#!/usr/bin/env bash

# I NEVER HAD A OPPO DEVICE ON HAND. 
# I did some intensive searches on the web to find a list and I try my best to document it. But I need Oppo users to really improve it.
# I use [MORE INFO NEEDED] tag as a marker.

# Honestly it's very difficult to document Oppo packages. I have no .apk and I don't want to go through chinese websites.
# If you are an Oppo user. Please help. :)

# Big Thanks to  @KOLIOSIS & @justinswidebody : 
# https://forum.xda-developers.com/find-X/how-to/guide-adb-oppo-x-apps-safe-to-uninstall-t3818165

declare -a oppo=(

    "com.coloros.appmanager"

    "com.coloros.assistantscreen" # [MORE INFO NEEDED]

    "com.coloros.backuprestore"
    # Most likely Oppo backup/restore feature 

    "com.coloros.childrenspace" # [MORE INFO NEEDED]

    "com.coloros.cloud"
    # Oppo Cloud

    "com.coloros.directui" # [MORE INFO NEEDED]

    "com.coloros.findmyphone" 
    # Find my phone service

    "com.coloros.gamespace"
    # Game Space
    # Hub for your Games + some performance optimizations
    # https://community.coloros.com/thread-9962-1-1.html

    "com.coloros.healthcheck" # [MORE INFO NEEDED]

    "com.coloros.mcs" # [MORE INFO NEEDED]

    "com.coloros.ocrscanner"
    # ColorOS Optical character recognition scanner

    "com.coloros.oppomultiapp" # [MORE INFO NEEDED]

    "com.coloros.phonenoareainquire" # [MORE INFO NEEDED]
    # Number Origin

    "com.coloros.smartdrive" # [MORE INFO NEEDED]

    "com.coloros.soundrecorder"
    # ColorOS Sound Recorder

    "com.coloros.speechassist"
    # ColorOS Speech Assistant

    "com.coloros.weather.service"
    # Oppo Weather Services
    
    "com.coloros.widget.smallweather"  # [MORE INFO NEEDED]

    "com.heytap.cloud" # [MORE INFO NEEDED]
    # HeyTap Cloud

    "com.mobiletools.systemhelper"
    # System Helper

    "com.nearme.atlas" # [MORE INFO NEEDED]
    # Secure payment

    "com.nearme.browser"
    # Default web browser

    "com.nearme.instant.platform" # [MORE INFO NEEDED]

    "com.nearme.themestore"
    # Themes store

    "com.oppo.fingerprints.fingerprintsensortest"
    # Fingerprint sensort test

    "com.oppo.logkitservice" # [MORE INFO NEEDED]

    "com.oppo.logkit" # [MORE INFO NEEDED]

    "com.oppo.market"
    # Oppo App Market

    "com.oppo.music"
    # Oppo Music app

    "com.oppo.ovoicemanager" # [MORE INFO NEEDED]

    "com.oppo.oppopowermonitor" # [MORE INFO NEEDED]

    "com.oppo.quicksearchbox"
    # Single swip from top to bottom search that has lots of Chinese in it

    "com.oppo.securepay" # [MORE INFO NEEDED]
    # Payment Protection

    "com.coloros.wallet"
    # Oppo Wallet

    "com.realme.findphone.client2"
    # Find my phone client app


    #####################  ADVANCED DEBLOAT  #####################

    #"com.coloros.filemanager"
    # ColorOS File Manager

    #"com.coloros.pictorial" (Lockscreen Magazine)
    # Removal will result in no longer being able to access Lockscreen settings.

    #"com.coloros.securitypermission"
    # Handles app permission management. DO NOT REMOVE THIS

    #"com.oppo.freefallingmonitor"
    # Provides protection for camera slider in the event of a fall. 
    # Best described here: https://www.gizchina.com/2018/06/20/oppo-find-x-slide-up-camera-has-anti-fall-feature-guarantees-5-years-usage/

    #"com.oppo.webview"
    # Oppo Webview
    # A WebView is a system component for the Android operating system (OS) that allows Android apps to display content 
    # from the web directly inside an application. It's based on Chrome.
    # On open-source privacy oriented Webview is Bromite (https://www.bromite.org/system_web_view)

    #"com.sohu.inputmethod.sogouoem" 
    # Default keyboard

    )