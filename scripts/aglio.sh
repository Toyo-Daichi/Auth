#!/bin/bash

CMD="aglio"
FILE="../docs/api"

${CMD} -i ${FILE}.md -o ${FILE}.html --theme-variables slate 

echo "Normal END"
exit
