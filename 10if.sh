#!/bin/bash
read -p "Enter a number: " num
echo

if [[ -z "$num" || ! "$num" =~ ^-?[0-9]+$ ]]; then
	    echo "Invalid input. Please enter a number."
	        exit 1
fi

if [[ $num -gt 100 ]]; then
	    echo "We have entered the if block"
	        sleep 3
		    echo "Your number is greater than 100"
		        echo
			    date
		    else
			        echo "Your number is less than or equal to 100"
fi

echo "Script execution success"
