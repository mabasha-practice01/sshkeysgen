echo "deleting repo"
echo "please enter token"
read token
curl \
    -X DELETE \
    -u mabashagithub:$token \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/mabasha-practice01/prcactice

