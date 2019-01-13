#!/bin/sh

# change permissions with 
# chmod +x *.sh

#
# USAGE
# $ sh *.sh pNNgXXaMM
# where NN is the number of participant
#      	XX is the gender, and
#	MM is the estimated age


pNNgXXaNN=$1
echo "Participant $pNNgXXaNN"
cd "$HOME/tmp/ofc" &&  mkdir -p $pNNgXXaNN && cd $pNNgXXaNN


#computing video with facelandmarks
#~/OpenFace/build/bin/./FaceLandmarkVid -f out.avi -ov "flvid.avi"
	
# compute openface features 
~/OpenFace/build/bin/./FeatureExtraction -rigid -verbose -f out.avi -of "offeatures.csv" -simalign aligned


## Play the FaceLandmarkVideo
#cvlc --loop --fullscreen flvid.avi
## to stop the video press 'crtl-c' in the terminal
#
#

