yum install -y $( cat /tmp/yum.list | tr '\n' ' ' )

res=$?
rm -f /tmp/yum.list

exit ${res}
