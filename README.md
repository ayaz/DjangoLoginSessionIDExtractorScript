DjangoLoginSessionIDExtractorScript
===================================

This is a quick shell script I threw together to extract the SESSION ID that is generated as a result of logging into a Django-based login view. This SESSION ID can then be used, for example, to access login protected pages via automated scripts and tools, such as Apace Benchmark. 

Example
-------

In this example, the SESSION_ID is retrieved from the script and stored in an env variable. The SESSION_ID is then used with Apache Benchmark tool to benchmark a URL that is login-protected. 

    $ chmod u+x get_session.sh
    $ SESSION_ID=$(get_session.sh "/login/" "USERNAME" "PASSWORD")
    $ echo ab -n 2000 -c 10 -C sessionid=${SESSIONID} http://localhost:8000/account/dashboard/
