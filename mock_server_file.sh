#!/bin/bash

touch ./mock_server_file

for i in {1..255}; do
    echo 192.168.0.$i >> ./mock_server_file
done





