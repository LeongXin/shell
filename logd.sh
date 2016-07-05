#! bin/bash

LOG_PATH='/server/tomcat/logs/'
LOG_PRE='dataAnalysis.log.'
LOG_SUF='.gz'

read -p "History log day: " num
read -p "qt: " qt

today=`date "+%Y-%m-%d"`
qtInfo="qt=${qt}"

flag=0
for d in `seq 1 ${num}`; do
        d1=`date -d "${today} -1 day" +%Y-%m-%d`

        for h in `seq 0 23`; do
                h1="${h}"
                if((h<10)); then
			h1="0${h}"
                fi

                logName=${LOG_PATH}${LOG_PRE}${d1}-${h1}${LOG_SUF}
                logInfo=`zcat ${logName} | grep "${qtInfo}"`

                if [ ${#logInfo} -gt 0 ]; then
                        echo "${logInfo}" | grep "${qtInfo}" --color
                        flag=1
                        break
                fi
        done

        if((flag>0)); then
                break
        fi

        d1=`date -d "${d1} -1 day" +%Y-%m-%d`
done
