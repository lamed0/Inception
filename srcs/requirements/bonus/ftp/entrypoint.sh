#!/bin/sh
set -eu

echo "Starting FTP entrypoint"

# Default values if not provided
FTP_USER=${FTP_USER:-wpuser}
FTP_PASS=${FTP_PASS:-password}
FTP_HOME=${FTP_HOME:-/var/www/html}
PASV_MIN=${PASV_MIN:-21100}
PASV_MAX=${PASV_MAX:-21110}

# Add user if it doesn't exist
if ! id "$FTP_USER" >/dev/null 2>&1; then
    echo "Creating user $FTP_USER"
    useradd -m -d "$FTP_HOME" -s /bin/sh "$FTP_USER"
else
    echo "User $FTP_USER already exists"
fi

# Set user password
echo "$FTP_USER:$FTP_PASS" | chpasswd

# Prepare home directory
mkdir -p "$FTP_HOME"
chown -R "$FTP_USER:$FTP_USER" "$FTP_HOME"

# Prepare log file
touch /var/log/vsftpd.log
chown root:root /var/log/vsftpd.log

# Update vsftpd.conf with PASV ports
sed -i "s/^pasv_min_port=.*/pasv_min_port=$PASV_MIN/" /etc/vsftpd.conf
sed -i "s/^pasv_max_port=.*/pasv_max_port=$PASV_MAX/" /etc/vsftpd.conf

# Make sure passive mode is enabled
grep -q "^pasv_enable=YES" /etc/vsftpd.conf || echo "pasv_enable=YES" >> /etc/vsftpd.conf

# Start vsftpd
exec /usr/sbin/vsftpd /etc/vsftpd.conf
