#!/bin/bash
while read line
do
	./runltp -p -q -f $line -l /home/ltp/results-log-$line.log -o /home/ltp/results-output-$line.output -C /home/ltp/results-failed-$line.failed -d /home/tmp
done <all
