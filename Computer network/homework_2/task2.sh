#!/bin/bash

network_interface="enx00e04c680a51"
ip_address=$(ifconfig "$network_interface"| awk '{print $2}' | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
echo "IP address: $ip_address"

subnet_mask=$(ifconfig "$network_interface"| grep -w inet |grep -v 127.0.0.1| awk '{print $4}' | cut -d ":" -f 2)
echo "Subnet mask: $subnet_mask"

binary_ip_address=$(for i in $(echo ${ip_address} | tr '.' ' '); do echo "obase=2 ; $i" | bc; done | awk '{printf ".%08d", $1}' | cut -c2-)
echo "Binary IP address: $binary_ip_address"

binary_subnet_mask=$(for i in $(echo ${subnet_mask} | tr '.' ' '); do echo "obase=2 ; $i" | bc; done | awk '{printf ".%08d", $1}' | cut -c2-)
echo "Binary subnet mask: $binary_subnet_mask"

# determine subnet class by IP
if [ "${ip_address%%.*}" -gt 0 ] && [ "${ip_address%%.*}" -le 126 ]
then
    echo "IP address belongs to Class A"
elif [ "${ip_address%%.*}" -ge 128 ] && [ "${ip_address%%.*}" -le 191 ]
then
    echo "IP address belongs to Class B"
elif [ "${ip_address%%.*}" -ge 192 ] && [ "${ip_address%%.*}" -le 223 ]
then
    echo "IP address belongs to Class C"
elif [ "${ip_address%%.*}" -ge 224 ] && [ "${ip_address%%.*}" -le 239 ]
then
    echo "IP address belongs to Class D"
elif [ "${ip_address%%.*}" -ge 240 ] && [ "${ip_address%%.*}" -le 255 ]
then
    echo "IP address belongs to Class E"
else
    echo "Something went wrong and I'm not able to use exceptions now."
fi

# determine subnet class by IP (binary)
if [ "${binary_ip_address%%.*}" -gt 00000001 ] && [ "${binary_ip_address%%.*}" -le 01111111 ]
then
    echo "IP address in binary code belongs to Class A"
elif [ "${binary_ip_address%%.*}" -ge 10000000 ] && [ "${binary_ip_address%%.*}" -le 10111111 ]
then
    echo "IP address in binary code belongs to Class B"
elif [ "${binary_ip_address%%.*}" -ge 11000000 ] && [ "${binary_ip_address%%.*}" -le 11011111 ]
then
    echo "IP address in binary code to Class C"
elif [ "${binary_ip_address%%.*}" -ge 11100000 ] && [ "${binary_ip_address%%.*}" -le 11101111 ]
then
    echo "IP address in binary code to Class D"
elif [ "${binary_ip_address%%.*}" -ge 11110000 ] && [ "${binary_ip_address%%.*}" -le 11111111 ]
then
    echo "IP address in binary code belongs to Class E"
else
    echo "Something went wrong and I'm not able to use exceptions now."
fi

# determine subnet class by mask
if [ "${subnet_mask}" == "255.0.0.0" ]
then
    echo "Subnet mask belongs to Class A"
elif [ "${subnet_mask}" == "255.255.0.0" ]
then
    echo "Subnet mask belongs to Class B"
elif [ "${subnet_mask}" == "255.255.255.0" ]
then
    echo "Subnet mask belongs to Class C"
else
    echo "Something went wrong and I'm not able to use exceptions now."
fi

IFS=. read -r ip1 ip2 ip3 ip4 <<< "$binary_ip_address"
IFS=. read -r mask1 mask2 mask3 mask4 <<< "$binary_subnet_mask"
subnet_address=$(printf "%d.%d.%d.%d\n" "$((ip1 & mask1))" "$((ip2 & mask2))" "$((ip3 & mask3))" "$((ip4 & mask4))")
echo "Subnet address in binary code is: $subnet_address"

IFS=. read -r ip1 ip2 ip3 ip4 <<< "$ip_address"
IFS=. read -r mask1 mask2 mask3 mask4 <<< "$subnet_mask"
subnet_address=$(printf "%d.%d.%d.%d\n" "$((ip1 & mask1))" "$((ip2 & mask2))" "$((ip3 & mask3))" "$((ip4 & mask4))")
echo "Subnet address is: $subnet_address"