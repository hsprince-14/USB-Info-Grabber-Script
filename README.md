# USB-Info-Grabber-Script

This script is designed to run on a Windows system from a USB drive to perform a system audit. It collects a variety of information about the network, system, security, and throughput metrics. The collected data is saved to the USB drive in a folder called `SystemAuditLogs`.

The script works automatically when inserting a USB, collecting data, merging logs, and encrypting sensitive information. It’s meant for educational and ethical auditing purposes only.

---

## Features

- **Network Information:**
  - WiFi profiles and passwords (if available)
  - Network configuration details
  - Active TCP/UDP connections
  - ARP Table

- **System Information:**
  - System info (CPU, memory, etc.)
  - Windows updates list
  - Driver information
  - Antivirus status

- **Security Information:**
  - SSL certificates
  - Audit policies
  - Installed software
  - User privileges

- **Network Throughput:**
  - Network performance metrics

- **Log Merging & Cleanup:**
  - Merges all collected logs into a single log file
  - Cleans up raw data files after processing

---

## Prerequisites

Before using the script, ensure you have the following:

- **Windows Operating System** (Windows 7, 10, 11 or later)
- **USB Drive** (to store logs and run the script)
- **USB AutoRun Creator - Editor** to enable automatic execution when the USB is inserted.
- You can download the tool from [Softonic](https://usb-autorun-creator.en.softonic.com/)

---

## How to Use

1. Download the [CompleteSystemAudit.vbs](CompleteSystemAudit.vbs) script and AUTORUN.INF file in your USB.
2. Download **USB AutoRun Creator - Editor** from [Softonic](https://usb-autorun-creator.en.softonic.com/).
3. Open **USB AutoRun Creator - Editor** and In **Program to run or dæurnent to open automatically (source file path):** option **Select** the CompleteSystemAudit.vbs from your USB And Press **OK**.
4. Now **Create in this drive or folder:** option **Select** your USB DRIVE (Example: :I\) and Must Tap in Right option **USB drive** And Press **OK**.
5. Then there is an option button name **Create** in below **Select** it And Press **OK**.
6. Now Choose **Close** 
7. Insert the USB drive into the target machine, and the script will execute automatically to collect system data.
8. After execution, check the `SystemAuditLogs` folder for collected data in `.txt` format.

---

## How It Works

The `CompleteSystemAudit.vbs` script performs the following tasks:

1. **Collects Data:**
   The script runs several system commands to collect network information, system configuration, security data, and more.
   
2. **Logs Data:**
   All output from the executed commands is written to log files inside the `SystemAuditLogs` folder on the USB drive.

3. **Merges Logs:**
   After data collection, the script merges all `.txt` log files into one comprehensive log file named `WindowsUpdate.log`.

4. **Cleans Up:**
   After merging the logs, the raw data files are deleted to keep the USB drive clean.

---

## Example Output

The following types of log files will be generated in WindowsUpdate.log txt file:

- **WiFi_Profiles** - List of available Wi-Fi profiles
- **Network_Config** - Network configuration details
- **System_Info** - System details (e.g., OS, CPU, RAM)
- **Audit_Policy** - Current audit policies
- **TCP_Ports** - Active TCP ports
- **SSL_Certificates** - SSL certificate details

---

## License

This script is provided for educational purposes. Use it responsibly. The script is licensed under the [MIT License](LICENSE).

---

## Contact

For support or questions, please contact me at:  
**Email:** rzprince02@gmail.com  
**GitHub Profile:** https://github.com/hsprince-14

---

