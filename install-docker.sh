#!/bin/bash

# Author: Fajar Nugroho / mafiasoleh@gmail.com
# Version: 0.0.1

clear -x
export DEBIAN_FRONTEND=noninteractive
user=$(whoami);
if [[ $user != "root" ]]; then
  echo ""
  echo "+===============================================================+"
  echo "|  CAUTION: This installer requires root privileges,            |"
  echo "|           Please login as root and run the installer again.   |"
  echo "+===============================================================+"
  echo ""
  echo;
  exit 1;
fi;

