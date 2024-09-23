#!/bin/bash

# Create a directory for results
SCAN_DIR="audit_results_$(date +%F_%T)"
mkdir -p "$SCAN_DIR"

# Error handling function
handle_error() {
    local message="$1"
    echo "Error: $message" | tee -a "$SCAN_DIR/error_log.txt"
    exit 1
}

# Check if a command is installed
check_command() {
    command -v "$1" &> /dev/null || handle_error "$1 is not installed."
}

# Prompt for target IP or range
get_target() {
    read -p "Enter target IP or range (e.g., 192.168.1.0/24): " target
    [[ -z "$target" ]] && handle_error "No target provided."
    echo "$target"
}

# Perform Network Scan
perform_network_scan() {
    local target
    target=$(get_target)
    check_command nmap
    nmap -sP "$target" -oN "$SCAN_DIR/network_scan.txt" && echo "Network scan completed."
}

# Perform Vulnerability Assessment
perform_vulnerability_assessment() {
    local target
    target=$(get_target)
    check_command nmap
    nmap --script vuln "$target" -oN "$SCAN_DIR/vuln_assessment.txt" && echo "Vulnerability assessment completed."
}

# Run Compliance Check
run_compliance_check() {
    local target
    target=$(get_target)
    check_command nmap
    check_command hydra
    nmap -p 22 --open -sV "$target" -oN "$SCAN_DIR/ssh_compliance.txt"
    hydra -L usernames.txt -P passwords.txt ssh://"$target" -o "$SCAN_DIR/weak_passwords.txt"
    echo "Compliance check completed."
}

# Collect System Information
collect_system_info() {
    {
        echo "Hostname: $(hostname)"
        echo "OS: $(uname -o)"
        echo "Kernel: $(uname -r)"
        echo "Uptime: $(uptime -p)"
        echo "Logged-in Users: $(who | wc -l)"
    } > "$SCAN_DIR/system_info.txt" || handle_error "Failed to collect system information."
    echo "System information collected."
}

# Check Password Policy
check_password_policy() {
    {
        if [[ -f /etc/login.defs ]]; then
            grep -E 'PASS_MAX_DAYS|PASS_MIN_DAYS|PASS_WARN_AGE' /etc/login.defs
        else
            echo "No policy file found."
        fi
    } > "$SCAN_DIR/password_policy.txt" || handle_error "Failed to check password policy."
    echo "Password policy checked."
}

# Check Firewall Status
check_firewall_status() {
    check_command ufw
    ufw status verbose > "$SCAN_DIR/firewall_status.txt" || handle_error "Failed to check firewall status."
    echo "Firewall status checked."
}

# Generate Audit Report
generate_audit_report() {
    {
        echo "=== Audit Report ==="
        echo "Generated on: $(date)"
        echo ""
        for file in network_scan vuln_assessment ssh_compliance weak_passwords system_info password_policy firewall_status; do
            echo "=== ${file//_/ } ==="
            [[ -f "$SCAN_DIR/${file}.txt" ]] && cat "$SCAN_DIR/${file}.txt" || echo "No results found."
            echo ""
        done
        echo "=== End of Report ==="
    } > "$SCAN_DIR/audit_report.txt" || handle_error "Failed to generate audit report."
    echo "Audit report generated: $SCAN_DIR/audit_report.txt"
}

# Main Menu Loop
main_menu() {
    while true; do
        echo "1. Network Scan"
        echo "2. Vulnerability Assessment"
        echo "3. Compliance Check"
        echo "4. System Information"
        echo "5. Password Policy Check"
        echo "6. Firewall Status"
        echo "7. Generate Audit Report"
        echo "8. Exit"

        read -p "Choose an option [1-8]: " choice
        case $choice in
            1) perform_network_scan ;;
            2) perform_vulnerability_assessment ;;
            3) run_compliance_check ;;
            4) collect_system_info ;;
            5) check_password_policy ;;
            6) check_firewall_status ;;
            7) generate_audit_report ;;
            8) exit 0 ;;
            *) echo "Invalid choice. Try again." ;;
        esac
    done
}

main_menu
