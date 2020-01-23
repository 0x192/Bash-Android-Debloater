#!/bin/bash

declare -a amazon_bloat=(
	"com.amazon.mShop.android"
	# Amazon Shopping (https://play.google.com/store/apps/details?id=com.amazon.mShop.android.shopping)

	"com.amazon.fv"
	# Amazon App suite. Provides access to Amazon digital content

	"com.amazon.kindle"
	# Amazon Kindle (https://play.google.com/store/apps/details?id=com.amazon.kindle)

	"com.amazon.mp3"
	# Amazon Music (https://play.google.com/store/apps/details?id=com.amazon.mp3)
	# Amazon streaming app

	"com.amazon.venezia"
	# Amazon AppStore

	"com.amazon.aa" 
	# Amazon Assistant app. Nice spyware ! 
	# Show you recoomanded products available on Amazon and price compare as you shop across the web.
	# NOTE : https://www.gadgetguy.com.au/amazon-assistant-spies-on-you/

	"com.amazon.aa.attribution"
	# Amazon Assistant Attribution. A spyware again !
	# Tracking tool. Allows sellers to measure the impact of media channels **off Amazon** on sales.
	# https://www.repricerexpress.com/amazon-attribution/

	"com.amazon.mShop.android.shopping"
	# Amazon Shopping (https://play.google.com/store/apps/details?id=com.amazon.mShop.android.shopping)
	# Same package as com.amazon.mShop.android.

	"com.amazon.clouddrive.photos"
	# Amazon Photos (https://play.google.com/store/apps/details?id=com.amazon.clouddrive.photos)

	"com.amazon.avod.thirdpartyclient"
	# Amazon Prime Video (https://play.google.com/store/apps/details?id=com.amazon.avod.thirdpartyclient)
	# https://www.primevideo.com/
	)

declare -a facebook_bloat=(
	# Facebook packages always run in background and send data to Facebook even if you don't have a Facebook account.

	"com.facebook.katana"
	# Facebook app (https://play.google.com/store/apps/details?id=com.facebook.katana)

	"com.facebook.system" 
	# Facebook App Installer (empty shell app which incite you to install the Facebook app)

	"com.facebook.appmanager"
	# Facebook app manager handles Facebook apps updates.

	"com.facebook.services"
	# Facebook Services is a tool that lets you manage different Facebook services automatically using your Android device. 
	# In particular, the tool focuses on searching for nearby shops and establishments based on your interests.
	# I don't know if this a dependency for com.facebook.katana but nobody cares because we all want to delete all the Facebook stuff right ?!!

	"com.facebook.orca"
	# Facebook Messenger (https://play.google.com/store/apps/details?id=com.facebook.orca)

	"com.instagram.android"
	# Instagram  (https://play.google.com/store/apps/details?id=com.instagram.android)

	"com.whatsapp"
	# Whatsapp (https://play.google.com/store/apps/details?id=com.whatsapp")
	)

declare -a microsoft_bloat=(
	"com.microsoft.skydrive"
	# Microsoft OneDrive (Cloud) (https://play.google.com/store/apps/details?id=com.microsoft.skydrive)

	"com.skype.raider"
	# Skpype (https://play.google.com/store/apps/details?id=com.skype.raider)

	"com.microsoft.office.excel" # Excel
	"com.microsoft.office.word" # Word
	"com.microsoft.office.outlook" # Outlook
	"com.microsoft.office.powerpoint" # Powerpoint

	"com.skype.m2"
	# Skype Lite (https://play.google.com/store/apps/details?id=com.skype.m2)

	"com.microsoft.office.officehubhl"
	# Office Mobile hub (on Samsung Phone)
	# Includes the complete Word, PowerPoint, and Excel apps to offer a convenient office experience on the go.

	"com.microsoft.office.officehub"
	# Microsoft Office Mobile
	# Includes the complete Word, PowerPoint, and Excel apps to offer a convenient office experience on the go. 

	"com.microsoft.office.officehubrow"
	# Microsoft Mobile Office Beta

	"com.microsoft.appmanager"
	# Your Phone Companion - Link to Windows (https://play.google.com/store/apps/details?id=com.microsoft.appmanager)
	# Microsoft app for synchronising your phone with a W10 PC.
	)

