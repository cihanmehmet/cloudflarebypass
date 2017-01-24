#!/bin/bash

# colors
BLU=$(echo -e "\e[1;36m")  
BLUN=$(echo -e "\e[0;36m") 
STD=$(echo -e "\e[0;0;0m")  
RED=$(echo -e "\e[1;31m")  
GRN=$(echo -e "\e[1;32m")  
GRNN=$(echo -e "\e[0;32m")  
REDN=$(echo -e "\e[0;31m")  

# header
f_header() {
echo $GRNN"
██████╗ ███╗   ██╗███████╗██████╗ ███████╗███████╗ ██████╗ ██╗    ██╗   ██╗███████╗██████╗ 
██╔══██╗████╗  ██║██╔════╝██╔══██╗██╔════╝██╔════╝██╔═══██╗██║    ██║   ██║██╔════╝██╔══██╗
██║  ██║██╔██╗ ██║███████╗██████╔╝█████╗  ███████╗██║   ██║██║    ██║   ██║█████╗  ██████╔╝
██║  ██║██║╚██╗██║╚════██║██╔══██╗██╔══╝  ╚════██║██║   ██║██║    ╚██╗ ██╔╝██╔══╝  ██╔══██╗
██████╔╝██║ ╚████║███████║██║  ██║███████╗███████║╚██████╔╝███████╗╚████╔╝ ███████╗██║  ██║
╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚══════╝ ╚═══╝  ╚══════╝╚═╝  ╚═╝
                                                                                           
===>$BLUN https//github.com/cihanmehmet                                                                                                                                                   
"$STD
}
clear
f_header
echo -n $GRN">$STD Enter website name : Example = $RED cloudflare.com $STD:"$BLU
read lookup
if [ "$lookup" == "" ] ; then 
echo $RED">$STD Missing input or input error, " 
echo
exit
fi
clear
f_header
echo $STD
echo $GRN"> $BLU$lookup$STD seçildi"
sleep 1.25
##################################nslookup##############################################################
echo "Nslookup ile IP'leri kontrol etmeye çalışılıyor.."
NS=$(nslookup $lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
MAXNR=$(echo $NS | sed 's/ /\n/' | wc -l)
for i in $(seq 1 $MAXNR) ; do 
IP=$(echo $NS | sed 's/ /\n/' | sed -n "$i"p)
IP_NETNAME=$(whois $IP | grep -i netname | awk '{print $2}')
echo "$GRNN$IP$STD --> $GRNN$IP_NETNAME$STD" 
done
sleep 1.25
echo $STD
###############################nslookup with cpanel#######################################################
CPANEL_RESULT=$(nslookup cpanel.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$CPANEL_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 1 of 9$BLUN [$STD Cpanel$BLUN ]$RED --> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 1 of 9$BLUN [$STD Cpanel$BLUN ]$GRNN --> $STD$CPANEL_RESULT"
CPANEL_NETNAME=$(whois $CPANEL_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of $GRNN$CPANEL_RESULT$STD --> $GRNN$CPANEL_NETNAME"
fi
sleep 1.25
echo $STD
#####################################nslookup with ftp####################################################
FAIL="Failed to resolve"
#
FTP_RESULT=$(nslookup ftp.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$FTP_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 2 of 9$BLUN [$STD FTP$BLUN ]$RED -----> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 2 of 9$BLUN [$STD FTP$BLUN ]$GRNN -----> $STD$FTP_RESULT"
FTP_NETNAME=$(whois $FTP_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of$GRNN$FTP_RESULT$STD --> $GRNN$FTP_NETNAME"
fi
sleep 1.25
echo $STD
######################################nslookup with webdisk#################################################
WEBDISK_RESULT=$(nslookup webdisk.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$WEBDISK_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 3 of 9$BLUN [$STD Webdisk$BLUN ]$RED --> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 3 of 9$BLUN [$STD Webdisk$BLUN ]$GRNN --> $STD$WEBDISK_RESULT"
WEBDISK_NETNAME=$(whois $WEBDISK_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of $GRNN$WEBDISK_RESULT$STD --> $GRNN$WEBDISK_NETNAME"
fi
sleep 1.25
echo $STD
#############################nslookup with webmail###########################################################
WEBMAIL_RESULT=$(nslookup webmail.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$WEBMAIL_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 4 of 9$BLUN [$STD Webmail$BLUN ]$RED --> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 4 of 9$BLUN [$STD Webmail$BLUN ]$GRNN --> $STD$WEBMAIL_RESUL$"
WEBMAIL_NETNAME=$(whois $WEBMAIL_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of$GRNN$WEBMAIL_RESULT$STD --> $GRNN$WEBMAIL_NETNAME"
fi
sleep 1.25
echo $STD""
###############################nslookup with whm##############################################################
# nslookup with whm
WHM_RESULT=$(nslookup whm.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$WEBDISK_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 5 of 9$BLUN [$STD Whm$BLUN ]$RED --> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 5 of 9$BLUN [$STD Whm$BLUN ]$GRNN --> $STD$WHM_RESULT"
WHM_NETNAME=$(whois $WHM_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of $GRNN$WHM_RESULT$STD --> $GRNN$WHM_NETNAME"
fi
sleep 1.25
echo $STD

###############################nslookup with mail#############################################################
MAIL_RESULT=$(nslookup mail.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$MAIL_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 6 of 9$BLUN [$STD Mail$BLUN ]$RED ----> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 6 of 9$BLUN [$STD Mail$BLUN ]$GRNN ----> $STD$MAIL_RESULT"
MAIL_NETNAME=$(whois $MAIL_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of$GRNN$MAIL_RESULT$STD --> $GRNN$MAIL_NETNAME"
fi
sleep 1.25
echo $STD""
#################################nslookup with direct########################################################
DIRECT_RESULT=$(nslookup direct.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$DIRECT_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 7 of 9$BLUN [$STD Direct$BLUN ]$RED --> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 7 of 9$BLUN [$STD Direct$BLUN ]$GRNN --> $STD$DIRECT_RESULT"
DIRECT_NETNAME=$(whois $DIRECT_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of$GRNN$DIRECT_RESULT$STD --> $GRNN$DIRECT_NETNAME"
fi
sleep 1.25
echo $STD""
##################################nslookup with direct-connect#################################################
DIRECT_RESULTC=$(nslookup direct-connect.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$DIRECTC_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 8 of 9$BLUN [$STD Direct-Connect$BLUN ]$RED --> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 8 of 9$BLUN [$STD Direct-Connect$BLUN ]$GRNN --> $STD$DIRECTC_RESUL$"
DIRECT_NETNAME=$(whois $DIRECTC_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of$GRNN$DIRECTC_RESULT$STD --> $GRNN$DIRECTC_NETNAME"
fi
sleep 1.25
echo $STD""
################################nslookup with portal###########################################################
PORTAL_RESULT=$(nslookup portal.$lookup | sed '0,/Non-authoritative/d' | grep -i Address | sed 's/Address://')
if [ "$PORTAL_RESULT" == "" ] ; then 
echo $GRN">$STD Resolve Case 9 of 9$BLUN [$STD Portal$BLUN ]$RED --> $STD$FAIL"
else
echo $GRN">$STD Resolve Case 9 of 9$BLUN [$STD Portal$BLUN ]$GRNN --> $STD$PORTAL_RESUL$"
PORTAL_NETNAME=$(whois $PORTAL_RESULT | grep -i netname | awk '{print $2}')
echo "NetName of$GRNN$PORTAL_RESULT$STD --> $GRNN$PORTAL_NETNAME"
fi
sleep 1.25
echo $STD""
##########################################finished#################################################################
echo $REDN">$STD Resolve Cases Finished$REDN <$STD"
echo "$BLUN Press Enter To Continue..$BLUE"
read enter
echo $STD""
bash dnsresolver.sh


