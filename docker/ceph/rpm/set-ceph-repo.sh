#!/bin/bash

set -e

if [[ -z "$REPO_URL" ]]; then
    REPO_URL=$(curl -s 'https://shaman.ceph.com/api/search/?project=ceph&distros=centos/7&flavor=default&ref=master&sha1=latest' | jq -a '.[0] | .url' | sed -e 's/"//g')/x86_64/
fi

echo "
[ceph-rpm]
name=Ceph RPM
baseurl=$REPO_URL
enabled=1
gpgcheck=0
" > /etc/yum.repos.d/ceph.repo

readonly REPO_URL_NOARCH=$(echo "$REPO_URL" | sed -e 's/x86_64/noarch/')
readonly REPO_URL_NOARCH_STATUS_CODE=$(curl -LIfs "$REPO_URL_NOARCH" | head -1 | awk '{print $2}')

if [[ "$REPO_URL_NOARCH_STATUS_CODE" == 200 ]]; then
    echo "
[ceph-rpm-noarch]
name=Ceph RPM noarch
baseurl=$REPO_URL_NOARCH
enabled=1
gpgcheck=0
" >> /etc/yum.repos.d/ceph.repo
fi
