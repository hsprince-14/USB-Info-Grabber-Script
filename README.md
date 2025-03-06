# USB-Info-Grabber-Script

This script is designed to run on a Windows system from a USB drive to perform a system audit. It collects a variety of information about the network, system, security, and throughput metrics. The collected data is saved to the USB drive in a folder called `SystemAuditLogs`.

The script works automatically when run, collecting data, merging logs, and encrypting sensitive information. It’s meant for educational and ethical auditing purposes only.

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

1. Download the [CompleteSystemAudit.vbs](CompleteSystemAudit.vbs) script.
2. Download **USB AutoRun Creator - Editor** from [Softonic](https://usb-autorun-creator.en.softonic.com/).
3. Set up your USB drive with AutoRun to automatically run the script when inserted into a computer.
4. Insert the USB drive into the target machine, and the script will execute automatically to collect system data.
5. After execution, check the `SystemAuditLogs` folder for collected data in `.txt` format.

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

The following types of log files will be generated:

- **WiFi_Profiles.txt** - List of available Wi-Fi profiles
- **Network_Config.txt** - Network configuration details
- **System_Info.txt** - System details (e.g., OS, CPU, RAM)
- **Audit_Policy.txt** - Current audit policies
- **TCP_Ports.txt** - Active TCP ports
- **SSL_Certificates.txt** - SSL certificate details

---

## License

This script is provided for educational purposes. Use it responsibly. The script is licensed under the [MIT License](LICENSE).

---

## Contact

For support or questions, please contact me at:  
**Email:** rzprince02@gmail.com  
**GitHub Profile:** https://github.com/hsprince-14

---

