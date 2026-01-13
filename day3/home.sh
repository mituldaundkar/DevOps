#!/bin/bash
        apt update -y
        apt install apache2 -y
        systemctl start apache2
        echo "<h1>Hello World" > /var/www/html/index.html