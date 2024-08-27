#!/bin/bash

CLEARED=""
THISDIR=$PWD
TOPDIR="$THISDIR/../../../../"

checkerror() {
    if [[ ${1} -gt 0 ]]; then
	if [[ "${3}" == "-fatal" ]]; then
		echo "[$(basename ${0})]: ERROR: ${2}" >&2
		exit 9
	else
		echo "[$(basename ${0})]: WARNING: ${2}" >&2	
	fi
    fi
}

clear_set() {

cd $1

for LINE in $(echo $(find -L -name *.patch); echo $(find -L -name *.apply); echo $(find -L -name *.disabled); echo $(find -L -name *.disabledapply); echo $(find -L -name *.fixme))

do
  	REPO=$(dirname $LINE)

	if [[ $(echo $CLEARED | grep -c "$REPO") -gt 0 ]]; then
		continue
	fi

	cd $TOPDIR

	if [[ ! -e $REPO ]]; then
		checkerror 1 "$REPO does not exist; skipping..."
		CLEARED="$CLEARED|$REPO|"
		cd $THISDIR
		continue
	fi

        OUT=$(echo "$REPO" | sed 's|^\./||')

	echo -e "\033[33mClearing: $OUT\033[0m"

	cd $REPO

	git add . > /dev/null
	git stash > /dev/null

	find -name *.orig | while read LINE; do rm $LINE; done
	find -name *.rej | while read LINE; do rm $LINE; done

	git clean -f > /dev/null
	git stash clear > /dev/null

	CLEARED="$CLEARED|$REPO|"

	cd $THISDIR
done

}

clear_set cm
echo -e "\033[32mSuccessfully cleared ROM patches!\033[0m"