declare -a misc_bloat=(

	"com.audible.application"
	# Cover Audible Audiobooks (https://play.google.com/store/apps/details?id=com.audible.application)

	"com.blurb.checkout" 
	# Blurb Checkout 
	# Provides book purchase and checkout for Samsung’s Story Album app (discontinued)

	"com.booking"
	# Booking.com app (https://play.google.com/store/apps/details?id=com.booking)
	# Seriously, you shouldn't use it !
	# https://en.wikipedia.org/wiki/Booking.com
	# https://blog.usejournal.com/why-i-would-never-trust-booking-com-again-so-you-should-too-a2ab535ed915?gi=7ebe86eaa880
	# https://ro-che.info/articles/2017-09-17-booking-com-manipulation

	"com.caf.fmradio"
	# caf = CodeAurora Forum, a Linux Foundation Collaborative Project (https://www.codeaurora.org/) 
	# All their code is open-source.
	# Provides tools to access FM radio. 
	# OpenSource : https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/fm/tree/fmapp2/src/com/caf/fmradio

	"com.cequint.ecid"
	# Caller ID from Cequint (https://www.cequint.com/)
	# https://www.fiercewireless.com/wireless/t-mobile-to-launch-caller-id-service-from-cequint
	# NOTE : Never trust a company which promotes call ID/spam blocking features.
	# Cequint was acquired by TNS (https://tnsi.com/)
	# That was not a good thing : https://www.geekwire.com/2013/earnouts-bad-cequint-execs-sue-parent-company/

	"com.discoveryscreen"
	# Appflash (https://play.google.com/store/apps/details?id=com.discoveryscreen)
	# Verizon Spyware.
	# https://www.eff.org/deeplinks/2017/04/update-verizons-appflash-pre-installed-spyware-still-spyware

	"com.ebay.mobile"
	# Ebay app (https://play.google.com/store/apps/details?id=com.ebay.mobile)

	"com.eterno"
	# Daily hunts News. (https://play.google.com/store/apps/details?id=com.eterno&hl=en)

	"com.evernote"
	# Evernote app (https://play.google.com/store/apps/details?id=com.evernote)

	"com.generalmobi.go2pay"
	# Go2Pay (https://play.google.com/store/apps/details?id=com.generalmobi.go2pay)
	# Payment app that offers mobile pre-paid recharges and post-paid bill payment, data card recharges and bill payment, 
	# DTH recharges through cashless transactions.
	# DTH = Direct To Home Television 

	"com.gotv.nflgamecenter.us.lite" 
	# Football NFL (https://play.google.com/store/apps/details?id=com.gotv.nflgamecenter.us.lite)

	"com.hancom.office.editor.hidden"
	# Legacy Hancom Office Editor (Korean alternative to Microsoft Office). Featured in Samsung and LG phones

	"com.imdb.mobile"
	# IMDb mobile app (https://play.google.com/store/apps/details?id=com.imdb.mobile)

	"com.infraware.polarisoffice5"
	# Polaris Office from US Infraware Inc company (Microsoft Office like)
	# https://en.wikipedia.org/wiki/Polaris_Office
	# https://play.google.com/store/apps/details?id=com.infraware.office.link

	"com.linkedin.android"
	# Linkedin app (https://play.google.com/store/apps/details?id=com.linkedin.android)

	"com.lookout" 
	# Lookout Security & Antivirus (https://play.google.com/store/apps/details?id=com.lookout)

	"com.micredit.in"
	# Mi Credit. Personal Loan app (https://play.google.com/store/apps/details?id=com.micredit.in.gp)

	"com.netflix.mediaclient"
	# Netflix app (https://play.google.com/store/apps/details?id=com.netflix.mediaclient)

	"com.netflix.partner.activation"
	# Netflix activation via partner manufacturer ? 

	"com.niksoftware.snapseed"
	# Snapseed (https://play.google.com/store/apps/details?id=com.niksoftware.snapseed)

	"com.nuance.swype.input"
	# Swype keyboard by Nuance
	# https://www.nuance.com/mobile/mobile-applications/swype/android.html
	# https://en.wikipedia.org/wiki/Swype

	"com.opera.branding"
	# Opera Branding Provider
	# Don't know what it really does.

	"com.opera.branding.news"
	# Opera News Branding Provider
	# Don't know what it really does.

	"com.opera.mini.native"
	# Opera Mini web browser (https://play.google.com/store/apps/details?id=com.opera.mini.native)

	"com.opera.preinstall"
	# It seems to be Opera Max Data saving (discontinued)

	"com.phonepe.app"
	# PhonePe (https://play.google.com/store/apps/details?id=com.phonepe.app)
	# PhonePe is a payments app that allows indian users to use BHIM UPI, your credit card and debit card or wallet to recharge your mobile phone, 
	# pay your utility bills and also make instant payments at offline and online stores.
	# PhonePe is an indian company (https://en.wikipedia.org/wiki/PhonePe)
	# BHIM = Bharat Interface for Money : https://en.wikipedia.org/wiki/BHIM
	# UPI = Unified Payement Interface : https://en.wikipedia.org/wiki/Unified_Payments_Interface

	"com.pure.indosat.care"
	# myIM3 (https://play.google.com/store/apps/details?id=com.pure.indosat.care)
	# App provided by Indosat Ooredoo, an Internet provider from Indonesia. 
	# Enables Indosat users to manage prepaid and postpaid numbers and check their credit and payments, purchase data packs, calls, SMS...

	"com.huaqin.FM"   
	# Radio app from huaqin a chinese company
	# NOTE : Transistor [https://f-droid.org/en/packages/org.y20k.transistor/] is much better

	"com.nextradioapp.nextradio"
	# NextRadio (https://play.google.com/store/apps/details?id=com.nextradioapp.nextradio)
	# 3-party app which lets you experience live and local FM radio on your smartphone.
	# https://nextradioapp.com/

	"com.s.antivirus"
	# AVG Antivirus (https://play.google.com/store/apps/details?id=com.s.antivirus) for Sony Xperia.

	"com.slacker.radio" 
	# LiveXLive - Streaming Music and Live Events (https://play.google.com/store/apps/details?id=com.slacker.radio)

	"net.sharewire.parkmobilev2" 
	# ParkMobile - Find Parking (https://play.google.com/store/apps/details?id=net.sharewire.parkmobilev2)

	"com.shopee.id"
	# Shopee 2.2 (https://play.google.com/store/apps/details?id=com.shopee.id)
	# official app from Shopee, an e-commerce online shopping platform in Southeast Asian.

	"com.spotify.music"
	# Spotify app (https://play.google.com/store/apps/details?id=com.spotify.music)

	"com.til.timesnews"
	# India News (https://play.google.com/store/apps/details?id=com.til.timesnews)
	# 
	"com.turner.cnvideoapp" 
	# Cartoon network App (https://play.google.com/store/apps/details?id=com.turner.cnvideoapp)

	"com.tripadvisor.tripadvisor"
	# Trip advisor (https://play.google.com/store/apps/details?id=com.tripadvisor.tripadvisor)
	# You should never trust and use trip advisor
	# https://en.wikipedia.org/wiki/TripAdvisor (see 'Controversy and fraudulent reviews' section)
	# https://nypost.com/2016/03/01/why-you-should-never-ever-trust-tripadvisor/

	"com.UCMobile.intl"
	# UC Browser by Alibaba (https://play.google.com/store/apps/details?id=com.UCMobile.intl)
	# !! Unsecure chinese web browser !!
	# https://www.quora.com/Whats-wrong-with-UC-Browser
	# https://www.digitalinformationworld.com/2019/05/url-spoofing-uc-browser-android.html

	"com.yahoo.mobile.client.android.liveweather" 
	# Yahoo Weather (https://play.google.com/store/apps/details?id=com.yahoo.mobile.client.android.weather)
	# Please boycott Yahoo ! (all of their services are crappy so it's not so difficult)
	# If you're not aware : https://en.wikipedia.org/wiki/Criticism_of_Yahoo!

	"flipboard.app" 
	# Flipboard News App (https://play.google.com/store/apps/details?id=flipboard.app)

	"flipboard.boxer.app" 
	# Briefing app (https://play.google.com/store/apps/details?id=flipboard.boxer.app)

	"id.co.babe"                                 
	# BaBe (https://play.google.com/store/apps/details?id=id.co.babe)
	# Indonesian news app.

	"in.mohalla.sharechat" 
	# ShareChat (https://play.google.com/store/apps/details?id=in.mohalla.sharechat)

	"net.sharewire.parkmobilev2" 
	# ParkMobile - Find Parking (https://play.google.com/store/apps/details?id=net.sharewire.parkmobilev2)	

	#### QUALCOMM ####
	# QTI = Qualcomm Technologies Inc
	# Qualcomm is an American multinational semiconductor and telecommunications equipment company 
	# that designs and markets wireless telecommunications products and services.
	# Qualcomm tracking : https://forum.fairphone.com/t/telemetry-spyware-list-of-privacy-threats-on-fp3-android-9/55179/20

	"com.qualcomm.atfwd"
	# Qualcomm's WiFi display. It allows you to mirror your devices display on a TV 
	# Seems to be used by Mircast. Need to be confirmed tho.

	"com.qualcomm.qti.auth.fidocryptoservice"
	# Qualcomm FIDO implementation. 
	# FIDO : https://en.wikipedia.org/wiki/FIDO_Alliance
	# Fido is a set of open technical specifications for mechanisms of authenticating users to online services that do not depend on passwords.
	# https://fidoalliance.org/specs/u2f-specs-1.0-bt-nfc-id-amendment/fido-glossary.html
	# https://fidoalliance.org/specs/fido-v2.0-rd-20170927/fido-overview-v2.0-rd-20170927.html

	"com.qualcomm.qti.perfdump"
	# Performance dump (logging)
	# Enable a more accurate overview of the running services (and maybe how much power/RAM they take?)

	#"com.qualcomm.qti.qms.service.connectionsecurity"
	# ?????
	# Background-Connection to tls.telemetry.swe.quicinc.com (Host/Domain belongs to Qualcomm)
	# CURRENTLY IN TEST / MAY NOT BE SAFE

	"com.qualcomm.qti.qms.service.telemetry"
	# Telemetry service.
	# Yeah obviously it phone to Qualcomm.

	"com.qualcomm.qti.rcsbootstraputil"
	"com.qualcomm.qti.rcsimsbootstraputil"
	# RCS Service 
	# RCS = Rich Communicatin Services. 
	# It's a communication protocol between mobile telephone carriers and between phone and carrier, aiming at replacing SMS messages 
	# https://en.wikipedia.org/wiki/Rich_Communication_Services
	# Used vorte VolTE and VoWifi.

	#"com.qualcomm.qti.services.secureui"
	# Qualcomm Secure UI Service.
	# Uncertain role...
	# CURRENTLY IN TEST / MAY NOT BE SAFE

	"com.qualcomm.qti.uceshimservice"
	# UCE shim service 
	# UCE = Unified Communications for Enterprise ? (not sure)

	#"com.qualcomm.timeservice" # [MORE INFO NEEDED]
	# Qualcomm Time Service
	# It maybe keeps the real time clock in the Qualcomm processor synchronised with Android time.
	# Seems not safe to remove. 

	"com.quicinc.cne.CNEService"
	# Qualcomm service
	# Automatically switchs between Wifi/3G/4G depending on network performances. 
	# https://www.qualcomm.com/news/onq/2013/07/02/qualcomms-cne-bringing-smarts-3g4g-wi-fi-seamless-interworking

	#### FONTS ####
	"com.monotype.android.font.chococooky"
	"com.monotype.android.font.cooljazz"
	"com.monotype.android.font.foundation"
	"com.monotype.android.font.rosemary"

	#### ANT(+) ####
	# ANT+ (Adaptive Network Topology) is a proprietary multicast wireless sensor network technology. 
	# It's like Bluetooth low energy, but oriented towards usage with sensors. ANT+ is mostly used for sport tracking devices 
	# https://www.thisisant.com/directory
	# Somes stuff are open-source : https://github.com/ant-wireless

	"com.dsi.ant.plugins.antplus" 
	# ANT+ plugin service (https://play.google.com/store/apps/details?id=com.dsi.ant.plugins.antplus)
	
	"com.dsi.ant.sample.acquirechannels"
	# I don't know why there is "sample" in the name. Is this package really useful to find ANT channels ? 

	"com.dsi.ant.server"
	# ANT HAL(Hardware Abstraction Layer) Server

	"com.dsi.ant.service.socket"
	# ANT Radio Service (https://play.google.com/store/apps/details?id=com.dsi.ant.service.socket)
	# it is NOT related to Radio FM !
	)



"com.trustonic.tuiservice"
"com.vlingo.midas"
"com.yelp.android.samsungedge"


