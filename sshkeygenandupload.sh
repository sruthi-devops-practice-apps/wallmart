#!/bin/bash
#title:
#description:
#author:
#date:
#version:
#usage:

echo " ENter your github Personal Access Tokem:"
read token

cat ~/.ssh/id_rsa_pub


if [ $? -eq 0 ]
then
	echo "SSH keys are already present ...."
else
	echo " SSH keys are not present..., Create the sshkeys using ssh-keygen command"
ssh-keygen -t rsa
echo "SSH Keys successfully generated"
fi

sshkey='cat ~/.ssh/id_rsa.pub'

if [ $? -eq 0 ]
then
	echo " Cpying the key to Github account"
curl -X POST -H " COntent-type: aaplication/json" -d "{\"title\": \"SSHKEY\",\"key\": \"$sshkey\"}" "https://api.github.com/user/keys?access_token=$token"
#Checking if above command is successful 
if [ $? -eq 0 ]
then
	echo " Successfully copied the token to Github"
exit 0
else 
	echo " Failed"
exit 1
fi
else 
echo" Failure in generating the key"
exit 1
fi
