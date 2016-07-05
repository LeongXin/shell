#! bin/bash

LOG_PATH='/server/tomcat/logs/'
LOG_PRE='dataAnalysis.log.'
LOG_SUF='.gz'

read -p "Start date(2016-01-01): " startDate
read -p "End date(2016-01-01): " endDate
read -p "qt: " qt

d=`date -d "${startDate}" +%s`
d2=`date -d "${endDate}" +%s`
qtInfo="qt=${qt}"

while [[ ${d} -le ${d2} ]]; do
        d1=`date -d @${d} "+%Y-%m-%d"`

        for h in `seq 0 23`; do
                h1="${h}"
		if ((h<10)); then
                        h1="0${h}"
                fi

                logName=${LOG_PATH}${LOG_PRE}${d1}-${h1}${LOG_SUF}
                logInfo=`zcat ${logName} | grep "${qtInfo}"`

                if [ ${#logInfo} -gt 0 ]; then
                        echo "${logInfo}" | grep "${qtInfo}" --color
                        break
                fi
        done

        d=`date -d "${d1} +1 day" +%s`
done
