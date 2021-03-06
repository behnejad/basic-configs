/ip smb set enabled=no 

/ip ssh
set host-key-size=4096
set strong-crypto=yes

/ip traffic-flow set enabled=no

/ip dhcp-server config
set store-leases-disk=never
set accounting=no

/ip accounting
set enabled=no
set account-local-traffic=no

/ip proxy
set enabled=no
set cache-on-disk=no

/ip settings
set route-cache=no
set rp-filter=strict

/ip firewall filter add action=drop chain=forward connection-state=invalid

/ip neighbor discovery-settings set discover-interface-list=none

/lcd set read-only-mode=yes

/ppp aaa set accounting=no

/tool graphing
set store-every=24hours
interface  set store-on-disk=no [find store-on-disk=yes]
queue set store-on-disk=no [find store-on-disk=yes]
resource set store-on-disk=no [find store-on-disk=yes]

/tool calea set disabled=yes [find disabled=no]

/tool bandwidth-server set enabled=no

/snmp set enabled=no

/system
scheduler set disabled=yes [find disabled=no]
watchdog set automatic-supout=no
logging set action=memory [find action="disk"]

/system routerboard settings
set protected-routerboot=enabled
set enable-jumper-reset=no

/interface wireless security-profiles set [find disable-pmkid=no] disable-pmkid=yes

/interface detect-internet set detect-interface-list=none wan-interface-list=none lan-interface-list=none internet-interface-list=none 

/tool fetch url=http://www.iwik.org/ipcountry/mikrotik/IR
/import file-name=IR

/console clear-history
