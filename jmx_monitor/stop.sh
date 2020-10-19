dir=$(dirname $(readlink -f $0))
cd $dir
if [ -f ./pid ];then
	kill -9 `cat pid`
else
	echo "not running or pid file is missing"
fi
