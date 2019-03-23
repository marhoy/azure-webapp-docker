#!/bin/bash

set -e

SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7dlQH04IKSg15U53SKThDOU/QfB+t54jxBMyM6hrhbPJ3gQG0gZ8Nx8fUQmigkt0AiwUpNuW8+dXPvg6EQxDKHpLVjNRMCM2L2QrauoPzgxZaCRPgPdSKl56+pxGLNdK1LiWgW/i/umEyoNEEQBc+kTkkPaoC7GJVRChtRS1gKGOHKHGl7zV7cBWBXlLc5ajbepUB3s4r9Qxg0yRsH2wdXYrt4o8rOnPq0ds9LEvrw2jl+x5p6l+F+T0TDF5ClEoi97UxbGelki4TVlv7bigcdEurcM9m2AXUGBmIh+1lBMu2s2IupOo5RxUExxMTunCWqZ8iWtNY3rXOzrhP5HSR marhoy@MacBook-Pro.local"

if [ -z "${SSH_KEY}" ]; then
        echo "=> Please pass your public key in the SSH_KEY environment variable"
        exit 1
fi

for MYHOME in /root; do
        mkdir -p ${MYHOME}/.ssh
        echo "${SSH_KEY}" > ${MYHOME}/.ssh/authorized_keys
        chmod 700 ${MYHOME}/.ssh
        chmod 600 ${MYHOME}/.ssh/authorized_keys
done
