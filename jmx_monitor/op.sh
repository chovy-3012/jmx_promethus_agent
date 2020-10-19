#!/bin/bash

restartRegionserver(){
        ip=$1
        port=22
        if [ $ip = "insight-hadoop-datanode-21" ] || [ $ip = "insight-hadoop-datanode-22" ] || [ $ip = "insight-hadoop-datanode-23" ] || [ $ip = "insight-hadoop-datanode-24" ] || [ $ip = "insight-hadoop-datanode-25" ];then
                port=5837
        fi
	ssh -p $port $ip "sh ~/hbase_jmx/stop.sh"
	#ssh -p $port $ip "rm -fr ~/hbase_jmx"
	#scp -r -P $port ./hbase_jmx $ip:~
	#ssh -p $port $ip "cd ~/hbase_jmx && sh start.sh"
}

hosts=("insight-hadoop-datanode-1" "insight-hadoop-datanode-2" "insight-hadoop-datanode-3" "insight-hadoop-datanode-4" "insight-hadoop-datanode-5" "insight-hadoop-datanode-6" "insight-hadoop-datanode-7" "insight-hadoop-datanode-8" "insight-hadoop-datanode-9" "insight-hadoop-datanode-10" "insight-hadoop-datanode-11" "insight-hadoop-datanode-12" "insight-hadoop-datanode-13" "insight-hadoop-datanode-14" "insight-hadoop-datanode-15" "insight-hadoop-datanode-16" "insight-hadoop-datanode-21" "insight-hadoop-datanode-22" "insight-hadoop-datanode-23" "insight-hadoop-datanode-24" "insight-hadoop-datanode-25")

for host in ${hosts[@]};do
	echo `date`
        echo "restart regionserver $host"
        restartRegionserver $host
done
