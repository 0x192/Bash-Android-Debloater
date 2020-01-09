#!/bin/bash

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
	"com.android.mediacenter" 	# Huawei music app. (yeah they messed up with the package name)
	#"com.hisi.mapcon " #Don't disable/remove this if you use WiFi Calling, or it'll kill the app. If you don't use WiFi Calling, this is safe to remove. (Thanks @mj084 !)
	#"com.huawei.hidisk " #Huawei File Manager app.
	)