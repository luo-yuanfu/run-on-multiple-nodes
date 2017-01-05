# Following are the available nodes.
# You need to config the names of those nodes in the ~/.ssh/config file.
# For example:
#	Host xcna11
#	Hostname xcna11.comp.nus.edu.sg
#	User yuanfu
# Change the name 'yuanfu' to your account name
# Also, to enable ssh without password, you need to use "ssh-copy-id" command to copy your public key to server
nodes="";
for n in $(seq 0 14); do nodes="$nodes xcna$n"; done
for n in $(seq 0 19); do nodes="$nodes xcnb$n"; done
for n in $(seq 0 49); do nodes="$nodes xcnc$n"; done
for n in $(seq 0 59); do nodes="$nodes xcnd$n"; done

used=0
id=0

# place the run-server.sh file to the directory you want to run your script, 
# and change the "workspace" in the following line to the directory you put your run_server.sh file
cmd="cd workspace; ./run-server.sh"

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