## HOW TO USE

1. place the run-local.sh in your local host, and place run-server.sh to server

2. write the run.sh file yourself and put it to a same directory of run-server.sh. The run.sh file contains the command you want to run in server. 

3. run run-local.sh in local host. It will automatically ssh to the server nodes and check its usage. If the usage is low, it will run your run.sh file. The number of server nodes to be used is specified in the run-local.sh file. Make sure you have read the run-local.sh file before running.