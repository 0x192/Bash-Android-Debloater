### These packages will be added in the default selection when I will find time to document them.
# It should be safe but you still need to be very careful).

# REMINDER : "Safe" only means "does not cause bootloop". 
# These packages can definitely break features (but you can easily reinstall them with my script)

declare -a pending=(
	###### THIRD PARTY APPS ######	
	"com.cnn.mobile.android.phone"
	"com.contextlogic.wish"
	"com.cootek.smartinputv5.language.englishgb"
	"com.cootek.smartinputv5.language.spanishus"
	"com.diotek.sec.lookup.dictionary"
	"com.directv.dvrscheduler"
	"com.dna.solitaireapp"

	"com.draftkings.dknativermgGP.vpl"
	"com.drivemode"
	"com.ehernandez.radiolainolvidable"
	"com.emoji.keyboard.touchpal"
	"com.google.android.instantapps.supervisor"
	"com.groupon"
	"com.handmark.expressweather"
	"com.handmark.expressweather.vpl"
	"com.ironsource.appcloud.oobe"
	"com.locationlabs.cni.att"

	"com.locationlabs.finder.sprint.vpl"
	"com.matchboxmobile.wisp"
	"com.mobitv.client.sprinttvng"
	"com.motorola.sprintwfc"
	"com.particlenews.newsbreak"
	"com.pinsight.v1"
	"com.playphone.gamestore"
	"com.playphone.gamestore.loot"
	"com.qti.qualcomm.datastatusnotification"
	"com.qualcomm.qti.simsettings"

	"com.qualcomm.qti.telephony.vodafonepack"
	"com.quicinc.fmradio"
	"com.remotefairy4"
	"com.rhapsody.vpl"
	"com.samsung.mdl.radio.radiostub"
	"com.sec.sprint.wfcstub"
	"com.sem.factoryapp"
	"com.servicemagic.consumer"
	"com.sharecare.askmd"
	"com.swiftkey.swiftkeyconfigurator"

	"com.synchronoss.dcs.att.r2g"
	"com.telenav.app.android.cingular"
	"com.telenav.app.android.scout_us"
	"com.touchtype.swiftkey"
	"com.touchtype.swiftkey.res.overlay"
	"com.tracker.t"
	"com.ubercab"
	"com.ubercab.driver"
	"com.ubercab.eats"
	"com.ume.browser.northamerica"

	"com.wavemarket.waplauncher"
	"com.yellowpages.android.ypmobile"
	"com.yelp.android"
	"com.zhiliaoapp.musically"
	"com.zte.assistant"
	"com.zte.weather"
	"de.axelspringer.yana.zeropage"
	"in.playsimple.wordtrip"
	"jp.gocro.smartnews.android"
	"msgplus.jibe.sca.vpl"

	"net.aetherpal.device"
	"tv.fubo.mobile.vpl"
	"tv.peel.app"
	"zpub.res"


	###### SAMSUNG ######
	"com.samsung.android.app.amcagent"

	"com.samsung.android.app.omcagent"
	"com.samsung.android.app.vrsetupwizards"
	"com.samsung.android.app.withtc"
	"com.samsung.android.bio.face.service"
	"com.samsung.android.bixby.agent"

	"com.samsung.android.bixby.agent.dummy"
	"com.samsung.android.bixby.wakeup"
	"com.samsung.android.dlp.service"
	"com.samsung.android.dqagent"
	"com.samsung.android.knox.containeragent"
	"com.samsung.android.knox.containercore"
	"com.samsung.android.scloud"
	"com.samsung.android.sdk.professionalaudio.app.audioconnectionservice"
	"com.samsung.android.slinkcloud"
	"com.samsung.android.smartcallprovider"
	"com.samsung.android.smartface"

	"com.samsung.android.sm.devicesecurity"
	"com.samsung.android.sm.policy"
	"com.samsung.android.unifiedprofile"
	"com.samsung.android.widgetapp.yagooedge.sport"
	"com.samsung.dcmservice"
	"com.samsung.faceservice"
	"com.samsung.fresco.logging"
	"com.samsung.know.securefolder.setuppage"
	"com.samsung.knox.securefolder.setuppage"
	"com.samsung.sec.android.application.csc"

	"com.sec.android.app.easysetup"
	"com.sec.android.app.scloud"
	"com.sec.android.game.gamehome"
	"com.sec.android.widgetapp.webmanual"
	"com.sec.enterprise.knox.cloudmdm.smdms"


	#### SONY ####
	"com.sonyericsson.android.camera3d"
	"com.sonyericsson.settings.res.overlay_305"
	"com.sonymobile.android.externalkeyboard"
	"com.sonymobile.apnupdater.res.overlay_305"
	"com.sonymobile.devicesecurity.service"

	"com.sonymobile.home.product.res.overlay"
	"com.sonymobile.indeviceintelligence"
	"com.sonymobile.intelligent.iengine"
	"com.sonymobile.intelligent.observer"
	"com.sonymobile.prediction"
	"com.sonymobile.swiqisystemservice"
	"com.sonymobile.themes.xperialoops2"
	"com.sonymobile.xperiaxlivewallpaper"
	"com.sonymobile.xperiaxlivewallpaper.product.res.overlay"


	### OPPO ####
	"com.coloros.cloud"
	"com.coloros.gamespace"
	"com.coloros.soundrecorder"
	"com.coloros.speechassist"
	"com.nearme.atlas"
	"com.nearme.instant.platform"
	"com.oppo.logkitservice"
	"com.oppo.logkit"
	"com.oppo.ovoicemanager"
	"com.oppo.oppopowermonitor"
	"com.oppo.quicksearchbox "
	"com.oppo.securepay "
	"com.oppo.webview"
	"com.coloros.appmanager "
	"com.coloros.childrenspace"
	"com.coloros.healthcheck "
	"com.coloros.weather.service "
	"com.coloros.widget.smallweather"
	"com.mobiletools.systemhelper "
	"com.oppo.fingerprints.fingerprintsensortest"
	"com.coloros.oppomultiapp"
	"com.coloros.backuprestore"
	"com.coloros.assistantscreen"

	# com.coloros.securitypermission 
	# Handles app permission management. DO NOT REMOVE THIS

	# com.coloros.pictorial (Lockscreen Magazine)
	# Removal will result in no longer being able to access Lockscreen settings.

	# com.OppoFreeFallingMonitor.apk
	# Provides protection for camera slider in the event of a fall. Best described here: https://www.gizchina.com/2018/06/20/...5-years-usage/
	)
