echo "enter the git hub personal account token"
read token
cat ~/.ssh/id_rsa.pub
if condition to validate weather ssh keys are already present or not
if [ $? -eq 0 ]
then
echo "ssh keys are already present.."
else
echo "ssh keys are not present.. create ssh keys using ssh-keygen command"
ssh-keygen -t rsa
echo "sshkeys are successfully generated"
fi

sshkey=`cat ~/.ssh/id_rsa.pub`

if [ $? -eq 0 ]
then
echo "copying th ekey into github account"
curl -X POST -H "Content-type: application/json" -d "{\"title\": \"SSHKEY\",\"KEY\": \"$sshkey\"}"
"https://api.github.com/user/keys?access_token=$token"
curl -X POST -H "Content-type: application\json" -u mabashagithub:$token -d "{\"title\": \"SSHKEYTEST\"}" "http://api.github.com/user/keys?access_token=$token"
if [ $? -eq 0 ]
then
echo "succesfully copied the token into to github"
exit 0
else
echo "FAILED"
exit 1
fi
else
echo "Failure in generating the key"
exit 1
fi