#!/bin/bash

token=""
email=""
zone=""
domain=""

# curl http://ifconfig.me
ip=$(curl -s -X GET "http://ipv4.icanhazip.com")
echo "ip: $ip"

zone_identifier=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$zone" -H "X-Auth-Email: $email" -H "X-Auth-Key: $token" -H "Content-Type: application/json" | grep -Po '(?<="id":")[^"]*' | head -1 )
echo "zone: $zone_identifier"

record_identifier=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records?name=$domain" -H "X-Auth-Email: $email" -H "X-Auth-Key: $token" -H "Content-Type: application/json"  | grep -Po '(?<="id":")[^"]*')
echo "record: $record_identifier"

update=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" -H "X-Auth-Email: $email" -H "X-Auth-Key: $token" -H "Content-Type: application/json" --data "{\"id\":\"$zone_identifier\",\"type\":\"A\",\"name\":\"$domain\",\"content\":\"$ip\"}")
echo "res: $update"

