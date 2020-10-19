dir=$(dirname $(readlink -f $0))
cd $dir
if [ -f ./pid ];then
	pid=`cat pid`
	kill -9 $pid
	echo "agent stopped,$pid"
	rm -f pid
else
	echo "not running or pid file is missing"
fi
