#! bin/bash

LOG_PATH='/server/tomcat/logs/'
DATA_PRE='dataAnalysis.log.'
BOOK_PRE='booksystem.log.'
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

                dataLog=${LOG_PATH}${DATA_PRE}${d1}-${h1}${LOG_SUF}
                dataInfo=`zcat ${dataLog} | grep "${qtInfo}"`
                queryId=`zcat ${dataLog} | grep "${qtInfo}" | awk -F',' '{print $2}' | awk -F'=' '{print $2}'`

                if [ ${#queryId} -gt 0 ]; then
                        #echo "${dataInfo}" | grep "${qt}" --color

                        bookLog=${LOG_PATH}${BOOK_PRE}${d1}-${h1}${LOG_SUF}
                        bookInfo=`zcat ${bookLog} | grep -A1 "${queryId}" --color`
                        echo "${bookInfo}"

                        flag=1
                        break
                fi
        done

        if((flag>0)); then
                break
        fi

        d1=`date -d "${d1} -1 day" +%Y-%m-%d`
done
