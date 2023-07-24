```bash
slava@phobos:~/git-projects/TMS-homework/homework_21$ ansible-playbook -i inventory.yml playbook.yml --ask-become-pass
BECOME password: 

PLAY [Install and configure Nginx] *****************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************
ok: [ansible-node1]
ok: [ansible-node2]

TASK [Update packages] *****************************************************************************************************************
ok: [ansible-node2]
ok: [ansible-node1]

TASK [Install nginx, curl, net-tools] **************************************************************************************************
changed: [ansible-node2] => (item=nginx)
changed: [ansible-node1] => (item=nginx)
changed: [ansible-node2] => (item=curl)
changed: [ansible-node1] => (item=curl)
changed: [ansible-node2] => (item=net-tools)
changed: [ansible-node1] => (item=net-tools)

TASK [Create tms.by site directory] ****************************************************************************************************
changed: [ansible-node1]
changed: [ansible-node2]

TASK [Create file index.html for site tms.by] ******************************************************************************************
changed: [ansible-node2]
changed: [ansible-node1]

TASK [Create Nginx config for site tms.by] *********************************************************************************************
changed: [ansible-node1]
changed: [ansible-node2]

TASK [Create symlink] ******************************************************************************************************************
changed: [ansible-node1]
changed: [ansible-node2]

TASK [Add current user to www-data group] **********************************************************************************************
ok: [ansible-node2]
ok: [ansible-node1]

TASK [Set proper permissions to /var/www directory] ************************************************************************************
changed: [ansible-node1]
changed: [ansible-node2]

TASK [Restart Nginx] *******************************************************************************************************************
changed: [ansible-node2]
changed: [ansible-node1]

TASK [Add tms.by in hosts] *************************************************************************************************************
changed: [ansible-node1]
changed: [ansible-node2]

TASK [Check if site works] *************************************************************************************************************
changed: [ansible-node2]
changed: [ansible-node1]

TASK [debug] ***************************************************************************************************************************
ok: [ansible-node1] => {
    "curl_output.stdout_lines": [
        "<html>",
        "    <head>",
        "        <title>Mikhalenka. Web Servers. Part I</title>",
        "    </head>",
        "    <body>",
        "        <p>Mikhalenka. Web Servers, Part I</p>",
        "    </body>",
        "</html>"
    ]
}
ok: [ansible-node2] => {
    "curl_output.stdout_lines": [
        "<html>",
        "    <head>",
        "        <title>Mikhalenka. Web Servers. Part I</title>",
        "    </head>",
        "    <body>",
        "        <p>Mikhalenka. Web Servers, Part I</p>",
        "    </body>",
        "</html>"
    ]
}

TASK [debug] ***************************************************************************************************************************
skipping: [ansible-node1]
skipping: [ansible-node2]

TASK [Show netstat input] **************************************************************************************************************
changed: [ansible-node2]
changed: [ansible-node1]

PLAY RECAP *****************************************************************************************************************************
ansible-node1              : ok=14   changed=10   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
ansible-node2              : ok=14   changed=10   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```