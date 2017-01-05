# following are the available nodes
nodes="";
for n in $(seq 0 14); do nodes="$nodes xcna$n"; done
for n in $(seq 0 19); do nodes="$nodes xcnb$n"; done
for n in $(seq 0 49); do nodes="$nodes xcnc$n"; done
for n in $(seq 0 59); do nodes="$nodes xcnd$n"; done

used=0
id=0

# place the run_server.sh file to the directory you want to run your script, 
# and change the "workspace" in the following line to the directory you put your run_server.sh file
cmd="cd workspace; ./run_server.sh"

for node in $nodes
do
	timeout 5 ssh $node exit
	if [ $? -eq 0 ];
	then
		ssh $node $cmd

		if [ $? -eq 11 ];
		then
			echo "threads not enough"
		else 
			used=`expr $used + 1`
		fi	
		echo $node
	else
		echo "fail to connect"
	fi

	if [ $used -eq 9 ];  ### change the number here to the number of server nodes you want to use
	then
		break
	fi

done
		
echo "final used node:"
echo $node