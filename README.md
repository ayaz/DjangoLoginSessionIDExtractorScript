DjangoLoginSessionIDExtractorScript
===================================

This is a quick shell script I threw together to extract the SESSION ID that is generated as a result of logging into a Django-based login view. This SESSION ID can then be used, for example, to access login protected pages via automated scripts and tools, such as Apace Benchmark. 

Example
-------

> $ chmod u+x get_session.sh
> $ SESSION_ID=$(get_session.sh "/login/" "USERNAME" "PASSWORD")
> $ echo ab -n 2000 -c 10 -C sessionid=${SESSIONID} http://localhost:8000/
