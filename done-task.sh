#!/bin/bash

#Lists the current tasks
task list

#Asks the user for the task they would like to complete
read -p "Task... " task

task done "$task"