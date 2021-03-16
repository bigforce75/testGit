#!/usr/bin/env bash

echo -e "\033[33m                          _ _               \033[0m"
echo -e "\033[33m    _ __ ___   ___  _ __ (_) |_ ___  _ __   \033[0m"
echo -e "\033[33m   | '_ \ _ \ / _ \| '_ \| | __/ _ \| '__|  \033[0m"
echo -e "\033[33m   | | | | | | (_) | | | | | || (_) | |     \033[0m"
echo -e "\033[33m   |_| |_| |_|\___/|_| |_|_|\__\___/|_|     \033[0m"
echo -e "\033[33m                                                          _     \033[0m"
echo -e "\033[33m          ___ ___  _ __ ___  _ __   ___  _ __   ___ _ __ | |_   \033[0m"
echo -e "\033[33m         / __/ _ \| '_ \ _ \| '_ \ / _ \| '_ \ / _ \ '_ \| __|  \033[0m"
echo -e "\033[33m        | (_| (_) | | | | | | |_) | (_) | | | |  __/ | | | |_   \033[0m"
echo -e "\033[33m         \___\___/|_| |_| |_| .__/ \___/|_| |_|\___|_| |_|\__|  \033[0m"
echo -e "\033[33m                            |_|                                 \033[0m"


function menu()
{
 	echo -e "Usage:  run.sh [OPTIONS]
	Options:
	\tstart                   start prometheus & grafana service
	\tstop                    stop prometheus & grafana service
	\tredeploy                restart prometheus & grafana service
	\treload                  reload prometheus.yml
	\tstatus                  print status
  --help|-h                 print usage\n"

	exit
}


# _main_
if [ -z "$1" ]; then
	menu
fi


case $1 in

	start)
		sh prom_shell.sh start
        sh graf_shell.sh start
        ;;

	stop)
		sh prom_shell.sh stop
        sh graf_shell.sh stop
        ;;

	redeploy)
		sh prom_shell.sh redeploy
		sleep 1
        sh graf_shell.sh redeploy
        ;;

	reload)
	    sh prom_shell reload
		;;

	status)
	    sh prom_shell.sh check
        sh graf_shell.sh check
	    ;;

	-h|--help)
		menu
        ;;

	*)
	    echo -e "try './run.sh --help' or './run.sh -h' for more information"
		;;
esac
