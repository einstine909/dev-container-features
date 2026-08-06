#!/bin/sh

# Make autostart script
OPENCODE_AUTOSTARTER="/opt/opencode-autostart"
echo "#!/bin/sh" > "$OPENCODE_AUTOSTARTER"
if [ "$AUTOSTART" = "true" ]; then
    echo -n "nohup opencode " >> "$OPENCODE_AUTOSTARTER"

	if [ -n "$OPENCODE_ARGS" ]; then
		echo -n "${OPENCODE_ARGS}" >> "$OPENCODE_AUTOSTARTER"
	fi
	echo " > /var/logs/opencode.log 2>&1 &" >> "$OPENCODE_AUTOSTARTER"

fi

chmod +x "$OPENCODE_AUTOSTARTER"

# Install opencode
su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/install | bash"