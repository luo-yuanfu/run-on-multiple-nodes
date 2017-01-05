num_running_threads=`cat /proc/loadavg | awk '{print $1}'`
echo $num_running_threads
free_cpu=`echo $num_running_threads'<'4.0 | bc -l`
if [ $free_cpu -eq 1 ];
then
	./run.sh  # write the run.sh file yourself. run.sh file is the script you want to run in the server.
else
	exit 11
fi

