#!/bin/sh
#By Zy143L

PROGRAM="EC200A"
printMsg() {
	local msg="$1"
	logger -t "${PROGRAM}" "${msg}"
} #日志输出调用API


Sim_Sel=`uci get ec200a.ec200a.sim_sel`
#SIM选择

modify_imei=`uci get ec200a.ec200a.modify_imei`
#IMEI开关

modify_band=`uci get ec200a.ec200a.modify_band`
#锁频开关




if [ ${modify_imei} == 1 ];then
	IMEI=`uci get ec200a.ec200a.IMEI`
	/usr/share/moimei ${IMEI} 1>/dev/null 2>&1
	printMsg "IMEI: ${IMEI}"
fi

if [ ${modify_band} == 1 ];then
	band_hex=`uci get ec200a.ec200a.band_hex`
	band=`uci get ec200a.ec200a.band`
	printMsg "频段修改 ${band}"
	/usr/share/moat "AT+QCFG=band,0,${band_hex}"
	/usr/share/moat "AT+CFUN=1,1"
fi

Sim_Sel_Save=`cat /tmp/Sim_Sel 2>/dev/null`
if [ -z "$Sim_Sel_Save" ] || [ ${Sim_Sel} != ${Sim_Sel_Save} ];then
	case "$Sim_Sel" in
		0)
		printMsg "外置SIM卡"
		echo 1 > /sys/class/gpio/cpe-sel0/value
		# GPIO 44 High
		echo 0 > /sys/class/gpio/cpe-sel1/value
		# GPIO 40 High
		/usr/share/moat "AT+CFUN=1,1"
		echo 0 > /tmp/Sim_Sel
		;;
		1)
		printMsg "内置SIM1"
		echo 0 > /sys/class/gpio/cpe-sel0/value
		# GPIO 44 Low
		echo 1 > /sys/class/gpio/cpe-sel1/value
		# GPIO 40 Low
		/usr/share/moat "AT+CFUN=1,1"
		echo 1 > /tmp/Sim_Sel
		;;
		2)
		printMsg "内置SIM2"
		echo 0 > /sys/class/gpio/cpe-sel0/value
		# GPIO 44 Low
		echo 0 > /sys/class/gpio/cpe-sel1/value
		# GPIO 40 High
		/usr/share/moat "AT+CFUN=1,1"
		echo 2 > /tmp/Sim_Sel
		;;
		*)
		printMsg "错误状态"
		echo 1 > /sys/class/gpio/cpe-sel0/value
		# GPIO 44 High
		echo 0 > /sys/class/gpio/cpe-sel1/value
		# GPIO 40 High
		/usr/share/moat "AT+CFUN=1,1"
		echo 3 > /tmp/Sim_Sel
		;;
	esac
else
	printMsg "不修改SIM"
fi




exit
