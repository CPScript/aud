## Features

### Example:
> an example using github-codespace

[sss.webm](https://github.com/user-attachments/assets/64e8283e-4cbc-4a7d-8c25-320a930eaa6f)




### Basic Audit(s):
- **Network Scan**: Performs a ping sweep on a specified IP range.
- **Vulnerability Assessment**: Checks for vulnerabilities using `nmap` scripts.
- **Compliance Check**: Examines SSH compliance and tests for weak passwords using `hydra`.
- **System Information Collection**: Gathers essential system information like hostname, OS, kernel version, and uptime.
- **Password Policy Check**: Reviews the password policy settings on the system.
- **Firewall Status Check**: Reports the status of the firewall using `ufw`.
- **Audit Report Generation**: Compiles all findings into a neatly formatted report.

### Host system Audit(s):
- **System Configuration**:
- **System Performance**:
- **System security**:
- **System Backup**:
- **System Restore**:
- **System Update**:


## required dependencies 

Before running the script, ensure you have the following tools installed on your system:

- `bash`
- `nmap`
- `hydra`
- `ufw` (Uncomplicated Firewall)

You can install these tools on Debian-based systems using:

```bash
sudo apt update
sudo apt install nmap hydra ufw
