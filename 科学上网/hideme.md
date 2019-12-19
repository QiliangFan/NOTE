### Step by Step Tutorial

-  ### 1

   **Notice:** This tutorial has been created with Ubuntu 15.10 (Wily Werewolf) and **does not** work with older versions. If you are using an older version please contact our customer support for assistance.

    Open the terminal and install OpenVPN with the following command.

   `sudo apt-get install openvpn network-manager-openvpn network-manager-openvpn-gnome`

   ![1](step1.png)

-  ### 2

   Open the network menu, go to "VPN Connections" and click on "Configure VPN...".

   ![2](step2.png)

-  ### 3

   Click on "Add".

   ![3](step3.png)

-  ### 4

   Click on "Import a saved VPN configuration...".

   ![4](step4.png)

-  ### 5

   Click on "Create".

   ![5](step5.png)

-  ### 6

   Download the [OpenVPN configuration](https://member.hide.me/en/server-status), unzip it and import the .ovpn file.

   ![6](step6.png)

-  ### 7

   Enter your login credentials and click on "Save...".

   ![7](step7.png)

-  ### 7a

   Switch to "Advanced Configuration" and in the tab "TLS Authentication" check  "Use additional TLS authentication". Select the file "StaticKey.pem"  from the configuration and set the "Key Direction" to "0". Confirm with  "OK".

   ![7a](step7a.png)

-  ### 8

   Open the network menu to establish a VPN connection.

   ![8](step8.png)

-  ### 9

   If connection has been successfully established, the status is shown in  the menu bar. You can manage your VPN connection in the network  settings.

   ![9](step9.png)

[Video Tutorial](https://hide.me/en/vpnsetup/ubuntu/openvpn/#video)[Step by Step Tutorial](https://hide.me/en/vpnsetup/ubuntu/openvpn/#step)

###