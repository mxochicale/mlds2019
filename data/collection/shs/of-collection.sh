#!/bin/sh

# change permissions with 
# chmod +x *.sh

#
# USAGE
# $ sh *.sh pNNgXXaMM
# where NN is the number of participant
#      	XX is the gender, and
#	MM is the estimated age

TIMER=12 # timer for 10 seconds video recording
pNNgXXaNN=$1
echo "Participant $pNNgXXaNN"
cd "$HOME/tmp/ofc" &&  mkdir -p $pNNgXXaNN && cd $pNNgXXaNN



while true
do
	##openface recording 
	~/OpenFace/build/bin/./Record    #[Q to exit]
	

done &
pid=$!
sleep $TIMER && kill -TERM $pid

#https://www.linuxquestions.org/questions/programming-9/execute-a-loop-for-only-1-minute-941431/


