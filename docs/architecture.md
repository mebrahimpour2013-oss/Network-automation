


etwork Automation Architecture

## Purpose

This project provides Ansible-based automation for network configuration backup and operational information collection across MikroTik RouterOS and Cisco IOS devices.

The automation was implemented and executed in a commercial corporate network environment.

## Automation Flow

Network Devices
    |
    +-- MikroTik RouterOS
    |
    +-- Cisco IOS
            |
            v
        Ansible
            |
            +-- Configuration Backup
            |
            +-- Operational Information Collection
            |
            v
          Backups

## Components

- Ansible Core
- ansible.netcommon
- community.routeros
- cisco.ios
- MikroTik RouterOS CLI
- Cisco IOS CLI

## Supported Operations

### Configuration Backup

- MikroTik: /export
- Cisco: show running-config

Configuration output is collected from the target devices and stored as timestamped backup files.

### Information Collection

The project also collects selected operational information such as:

- Device identity
- System resources
- RouterBoard information
- Cisco IOS version information

## Security Considerations

Credentials are supplied at execution time where applicable and are not intended to be embedded in the automation playbooks.

Public documentation intentionally excludes real organizational credentials, network addresses, and identifying infrastructure information.

## Repository Structure

`text
network-automation/
├── backups/
├── docs/
├── roles/
├── tests/
├── ansible.cfg
├── inventory.ini
├── requirements.yml
├── backup_network.yml
├── backup_role.yml
├── collect_info.yml
└── collect_network.yml
`