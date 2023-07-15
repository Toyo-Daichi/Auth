#!/bin/bash

CMD="drakov"
FILE="../docs/api"

${CMD} -f ${FILE}.md -p 8081 --watch 

echo "Normal END"
exit
