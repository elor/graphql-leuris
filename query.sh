#!/bin/bash

URL='https://fob.uni-leipzig.de/anchorwheel/api'

function myquery(){
	id=$1
  QUERY='{ "query": "query { publication(id: '$id') { title } }" }'
curl "$URL" -H 'Content-Type: application/json' --data "$QUERY" --request POST
}

echo '['
for i in {1..10}; do
	myquery $i
	echo
done
echo ']'
