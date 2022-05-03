#!/bin/bash
sfmlg++(){

    if [[ $# -eq 0 ]]
    then 
        echo "invalid input: no arguments"
        exit 1
    fi

    for file in ${@:1:$# -1}
    do 
        if [[ ${#file} -lt 5 ]]
        then
            echo "invalid input: $file is not a cpp file"
            exit 1
        fi

        if [[ ${file: -4} != ".cpp" ]]
        then
            echo "invalid input: $file is not a cpp file"
            exit 1
        fi
    done

    last_element=${@: -1}

    if [[ ${#last_element} -lt 5 ]] || [[ ${last_element: -4} != ".cpp" ]] 
    then
        if [[ $# -eq 1 ]] 
        then
            echo "invalid input: no cpp file given"
            exit 1
        fi
        g++ -Wall -Wextra -fsanitize=address ${@:1:$# -1} -o ${last_element} -lsfml-graphics -lsfml-window -lsfml-system
    else
        g++ -Wall -Wextra -fsanitize=address $@ -o a.out -lsfml-graphics -lsfml-window -lsfml-system
    fi
    exit 0

}
sfmlg++ $@