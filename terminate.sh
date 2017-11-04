#/bin/bash
cat /proc/net/ip_conntrack;
var $tcp_track_output;
tcptrack -i eth0 | grep "NEW" > $tcp_track_output;
var $temp;
var $tcptack_copy = $tcp_track_output;

for (var $i in $tcptack_copy)
plline $i | tail -f 3 -d " " > $temp;
if ($temp > 20) 
tail -f 1 -d " " | sudo tcpkill -i eth0 host 
end;