#Enterprise Network Automation

An Ansible-based network automation solution implemented and executed in a commercial corporate network environment to automate configuration backup and operational information collection across MikroTik routers and Cisco switches.

#Overview

This project provides a practical Ansible-based automation framework for managing configuration backup and operational information collection in a multi-vendor network environment.

The automation was designed and implemented to reduce repetitive administrative tasks, improve backup consistency, and provide a structured approach to network configuration management.

#Objectives

- Automate network device configuration backups
- Collect selected operational information from network devices
- Support heterogeneous network environments
- Reduce repetitive manual administration
- Maintain organized, timestamped configuration backups
- Provide a reusable and maintainable automation structure

#Supported Platforms

Platform| Automation
MikroTik RouterOS| Configuration backup and information collection
Cisco IOS| Running configuration backup and information collection

#Automation Architecture

Network Devices
      |
      +-------------------+
      |                   |
MikroTik RouterOS     Cisco IOS
      |                   |
      +---------+---------+
                |
             Ansible
                |
      +---------+---------+
      |                   |
Configuration Backup   Information Collection
      |                   |
      +---------+---------+
                |
             Backups

The automation communicates with network devices through their native CLI-based interfaces.

- MikroTik: RouterOS CLI
- Cisco: IOS CLI

#Project Structure

network-automation/
├── backups/
├── docs/
│   └── architecture.md
├── roles/
│   ├── cisco_backup/
│   │   └── tasks/
│   │       └── main.yml
│   └── network_backup/
│       └── tasks/
│           └── main.yml
├── tests/
│   ├── cisco_test.yml
│   └── test.yml
├── ansible.cfg
├── inventory.ini
├── requirements.yml
├── backup_network.yml
├── backup_role.yml
├── collect_info.yml
└── collect_network.yml

#Implemented Automation

MikroTik Configuration Backup

The automation connects to MikroTik RouterOS devices and executes:

/export

The collected configuration is stored as a timestamped ".rsc" backup file.

Cisco Configuration Backup

For Cisco IOS devices, the automation executes:

show running-config

The collected configuration is stored as a timestamped ".cfg" backup file.

#Information Collection

The project also provides operational information collection from network devices.

#MikroTik

The automation collects information including:

- System identity
- System resources
- RouterBoard information

#Cisco

The automation collects information including:

- IOS version
- Device operational information

#Ansible Roles

The project uses vendor-specific Ansible roles to separate device automation logic and improve maintainability.

"network_backup"

Responsible for MikroTik configuration backup using the "community.routeros" collection.

"cisco_backup"

Responsible for Cisco configuration backup using the "cisco.ios" collection.

#Execution Workflow

1. Define target devices in inventory
              ↓
2. Provide credentials at execution time
              ↓
3. Execute the appropriate Ansible playbook
              ↓
4. Connect to target network devices
              ↓
5. Execute vendor-specific commands
              ↓
6. Collect configuration or operational information
              ↓
7. Store timestamped backup files

#Technology Stack

- Ansible Core
- Python
- YAML
- MikroTik RouterOS
- Cisco IOS
- "ansible.netcommon"
- "community.routeros"
- "cisco.ios"
- SSH-based network automation

#Requirements

Required Ansible collections are defined in "requirements.yml".

Install them with:

ansible-galaxy collection install -r requirements.yml

Required components include:

- Ansible Core
- "ansible.netcommon"
- "community.routeros"
- "cisco.ios"
- SSH connectivity to target network devices

#Security Considerations

Credentials are supplied at execution time where applicable and are not intended to be hard-coded into the automation workflow.

Public documentation intentionally excludes:

- Real organizational credentials
- Identifying infrastructure information
- Production network addressing details
- Sensitive organizational information

Backup artifacts included in the repository do not represent real production credentials or identifying production infrastructure.

#Operational Characteristics

The automation provides a consistent and repeatable approach to network configuration management by:

- Standardizing configuration backup procedures
- Supporting multiple network vendors
- Generating timestamped backup files
- Reducing manual administrative tasks
- Providing reusable Ansible roles
- Simplifying operational information collection

#Future Improvements

Potential future enhancements include:

- Centralized backup storage
- Backup retention and lifecycle management
- Configuration change detection
- Automated backup validation
- Scheduled execution
- Structured logging
- Monitoring and notification integration
- Additional vendor support
- Git-based configuration management

#Project Context

This project was implemented and executed in a commercial corporate network environment to automate configuration backup and operational information collection across MikroTik routers and Cisco switches.

Organizational identifiers, real credentials, and sensitive infrastructure details have intentionally been excluded from the public documentation.

The project represents practical experience applying Ansible-based automation to real-world multi-vendor network administration workflows.

#Author

Mohammad Ebrahimpour

Network & IT Infrastructure Specialist

Focus Areas:

- Network Automation
- Network Infrastructure
- MikroTik
- Cisco
- Network Security
- Python Automation
- Ansible
- Cloud Networking