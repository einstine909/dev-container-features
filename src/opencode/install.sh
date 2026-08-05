#!/bin/sh

# Make autostart script
OPENCODE_AUTOSTARTER="/opt/opencode-autostart"
echo "#!/bin/sh" > OPENCODE_AUTOSTARTER
if [[ "$AUTOSTART" == "true" ]]; then
    echo -n "opencode " >> OPENCODE_AUTOSTARTER

	if [ -n "$OPENCODE_ARGS" ]; then
		echo "${OPENCODE_ARGS}" >> OPENCODE_AUTOSTARTER
	fi
fi

chmod +x OPENCODE_AUTOSTARTER
cat OPENCODE_AUTOSTARTER

# Install opencode
su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/install | bash"