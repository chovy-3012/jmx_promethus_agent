lines=`curl -s http://localhost:5558/metrics | grep -v "^#" | cat `
IFS_old=$IFS
IFS=$'\n'
for line in $lines;do
        echo "bdp_prod_$line"
done
IFS=$IFS_old
