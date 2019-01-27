#!/bin/bash
showCommandUsager()
{
    echo "Use : rasmanger -s [ -a | -t | -g | -m ] "
    echo "                --update"
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

showcpuusage()
{

    cpufreeuse=`vmstat |sed -n '3,1p' | awk -F' ' '{printf $15}'`
    CpuUsage=`echo ${cpufreeuse} | awk '{printf ("%.2f\n",100-$1)}'`
    
    echo "Now Cpu Usage :" ${CpuUsage} "%"  

}

showsysInfo()
{
    if [ $# -ne 1 ];then
        showCommandUsager
        exit
    fi

    if [ "${1}" == "-a" ];then
        #cpu/gpu temp
        showcputemp
        showgputemp
        
        echo
        #cpu
        showcpuusage
        #memory
        showmemuse
    elif [ "${1}" == "-t" ];then
        #cpu/gpu temp
        showcputemp
        showgputemp
    elif [ "${1}" == "-c" ];then
        #cpu use
        showcpuusage
    elif [ "${1}" == "-m" ];then
        #memory
        showmemuse
    else
        showCommandUsager
    fi

}

checkFileExist()
{
    MemFile="/proc/meminfo"
    CputempFIle="/sys/class/thermal/thermal_zone0/temp"
    GputempFIle="/opt/vc/bin/vcgencmd measure_temp"

    if [ ! -f "$MemFile" ]; then
        echo "${MemFile} is not exist"
        exit 1
    fi

    if [ ! -f "$CputempFIle" ]; then
        echo "${CputempFIle} is not exist"
        exit 1
    fi

    if [ ! -f "$GputempFIle" ]; then
        echo "${GputempFIle} is not exist"
        exit 1
    fi

}

