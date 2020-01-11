declare -a US_carrier_bloat=(
	
	########################  T-Mobile ########################
	# Mostly old bloatware/spyware.
	# Now T-mobile opt-out their bloatwares. That's good :
	# https://www.theverge.com/2018/3/20/17142246/t-mobile-bloatware-customer-apps-android

	"com.mobitv.client.tmobiletvhd"
	# T-Mobile TV (discontinued, replaced by nl.tmobiletv.vinson)
	# https://play.google.com/store/apps/details?id=nl.tmobiletv.vinson&hl=en

	"com.tmobile.pr.adapt"
	# Diagnostic tool. 
	# This app can see all your installed apps, that you have allowed unknown sources on, that your rooted, 
	# and will deny your warranty saying your rooted. It constantly run in background.

	"com.tmobile.pr.mytmobile"
	# T-mobile app (https://play.google.com/store/apps/details?id=com.tmobile.pr.mytmobile)

	"com.tmobile.services.nameid" 
	# Name ID T-Mobile (powered by Hiya or cequint if on Samsung devices)
	# NOTE : Never trust a company which promotes call ID/spam blocking features.
	# https://techcrunch.com/2019/08/09/many-robocall-blocking-apps-send-your-private-data-without-permission/

	"com.tmobile.simlock"
	# Device Unlock.
	# Allows you to request and apply a mobile device unlock directly from the device.
	# https://support.t-mobile.com/docs/DOC-14011

	"com.tmobile.vvm.application"
	# T-Mobile Visual VoiceMail (https://play.google.com/store/apps/details?id=com.tmobile.vvm.application)
	# Lets you use your voice mail and easily manage your inbox without dialing into your voicemail. 

	"com.whitepages.nameid.tmobile"
	# T-mobile nameid by WhitePages (https://www.whitepages.com/)
	# Discontinued. Replaced by com.tmobile.services.nameid
	# https://www.fiercewireless.com/wireless/t-mobile-to-offer-name-id-service-from-whitepages
	# https://www.geekwire.com/2016/whitepages-spins-caller-id-spam-blocking-app-startup-hiya/

	"us.com.dt.iq.appsource.tmobile"
	# App Source (discontinued)
	# This app aimed at organizing all of your existing apps on the phone by category and helping you discover 
	# new apps through search and recommendations.


	########################  Verizon  ########################
	# Everything from them is bloatware or spyware. That's simple.

	"com.asurion.android.verizon.vms"
	# Verizon Digital Secure (https://play.google.com/store/apps/details?id=com.asurion.android.verizon.vms)

	"com.customermobile.preload.vzw"
	# Verizon Store Demo Mode

	"com.LogiaGroup.LogiaDeck"
	# Mobile Services Manager
	# Seems to be a spyware. 
	# Good explainantion from someone who worked for carrier : 
	# https://www.reddit.com/r/lgv20/comments/6u0wnf/what_is_mobile_services_manager_did_i_catch_a/

	"com.securityandprivacy.android.verizon.vms"
	# Digital Secure (https://play.google.com/store/apps/details?id=com.securityandprivacy.android.verizon.vms&hl=en)
	# I don't know why this apps is released twice on the Play store under 2 different package name.

	"com.telecomsys.directedsms.android.SCG"
	# Verizon Location Agent
	# Location tracking (does not impact GPS function if deleted, don't worry)

	"com.vcast.mediamanager" 
	# Verizon Cloud (https://play.google.com/store/apps/details?id=com.vcast.mediamanager)

	"com.verizon.llkagent"
	# Used for Verizon store demo mode.

	"com.verizon.messaging.vzmsgs"
	# Verizon Messages (https://play.google.com/store/apps/details?id=com.verizon.messaging.vzmsgs)

	"com.verizon.mips.services"
	# My Verizon Services 
	# Related to My Verizon app.

	"com.verizon.obdm"
	"com.verizon.obdm_permissions"
	# D-MAT.
	# I don't know what it is but it has a LOT of permissions !

	"com.verizon.vzwavs"
	# ???

	"com.verizontelematics.verizonhum"
	# Hum Family Locator (https://play.google.com/store/apps/details?id=com.verizontelematics.verizonhum)

	"com.vzw.ecid"
	# Verizon Call Filter (https://play.google.com/store/apps/details?id=com.vzw.ecid)
	# NOTE : Never trust a company which promotes call ID/spam blocking features.
 
	"com.vzw.hss.myverizon"
	# My Verizon (https://play.google.com/store/apps/details?id=com.vzw.hss.myverizon)

	"com.vzw.qualitydatalog"
	# Logging stuff

	"customermobile.preload.vzw"
	# Retail Demo Mode

	"vznavigator.Generic"
	# VZ Navigator (GPS app) (https://play.google.com/store/apps/details?id=com.vznavigator.Generic)

	"vzw.hss.widgets.infozone.large"
	# My InfoZone Widget
	# Gives weekly tips, access to device info and account information.
	# https://www.droid-life.com/2013/02/12/verizon-introduces-my-infozone-widget-allows-easy-access-to-tips-device-info-and-account-information/

	########   Verizon blotware especially for Motorola ! ########

	"com.motorola.mot5gmod"
	"com.motorola.vzw.mot5gmod"
	# 5G Moto Mod (https://play.google.com/store/apps/details?id=com.motorola.mot5gmod)

	"com.motorola.vzw.phone.extensions"
	# Free HD wallpaper from verizon

	"com.motorola.vzw.cloudsetup"
	# Cloud setup 

	"com.motorola.ltebroadcastservices_vzw"
	# ????

	"com.motorola.vzw.loader"

	# ????
	"com.motorola.omadm.vzw"
	# ????

	"com.motorola.vzw.provider"
	# ????
	)

declare -a French_carrier_bloat=(

	########################  Bouygues  ########################

	############################ Free  ############################

	########################   Orange/Sosh  ########################

	#############################  SFR  ############################
	)