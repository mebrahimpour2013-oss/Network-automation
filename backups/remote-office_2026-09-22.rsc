# 2026-09-16 19:46:40 by RouterOS 7.23.7
# software id = K7DS-TKC7
#
# model = RB750UPr2
# serial number = 8B0209AD980B
/interface bridge
add name=bridge-lan vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] advertise="10M-baseT-half,10M-baseT-full,100M\
    -baseT-half,100M-baseT-full,1G-baseT-half,1G-baseT-full"
set [ find default-name=ether2 ] advertise="10M-baseT-half,10M-baseT-full,100M\
    -baseT-half,100M-baseT-full,1G-baseT-half,1G-baseT-full"
set [ find default-name=ether3 ] advertise="10M-baseT-half,10M-baseT-full,100M\
    -baseT-half,100M-baseT-full,1G-baseT-half,1G-baseT-full"
set [ find default-name=ether4 ] advertise="10M-baseT-half,10M-baseT-full,100M\
    -baseT-half,100M-baseT-full,1G-baseT-half,1G-baseT-full"
set [ find default-name=ether5 ] advertise="10M-baseT-half,10M-baseT-full,100M\
    -baseT-half,100M-baseT-full,1G-baseT-half,1G-baseT-full"
/interface vlan
add interface=bridge-lan name=vlan10-mgmt vlan-id=10
add interface=bridge-lan name=vlan20-users vlan-id=20
add interface=bridge-lan name=vlan30-Servers vlan-id=30
add interface=bridge-lan name=vlan40-guest vlan-id=40
/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no
/ip pool
add name=mgmt-pool ranges=192.168.10.10-192.168.10.200
add name=dhcp_pool1 ranges=192.168.10.2-192.168.10.254
add name=users-pool ranges=192.168.20.10-192.168.20.200
add name=server-pool ranges=192.168.30.10-192.168.30.200
add name=Guest-pool ranges=192.168.40.10-192.168.40.200
add name=dhcp_pool5 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool6 ranges=192.168.30.2-192.168.30.254
add name=dhcp_pool7 ranges=192.168.40.2-192.168.40.254
add name=vpn-pool ranges=10.20.20.10-10.20.20.50
/ip smb users
set [ find default=yes ] disabled=yes
/ppp profile
add dns-server=4.2.2.4,8.8.8.8 local-address=10.20.20.1 name=l2tpvpn \
    remote-address=vpn-pool
/routing bgp template
set default as=65530 disabled=no name=default output.network=bgp-networks
/routing ospf instance
add disabled=no name=default-v2
/routing ospf area
add disabled=yes instance=default-v2 name=backbone-v2
/interface bridge port
add bridge=bridge-lan interface=ether2
add bridge=bridge-lan interface=ether3 pvid=10
/ip firewall connection tracking
set udp-timeout=10s
/ip settings
set max-neighbor-entries=8192
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=8192
/interface bridge vlan
add bridge=bridge-lan tagged=bridge-lan,ether2 untagged=ether3 vlan-ids=10
add bridge=bridge-lan tagged=bridge-lan,ether2 vlan-ids=20
add bridge=bridge-lan tagged=bridge-lan,ether2 vlan-ids=30
add bridge=bridge-lan tagged=bridge-lan,ether2 vlan-ids=40
/interface l2tp-server server
set authentication=mschap2 default-profile=l2tpvpn enabled=yes max-mru=1350 \
    max-mtu=1350 use-ipsec=yes
/interface ovpn-server server
add auth=sha1,md5 mac-address=FE:FA:A7:8A:FF:8A name=ovpn-server1
/ip address
add address=192.168.10.1/24 comment="Management LAN" interface=vlan10-mgmt \
    network=192.168.10.0
