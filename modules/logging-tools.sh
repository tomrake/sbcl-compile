#! /bin/bash

function datestamp () {
    echo `date +"%F-%H_%M_%S"`
}

function logging  () {
    echo "#### DATE: `datestamp` UNAME: `uname` $1"
}
   
