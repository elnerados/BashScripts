#!/bin/bash

LOG_FILE="$HOME/Desktop/Projects/DevopsPrep/lab03-bash/access.log"

REQ_200=$(awk '$3 == 200' "$LOG_FILE" | wc -l)
REQ_500=$(awk '$3 == 500' "$LOG_FILE" | wc -l)
MOST_USED_EP=$(awk '{print $5}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1)

cat <<EOF
Number of req 200: ${REQ_200}
Number of req 500: ${REQ_500}
Most used EP: ${MOST_USED_EP}
EOF
