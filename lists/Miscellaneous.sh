#!/bin/bash

declare -a brands=("Asus" "Huawei" "LG" "Nokia" "Samsung" "Sony" "Xiaomi")

declare -a amazon_bloat=(
	"com.amazon.mShop.android"
	"com.sec.android.app.dictionary"
	"com.amazon.fv"
	"com.amazon.kindle"
	"com.amazon.mp3"
	"com.amazon.venezia"
	"com.amazon.aa.attribution"
	"com.amazon.aa"
	"com.amazon.mShop.android.shopping"
	"com.amazon.clouddrive.photo"
	"com.amazon.avod.thirdpartyclient"
	"amazon.venezia"
	"amazon.mp3"
	"amazon.mShop.android"
	"amazon.fv"
	"amazon.kindle"
	)

declare -a facebook_bloat=(
	"com.facebook.katana"
	"com.facebook.system"
	"com.facebook.appmanager"
	"com.facebook.services"
	"com.facebook.orca"
	"com.instagram.android"
	#"com.whatsapp"
	)

declare -a microsoft_bloat=(
	"com.microsoft.skydrive"
	"com.skype.raider"
	"com.microsoft.office.excel"
	"com.microsoft.office.word"
	"com.microsoft.office.outlook"
	"com.microsoft.office.powerpoint"
	"com.skype.m2"
	"com.microsoft.office.officehubhl"
	"com.microsoft.office.officehub"
	"com.microsoft.office.officehubrow"
	"com.microsoft.appmanager"
	)

declare -a misc_bloat=(
	"audible.application"
	"cequint.ecid"
	"com.audible.application"
	"com.blurb.checkout"
	"com.booking"
	"com.cequint.ecid"
	"com.ebay.mobile"
	"com.enhance.gameservice"
	"com.evernote"
	"com.gotv.nflgamecenter.us.lite"
	"com.hancom.office.editor.hidden"
	"com.imdb.mobile"
	"com.infraware.polarisoffice5"
	"com.linkedin.android"
	"com.micredit.in"
	"com.netflix.mediaclient"
	"com.netflix.partner.activation"
	"com.nuance.swype.input"
	"com.opera.app.news"
	"com.opera.branding"
	"com.opera.mini.native"
	"com.s.antivirus"
	"com.slacker.radio" # LiveXLive - Streaming Music and Live Events (https://play.google.com/store/apps/details?id=com.slacker.radio)
	"com.spotify.music"
	"com.til.timesnews"
	"com.tripadvisor.tripadvisor"
	"com.UCMobile.intl"
	"flipboard.app"
	"flipboard.boxer.app" #Briefing app (https://play.google.com/store/apps/details?id=flipboard.boxer.app)
	"gotv.nflgamecenter.us.lite"
	"in.mohalla.sharechat"
	"yahoo.mobile.client.android.liveweather"
	"com.qualcomm.qti.rcsbootstraputil"
	"com.qualcomm.qti.rcsimsbootstraputil"
	"com.qualcomm.timeservice"
	"com.niksoftware.snapseed" #Snapseed (https://play.google.com/store/apps/details?id=com.niksoftware.snapseed)
	)







