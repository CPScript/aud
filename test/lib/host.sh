#!/bin/bash

HOST_DIR="lib/reports/HOST_audit_results_$(date)"
REPORT_FILE="system_configuration_audit_$(date +%F_%T).txt"
mkdir -p "$HOST_DIR"


sys_configuration() {
    report_file="$SCAN_DIR/system_configuration_report.txt"
    (
        echo "System Configuration Report"
        echo "============================="

        # System Information
        echo "System Information:"
        echo "------------------"
        echo "$(uname -a)"
        echo "$(cat /etc/os-release)"

        # Hardware Information
        echo "Hardware Information:"
        echo "-------------------"
        echo "$(lshw -short)"

        # CPU Information
        echo "CPU Information:"
        echo "--------------"
        echo "$(lscpu)"

        # Memory Information
        echo "Memory Information:"
        echo "-----------------"
        echo "$(free -h)"

        # Disk Information
        echo "Disk Information:"
        echo "--------------"
        echo "$(df -h)"

        # Network Information
        echo "Network Information:"
        echo "------------------"
        echo "$(ip addr show)"
        echo "$(ip route show)"

        # Package Information
        echo "Package Information:"
        echo "------------------"
        echo "$(dpkg -l)"

        # Services Information
        echo "Services Information:"
        echo "-------------------"
        echo "$(systemctl list-units --type=service)"
    ) | tee -a "$report_file"

    echo "[$(date +'%Y-%m-%d %H:%M:%S')] System configuration report generated successfully!"
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] Report file: $report_file"
}

sys_preformance() {
    clear
    echo "hello world!"
    sleep 10
}

sys_security() {
    clear
    echo "hello world!"
    sleep 10
}

sys_backup() {
    clear
    echo "hello world!"
    sleep 10
}

sys_restore() {
    clear
    echo "hello world!"
    sleep 10
}

sys_update() {
    clear
    echo "hello world!"
    sleep 10
}
