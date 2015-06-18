#!/bin/bash

#Where DB is located
REGION1=EDGE-CG-1
#Where Web Server is located
REGION2=EDGE-MG-1

NET_ID1=`quantum net-list --os-region-name=$REGION1 | grep $OS_TENANT_NAME | awk '{print $2}'` 
NET_ID2=`quantum net-list --os-region-name=$REGION2 | grep $OS_TENANT_NAME | awk '{print $2}'` 
KEY_NAME=`nova keypair-list | head -n 4 | tail -n 1 | awk '{print $2}'`

#heat stack-create multi_region_wp -f multi_region_wordpress.yaml -P="net_id1=NET_ID1;net_id2=NET_ID2;key_name=KEY_NAME"
heat stack-create $1 -f wordpress_multi_region.yaml -P="net_id1=$NET_ID1;net_id2=$NET_ID2;key_name=$KEY_NAME;region1=$REGION1;region2=$REGION2"
