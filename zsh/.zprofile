# Start sway automatically on tty1
[ "$(tty)" = "/dev/tty1" ] && exec sway
