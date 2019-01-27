#!/bin/bash
showCommandUsager()
{
    echo "Use : rasmanger -s [ -a | -c | -g | -m ]"
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

showmemuse()
{
    #all memory
    allmemuse=`sed -n "1, 1p" /proc/meminfo | awk -F' ' '{print $2}'`
    Nowusemem=`sed -n "2, 1p" /proc/meminfo | awk -F' ' '{print $2}'`

    MemoryUsage=`echo  ${Nowusemem} ${allmemuse} | awk '{printf ("%.2f\n",$1/$2*100)}'`
    echo "Now Memory Usage :" ${MemoryUsage} "%"

}

showsysInfo()
{
    if [ $# -ne 1 ];then
        showCommandUsager
        exit
    fi

    if [ "${1}" == "-a" ];then
        #cpu
        showcputemp
        #gpu
        showgputemp
        #memory
        showmemuse
    elif [ "${1}" == "-c" ];then
        #cpu
        showcputemp
    elif [ "${1}" == "-g" ];then
        #gpu
        showgputemp
    elif [ "${1}" == "-m" ];then
        #memory
        showmemuse
    else
        showCommandUsager
    fi

}

