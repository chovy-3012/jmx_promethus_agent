#!/bin/bash

bin_path="/home/kylin/jmx_monitor"
monitor_path="/var/lib/om_plugin"

host=""
port=""
dispatch_conf(){
	scp -P $port $bin_path/config.yml $host:$bin_path
}

dispatch_bin(){
	ssh -p $port $host "rm -rf $bin_path"
	scp -P $port -r $bin_path $host:${bin_path%'/'*}
}

dispatch_monitor(){
        scp -P $port -r $bin_path/monitor.sh $host:$monitor_path
}

start_all(){
	ssh -p $port $host "sh $bin_path/start.sh"
}


stop_all(){
	ssh -p $port $host "sh $bin_path/stop.sh"
}

hosts=("insight-service-app-4:22" "insight-service-app-19:5837" "insight-service-app-20:5837")
for host_ in ${hosts[@]};do
	echo "$host_ =====>>> `date`"
        port=${host_#*':'}
        host=${host_%':'*}
	$1 $@
done
