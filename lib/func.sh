#!/bin/bash
showCommandUsager()
{
    echo "Use : rasmanger -s cpu"
}


showcputemp()
{
    if [  -n ${1}  ];then
        showcputemp
        showgputemp
        return 
    else if [ ${1} == "cpu" ]
        showcputemp
        return
    else if ["${1}" == "gpu" ]
        showgputemp
    else
        showCommandUsager
    fi

}

showcputemp()
{
        NowCpuTem=`cat /sys/class/thermal/thermal_zone0/temp`
        CurrentNowTem=`expr ${NowCpuTem} / 1000`
        echo "Now CPU Temp :" ${CurrentNowCpuTem} "'C"
}

showgputemp()
{
        CurrentNowTem=`/opt/vc/bin/vcgencmd measure_temp | cut -f2 -d"="`
        echo "Now GPU Temp :" ${CurrentNowCpuTem}
}
