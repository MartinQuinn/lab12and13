#!/bin/bash

function press_enter {
	printf "\n"
	printf "Press Enter to continue..."
	read
	clear
}

selection=
until [ "$selection" = "0" ]; do
	printf "\nSelect from the menu: \n\n" 
	printf "  1) Get Keys\n"
	printf "  2) List Queues\n"
	printf "  3) Create Queue\n"
	printf "  4) Delete a Queue\n"
	printf "  5) Get count from queue\n"
	printf "  6) Write message to queue\n"
	printf "  7) Get message from queue\n"
	printf "  8) Delete message from queue\n"
	printf " \n 0) Exit\n"

	printf "\nSelection: "
	read selection

	case $selection in
		1  ) 	curl -s -X GET localhost:8088/version 
			press_enter
			;;
		2  )   	curl -s -X GET -H 'Accept: application /json' http://localhost:8088/queues | python -mjson.tool
			press_enter
			;;
		3  ) 	curl -X POST -H 'Content-Type: application/json' http://localhost:8088/queues -d '{"name": "MartinLab12"}'
			press_enter
			;;
		4  ) 	curl -X DELETE -H 'Accept: application/json' http://localhost:8088/queues/MartinLab12
			press_enter
			;;
		5  ) 	curl -X GET -H 'Accept: application/json' http://localhost:8088/queues/MartinLab12/msgs/count
			press_enter
			;;
		6  ) 	curl -s -X POST -H 'Accept: application/json' http://localhost:8088/queues/MartinLab12/msgs -d '{"content": "this is the queue message"}' 
			press_enter
			;;
		7  ) 	curl -X GET -H 'Accept: application/json' http://localhost:8088/queues/MartinLab12/msgs
			press_enter
			;;
		8  )	curl -X DELETE -H 'Accept: application/json' http://localhost:8088/queues/MartinLab12/msgs
			press_enter
			;;
		0) exit
			;;
		* ) printf "You did not choose a valid option!\n"
	esac
done

printf "\n"
