Enterprise Network Automation

An Ansible-based network automation solution implemented in a commercial corporate network environment to automate configuration backup and operational information collection across MikroTik routers and Cisco switches.

Overview

This project provides a practical multi-vendor network automation workflow using Ansible, MikroTik RouterOS, Cisco IOS, and Git.

The solution was implemented and successfully executed in a real corporate network environment to reduce manual configuration backup operations and provide a consistent, repeatable process for collecting network device information.

Objectives

- Automate network device configuration backups
- Reduce manual backup operations
- Provide a consistent backup process across multiple vendors
- Collect operational information from network devices
- Organize automation tasks using reusable Ansible Roles
- Maintain configuration backups with timestamped filenames
- Provide a maintainable foundation for further network automation

Supported Platforms

MikroTik RouterOS

The automation workflow supports MikroTik routers and performs:

- Configuration export
- Device identity collection
- System information collection
- RouterBoard information collection

Cisco IOS

The automation workflow supports Cisco IOS switches and performs:

- Running configuration collection
- Timestamped configuration backup
- Device version information collection

Automation Architecture

                    Ansible Control Node
                            │
                            │
              ┌─────────────┴─────────────┐
              │                           │
        MikroTik Routers             Cisco Switches
              │                           │
              │                           │
        RouterOS CLI               IOS CLI
              │                           │
              └─────────────┬─────────────┘
                            │
                     Configuration
                       Collection
                            │
                            ▼
                      Backup Storage
                            │
                    Timestamped Files

Project Structure

network-automation/
├── README.md
├── inventory.ini
├── backup_network.yml
├── backup_role.yml
├── collect_info.yml
├── collect_network.yml
├── cisco_test.yml
├── test.yml
├── roles/
│   ├── network_backup/
│   │   └── tasks/
│   │       └── main.yml
│   └── cisco_backup/
│       └── tasks/
│           └── main.yml
└── backups/

Implemented Automation

Network Configuration Backup

The backup workflow connects to network devices through Ansible Network CLI and collects their current configuration.

For MikroTik devices, the automation executes the RouterOS export operation and stores the resulting configuration as an ".rsc" file.

For Cisco IOS devices, the automation retrieves the running configuration and stores it as a ".cfg" file.

Backup filenames include the device hostname and execution timestamp to make individual backup versions easy to identify.

Example:

remote-office_2026-09-22_11-07-24.rsc
branch-01_2026-09-22_11-07-24.rsc
core-switch_2026-09-22_11-07-31.cfg

Information Collection

The project also includes automation tasks for collecting operational information from network devices.

MikroTik

Collected information includes:

- System identity
- System resource information
- RouterBoard information

Cisco

Collected information includes:

- IOS version
- Device information

This information can be used as a foundation for future inventory, monitoring, compliance, and reporting automation.

Ansible Roles

The project uses Ansible Roles to separate vendor-specific automation logic.

"network_backup"

Responsible for MikroTik configuration backup.

"cisco_backup"

Responsible for Cisco configuration backup.

This separation allows vendor-specific tasks to remain independent while the overall automation workflow remains consistent.

Execution Workflow

The general workflow is:
Inventory
    │
    ▼
Ansible Playbook
    │
    ▼
Vendor-specific Role
    │
    ▼
Network Device
    │
    ▼
Configuration / Information
    │
    ▼
Timestamped Backup

## Requirements

Before running the automation, install the required Ansible collections:

`bash
ansible-galaxy collection install -r requirements.yml
The project requires:
Ansible Core
ansible.netcommon
community.routeros
cisco.ios
SSH connectivity to the target network devices

Technology Stack

- Ansible
- Ansible Network CLI
- MikroTik RouterOS
- Cisco IOS
- Git
- GitHub
- Linux / WSL2
- YAML

Security Considerations

Credentials are provided separately from the automation logic and are not intended to be embedded directly into automation tasks.

Device configuration backups may contain sensitive operational information and should therefore be handled as protected operational data rather than publicly distributed configuration files.

For production deployments, credential management should be implemented using mechanisms such as Ansible Vault or an enterprise secrets-management solution.

Operational Characteristics

The automation was designed around the following principles:

- Repeatable execution
- Multi-vendor support
- Reusable Ansible Roles
- Timestamped backups
- Separation of device-specific automation logic
- Reduced manual configuration handling
- Maintainable YAML-based automation

Future Improvements

Potential extensions include:

- Centralized credential management
- Configuration change detection
- Backup retention management
- Structured execution logging
- Automated compliance checks
- Configuration comparison
- Scheduled execution
- Multi-vendor device discovery
- Integration with CI/CD workflows
- Automated reporting

Project Context

This project represents a practical network automation implementation rather than a purely theoretical or laboratory exercise.

The automation workflows were executed against network devices in a commercial corporate network environment and the resulting configuration backups and information-collection operations were successfully verified.

Sensitive organizational information, device-specific credentials, and identifying infrastructure details are intentionally excluded from the public project documentation.

Author

Mohammad Ebrahimpour

Network & IT Infrastructure | Network Automation | Network Security