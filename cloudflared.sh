#!/usr/bin/env sh

# Copyright (c) 2021-2024 tteck
# Author: tteck (tteckster)
# License: MIT
# https://github.com/tteck/Proxmox/raw/main/LICENSE

header_info() {
    cat << "EOF"
   ________                ________                    __
  / ____/ /___  __  ______/ / __/ /___ _________  ____/ /
 / /   / / __ \/ / / / __  / /_/ / __ `/ ___/ _ \/ __  /
/ /___/ / /_/ / /_/ / /_/ / __/ / /_/ / /  /  __/ /_/ /
\____/_/\____/\__,_/\__,_/_/ /_/\__,_/_/   \___/\__,_/
EOF
}

header_info
echo "Loading..."
APP="Cloudflared"
var_disk="1G"
var_cpu="1"
var_ram="128"
var_os="debian"
var_version="12"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW=""
  CT_ID=100132
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="dhcp"
  GATE=""
  APT_CACHER=""
  APT_CACHER_IP=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC=""
  VLAN=""
  SSH="no"
  VERB="no"
  echo_default
}

update_script() {
  header_info
  if [ ! -d /var ]; then
    msg_error "No ${APP} Installation Found!"
    exit 1
  fi
  msg_info "Updating $APP LXC"
  apk update >/dev/null
  apk upgrade --available >/dev/null
  msg_ok "Updated $APP LXC"
  exit 0
}

start
build_container
description

msg_ok "Completed Successfully!\n"
