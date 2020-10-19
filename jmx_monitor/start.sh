port=5558
dir=$(dirname $(readlink -f $0))
cd $dir
set -e
nohup java -server -Xmx256M -jar jmx_prometheus_httpserver-0.13.0-jar-with-dependencies.jar $port ./config.yml &>>log &
echo $! > pid
echo "jmx promethus agent started,pid $!"
