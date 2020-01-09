#!/bin/bash

declare -a xiaomi_bloat=(
	"com.mipay.wallet"
	"com.miui.analytics #Analytics"
	"com.miui.android.fashiongallery"
	"com.miui.antispam"
	"com.miui.bugreport" #Mi Feedback
	"com.miui.calculator" #Calculator
	"com.miui.cleanmaster"
	"com.miui.cloudbackup"
	"com.miui.cloudservice"
	"com.miui.cloudservice.sysbase"
	"com.miui.compass" #Mi Compass
	"com.miui.contentcatcher"
	"com.miui.daemon"
	"com.miui.fm"
	"com.miui.gallery"
	"com.miui.home"
	"com.miui.hybrid"
	"com.miui.klo.bugreport"
	"com.miui.msa.global" #Main System Advertising
	"com.miui.notes" #Mi Notes
	"com.miui.personalassistant"
	"com.miui.player" #Mi Music
	"com.miui.providers.weather"
	"com.miui.screenrecorder" #Mi Screen Recorder
	"com.miui.systemAdSolution"
	"com.miui.translation.kingsoft"
	"com.miui.translation.youdao"
	"com.miui.video"
	"com.miui.videoplayer" #Mi Video
	"com.miui.videoplayer.overlay"
	"com.miui.virtualsim"
	"com.miui.vsimcore"
	"com.miui.weather2"
	"com.miui.yellowpage"
	"com.mi.webkit.core"
	"com.qiyi.video"
	"com.sohu.inputmethod.sogou.xiaomi"
	"com.xiaomi.ab"
	"com.xiaomi.account" #Mi Account
	"com.xiaomi.channel"
	"com.xiaomi.gamecenter.sdk.service"
	"com.xiaomi.joyose"
	"com.xiaomi.jr"
	"com.xiaomi.lens"
	"com.xiaomi.midrop" #Mi Drop
	"com.xiaomi.midrop.overlay"
	"com.xiaomi.mipicks" #Mi Apps
	"com.xiaomi.o2o"
	"com.xiaomi.pass"
	"com.xiaomi.payment"
	"com.xiaomi.scanner" #Mi Scannercom.miui.screenrecorder
	"com.xiaomi.shop"
	"com.xiaomi.vipaccount"
	"android.autoinstalls.config.Xiaomi.cepheus"
	"android.autoinstalls.config.Xiaomi.dipper"
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
	"com.milink.service"
	"com.mipay.wallet.id"
	"com.mipay.wallet.in"
	"com.miui.analytics"
	"com.miui.android.fashiongallery" # Wallpapers by xiaomi
	"com.miui.audioeffect"
	"com.miui.bugreport"
	"com.miui.cit"
	"com.miui.cloudservice" # Settings will crash when pressing on any "Mi Cloud" button
	"com.miui.compass"
	"com.miui.enbbs" # Xiaomi Forums
	"com.eterno"
	"com.miui.greenguard"
	"com.miui.hybrid.accessory"
	"com.miui.micloudsync"
	"com.miui.miwallpaper"
	"com.miui.msa.global" # MIUI System Ads Solution
	"com.miui.nextpay"
	"com.miui.notes"
	"com.miui.player"
	"com.miui.qr"
	"com.miui.screenrecorder"
	"com.miui.touchassistant" # Quick Ball/Touch Assistant
	"com.miui.translation.xmcloud"
	"com.miui.translationservice"
	"com.miui.userguide"
	"com.miui.videoplayer"
	"com.mi.android.globalpersonalassistant"
	"com.opera.preinstall"
	"com.phonepe.app"
	"com.samsung.aasaservice"
	"com.xiaomi.glgm"
	"com.xiaomi.micloud.sdk"
	"com.xiaomi.midrop"
	"com.xiaomi.mipicks"
	"com.xiaomi.mirecycle"
	"com.xiaomi.oversea.ecom"
	"com.xiaomi.providers.appindex"
	"com.xiaomi.scanner"
	"org.codeaurora.gps.gpslogsave"
	#******** ADVCANED DEBLOAT ********#
	"com.xiaomi.account"
	"com.miui.gallery" #MIUI Gallery
	#"com.xiaomi.discover" # !!! WARNING : Disable System app update (but not firmware update)
	#"com.mi.android.globalFileexplorer" #Stock Files Manager
	#"com.miui.home" #MIUI launcher. Install another launcher before deleting this one
	#******** ADVANCED DEBLOAT ********#

	#******** DO NOT DELETE ********#
	#"com.miui.securitycenter" ---- BOOTLOOP
	#"com.miui.securityadd" ------- BOOTLOOP
	#"com.xiaomi.finddevice" ------ BOOTLOOP
	)