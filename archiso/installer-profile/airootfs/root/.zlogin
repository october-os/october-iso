# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

~/.automated_script.sh

if [ -f /usr/bin/october-installer ]; then
    chmod +x /usr/bin/october-installer
fi

mount -t virtiofs installer /root/installer
