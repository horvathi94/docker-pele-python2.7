#!/bin/bash

VERSION=$1
PELE_SRC="pele.zip"

if [ ! -f $PELE_SRC ]; then
	curl -L https://github.com/pele-python/pele/archive/refs/heads/master.zip --output $PELE_SRC
#	git clone https://github.com/pele-python/pele.git
fi


docker build \
	--tag horvathi/pele-python2.7:$VERSION \
	--tag horvathi/pele-python2.7:latest .
