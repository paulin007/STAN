#!/bin/bash

function signal(){
	echo "******* $1 *******"
}

set -e
relative_path=`dirname $0`
root=`cd $relative_path;pwd`

cd $root
../build.sh
cd ../../

cd stan
signal 'Computing scaled depths'
java -Xms256m -Xmx3000m -cp .:'stan.jar' it.disco.unimib.labeller.tools.RunScaledDepthComputation $@
signal 'Done'
