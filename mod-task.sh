#!/bin/bash

#Lists the current tasks
task list

#Asks the user for the task they would like to modify
read -p "Task... " task

#Asks the user for the modifications they would like to make
read -p "Mods... " mod

task modify "$task" $mod