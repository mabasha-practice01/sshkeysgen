echo "Creating the repo"
echo "please enter the PAT"
read token

curl \
    -X POST \
    -u mabashagithub:$token \
    https://api.github.com/orgs/mabasha-practice01/repos \
    -d '{"name":"practice","private":true,"description":"this is a new repository"}'