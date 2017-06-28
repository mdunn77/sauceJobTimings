#!/bin/bash

USAGE="jobTimings: -t <test user> -j <job ID>"
echo ""

if [ -z "$SAUCE_USERNAME" ]; then
    echo "Need to set SAUCE_USERNAME"
    exit 1
fi  

if [ -z "$SAUCE_ACCESS_KEY" ]; then
    echo "Need to set SAUCE_ACCESS_KEY"
    exit 1
fi

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -t|--testuser)
    TESTUSER="$2"
    shift # past argument
    ;;
    -j|--jobid)
    JOBID="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done
echo SAUCE USERNAME: "$SAUCE_USERNAME"
echo TEST USER: "${TESTUSER}"
echo JOB ID: "${JOBID}"

if [ -z "${TESTUSER}" ]; then
    echo "Usage:" ${USAGE}
    exit 1
fi  

if [ -z "$JOBID" ]; then
    echo "Usage:" ${USAGE}
    exit 1
fi

JSONFILE="/tmp/log.json"
DURATIONSFILE="/tmp/durations.txt"
BETWEENSFILE="/tmp/betweens.txt"

echo "Getting log.json"
curl -u $SAUCE_USERNAME:$SAUCE_ACCESS_KEY https://saucelabs.com/rest/v1/${TESTUSER}/jobs/${JOBID}/assets/log.json > ${JSONFILE}

echo "Parsing commands from log.json"
jq '.[] | .duration' ${JSONFILE} > ${DURATIONSFILE}
jq '.[] | .between_commands' ${JSONFILE} > ${BETWEENSFILE}

NUMCOMMANDS=$(cat ${DURATIONSFILE} | wc -l )
TOTALDURATIONS=$(jq -s add ${DURATIONSFILE})
TOTALBETWEEN=$(jq -s add ${BETWEENSFILE})
TOTALTIME=$(dc <<<"${TOTALDURATIONS} ${TOTALBETWEEN} + p")
AVGDURATION=$(jq -s 'add/length' ${DURATIONSFILE})
AVGBETWEEN=$(jq -s 'add/length' ${BETWEENSFILE})

echo "Number of commands:" ${NUMCOMMANDS}
echo "Total time:" ${TOTALTIME}
echo "Total command duration:" ${TOTALDURATIONS}
echo "Average command duration:" ${AVGDURATION}
echo "Total time between commands:" ${TOTALBETWEEN}
echo "Average time between commands:" ${AVGBETWEEN}



