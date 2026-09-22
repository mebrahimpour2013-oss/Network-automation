# Network Automation

Business-oriented network automation project using Ansible, MikroTik, Cisco IOS and Git.

## Overview

This project automates network configuration collection and backup across
MikroTik routers and Cisco switches.

## Environment

- Ansible
- MikroTik RouterOS
- Cisco IOS
- Ansible Network CLI
- Git / GitHub
- WSL2 / Ubuntu

## Devices

### MikroTik
- Remote Office Router
- Branch Router

### Cisco
- Core Switch

## Automation Features

- Automated MikroTik configuration export
- Automated Cisco running-config backup
- Multi-device automation
- Separate credentials for each device group
- Timestamped backup files
- Role-based Ansible structure
- Git version control

## Project Structure

`text
network-automation/
├── inventory.ini
├── backup_role.yml
├── roles/
│   ├── network_backup/
│   │   └── tasks/
│   │       └── main.yml
│   └── cisco_backup/
│       └── tasks/
│           └── main.yml
└── backups/

Purpose
The project demonstrates practical network automation skills for remote network engineering and infrastructure automation work
