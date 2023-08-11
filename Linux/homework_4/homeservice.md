```bash
[Unit]
Description=Home Backup Script

[Service]
Type=simple
User=root
Group=root
TimeoutStartSec=0
Restart=on-failure
RestartSec=30s
ExecStart=/bin/bash /etc/scripts/backup.sh

[Install]
WantedBy=multi-user.target
```