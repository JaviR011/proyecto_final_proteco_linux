#!/bin/bash
# Overwrite the exit command
exit() {
    :
}
# Overwrite the default trap for SIGTSTP, SIGINT and SIGTERM
trap ' ' SIGTSTP SIGINT SIGTERM
while true
do
    # Get current directory, and replace home directory with ~
    DIR=$( basename "$PWD" | sed "s|$HOME|~|" )
    
    # Show prompt with colors and read input
    printf "\e[35m|| <<\e[1m\e[45m$USER\e[0m\e[35m>> (\e[36m$DIR\e[35m) ||: \e[0m"
    read input

    # If input is "salir", exit the loop
    if [ "$input" == "salir" ]; then
        break
    fi
    $input
done

# Return to the default trap for SIGTSTP, SIGINT and SIGTERM
trap - SIGTSTP SIGINT SIGTERM