add address=192.168.20.1/24 interface=vlan20-users network=192.168.20.0
add address=192.168.30.1/24 interface=vlan30-Servers network=192.168.30.0
add address=192.168.40.1/24 interface=vlan40-guest network=192.168.40.0
/ip dhcp-client
add interface=ether1 name=client1
/ip dhcp-server
add address-pool=mgmt-pool interface=vlan10-mgmt lease-time=10m name=dhcp1
add address-pool=users-pool interface=vlan20-users lease-time=10m name=dhcp2
add address-pool=server-pool interface=vlan30-Servers lease-time=10m name=\
    dhcp3
add address-pool=Guest-pool interface=vlan40-guest lease-time=10m name=dhcp4
/ip dhcp-server network
add address=192.168.10.0/24 dns-server=192.168.10.1 gateway=192.168.10.1
add address=192.168.20.0/24 dns-server=192.168.20.1 gateway=192.168.20.1
add address=192.168.30.0/24 dns-server=192.168.30.1 gateway=192.168.30.1
add address=192.168.40.0/24 dns-server=192.168.40.1 gateway=192.168.40.1
/ip dns
set servers=1.1.1.1,8.8.8.8,4.2.2.4
/ip firewall filter
add action=accept chain=input connection-state=established,related
add action=drop chain=input connection-state=invalid disabled=yes
add action=drop chain=input in-interface=ether1
add action=accept chain=input in-interface=vlan10-mgmt src-address=\
    192.168.10.0/24
add action=accept chain=input protocol=icmp src-address=192.168.10.0/24
add action=accept chain=input dst-port=8291,22 in-interface=vlan10-mgmt \
    protocol=tcp src-address=192.168.10.0/24
add action=accept chain=forward connection-state=established,related
add action=drop chain=forward connection-state=invalid disabled=yes
add action=drop chain=forward connection-state=new in-interface=ether1
add action=drop chain=forward dst-address=192.168.10.0/24 src-address=\
    192.168.40.0/24
add action=drop chain=forward dst-address=192.168.20.0/24 src-address=\
    192.168.40.0/24
add action=drop chain=forward dst-address=192.168.30.0/24 src-address=\
    192.168.40.0/24
add action=drop chain=forward dst-address=192.168.10.0/24 src-address=\
    192.168.20.0/24
add action=accept chain=forward dst-address=192.168.30.0/24 src-address=\
    192.168.20.0/24
add action=accept chain=forward out-interface=ether1 src-address=\
    192.168.10.0/24
add action=accept chain=forward out-interface=ether1 src-address=\
    192.168.40.0/24
add action=accept chain=forward out-interface=ether1 src-address=\
    192.168.20.0/24
add action=accept chain=forward out-interface=ether1 src-address=\
    192.168.30.0/24
add action=drop chain=input disabled=yes src-address=192.168.40.0/24
add action=drop chain=forward dst-address=192.168.10.0/24 src-address=\
    192.168.30.0/24
add action=accept chain=forward dst-address=192.168.20.0/24 src-address=\
    10.20.20.0/24
add action=accept chain=forward out-interface=ether1 src-address=\
    10.20.20.0/24
add action=accept chain=forward dst-address=192.168.30.0/24 src-address=\
    10.20.20.0/24
add action=accept chain=input dst-port=500,4500 protocol=udp
add action=accept chain=input dst-port=1701 protocol=udp
add action=accept chain=input protocol=ipsec-esp
add action=drop chain=forward
add action=drop chain=input
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat out-interface=ether1 src-address=\
    10.20.20.0/24
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip service
set ftp disabled=yes
set ssh address=192.168.10.0/24
set telnet disabled=yes
set www address=192.168.10.0/24 disabled=yes
set winbox address=192.168.10.0/24
set api address=192.168.10.0/24
set api-ssl disabled=yes
/ppp secret
add name=l2tp profile=l2tpvpn service=l2tp
/routing bfd configuration
add disabled=no interfaces=all min-rx=200ms min-tx=200ms multiplier=5
/system clock
set time-zone-name=Asia/Tehran
/system identity
set name=Remote-Office-MT
/system logging
add topics=firewall
add topics=ppp
/system ntp client
set enabled=yes
/system ntp client servers
add address=216.239.35.0
add address=216.239.35.4
/system package update
set channel=long-term