```bash
ip route show
default via 192.168.56.101 dev enp0s8
10.0.2.0/24 dev enp0s3 proto kernel scope link src 10.0.2.15 metric 100
10.0.2.2 dev enp0s3 proto dhcp scope link src 10.0.2.15 metric 100
10.0.2.3 dev enp0s3 proto dhcp scope link src 10.0.2.15 metric 100
192.168.56.0/24 dev enp0s8 proto kernel scope link src 192.168.56.102 

traceroute 8.8.8.8
traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets
1  _gateway (192.168.56.101)  0.674 ms  0.610 ms  0.585 ms
2  _gateway (192.168.56.101)  0.665 ms  0.863 ms  0.770 ms
```
