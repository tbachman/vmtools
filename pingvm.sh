#!/bin/bash
#
# Copyright (C) 2013 Cisco Systems, Inc.
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License v1.0 which accompanies this distribution,
# and is available at http://www.eclipse.org/legal/epl-v10.html
#
# Authors : Thomas Bachman


#
# Ping an instance created by DevStack
#

ip=$1
nnet=`neutron net-list`
nlist=`nova list`
uuid=`echo "$nnet" | grep $(echo "$nlist" | grep $ip | awk '{print $12}' | awk 'BEGIN {FS="="} {print $1}') | awk '{print $2}'`
cmd="ip netns exec qdhcp-$uuid ping $ip"
sudo $cmd
