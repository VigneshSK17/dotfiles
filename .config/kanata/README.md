# Kanata Systemd Service Install

1. Install kanata into ~/.local/bin/kanata
    - Can change path in kanata.service
2. Hard link kanata.service to /etc/systemd/system/
    - ```ln kanata.service /etc/systemd/system/kanata.service```
3. Update systemd and start service
    ```
    sudo systemctl daemon-reload
    sudo systemctl enable kanata.service
    sudo systemctl start kanata.service
    ```
