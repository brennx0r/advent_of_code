#! /usr/bin/env bash

if [ $1 == "--help" ]; then
    echo "NAME"
    echo "       genesis.sh - creates 'seed' folders and files to assist in working through the days in Advent of Code."
    echo ""
    echo ""
    echo "SYNOPSIS"
    echo '      genesis.sh [$1]'
    echo ""
    echo '       $1 - a number expressing the day you would like to generate. This will create a numbered folder, with seed ruby and txt files underneath.'
    exit 0
fi

day=$1
year='2022'

mkdir ${year}/${day}
touch ${year}/${day}/test_data.txt
touch ${year}/${day}/test_data_sample.txt
cp sample.rb ${year}/${day}/${day}.rb