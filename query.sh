#!/bin/bash

URL='https://fob.uni-leipzig.de/anchorwheel/api'

function myquery(){
	id=$1
  QUERY='{ "query": "query { publication(id: '$id') { title } }" }'
curl "$URL" -H 'Content-Type: application/json' --data "$QUERY" --request POST
}

is_first=true

echo '['
for i in {1..10}; do
	if $is_first; then
		is_first=false
	else
		echo ','
	fi
	myquery "$i"
	echo
done
echo ']'
