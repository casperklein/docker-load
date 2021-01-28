#!/bin/bash

set -ueo pipefail

# defaults
SLEEP=${SLEEP:-30}
THREADS=${THREADS:-2}
TIME=${TIME:-60}
COLUMNS=${COLUMNS:-80}

echo "Threads: $THREADS"
echo "Time:    $TIME"
echo "Sleep:   $SLEEP"
echo
printf '%.0s-' $(seq 1 $COLUMNS)
echo
echo

while :; do
	date '+%F %T'
	stress --cpu "$THREADS" --timeout "$TIME"
	echo "Now sleeping for $SLEEP seconds.."
	echo
	sleep "$SLEEP"
	printf '%.0s-' $(seq 1 $COLUMNS)
	echo
	echo
done
