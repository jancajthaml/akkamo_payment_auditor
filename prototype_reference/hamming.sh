#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: \"sh $0 <string1> <string2>\""
  exit 1
fi

leftLen=${#1}
rightLen=${#2}

if [ $leftLen -gt $rightLen ]; then
  pad=$(head -c $(($leftLen - $rightLen)) < /dev/zero | tr '\0' ' ')
  left="${2}${pad}"
  right="${1}"
elif [ $leftLen -lt $rightLen ]; then
  pad=$(head -c $(($rightLen - $leftLen)) < /dev/zero | tr '\0' ' ')
  left="${1}${pad}"
  right="${2}"
else
  left="${1}"
  right="${2}"
fi

distance=0

for ((i=0; i<${#left}; i++)); do
  [[ "${left:i:1}" == "${right:i:1}" ]] || let "distance++"
done

echo "${distance}"