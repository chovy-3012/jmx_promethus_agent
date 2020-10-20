#!/bin/bash

bin_path="/root/jmx"
monitor_path="/var/lib/om_plugin"

dispatch_conf(){
        ip=$1
        port=$2
	scp -P $port $bin_path/config.yml $ip:$bin_path
}

dispatch_bin(){
	ip=$1
	port=$2
	scp -P $port -r $bin_path $ip:$bin_path
}

dispatch_monitor(){
	ip=$1
        port=$2
        scp -P $port -r $bin_path/monitor.sh $ip:$monitor_path
}

start_all(){
	ip=$1
        port=$2
	ssh -p $port $ip "sh $bin_path/start.sh"
}


stop_all(){
	ip=$1
        port=$2
	ssh -p $port $ip "sh $bin_path/stop.sh"
}

hosts=("druid2")
for host in ${hosts[@]};do
	echo "$host ===>>> `date`"
	port=22
	#if [ $ip ="xx" ];then
        #        port=5837
        #fi
	$1 $host $port $@
done
