#! /bin/bash

function datestamp () {
    echo `date +"%F_%T"`
}

function logging  () {
    echo "#### DATE: `datestamp` UNAME: `uname` $1"
}
   
