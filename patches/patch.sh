#!/bin/bash

ROM=cm
CLEAR=${2}
THISDIR=$PWD
TOPDIR="$THISDIR/../../../../"

checkerror() {
    if [[ ${1} -gt 0 ]]; then
        if [[ "${3}" == "-fatal" ]]; then
            echo -e "[$(basename ${0})]: ERROR: ${2}" >&2
            echo -e "[$(basename ${0})]: \t: #############################################################################" >&2
            echo -e "[$(basename ${0})]: \t: # ABORT: This ROM may not build or may not boot unless this patch is fixed. #" >&2
            echo -e "[$(basename ${0})]: \t: #############################################################################" >&2
            exit 9
        else
            echo -e "[$(basename ${0})]: WARNING: ${2}" >&2
        fi
    fi
}

if [[ "$CLEAR" == "" ]]; then
    ./clearpatches.sh $ROM
fi

if ! find -L -name '*.patch' | read; then
    echo -e "\033[32mNo applicable ROM patches!\033[0m"
    exit 0
fi

cd $ROM

for LINE in $(find -L -name *.patch | sort ); do
    PATCH=$THISDIR/$ROM/$LINE
    REPO=$(dirname $LINE)
    PATCHFATAL=""

    if [[ "$(basename $PATCH)" == *critical* ]]; then
        PATCHFATAL="-fatal"
    fi

    cd $TOPDIR

    if [[ ! -e $REPO ]]; then
        checkerror 1 "$REPO does not exist; skipping..."
        cd $THISDIR
        continue
    fi

    cd $REPO

    OUT=$(echo "$REPO" | sed 's|^\./||')

    echo -e "\033[33mApplying: $OUT -> $(basename $PATCH)\033[0m"

    patch -p1 --follow-symlinks --no-backup-if-mismatch < $PATCH &> /dev/null

    if [[ $? -gt 0 ]]; then
        checkerror 1 "PATCH FAILED!!! $PATCH" $PATCHFATAL
    fi

    cd $THISDIR
done

echo -e "\033[32mSuccessfully applied ROM patches!\033[0m"

cd $ROM

for LINE in $(find -L -name *.apply | sort ); do
    PATCH=$THISDIR/$ROM/$LINE
    REPO=$(dirname $LINE)
    PATCHFATAL=""

    if [[ "$(basename $PATCH)" == *critical* ]]; then
        PATCHFATAL="-fatal"
    fi

    cd $TOPDIR

    if [[ ! -e $REPO ]]; then
        checkerror 1 "$REPO does not exist; skipping..."
        cd $THISDIR
        continue
    fi

    cd $REPO

    echo "Applying patch: $ROM - $LINE"

    git apply --whitespace=nowarn --reject $PATCH &> /dev/null

    checkerror $? "APPLY FAILED!!! $PATCH" $PATCHFATAL

    cd $THISDIR
done
