### IP: 192.168.200.139
### ORIGINAL MASK: 255.255.255.0
### EVENTUAL MASK: 255.255.255.224

### **Find:**

+ number of bits in subnet
+ number of created subnets
+ number of bits of hosts in subnet
+ number of hosts in subnet
+ network address of subnet
+ IPv4 address of first host in subnet
+ IPv4 address of last host in subnet
+ broadcast IPv4 address in subnet

Original mask is 255.255.255.0 (or /24) and eventual mask is 255.255.255.224 (or /27), so the variance is 3 bits.
Because 3 bits were borrowed, we can determine that were created 8 subnets. In new mask (255.255.255.224 or /27) remains only 255-2=253 hosts.

AND operator could help determine subnet: 192.168.200.0

number of hosts: 253
network address of subnet: 192.168.200.0
first host IP: 192.168.200.1
last host IP: 192.168.200.158
Broadcast: 192.168.200.159
