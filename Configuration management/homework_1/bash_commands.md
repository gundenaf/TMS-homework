```bash
ansible@ansible-master:~$ sudo apt update
Hit:1 http://packages.microsoft.com/repos/code stable InRelease
Hit:2 http://deb.debian.org/debian bookworm InRelease                                                                                                               
Hit:3 http://security.debian.org/debian-security bookworm-security InRelease                                                                                                               Hit:4 http://deb.debian.org/debian bookworm-updates InRelease                                                                                         
Hit:5 http://deb.debian.org/debian bookworm-backports InRelease                                                
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
ansible@ansible-master:~$ sudo apt install -y ansible
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  ansible-core ieee-data python-babel-localedata python3-anyio python3-argcomplete python3-babel python3-dnspython python3-h11 python3-h2 python3-hpack
  python3-httpcore python3-httpx python3-hyperframe python3-jinja2 python3-jmespath python3-kerberos python3-libcloud python3-lockfile python3-markdown-it
  python3-mdurl python3-netaddr python3-ntlm-auth python3-packaging python3-pycryptodome python3-pygments python3-requests-kerberos python3-requests-ntlm
  python3-requests-toolbelt python3-resolvelib python3-rfc3986 python3-rich python3-selinux python3-simplejson python3-sniffio python3-tz python3-winrm
  python3-xmltodict python3-yaml
Suggested packages:
  cowsay python3-trio python3-aioquic python-jinja2-doc python-lockfile-doc ipython3 python-netaddr-docs python-pygments-doc ttf-bitstream-vera
The following NEW packages will be installed:
  ansible ansible-core ieee-data python-babel-localedata python3-anyio python3-argcomplete python3-babel python3-dnspython python3-h11 python3-h2 python3-hpack
  python3-httpcore python3-httpx python3-hyperframe python3-jinja2 python3-jmespath python3-kerberos python3-libcloud python3-lockfile python3-markdown-it
  python3-mdurl python3-netaddr python3-ntlm-auth python3-packaging python3-pycryptodome python3-pygments python3-requests-kerberos python3-requests-ntlm
  python3-requests-toolbelt python3-resolvelib python3-rfc3986 python3-rich python3-selinux python3-simplejson python3-sniffio python3-tz python3-winrm
  python3-xmltodict python3-yaml
0 upgraded, 39 newly installed, 0 to remove and 0 not upgraded.
Need to get 29.7 MB of archives.
After this operation, 286 MB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bookworm/main amd64 python3-jinja2 all 3.1.2-1 [119 kB]
Get:2 http://deb.debian.org/debian bookworm/main amd64 python3-packaging all 23.0-1 [32.5 kB]
Get:3 http://deb.debian.org/debian bookworm/main amd64 python3-resolvelib all 0.9.0-2 [27.3 kB]
Get:4 http://deb.debian.org/debian bookworm/main amd64 python3-yaml amd64 6.0-3+b2 [119 kB]
Get:5 http://deb.debian.org/debian bookworm/main amd64 python3-pycryptodome amd64 3.11.0+dfsg1-4 [1,011 kB]
Get:6 http://deb.debian.org/debian bookworm/main amd64 python3-dnspython all 2.3.0-1 [152 kB]
Get:7 http://deb.debian.org/debian bookworm/main amd64 ieee-data all 20220827.1 [2,029 kB]
Get:8 http://deb.debian.org/debian bookworm/main amd64 python3-netaddr all 0.8.0-2 [295 kB]
Get:9 http://deb.debian.org/debian bookworm/main amd64 ansible-core all 2.14.3-1 [1,273 kB]
Get:10 http://deb.debian.org/debian bookworm/main amd64 ansible all 7.3.0+dfsg-1 [16.3 MB]
Get:11 http://deb.debian.org/debian bookworm/main amd64 python-babel-localedata all 2.10.3-1 [5,615 kB]
Get:12 http://deb.debian.org/debian bookworm/main amd64 python3-sniffio all 1.2.0-1 [6,372 B]
Get:13 http://deb.debian.org/debian bookworm/main amd64 python3-anyio all 3.6.2-1 [54.0 kB]
Get:14 http://deb.debian.org/debian bookworm/main amd64 python3-argcomplete all 2.0.0-1 [34.7 kB]
Get:15 http://deb.debian.org/debian bookworm/main amd64 python3-tz all 2022.7.1-4 [30.1 kB]
Get:16 http://deb.debian.org/debian bookworm/main amd64 python3-babel all 2.10.3-1 [103 kB]
Get:17 http://deb.debian.org/debian bookworm/main amd64 python3-h11 all 0.14.0-1 [50.1 kB]
Get:18 http://deb.debian.org/debian bookworm/main amd64 python3-hpack all 4.0.0-2 [25.0 kB]
Get:19 http://deb.debian.org/debian bookworm/main amd64 python3-hyperframe all 6.0.0-1 [14.5 kB]
Get:20 http://deb.debian.org/debian bookworm/main amd64 python3-h2 all 4.1.0-4 [80.8 kB]
Get:21 http://deb.debian.org/debian bookworm/main amd64 python3-httpcore all 0.16.3-1 [38.4 kB]
Get:22 http://deb.debian.org/debian bookworm/main amd64 python3-pygments all 2.14.0+dfsg-1 [783 kB]
Get:23 http://deb.debian.org/debian bookworm/main amd64 python3-mdurl all 0.1.2-1 [9,444 B]
Get:24 http://deb.debian.org/debian bookworm/main amd64 python3-markdown-it all 2.1.0-5 [58.8 kB]
Get:25 http://deb.debian.org/debian bookworm/main amd64 python3-rich all 13.3.1-1 [202 kB]
Get:26 http://deb.debian.org/debian bookworm/main amd64 python3-rfc3986 all 1.5.0-2 [22.2 kB]
Get:27 http://deb.debian.org/debian bookworm/main amd64 python3-httpx all 0.23.3-1 [72.3 kB]
Get:28 http://deb.debian.org/debian bookworm/main amd64 python3-jmespath all 1.0.1-1 [21.1 kB]
Get:29 http://deb.debian.org/debian bookworm/main amd64 python3-kerberos amd64 1.1.14-3.1+b7 [21.5 kB]
Get:30 http://deb.debian.org/debian bookworm/main amd64 python3-lockfile all 1:0.12.2-2.2 [17.3 kB]
Get:31 http://deb.debian.org/debian bookworm/main amd64 python3-simplejson amd64 3.18.3-1 [59.8 kB]
Get:32 http://deb.debian.org/debian bookworm/main amd64 python3-libcloud all 3.4.1-5 [808 kB]
Get:33 http://deb.debian.org/debian bookworm/main amd64 python3-ntlm-auth all 1.4.0-2 [21.9 kB]
Get:34 http://deb.debian.org/debian bookworm/main amd64 python3-requests-kerberos all 0.12.0-2 [13.0 kB]
Get:35 http://deb.debian.org/debian bookworm/main amd64 python3-requests-ntlm all 1.1.0-3 [6,268 B]
Get:36 http://deb.debian.org/debian bookworm/main amd64 python3-requests-toolbelt all 0.10.1-1 [41.3 kB]
Get:37 http://deb.debian.org/debian bookworm/main amd64 python3-selinux amd64 3.4-1+b6 [152 kB]
Get:38 http://deb.debian.org/debian bookworm/main amd64 python3-xmltodict all 0.13.0-1 [16.7 kB]
Get:39 http://deb.debian.org/debian bookworm/main amd64 python3-winrm all 0.3.0-4 [21.8 kB]
Fetched 29.7 MB in 3s (10.8 MB/s)        
Retrieving bug reports... Done
Parsing Found/Fixed information... Done
Extracting templates from packages: 100%
Selecting previously unselected package python3-jinja2.
(Reading database ... 202520 files and directories currently installed.)
Preparing to unpack .../00-python3-jinja2_3.1.2-1_all.deb ...
Unpacking python3-jinja2 (3.1.2-1) ...
Selecting previously unselected package python3-packaging.
Preparing to unpack .../01-python3-packaging_23.0-1_all.deb ...
Unpacking python3-packaging (23.0-1) ...
Selecting previously unselected package python3-resolvelib.
Preparing to unpack .../02-python3-resolvelib_0.9.0-2_all.deb ...
Unpacking python3-resolvelib (0.9.0-2) ...
Selecting previously unselected package python3-yaml.
Preparing to unpack .../03-python3-yaml_6.0-3+b2_amd64.deb ...
Unpacking python3-yaml (6.0-3+b2) ...
Selecting previously unselected package python3-pycryptodome.
Preparing to unpack .../04-python3-pycryptodome_3.11.0+dfsg1-4_amd64.deb ...
Unpacking python3-pycryptodome (3.11.0+dfsg1-4) ...
Selecting previously unselected package python3-dnspython.
Preparing to unpack .../05-python3-dnspython_2.3.0-1_all.deb ...
Unpacking python3-dnspython (2.3.0-1) ...
Selecting previously unselected package ieee-data.
Preparing to unpack .../06-ieee-data_20220827.1_all.deb ...
Unpacking ieee-data (20220827.1) ...
Selecting previously unselected package python3-netaddr.
Preparing to unpack .../07-python3-netaddr_0.8.0-2_all.deb ...
Unpacking python3-netaddr (0.8.0-2) ...
Selecting previously unselected package ansible-core.
Preparing to unpack .../08-ansible-core_2.14.3-1_all.deb ...
Unpacking ansible-core (2.14.3-1) ...
Selecting previously unselected package ansible.
Preparing to unpack .../09-ansible_7.3.0+dfsg-1_all.deb ...
Unpacking ansible (7.3.0+dfsg-1) ...
Selecting previously unselected package python-babel-localedata.
Preparing to unpack .../10-python-babel-localedata_2.10.3-1_all.deb ...
Unpacking python-babel-localedata (2.10.3-1) ...
Selecting previously unselected package python3-sniffio.
Preparing to unpack .../11-python3-sniffio_1.2.0-1_all.deb ...
Unpacking python3-sniffio (1.2.0-1) ...
Selecting previously unselected package python3-anyio.
Preparing to unpack .../12-python3-anyio_3.6.2-1_all.deb ...
Unpacking python3-anyio (3.6.2-1) ...
Selecting previously unselected package python3-argcomplete.
Preparing to unpack .../13-python3-argcomplete_2.0.0-1_all.deb ...
Unpacking python3-argcomplete (2.0.0-1) ...
Selecting previously unselected package python3-tz.
Preparing to unpack .../14-python3-tz_2022.7.1-4_all.deb ...
Unpacking python3-tz (2022.7.1-4) ...
Selecting previously unselected package python3-babel.
Preparing to unpack .../15-python3-babel_2.10.3-1_all.deb ...
Unpacking python3-babel (2.10.3-1) ...
Selecting previously unselected package python3-h11.
Preparing to unpack .../16-python3-h11_0.14.0-1_all.deb ...
Unpacking python3-h11 (0.14.0-1) ...
Selecting previously unselected package python3-hpack.
Preparing to unpack .../17-python3-hpack_4.0.0-2_all.deb ...
Unpacking python3-hpack (4.0.0-2) ...
Selecting previously unselected package python3-hyperframe.
Preparing to unpack .../18-python3-hyperframe_6.0.0-1_all.deb ...
Unpacking python3-hyperframe (6.0.0-1) ...
Selecting previously unselected package python3-h2.
Preparing to unpack .../19-python3-h2_4.1.0-4_all.deb ...
Unpacking python3-h2 (4.1.0-4) ...
Selecting previously unselected package python3-httpcore.
Preparing to unpack .../20-python3-httpcore_0.16.3-1_all.deb ...
Unpacking python3-httpcore (0.16.3-1) ...
Selecting previously unselected package python3-pygments.
Preparing to unpack .../21-python3-pygments_2.14.0+dfsg-1_all.deb ...
Unpacking python3-pygments (2.14.0+dfsg-1) ...
Selecting previously unselected package python3-mdurl.
Preparing to unpack .../22-python3-mdurl_0.1.2-1_all.deb ...
Unpacking python3-mdurl (0.1.2-1) ...
Selecting previously unselected package python3-markdown-it.
Preparing to unpack .../23-python3-markdown-it_2.1.0-5_all.deb ...
Unpacking python3-markdown-it (2.1.0-5) ...
Selecting previously unselected package python3-rich.
Preparing to unpack .../24-python3-rich_13.3.1-1_all.deb ...
Unpacking python3-rich (13.3.1-1) ...
Selecting previously unselected package python3-rfc3986.
Preparing to unpack .../25-python3-rfc3986_1.5.0-2_all.deb ...
Unpacking python3-rfc3986 (1.5.0-2) ...
Selecting previously unselected package python3-httpx.
Preparing to unpack .../26-python3-httpx_0.23.3-1_all.deb ...
Unpacking python3-httpx (0.23.3-1) ...
Selecting previously unselected package python3-jmespath.
Preparing to unpack .../27-python3-jmespath_1.0.1-1_all.deb ...
Unpacking python3-jmespath (1.0.1-1) ...
Selecting previously unselected package python3-kerberos.
Preparing to unpack .../28-python3-kerberos_1.1.14-3.1+b7_amd64.deb ...
Unpacking python3-kerberos (1.1.14-3.1+b7) ...
Selecting previously unselected package python3-lockfile.
Preparing to unpack .../29-python3-lockfile_1%3a0.12.2-2.2_all.deb ...
Unpacking python3-lockfile (1:0.12.2-2.2) ...
Selecting previously unselected package python3-simplejson.
Preparing to unpack .../30-python3-simplejson_3.18.3-1_amd64.deb ...
Unpacking python3-simplejson (3.18.3-1) ...
Selecting previously unselected package python3-libcloud.
Preparing to unpack .../31-python3-libcloud_3.4.1-5_all.deb ...
Unpacking python3-libcloud (3.4.1-5) ...
Selecting previously unselected package python3-ntlm-auth.
Preparing to unpack .../32-python3-ntlm-auth_1.4.0-2_all.deb ...
Unpacking python3-ntlm-auth (1.4.0-2) ...
Selecting previously unselected package python3-requests-kerberos.
Preparing to unpack .../33-python3-requests-kerberos_0.12.0-2_all.deb ...
Unpacking python3-requests-kerberos (0.12.0-2) ...
Selecting previously unselected package python3-requests-ntlm.
Preparing to unpack .../34-python3-requests-ntlm_1.1.0-3_all.deb ...
Unpacking python3-requests-ntlm (1.1.0-3) ...
Selecting previously unselected package python3-requests-toolbelt.
Preparing to unpack .../35-python3-requests-toolbelt_0.10.1-1_all.deb ...
Unpacking python3-requests-toolbelt (0.10.1-1) ...
Selecting previously unselected package python3-selinux.
Preparing to unpack .../36-python3-selinux_3.4-1+b6_amd64.deb ...
Unpacking python3-selinux (3.4-1+b6) ...
Selecting previously unselected package python3-xmltodict.
Preparing to unpack .../37-python3-xmltodict_0.13.0-1_all.deb ...
Unpacking python3-xmltodict (0.13.0-1) ...
Selecting previously unselected package python3-winrm.
Preparing to unpack .../38-python3-winrm_0.3.0-4_all.deb ...
Unpacking python3-winrm (0.3.0-4) ...
Setting up python3-sniffio (1.2.0-1) ...
Setting up python3-lockfile (1:0.12.2-2.2) ...
Setting up python3-requests-toolbelt (0.10.1-1) ...
Setting up python3-anyio (3.6.2-1) ...
Setting up python3-hyperframe (6.0.0-1) ...
Setting up python3-hpack (4.0.0-2) ...
Setting up python3-ntlm-auth (1.4.0-2) ...
Setting up python3-pycryptodome (3.11.0+dfsg1-4) ...
Setting up python3-resolvelib (0.9.0-2) ...
Setting up python3-kerberos (1.1.14-3.1+b7) ...
Setting up python3-yaml (6.0-3+b2) ...
Setting up python3-tz (2022.7.1-4) ...
Setting up python-babel-localedata (2.10.3-1) ...
Setting up python3-simplejson (3.18.3-1) ...
Setting up python3-xmltodict (0.13.0-1) ...
Setting up python3-jinja2 (3.1.2-1) ...
Setting up python3-pygments (2.14.0+dfsg-1) ...
Setting up python3-packaging (23.0-1) ...
Setting up python3-rfc3986 (1.5.0-2) ...
Setting up python3-jmespath (1.0.1-1) ...
Setting up python3-mdurl (0.1.2-1) ...
Setting up python3-h11 (0.14.0-1) ...
Setting up python3-markdown-it (2.1.0-5) ...
Setting up python3-requests-kerberos (0.12.0-2) ...
Setting up ieee-data (20220827.1) ...
Setting up python3-dnspython (2.3.0-1) ...
Setting up python3-selinux (3.4-1+b6) ...
Setting up python3-h2 (4.1.0-4) ...
Setting up python3-argcomplete (2.0.0-1) ...
Setting up python3-httpcore (0.16.3-1) ...
Setting up python3-requests-ntlm (1.1.0-3) ...
Setting up python3-babel (2.10.3-1) ...
update-alternatives: using /usr/bin/pybabel-python3 to provide /usr/bin/pybabel (pybabel) in auto mode
Setting up python3-rich (13.3.1-1) ...
Setting up python3-libcloud (3.4.1-5) ...
Setting up python3-httpx (0.23.3-1) ...
Setting up python3-netaddr (0.8.0-2) ...
Setting up python3-winrm (0.3.0-4) ...
Setting up ansible-core (2.14.3-1) ...
Setting up ansible (7.3.0+dfsg-1) ...
Processing triggers for man-db (2.11.2-2) ...
ansible@ansible-master:~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ansible/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/ansible/.ssh/id_rsa
Your public key has been saved in /home/ansible/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:ccgldYTm2rMDYnjicEy5BoCFN7N2YgeTkAw3Z5N7pA8 ansible@ansible-master
The key's randomart image is:
+---[RSA 4096]----+
|*=+.+.  ..ooo    |
|=oB+.... +o.     |
| o * =  +o.      |
|  * E .  o.      |
| o B *  So       |
|  . B = o o      |
|   = + . . o     |
|    .     o      |
|           .     |
+----[SHA256]-----+
ansible@ansible-master:~$ ssh-copy-id ansible@172.16.24.71
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/ansible/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
ansible@172.16.24.71's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ansible@172.16.24.71'"
and check to make sure that only the key(s) you wanted were added.
ansible@ansible-master:~$ nano hosts.txt
ansible@ansible-master:~$ ansible -i hosts.txt all -m ping 
linux1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
ansible@ansible-master:~$ ansible -i hosts.txt all -m ping 
linux1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
ansible@ansible-master:~$ nano hosts.txt
ansible@ansible-master:~$ nano ansible.cfg
ansible@ansible-master:~$ ansible all -m ping
linux1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
ansible@ansible-master:~$ 
```