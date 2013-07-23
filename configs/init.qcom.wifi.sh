#!/system/bin/sh
###########################
#                         #
# QCOM Wifi Loader Script #
# drewx2                  #
#                         #
###########################

target=`getprop ro.build.product`
case "$target" in
	n5*)
        serialno=`getprop ro.serialno`
        echo $serialno > /sys/devices/platform/wcnss_wlan.0/serial_number

        setprop wlan.driver.ath 0 
        setprop wlan.driver.config /etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini

		mkdir -p /etc/firmware/wlan/prima/
		cp -f /persist/WCNSS_qcom_cfg.ini /etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini
		cp -f /persist/WCNSS_qcom_wlan_nv.bin /etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin
		
		echo 1 > /dev/wcnss_wlan
	;;
esac
exit 0
