#!/bin/bash

GH_USER="dakotanelson"

install_sshb0t() {
  # Export the sha256sum for verification.
  export SSHB0T_SHA256="1b231c8ced77eef54c01b9d96c4278da0e02f362502096eee940d345b10a90e7"

  # Download and check the sha256sum.
  curl -fSL "https://github.com/genuinetools/sshb0t/releases/download/v0.3.7/sshb0t-linux-amd64" -o "/usr/local/bin/sshb0t" \
      && echo "${SSHB0T_SHA256}  /usr/local/bin/sshb0t" | sha256sum -c - \
      && chmod a+x "/usr/local/bin/sshb0t"

  echo "sshb0t installed!"

  KEYFILE="/home/$USER/.ssh/authorized_keys"
  if [ $KEYFILE does not exist ]; then
       echo "$KEYFILE does not exist, creating..."
       touch $KEYFILE
       chown $USER:$USER $KEYFILE
       chmod 644 $KEYFILE
  fi

  echo \
  """[Unit]
  Description=keeps SSH keys synchyronized from GitHub
  After=network.target

  [Service]
  type=simple
  Restart=always
  ExecStart=/usr/local/bin/sshb0t --user $GH_USER --keyfile $KEYFILE

  [Install]
  WantedBy=multi-user.target""" > /etc/systemd/system/sshb0t.service

  echo "sshb0t unit file created..."

  systemctl daemon-reload
  systemctl enable sshb0t.service
  systemctl start sshb0t.service

  echo "sshb0t.service enabled and started"
}

##########################################################

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

echo "Installing sshb0t for github username $GH_USER and local username $USER."
read -p "Are you sure? [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
      install_sshb0t
fi

