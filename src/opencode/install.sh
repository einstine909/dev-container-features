#!/bin/sh

# Make autostart script
OPENCODE_INIT="/opt/opencode-init"
echo "#!/bin/sh" > "$OPENCODE_INIT"

if [ "$AUTOSTART" = "true" ]; then
    echo -n "nohup opencode " >> "$OPENCODE_INIT"

	if [ -n "$OPENCODE_ARGS" ]; then
		echo -n "${OPENCODE_ARGS}" >> "$OPENCODE_INIT"
	fi
	echo " > /var/log/opencode.log 2>&1 &" >> "$OPENCODE_INIT"

fi

chmod +x "$OPENCODE_INIT"

# Install opencode
su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/install | bash"