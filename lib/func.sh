#!/bin/bash
showCommandUsager()
{
    echo "Use : rasmanger -s [ -a | -c | -g ]"
}

showcputemp()
{
        NowCpuTem=`cat /sys/class/thermal/thermal_zone0/temp`
        CurrentNowTem=`expr ${NowCpuTem} / 1000`
        echo "Now CPU Temp :" ${CurrentNowTem} "'C"
}

showgputemp()
{
        CurrentNowTem=`/opt/vc/bin/vcgencmd measure_temp | cut -f2 -d"=" | cut -f1 -d"'" `
        echo "Now GPU Temp :" ${CurrentNowTem} "'C"
}

showsysInfo()
{
    if [ $# -ne 1 ];then
        showCommandUsager
        exit
    fi

    if [ "${1}" == "-a" ];then
        showcputemp
        showgputemp
    elif [ "${1}" == "-c" ];then
        showcputemp
    elif [ "${1}" == "-g" ];then
        showgputemp
    else
        showCommandUsager
    fi

}

