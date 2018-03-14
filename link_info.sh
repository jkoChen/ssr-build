#!/usr/bin/env bash
get_IP_address(){
        #echo "user_IP_1=${user_IP_1}"
        if [[ ! -z ${user_IP_1} ]]; then
        #echo "user_IP_total=${user_IP_total}"
                for((integer_1 = ${user_IP_total}; integer_1 >= 1; integer_1--))
                do
                        IP=`echo "${user_IP_1}" |sed -n "$integer_1"p`
                        #echo "IP=${IP}"
                        IP_address=`wget -qO- -t1 -T2 http://freeapi.ipip.net/${IP}|sed 's/\"//g;s/,//g;s/\[//g;s/\]//g'`
                        #echo "IP_address=${IP_address}"
                        user_IP="${user_IP}\n${IP}(${IP_address})"
                        #echo "user_IP=${user_IP}"
                        sleep 1s
                done
        fi
}

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
now_mode="单端口" && user_total="1"
IP_total=` docker exec -it $(docker ps | grep jko/ssr | awk '{print $1}') netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp' |grep ":5201 " |awk '{print $5}' |awk -F ":" '{print $1}' |sort -u |wc -l`
user_port=5201
user_IP_1=`docker exec -it $(docker ps | grep jko/ssr | awk '{print $1}') netstat -anp |grep 'ESTABLISHED' |grep 'python' |grep 'tcp' |grep ":5201 " |awk '{print $5}' |awk -F ":" '{print $1}' |sort -u`
if [[ -z ${user_IP_1} ]]; then
        user_IP_total="0"
else
        user_IP_total=`echo -e "${user_IP_1}"|wc -l`
        get_IP_address
fi
user_list_all="端口: ${Green_font_prefix}"${user_port}"${Font_color_suffix}\t 链接IP总数: ${Green_font_prefix}"${user_IP_total}"${Font_color_suffix}\t 当前链接IP: ${Green_font_prefix}${user_IP}${Font_color_suffix}\n"
user_IP=""
echo -e "当前模式: ${Green_background_prefix} "${now_mode}" ${Font_color_suffix} 链接IP总数: ${Green_background_prefix} "${IP_total}" ${Font_color_suffix}"
echo -e "${user_list_all}"
