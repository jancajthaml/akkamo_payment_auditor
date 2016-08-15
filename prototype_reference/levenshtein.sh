#!/bin/bash

if [ "$#" -ne "2" ]; then
  echo "Usage: \"sh $0 <string1> <string2>\""
  exit 1
fi

if [ "${#1}" -lt "${#2}" ]; then
  left="${2}"
  right="${1}"
else
  left="${1}"
  right="${2}"
fi

/usr/bin/awk -f levenshtein_distance.awk "$left" "$right"