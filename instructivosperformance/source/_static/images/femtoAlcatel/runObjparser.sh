#!/bin/bash

FILE=`find $3 -name UTRAN-*.xml`
java -jar $1 $2 $FILE
