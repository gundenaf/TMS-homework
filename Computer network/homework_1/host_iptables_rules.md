```bash
[vagrant@centos8 scripts]$ sudo iptables -L -n -v
Chain INPUT (policy DROP 1 packets, 40 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    4   448 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0           
  289 16609 ACCEPT     all  --  eth0   *       0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0            tcp dpt:22

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0           
   22  1480 REJECT     all  --  eth1   eth0    0.0.0.0/0            0.0.0.0/0            reject-with icmp-port-unreachable

Chain OUTPUT (policy DROP 1 packets, 92 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    4   448 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0           
  165 13360 ACCEPT     all  --  *      eth0    0.0.0.0/0            0.0.0.0/0           
   19  1816 ACCEPT     all  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
```