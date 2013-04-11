!/bin/bash
if [ "$1" == "-h" ]
then
    echo "Usage: $0 BASE_URL USERNAME PASSWORD";
    exit -1;
fi

[[ -z $1 ]] && BASE_URL='http://localhost:8000/' || BASE_URL=$1
[[ -z $2 ]] && USERNAME='test' || USERNAME=$2
[[ -z $3 ]] && PASSWORD='test' || PASSWORD=$3

COOKIE_FILE=/tmp/cookie_jar.txt
LOGIN_URL=${BASE_URL}login/

CURL_DATA=$(curl -s -c $COOKIE_FILE $LOGIN_URL | grep -o "name=['\"]csrfmiddlewaretoken['\"] value=['\"][^'\"]*" | sed -e "s/name='//" -e "s/' value='/=/")\&username=$USERNAME\&password=$PASSWORD

curl -b $COOKIE_FILE -c $COOKIE_FILE -d $CURL_DATA -X POST -H 'Content-Type:application/x-www-form-urlencoded' $LOGIN_URL

SESSIONID=$(grep -E 'sessionid\s*(.+)' $COOKIE_FILE  -o | awk '{print $2}')

