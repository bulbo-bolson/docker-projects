#!/bin/bash

cat people.txt | nl | while read line; do
    id=$(echo $line | awk '{print $1}')
    name=$(echo $line | awk '{print $2}' | awk -F',' '{print $1}')
    apellido=$(echo $line | awk '{print $2}' | awk -F',' '{print $2}')
    edad=$(shuf -i 20-25 -n1)

    mysql -u root -p1234 people -e "insert into registro values ($id, '$name', '$apellido', $edad)"
    echo "$id, $name, $apellido, $edad se importaron correctamente"
done
