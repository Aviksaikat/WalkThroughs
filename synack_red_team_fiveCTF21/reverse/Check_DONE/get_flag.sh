#!/bin/bash


echo 'ch3ck_anD_r3checK_aga1n!' | ./check | grep "HTB{.*}" | awk '{print $10}'