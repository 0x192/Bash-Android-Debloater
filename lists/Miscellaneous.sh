#!/bin/bash

declare -a amazon_bloat=(

	"com.amazon.appmanager"
	# Mobile Device Information Provider
	# Seems related to Kindle

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

	"in.amazon.mShop.android.shopping"
	# Amazon India (https://play.google.com/store/apps/details?id=in.amazon.mShop.android.shopping)

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

	"cci.usage"
	# My Consumer Cellular (https://play.google.com/store/apps/details?id=cci.usage)
	# Lets you manage your Consumer Cellular account, track your usage, pay your bill.
	# Consumer Cellular is an American postpaid mobile virtual network operator
	# https://en.wikipedia.org/wiki/Consumer_Cellular

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

	"com.republicwireless.tel"
	# Republic (https://play.google.com/store/apps/details?id=com.republicwireless.tel&hl)
	# Lets you manage your Republic wireless account.
	# Republic Wireless is an american mobile virtual network operator (https://en.wikipedia.org/wiki/Republic_Wireless)

	"com.roaming.android.gsimbase" # [MORE INFO NEEDED]
	"com.roaming.android.gsimcontentprovider"
	# GSIM = Generic Statistical Information Model ? I don't think so but I can't find anything.

	"com.s.antivirus"
	# AVG Antivirus (https://play.google.com/store/apps/details?id=com.s.antivirus) for Sony Xperia.

	"com.slacker.radio" 
	# LiveXLive - Streaming Music and Live Events (https://play.google.com/store/apps/details?id=com.slacker.radio)

	"com.shopee.id"
	# Shopee 2.2 (https://play.google.com/store/apps/details?id=com.shopee.id)
	# official app from Shopee, an e-commerce online shopping platform in Southeast Asian.

	"com.smithmicro.netwise.director.comcast.oem"
	# XFINITY Wifi settings (https://play.google.com/store/apps/details?id=com.smithmicro.netwise.director.comcast.oem)
	# Auto-connects you to XFINITY WiFi hotspot.
	# XFINITY is a subsidiary of the Comcast Corporation (https://en.wikipedia.org/wiki/Xfinity)

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

	"com.trustonic.tuiservice"
	# The tuiService (Trusted User Interface) is a new security layer implemented by Trustonic.
	# Allows a Trusted Application to interact directly with the user via a common display and touch screen, completely isolated from the main device OS.
	# Seems like a good idea but it's closed source and "normal" devs can't use it for their apps. 
	# https://stackoverflow.com/questions/16909576/how-to-make-use-of-arm-trust-zone-in-android-application
	# It is basically only used by manufacter sapps like Samsung Pay and for DRM stuff.
	# Google implemented their own TUI in Android Pie : https://android-developers.googleblog.com/search/label/Trusted%20User%20Interface
	# 
	# https://www.trustonic.com/news/blog/benefits-trusted-user-interface/
	# https://en.wikipedia.org/wiki/Trusted_execution_environment
	#
	# If you're wondering, deleting this package will not cause security issues and will not break ARM TrustZone. It will break Trustonic TEE for sure
	# but if you don't use Trusted Apps. You won't need this ! 
	# Deleting this **may** reduce attack surface because yeah, Trustonic TEE isn't foolproof (as it was claimed)
	# https://en.wikipedia.org/wiki/ARM_architecture#Security_extensions
	# https://googleprojectzero.blogspot.com/2017/07/trust-issues-exploiting-trustzone-tees.html
	# https://www.synacktiv.com/posts/exploit/kinibi-tee-trusted-application-exploitation.html
	# https://blog.quarkslab.com/introduction-to-trusted-execution-environment-arms-trustzone.html
	#
	# Good ressources : 
	# https://medium.com/@nimronagy/arm-trustzone-on-android-975bfe7497d2
	# https://www.gsd.inesc-id.pt/~nsantos/papers/pinto_acsur19.pdf
	# https://blog.quarkslab.com/introduction-to-trusted-execution-environment-arms-trustzone.html
	# https://medium.com/taszksec/unbox-your-phone-part-i-331bbf44c30c
	#
	# NOTE : Trustonic TEE (called Kinibi) is used in Samsung, Vivo, Oppo, Xiaomi, Meizu and LG devices.

	"com.UCMobile.intl"
	# UC Browser by Alibaba (https://play.google.com/store/apps/details?id=com.UCMobile.intl)
	# !! Unsecure chinese web browser !!
	# https://www.quora.com/Whats-wrong-with-UC-Browser
	# https://www.digitalinformationworld.com/2019/05/url-spoofing-uc-browser-android.html

	"com.vlingo.midas"
	# Speech recognition app forthe personal assistant by Vlingo 
	# Vlingo : https://en.wikipedia.org/wiki/Vlingo
	# FYI : In January 2012 AndroidPit discovered that Vlingo sended packets of information containing the users GPS co-ordinates,
	# IMEI (unique device identifier), contact list and the title of every song stored on the device back to Nuance without.
	# Source : https://www.androidpit.com/Vlingo-Privacy-Breach

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

	"org.codeaurora.gps.gpslogsave"
	# CodeAurora Forum is a Linux Foundation Collaborative Project (https://www.codeaurora.org/). All their code is open-source.
	# According to its name, it only saves GPS logs.	

	"org.codeaurora.ims"
	# CodeAurora Forum is a Linux Foundation Collaborative Project (https://www.codeaurora.org/). All their code is open-source.
	# IMS is an open industry standard for voice and multimedia communications over packet-based IP networks (Volte/VoIP/Wifi calling)
	# There is high chances this package is needed for Volte/VoIP/Wifi calling. 

	#### QUALCOMM ####
	# QTI = Qualcomm Technologies Inc
	# Qualcomm is an American multinational semiconductor and telecommunications equipment company 
	# that designs and markets wireless telecommunications products and services.
	# Qualcomm tracking : https://forum.fairphone.com/t/telemetry-spyware-list-of-privacy-threats-on-fp3-android-9/55179/20

	"com.qti.qualcomm.datastatusnotification" # [MORE INFO NEEDED]
	# Maybe it displays data status notification (network data usage)
	# Asks for sending SMS permission.

	"com.qti.service.colorservice" # [MORE INFO NEEDED]
	# Don't know why but it uses mobiledata.
	# It most likely does something to colors on your display. Can someone see the difference ? Is it accessbility feature ?

	"com.qti.snapdragon.qdcm_ff" # [MORE INFO NEEDED]
	# Qualcomm Display Color Management tool
	# Works in background and "enhance" the display’s appearance through an intelligent color adjustment and gamut-mapping system 
	# "to make colors look vibrant and true to life".
	# Not really convinced. Can someone see the difference ? 
	# https://www.qualcomm.com/news/onq/2016/05/02/qualcomm-trupalette-brings-your-phones-display-life
	#
	# ff = FinFet ? (https://en.wikipedia.org/wiki/FinFET)

	"com.qualcomm.atfwd"
	# Qualcomm's WiFi display. It allows you to mirror your devices display on a TV 
	# Seems to be used by Mircast. Need to be confirmed tho.

	"com.qualcomm.embms"
	# Run in background.
	# I guess it add support to LTE Broadcast or eMBMS (evolved Multimedia Broadcast Multicast Service) 
	# Enables carriers to sends stuff using multicast (same content to be delivered to a large number of users at the same time) instead of LTE.
	# It is a more efficient use of network resources when compared to each user receiving the same content individually.
	# Personally I don't want my carrier to send me stuff.
	#
	# FYI : https://en.wikipedia.org/wiki/Multimedia_Broadcast_Multicast_Service
	# 		https://www.one2many.eu/en/lte-broadcast/what-is-embms

	#"com.qualcomm.fastdormancy"
	# Provide Fast Dormancy feature/setting in the dialer (reduce battery consumption and network utilization during periods of data inactivity) 
	# https://en.wikipedia.org/wiki/Fast_Dormancy

	"com.qualcomm.location"
	# May enable your device to determine its location more quickly and accurately, even when your device is unable to get a strong GPS signal. 
	# **May** also help your device conserve battery power when you use applications or services requiring location data
	# It will eriodically downloads data to your device regarding the locations of nearby cellular towers and WiFi access points
	#
	# Qualcomm Location periodically sends a unique software ID, the location of your device (longitude, latitude and altitude, and its uncertainty) 
	# and nearby cellular towers and Wi-Fi hotspots, signal strength, and time (collectively, “Location Data”) to Qualcomm servers. 
	# As with any Internet communication, they also receive the IP address your device uses. 
	# https://www.qualcomm.com/site/privacy/services

	#"com.qualcomm.qcrilmsgtunnel" # [MORE INFO NEEDED]
	# Tunnel between modem and android framework. Related to SMS ? 
	# FYI : ril = Radio Interface layer. It's the bridge between Android phone framework services and the hardware.
	# There is no noticeable immediate consequences after disabling it but it'd better to know more about.

	"com.qualcomm.uimremoteclient" # [MORE INFO NEEDED]
	# UIM Remote client
	# When you see "remote" in a package name you can try to delete it.
	# See "com.qualcomm.qti.uim" for more information.

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

	"com.qualcomm.qti.dynamicddsservice"
	# Dynamic DDS Service
	# DDS = Direct Digital Synthesizer
	# To make this very simple, it enables frequencies to be changed quickly without settling time.
	# It is very useful for testing, communications and frequency sweep applications. Not sure you need this in your phone.
	# https://www.qualcomm.com/news/releases/1996/05/07/qualcomm-introduces-new-high-speed-dual-direct-digital-synthesizer
	# If you want to know more about the use of a DDS : https://www.allaboutcircuits.com/technical-articles/direct-digital-synthesis/

	"com.qualcomm.qti.lpa"
	# Only useful if you use an esim (virtual sim)
	# lpa = Local Profile Assistants. It is a software that allows consumers to choose and change their subscription data when switching between 
	# network operators/carriers.
	# https://developer.qualcomm.com/blog/rise-esims-and-isims-and-their-impact-iot
	# https://source.android.com/devices/tech/connect/esim-overview

	"com.qualcomm.qti.remoteSimlockAuth" # [MORE INFO NEEDED]
	# Enable you to lock/unlock your eSIM remotely.
	# Seems more of a security risk to me than anything else.
	# Is it related to Safeswitch ? https://www.qualcomm.com/products/features/security/safeswitch

	"com.qualcomm.qti.telephonyservice" # [MORE INFO NEEDED]
	# Sincerely I don't know what it is.
	# It runs in background.
	# It seems there is no issue with telephony if removed. I need to keep an eye on this.

	"com.qualcomm.qti.uim"
	# Related to RUIM I guess. It is a king of SIM card
	# https://en.wikipedia.org/wiki/Removable_User_Identity_Module
	# Still used in China it seems. 

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



