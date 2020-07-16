#!/usr/bin/env bash

### These packages will be added in the default selection when I will find time to document them.
# It should be safe but you still need to be **VERY** careful.

# REMINDER : "Safe" only means "does not cause bootloop". 
# These packages can definitely break features (but you can easily reinstall them with the script)

declare -a pending=(

	############# AOSP #############
	#"com.android.keyguard"
	"com.android.hwmirror" # Huawei Mirror app.
	"com.android.dreams" # AOSP screensaver
	#"com.android.camera"
	#"com.android.fileexplorer"
	#"com.android.incallui"
	#"com.android.se"
	#"com.android.smspush"
	#"com.android.systemui.gesture.line.overlay"
	#"com.android.systemui.navigation.bar.overlay"
	#"com.android.thememanager"
	#"com.android.thememanager.module"
	#"com.android.updater"
	"com.factory.mmigroup"

	########## THIRD PARTY ###########
	"com.microsoft.translator"
	"com.realvnc.android.remote"
	"com.hicloud.android.clone"
	#"com.hisi.mapcon" # "wi-fi calling" feature
	"com.ironsource.appcloud.oobe.huawei"
	"com.qti.confuridialer"
	#"com.qualcomm.cabl"
	#"com.qualcomm.svi"
	#"com.qualcomm.uimremoteserver"
	#"com.qualcomm.wfd.service"
	#"com.trustonic.teeservice"
	#"com.wssnps"


	############# SAMSUNG #############
	
	"com.galaxyfirsatlari"
	"com.gd.mobicore.pa"

	"com.samsung.accessory"
	"com.samsung.accessory.beansmgr"
	"com.samsung.accessory.safiletransfer"
	"com.samsung.android.app.accesscontrol"
	"com.samsung.android.app.color"
	"com.samsung.android.app.multiwindow"
	"com.samsung.android.app.panel.naver.v"
	"com.samsung.android.coreapps"
	"com.samsung.android.emojiupdater"
	"com.samsung.android.gearoplugin"
	"com.samsung.android.knox.containerdesktop" # KnowContainerDesktop
	"com.samsung.android.rubin.app"
	"com.samsung.android.sdk.handwriting"
	"com.samsung.android.server.iris"
	"com.samsung.android.smartfitting" # SmartFittingService
	"com.samsung.android.smartswitchassistant" # Samsung SmartSwitch
	"com.samsung.android.timezone.data_P" # Samsung Time Zone Data
	"com.samsung.android.unifiedprofile"
	"com.samsung.android.video"
	"com.samsung.android.voc"
	"com.samsung.android.wallpaper.res"
	"com.samsung.android.widgetapp.yagooedge.sport"
	"com.samsung.app.jansky"
	"com.samsung.app.newtrim"
	"com.samsung.fresco.logging"
	"com.samsung.knox.securefolder.setuppage"
	"com.samsung.tmowfc.wfccontroller"
	"com.samsung.tmowfc.wfcpref"
	"com.samsung.visionprovider" # VisionProvider, maybe linked to Bixby?
	"com.sec.android.app.bluetoothtest"
	"com.sec.android.app.chromecustomizations"
	"com.sec.android.app.DataCreate"
	"com.sec.android.app.ringtoneBR"
	"com.sec.android.app.setupwizardlegalprovider" # SetupWizardLegalProvider
	"com.sec.android.app.suwscriptplayer" # SuwScriptPlayer
	"com.sec.android.app.sysscope"
	"com.sec.android.app.vepreload"
	"com.sec.android.app.wlantest"
	#"com.sec.android.provider.badge"
	#"com.sec.android.providers.security"
	"com.sec.android.widgetapp.webmanual"
	"com.sec.app.RilErrorNotifier"
	"com.sec.downloadablekeystore"
	"com.sec.enterprise.knox.cloudmdm.smdms"
	"com.sec.hiddenmenu"
	#"com.sec.phone"
	"com.setk.widget"

	############### SONY ##############	
	"com.sonymobile.devicesecurity.service"
	"com.sonymobile.home.product.res.overlay"
	"com.sonymobile.indeviceintelligence"
	"com.sonymobile.swiqisystemservice"
	"com.sonymobile.themes.xperialoops2"
	"com.sonymobile.xperiaxlivewallpaper"
	"com.sonymobile.xperiaxlivewallpaper.product.res.overlay"


	############# HUAWAI ##############
	"com.huawei.android.pushagent"
	"com.huawei.android.thememanager"
	"com.huawei.android.totemweatherapp"
	"com.huawei.android.totemweatherwidget"
	"com.huawei.android.wfdft"
	"com.huawei.bd"
	"com.huawei.contacts.sync"
	"com.huawei.HwMultiScreenShot" # screenshot with scroll
	"com.huawei.KoBackup"
	"com.huawei.livewallpaper.artflower"
	"com.huawei.livewallpaper.flowersbloom"
	"com.huawei.livewallpaper.mountaincloud"
	"com.huawei.livewallpaper.naturalgarden"
	"com.huawei.livewallpaper.ripplestone"
	"com.huawei.mirrorlink"
	"com.huawei.phoneservice" # HiCare app.
	"com.huawei.securitymgr"
	"com.huawei.tips"
	"com.huawei.vassistant" # HiVoice app


	########## XIAOMI ###############
	#"android.autoinstalls.config.Xiaomi.cactus"
	#"com.mi.android.globalminusscreen"
	"com.mi.AutoTest"
	#"com.mi.globallayout"
	"com.miui.audiomonitor"
	"com.miui.backup"
	#"com.miui.core"
	"com.miui.face"
	"com.miui.fmservice"
	"com.miui.freeform"
	#"com.miui.global.packageinstaller"
	"com.miui.guardprovider"
	"com.miui.haunji"
	#"com.miui.miservice"
	#"com.miui.misound"
	#"com.miui.notification"
	"com.miui.phrase"
	#"com.miui.powerkeeper"
	#"com.miui.rom"
	#"com.miui.securitycore"
	"com.miui.smsextra"
	"com.miui.sysopt"
	#"com.miui.system"
	#"com.miui.systemui.carriers.overlay"
	#"com.miui.systemui.devices.overlay"
	#"com.miui.systemui.overlay.devices.android"
	#"com.miui.wmsvc"
	#"com.wapi.wapicertmanager"
	"com.wingtech.standard"
	"com.wt.secret_code_manager"
	#"com.xiaomi.bluetooth"
	#"com.xiaomi.bluetooth.overlay"
	#"com.xiaomi.location.fused"
	"com.xiaomi.mi_connect_service"
	"com.xiaomi.miplay_client"
	#"com.xiaomi.misettings"
	#"com.xiaomi.powerchecker"
	"com.xiaomi.simactivate.service"
	"com.xiaomi.upnp"
	"com.xiaomi.xmsf"
	"com.xiaomi.xmsfkeeper"
	#"org.simalliance.openmobileapi.uicc1terminal"
	#"org.simalliance.openmobileapi.uicc2terminal"
	"se.dirac.acs"

	"com.fido.asm"
	#"com.fido.xiaomi.uafclient"
	"com.lbe.security.miui"
	"com.mediatek"
	"com.mediatek.atmwifimeta"
	#"com.mediatek.callrecorder"
	"com.mediatek.engineermode"
	#"com.mediatek.gpslocationupdate"
	"com.mediatek.ims"
	#"com.mediatek.location.lppe.main"
	"com.mediatek.mdmconfig"
	"com.mediatek.mtklogger"
	#"com.mediatek.nlpservice"
	#"com.mediatek.omacp"
	"com.mediatek.providers.drm"
	"com.mediatek.wfo.impl"
	)
