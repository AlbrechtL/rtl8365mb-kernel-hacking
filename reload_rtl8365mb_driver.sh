#!/bin/sh

echo "***** Building of rtl8365mb *****"
make

echo "***** Remove kernel modules *****"
sudo rmmod realtek_mdio
sudo rmmod realtek_smi
sudo rmmod rtl8365mb

echo "***** Load rtl8365mb.ko kernel module *****"
sudo insmod rtl8365mb.ko

echo "***** Load realtek_smi kernel module *****"
#sudo insmod realtek-smi.ko
sudo modprobe realtek_smi

echo "***** Setup bridge and attach LAN ports *****"
sudo ip link delete dsabr0
sudo ip link add name dsabr0 type bridge
sudo ip link set dev lan1 master dsabr0
sudo ip link set dev lan2 master dsabr0
sudo ip link set dev dsabr0 up