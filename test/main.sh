#!/bin/bash

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
}

system_menu() {
    while true; do
        echo "1. Host System Configuration Audit"
        echo "2. Host System Performance Audit"
        echo "3. Host System Security Audit"
        echo "4. Host System Backup Audit"
        echo "5. Host System Restore Audit"
        echo "6. Host System Update Audit"
        echo "0. Back"
}

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
}

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
}

scripting_menu() {
    while true; do
        echo "38. Script Syntax Audit"
        echo "39. Script Logic Audit"
        echo "40. Script Performance Audit"
        echo "41. Script Security Audit"
        echo "42. Script Compatibility Audit"
        echo "43. Script Error Handling Audit"
        echo "44. Script Logging Audit"
        echo "45. Script Testing Audit"
        echo "46. Script Deployment Audit"
        echo "47. Script Maintenance Audit"
        echo "0. Back"
}

main_menu() {
    while true; do
        echo "1. Check If Rooted?"
        echo "2. Basic Audit Tools"
        echo "3. Host system Audit Tools"
        echo "4. Server Audit Tools"
        echo "4. Network Audit Toolls"
        echo "5. Scripting Audit Tools"
        echo "6. Check Policys (system policys & repo licence)"
        
        echo "0. Exit"

        read -p "Choose an option [0-5]: " choice # add to the rest of functions

        case $choice in # need to organize to functions!
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
            12) system_configuration_audit ;;
            13) system_performance_audit ;;
            14) system_security_audit ;;
            15) system_backup_audit ;;
            16) system_restore_audit ;;
            17) system_update_audit ;;
            18) server_hardware_inventory_audit ;;
            19) server_software_inventory_audit ;;
            20) server_user_account_audit ;;
            21) server_group_policy_audit ;;
            22) server_configuration_audit ;;
            23) server_performance_audit ;;
            24) server_security_audit ;;
            25) server_backup_audit ;;
            26) server_restore_audit ;;
            27) server_update_audit ;;
            28) network_topology_audit ;;
            29) network_device_audit ;;
            30) network_configuration_audit ;;
            31) network_performance_audit ;;
            32) network_security_audit ;;
            33) network_traffic_audit ;;
            34) network_protocol_audit ;;
            35) network_service_audit ;;
            36) network_access_audit ;;
            37) network_vulnerability_audit ;;
            38) script_syntax_audit ;;
            39) script_logic_audit ;;
            40) script_performance_audit ;;
            41) script_security_audit ;;
            42) script_compatibility_audit ;;
            43) script_error_handling_audit ;;
            44) script_logging_audit ;;
            45) script_testing_audit ;;
            46) script_deployment_audit ;;
            47) script_maintenance_audit ;;
            48) exit 0 ;;
            *) echo "Invalid choice. Try again." ;;
        esac
    done
}

# New audit functions
hardware_inventory_audit() {
    # TO DO: implement hardware inventory audit logic
    echo "Hardware inventory audit in progress..."
}

software_inventory_audit() {
    # TO DO: implement software inventory audit logic
    echo "Software inventory audit in progress..."
}

user_account_audit() {
    # TO DO: implement user account audit logic
    echo "User account audit in progress..."
}

group_policy_audit() {
