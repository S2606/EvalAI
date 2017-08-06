#!/bin/bash


#    List the process ids for all the running consumer or receiver processes.
#    Kill the running consumer or receiver processes.
#    Run new instances of the consumer or receiver processes.
#    List the process ids of the running consumer or receiver processes.

for pid in `ps -ef | grep 'scripts/workers/submission_worker.py' | grep -v 'grep' | awk '{print $2}'` ; do echo $pid ; done

for pid in `ps -ef | grep 'scripts/workers/submission_worker.py' | grep -v 'grep' | awk '{print $2}'` ; do kill $pid ; done

# Running four consumer or receiver processes in background. We can increase its number for further requirements.
python 'scripts/workers/submission_worker.py' &
python 'scripts/workers/submission_worker.py' &
python 'scripts/workers/submission_worker.py' &
python 'scripts/workers/submission_worker.py' &

for pid in `ps -ef | grep 'scripts/workers/submission_worker.py' | grep -v 'grep' | awk '{print $2}'` ; do echo $pid ; done
