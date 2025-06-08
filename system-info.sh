#!/bin/bash

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

# Timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
logfile="system_report_$timestamp.txt"

echo -e "${CYAN}🔍 System Information Report ($timestamp)${RESET}" | tee "$logfile"

echo -e "\n${YELLOW}📦 OS and Kernel:${RESET}" | tee -a "$logfile"
uname -a | tee -a "$logfile"

echo -e "\n${YELLOW}🕒 Uptime and Load:${RESET}" | tee -a "$logfile"
uptime | tee -a "$logfile"

echo -e "\n${YELLOW}🧠 CPU Info:${RESET}" | tee -a "$logfile"
lscpu | grep -E 'Model name|CPU\(s\)|Architecture' | tee -a "$logfile"

echo -e "\n${YELLOW}📊 Memory Usage:${RESET}" | tee -a "$logfile"
free -h | tee -a "$logfile"

echo -e "\n${YELLOW}💽 Disk Usage:${RESET}" | tee -a "$logfile"
df -h | tee -a "$logfile"

echo -e "\n${YELLOW}📡 Network Interfaces & IPs:${RESET}" | tee -a "$logfile"
ip -brief address | tee -a "$logfile"

echo -e "\n${YELLOW}🔌 USB and PCI Devices:${RESET}" | tee -a "$logfile"
lsusb | tee -a "$logfile"
lspci | tee -a "$logfile"

echo -e "\n${YELLOW}🔓 Open Ports:${RESET}" | tee -a "$logfile"
ss -tuln | tee -a "$logfile"

echo -e "\n${GREEN}✅ Report saved to: $logfile${RESET}"
