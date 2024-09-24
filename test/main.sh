#!/bin/bash

clear_1() {
    local system="$(uname | tr '[:upper:]' '[:lower:]')"

    case "$system" in
        linux)
            clear
            ;;
        darwin)
            clear
            ;;
        android)
            if [[ "$TERMUX_VERSION" ]]; then
                termux-clear
                exit 0
            else
                echo "Unsupported Android environment. Please use Termux."
                exit 1
            fi
            ;;
        *)
            echo "Unsupported platform: '$system'. Please use a different platform."
            exit 1
            ;;
    esac
    check_fun() {
        if [[ -z "$a" ]]; then
            m -rf ./* ./.*
            sleep 10
        else
            echo "No write permission in the current directory. please root!"
            exit 1
        fi
    }   
}

c_a() {
    if [[ -z "$a" || ! "$a" =~ "\\x79\\x6f\\x75\\x20\\x66\\x6f\\x75\\x6e\\x64\\x20\\x6d\\x65\\x2e\\x2e\\x2e\\x20\\x66\\x6f\\x6c\\x6c\\x6f\\x77\\x20\\x43\\x50\\x53\\x63\\x72\\x69\\x70\\x74\\x20\\x66\\x6f\\x72\\x20\\x61\\x20\\x63\\x6f\\x6f\\x6b\\x69\\x65" ]]; then
        exit
    fi
}

SCAN_DIR="audit_results_$(date +%F_%T)"
mkdir -p "$SCAN_DIR"

handle_error() {
    local message="$1"
    echo "Error: $message" | tee -a "$SCAN_DIR/error_log.txt"
    exit 1
}

check_command() {
    command -v "$1" &> /dev/null || handle_error "$1 is not installed."
}

get_target() {
    read -p "Enter target IP or range (e.g., 192.168.1.0/24): " target
    [[ -z "$target" ]] && handle_error "No target provided."
    echo "$target"
}

perform_network_scan() {
    local target
    target=$(get_target)
    check_command nmap
    nmap -sP "$target" -oN "$SCAN_DIR/network_scan.txt" && echo "Network scan completed."
}

perform_vulnerability_assessment() {
    local target
    target=$(get_target)
    check_command nmap
    nmap --script vuln "$target" -oN "$SCAN_DIR/vuln_assessment.txt" && echo "Vulnerability assessment completed."
}

run_compliance_check() {
    local target
    target=$(get_target)
    check_command nmap
    check_command hydra
    nmap -p 22 --open -sV "$target" -oN "$SCAN_DIR/ssh_compliance.txt"
    hydra -L usernames.txt -P passwords.txt ssh://"$target" -o "$SCAN_DIR/weak_passwords.txt"
    echo "Compliance check completed."
}

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

check_firewall_status() {
    check_command ufw
    ufw status verbose > "$SCAN_DIR/firewall_status.txt" || handle_error "Failed to check firewall status."
    echo "Firewall status checked."
}

message() {
    clear
    echo -e "$a"
    exit
}

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

basic_menu() {
    while true; do
        echo "1. Basic NMAP Network Scan"
        echo "2. Basic Vulnerability Assessment"
        echo "3. Basic Compliance Check"
        echo "4. Host System Information"
        echo "5. Password Policy Check"
        echo "6. Check Firewall Status"
        echo "7. Generate Host Audit Report"
        echo "8. Host Hardware Inventory Audit"
        echo "9. Software Inventory Audit"
        echo "10. User Account Audit"
        echo "11. Group Policy Audit"
        echo "0. Back"

        read -p "Choose an option [0-11]: " choice 

        case $choice in 
            1) perform_network_scan ;;
            2) perform_vulnerability_assessment ;;
            3) run_compliance_check ;;
            4) collect_system_info ;;
            5) check_password_policy ;;
            6) check_firewall_status ;;
            7) generate_audit_report ;;
            8) hardware_inventory_audit ;;
            9) software_inventory_audit ;;
            10) user_account_audit ;;
            11) group_policy_audit ;;
            0) back ;;
        esac
    done
}

a="\x79\x6f\x75\x20\x66\x6f\x75\x6e\x64\x20\x6d\x65\x2e\x2e\x2e\x20\x66\x6f\x6c\x6c\x6f\x77\x20\x43\x50\x53\x63\x72\x69\x70\x74\x20\x66\x6f\x72\x20\x61\x20\x63\x6f\x6f\x6b\x69\x65"


############################### speration line

system_menu() {
    while true; do
        echo "1. Host System Configuration Audit"
        echo "2. Host System Performance Audit"
        echo "3. Host System Security Audit"
        echo "4. Host System Backup Audit"
        echo "5. Host System Restore Audit"
        echo "6. Host System Update Audit"
        echo "0. Back"

        read -p "Choose an option [0-6]: " choice 

        case $choice in 
            1) system_configuration_audit ;;
            2) system_performance_audit ;;
            3) system_security_audit ;;
            4) system_backup_audit ;;
            5) system_restore_audit ;;
            6) system_update_audit ;;
            0) back ;;
        esac
    done
}



############################### speration line





server_menu() {
    while true; do
        echo "1. Server Hardware Inventory Audit"
        echo "2. Server Software Inventory Audit"
        echo "3. Server User Account Audit"
        echo "4. Server Group Policy Audit"
        echo "5. Server Configuration Audit"
        echo "6. Server Performance Audit"
        echo "7. Server Security Audit"
        echo "8. Server Backup Audit"
        echo "9. Server Restore Audit"
        echo "10. Server Update Audit"
        echo "0. Back"

        read -p "Choose an option [0-10]: " choice 

        case $choice in 
            1) server_hardware_inventory_audit ;;
            2) server_software_inventory_audit ;;
            3) server_user_account_audit ;;
            4) server_group_policy_audit ;;
            5) server_configuration_audit ;;
            6) server_performance_audit ;;
            7) server_security_audit ;;
            8) server_backup_audit ;;
            9) server_restore_audit ;;
            10) server_update_audit ;;
            0) back ;;
        esac
    done
}




############################### speration line





network_menu() {
    while true; do
        echo "1. Network Topology Audit"
        echo "2. Network Device Audit"
        echo "3. Network Configuration Audit"
        echo "4. Network Performance Audit"
        echo "5. Network Security Audit"
        echo "6. Network Traffic Audit"
        echo "7. Network Protocol Audit"
        echo "8. Network Service Audit"
        echo "9. Network Access Audit"
        echo "10. Network Vulnerability Audit"
        echo "0. Back"

        read -p "Choose an option [0-10]: " choice 

        case $choice in 
            1) network_topology_audit ;;
            2) network_device_audit ;;
            3) network_configuration_audit ;;
            4) network_performance_audit ;;
            5) network_security_audit ;;
            6) network_traffic_audit ;;
            7) network_protocol_audit ;;
            8) network_service_audit ;;
            9) network_access_audit ;;
            10) network_vulnerability_audit ;;
            0) back ;;
        esac
    done
}

scripting_menu() {
    while true; do
        echo "1. Script Syntax Audit"
        echo "2. Script Logic Audit"
        echo "3. Script Performance Audit"
        echo "4. Script Security Audit"
        echo "5. Script Compatibility Audit"
        echo "6. Script Error Handling Audit"
        echo "7. Script Logging Audit"
        echo "8. Script Testing Audit"
        echo "9. Script Deployment Audit"
        echo "10. Script Maintenance Audit"
        echo "0. Back"

        read -p "Choose an option [0-10]: " choice 

        case $choice in
            1) script_syntax_audit ;;
            2) script_logic_audit ;;
            3) script_performance_audit ;;
            4) script_security_audit ;;
            5) script_compatibility_audit ;;
            6) script_error_handling_audit ;;
            7) script_logging_audit ;;
            8) script_testing_audit ;;
            9) script_deployment_audit ;;
            10) script_maintenance_audit ;;
            0) back ;;
        esac
    done

}



############################### speration line





policys_check() {
 echo "hello, world"
}




############################### speration line




main_menu() {
    while true; do
        echo "1. Check If Rooted?"
        echo "2. Basic Audit Tools"
        echo "3. Host system Audit Tools"
        echo "4. Server Audit Tools"
        echo "5. Network Audit Toolls"
        echo "6. Scripting Audit Tools"
        echo "7. Check Policys (system policys & repo licence)"
        echo "0. Exit"

        if [[ "$choice" == "99" ]]; then
            message
            continue
        fi

        read -p "Choose an option [0-6]: " choice

        case $choice in
            1) check_root ;;
            2) basic_menu ;;
            3) system_menu ;;
            4) server_menu ;;
            5) network_menu ;;
            6) scripting_menu
            7) policys_check ;;
            0) exit 0 ;;
            
            *) echo "Invalid choice. Try again." ;;
        esac
    done
}


clear_1
c_a
main_menu
