#!/bin/bash

#Asks the user for the task they would like to add
read -p "Task... " task

#Asks the user for additional info, e.g. priority
read -p "Mods... " mod

task add "$task" $mod