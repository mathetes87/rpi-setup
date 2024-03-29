#!/bin/sh

####################################################################################################################################
# FROM:
# https://gist.githubusercontent.com/pjobson/f749e6654e5432c2f3a73fc421bc4a6b/raw/5099f76697a48ad9185fc5dc7fc0e7b6ed85fd21/deluge.sh
####################################################################################################################################

### BEGIN INIT INFO
# Provides:          deluged
# Required-Start:    $network $remote_fs $syslog
# Required-Stop:     $network $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start deluged at boot time
# Description:       Start DelugeD and Deluge-Web.
### END INIT INFO

#Author              QuidsUp
#Last Modified	     26 Jan 2013

#Required -- To be changed!
USER=mathetes        #Set Username here.
PORT=8112            #Set port number for web interface (default 8112)
PIDFileDeluge=/var/run/deluged.pid
PIDFileWeb=/var/run/deluge-web.pid

case "$1" in
  start)
    echo "Starting Deluge"
    start-stop-daemon --start --chuid $USER --name deluged --pidfile $PIDFileDeluge \
     --background --make-pidfile --exec /usr/bin/deluged -- -d
    start-stop-daemon --start --chuid $USER --name deluge-web --pidfile $PIDFileWeb \
     --background --make-pidfile --exec /usr/bin/deluge-web -- --port $PORT
  ;;

  stop)
    echo "Stopping Deluge"
    start-stop-daemon --stop --chuid $USER --name deluged --pidfile $PIDFileDeluge
    start-stop-daemon --stop --chuid $USER --name deluge-web --pidfile $PIDFileWeb
  ;;

  restart|force-reload)
    echo "Stopping Deluge for Restart"
    start-stop-daemon --stop --chuid $USER --name deluged --pidfile $PIDFileDeluge
    start-stop-daemon --stop --chuid $USER --name deluge-web --pidfile $PIDFileWeb
    sleep 5s
    echo "Restarting Deluge"
    start-stop-daemon --start --chuid $USER --name deluged --pidfile $PIDFileDeluge \
      --background --make-pidfile --exec /usr/bin/deluged -- --do-not-daemonize
    start-stop-daemon --start --chuid $USER --name deluge-web --pidfile $PIDFileWeb \
      --background --make-pidfile --exec /usr/bin/deluge-web -- --port $PORT
  ;;
  status)
    echo "Checking Status of Deluge"
    if (test -f $PIDFileDeluge); then
      PIDVal=$(head -1 $PIDFileDeluge)
      if [ -e /proc/$PIDVal ]; then
        echo -n "DelugeD Running on Process ID: "
        echo $PIDVal
        echo
        ps -H $PIDVal
      else
        echo "DelugeD Not Running but PID File Exists"
        exit 1
      fi
    else
      echo "No PID File found for DelugeD"
    fi
  ;;
  *)
     echo "Usage: deluge {start|stop|restart|force-reload|status}" >&2
     exit 1
  ;;
esac

exit 0