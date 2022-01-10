#!/bin/bash
# This script update the token in the git  repository url
# Can be executed with 
# $ bash <script_name>
# or
# $ ./<script_name> (the file must be executable)
#
# References about bash
# 	https://stackoverflow.com/questions/7507038/semicolons-superfluous-at-the-end-of-a-line-in-shell-scripts
# 	https://unix.stackexchange.com/questions/5778/whats-the-difference-between-stuff-and-stuff
# About string substitution
# 	https://unix.stackexchange.com/questions/88480/bash-var-search-replace-and-weird-regex-behaviour
# About arguments
# 	https://tldp.org/LDP/abs/html/internalvariables.html#ARGLIST
# 	https://www.commentcamarche.net/faq/5444-bash-les-arguments-parametres
# 	https://stackoverflow.com/questions/4423306/how-do-i-find-the-number-of-arguments-passed-to-a-bash-script
# How to execute
# 	https://stackoverflow.com/questions/3401183/bash-syntax-error-not-found
#
#


# Where the script was launch from ?
#echo "Script launch from \t"`pwd`

# Where is the script located ?
#echo "Script located in \t$(dirname "$(readlink -f "$0")")"

if [ "$#" -ne 1 ]; then
	echo "New token must passed as paramter"
	exit
fi

# Quit if I'm not in a git repository
GIT_STATUS=$(git status 2>&1)
if [[ $GIT_STATUS =~ "fatal: not a git repository" ]] ; then 
	echo "Script must be executed into a git repository" 
	exit
fi


GIT_REMOTE_URL=$(git remote get-url origin)
echo -e "Current url is \t\t\t\t$GIT_REMOTE_URL"

# The token
echo -e "This token will replace the former one\t$1"


# https://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@github.com/syncrase/coffres.git

loop=
while :; do
  case $GIT_REMOTE_URL in (*//*@*) 
  	loop=$loop${GIT_REMOTE_URL%%//*}//$1@;GIT_REMOTE_URL=${GIT_REMOTE_URL#*@};;
    (*) break;;
  esac
done
loop=$loop$GIT_REMOTE_URL
printf '%s\n' "$loop"

# Check if the push works with this new token and revert if it's not
git remote set-url origin $loop




# TODO Vérifier le résultat (si prompt pour username ou pas)
#GIT_REMOTE_URL="https://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@github.com/syncrase/coffres.git"
#git remote set-url origin $GIT_REMOTE_URL
#CHECK=$(echo "Y\n" | git push)
#CHECK=$(printf "Y\n" | git push)
#CHECK=$(git push < echo "y\n")

#CHECK=$(yes "Y\n" | git push)
#git push <<< "foo"
#git push <<STDIN "foo"
#git push  < <(echo -ne '\n')
#echo -ne '\n' | git push
#yes '\n' | git push
#echo -e foo\n
# https://stackoverflow.com/questions/6541109/send-string-to-stdin
#cat <(echo "selection here") | git push
# https://www.baeldung.com/linux/simulate-enter-keypress-bash
#PUSH_RESULT=$(git push <<END "foo")

#(sleep 3; echo; sleep 5) | git push
#(sleep 3; echo; sleep 5) | git push


#if git push
#then
#  echo "git push succeeded"
#else
#  echo "git push failed"
#fi

#echo $CHECK