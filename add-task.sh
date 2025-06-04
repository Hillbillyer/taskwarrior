#!/bin/bash

#User adds the Task
read -p "Task... " task

#User adds the Due Date (If Relevant)
read -p "Due... " due

#User adds the Priority (If Relevant)
read -p "Priority... " pri

#User adds the Project (If Relevant)
read -p "Project... " pro

task add "$task" due:"$due" priority:"$pri" project:"$pro" 