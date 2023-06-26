#!/bin/bash

iptablesCmd=$(which iptables) # Put iptables path to variable
LAN="eth0"
WAN="eth1"

$iptablesCmd -F # Flushing filter table
$iptablesCmd -t nat -F # Flushing nat table
$iptablesCmd -t mangle -F # Flushing mangle table
$iptablesCmd -X # Delete user defined chains
$iptablesCmd -t nat -X #
$iptablesCmd -t mangle -X #
$iptablesCmd -Z # Resetting iptables counters

sysctl -w net.ipv4.ip_forward=1 # Allow forward

$iptablesCmd -P INPUT DROP # Block incoming traffic
$iptablesCmd -P OUTPUT DROP #
$iptablesCmd -P FORWARD DROP #

$iptablesCmd -A INPUT -i lo -j ACCEPT #
$iptablesCmd -A INPUT -i "$LAN" -j ACCEPT #
$iptablesCmd -A OUTPUT -o lo -j ACCEPT #
$iptablesCmd -A OUTPUT -o "$LAN" -j ACCEPT #

$iptablesCmd -A OUTPUT -o "$WAN" -j ACCEPT #

$iptablesCmd -A INPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptablesCmd -A OUTPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptablesCmd -A FORWARD -p all -m state --state ESTABLISHED,RELATED -j ACCEPT

$iptablesCmd -A FORWARD -i "$LAN" -o "$WAN" -j ACCEPT
$iptablesCmd -A FORWARD -i "$WAN" -o "$LAN" -j REJECT
$iptablesCmd -t nat -A POSTROUTING -o "$WAN" -j MASQUERADE

$iptablesCmd -A INPUT -i "$WAN" -p tcp --dport 22 -j ACCEPT # Allow SSH