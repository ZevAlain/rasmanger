#!/bin/bash
showCommandUsager()
{
    echo "Use : rasmanger -s cpu"
}

showcputmp()
{
    if [ "${1}" != "cpu" ];then
        showCommandUsager
        exit 1
    fi
    NowCpuTem=`cat /sys/class/thermal/thermal_zone0/temp`
    CurrentNowCpuTem=`expr ${NowCpuTem} / 1000`

    echo "Now CPU Tem :" ${CurrentNowCpuTem} "%"
}

