port=5558
dir=$(dirname $(readlink -f $0))
cd $dir
nohup java -server -Xmx256M -jar jmx_prometheus_httpserver-0.13.0-jar-with-dependencies.jar $port ./config.yml &>/dev/null &
echo $! > pid
