/ip dhcp-server config
set store-leases-disk=never
set accounting=no

/system logging
set action=memory [find action="disk"]

/tool graphing
set store-every=24hours
interface  set store-on-disk=no [find store-on-disk=yes]
queue set store-on-disk=no [find store-on-disk=yes]
resource set store-on-disk=no [find store-on-disk=yes]

/ip accounting
set enabled=no
set account-local-traffic=no

/ip proxy
set enabled=no
set cache-on-disk=no

/ip settings
set route-cache=no

/tool calea set disabled=yes [find disabled=no]

/system scheduler
set disabled=yes [find disabled=yes]

/lcd set read-only-mode=yes
