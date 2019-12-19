https://account.protonvpn.com

liangliangsxj

```shell
sudo apt install -y openvpn dialog python3-pip python3-setuptools
sudo pip3 install protonvpn-cli
```



https://protonvpn.com/support/linux-vpn-tool/

## Commands

### List of all Commands

| **Command**                      | **Description**                                       |
| -------------------------------- | ----------------------------------------------------- |
| `protonvpn init`                 | Initialize ProtonVPN profile.                         |
| `protonvpn connect, c`           | Select a ProtonVPN server and connect to it.          |
| `protonvpn c [servername]`       | Connect to a specified server.                        |
| `protonvpn c -r`                 | Connect to a random server.                           |
| `protonvpn c -f`                 | Connect to the fastest server.                        |
| `protonvpn c --p2p`              | Connect to the fastest P2P server.                    |
| `protonvpn c --cc [countrycode]` | Connect to the fastest server in a specified country. |
| `protonvpn c --sc`               | Connect to the fastest Secure Core server.            |
| `protonvpn reconnect, r`         | Reconnect or connect to the last server used.         |
| `protonvpn disconnect, d`        | Disconnect the current session.                       |
| `protonvpn status, s`            | Print connection status.                              |
| `protonvpn configure`            | Change CLI configuration.                             |
| `protonvpn refresh`              | Refresh OpenVPN configuration and server data.        |
| `protonvpn examples`             | Print example commands.                               |
| `protonvpn --version`            | Display version.                                      |
| `protonvpn --help`               | Show help message.                                    |

All connect options can be used with the `-p` flag to explicitly specify which transmission protocol is used for that connection (either `udp` or `tcp`).



```
sudo pip3 uninstall protonvpn-cli
```