#/bin/sh
/sbin/ifconfig eth0:0 192.168.0.222 netmask 255.255.255.0 up
/sbin/ifconfig eth0:1 192.168.1.222 netmask 255.255.255.0 up
/sbin/ifconfig eth0:2 10.10.0.222 netmask 255.255.0.0 up  

echo 0 > /sys/class/leds/green_led/brightness
until wget -S --spider http://localhost:8080 2>&1 | grep -q 'HTTP/1.1 200 OK'; do
sleep 1
echo 0 > /sys/class/leds/green_led/brightness
done
echo 255 > /sys/class/leds/green_led/brightness
echo "OK"
