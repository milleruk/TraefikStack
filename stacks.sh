#!/bin/bash

for file in $PWD/stacks/*.yml; do
  filename=$(basename -- "$file")
  name="${filename%.*}"
  docker-compose -p "$name" -f stacks/$filename up -d
done